# -*- coding: utf-8 -*-

import sqlite3
from time import localtime, strftime
import os
from skimage import io as iio
import io
import zlib
import dlib  # 人脸识别的库dlib
import numpy as np  # 数据处理的库numpy
import cv2  # 图像处理的库OpenCv


ID_NEW_REGISTER = 160
ID_FINISH_REGISTER = 161

ID_START_PUNCHCARD = 190
ID_END_PUNCARD = 191

ID_OPEN_LOGCAT = 283
ID_CLOSE_LOGCAT = 284

ID_WORKER_UNAVIABLE = -1
work_dir = os.path.dirname(os.path.abspath(__file__))
PATH_FACE = os.path.join(work_dir, "data/face_img_database/")
# face recognition model, the object maps human faces into 128D vectors
facerec = dlib.face_recognition_model_v1(os.path.join(work_dir, "model/dlib_face_recognition_resnet_model_v1.dat"))
# Dlib 预测器
detector = dlib.get_frontal_face_detector()
predictor = dlib.shape_predictor(os.path.join(work_dir, 'model/shape_predictor_68_face_landmarks.dat'))


def return_euclidean_distance(feature_1, feature_2):
    feature_1 = np.array(feature_1)
    feature_2 = np.array(feature_2)
    dist = np.sqrt(np.sum(np.square(feature_1 - feature_2)))
    if dist > 0.4:
        return "diff"
    else:
        return "same"


class WAS():
    def __init__(self):
        self.initData()


    def initData(self):
        self.name = ""
        self.id = ''
        self.face_feature = ""
        self.pic_num = 0
        self.loadDataBase(1)


    def register_cap(self):
        print(1111)
        # 创建 cv2 摄像头对象
        self.cap = cv2.VideoCapture(0)
        # cap是否初始化成功
        person_path = PATH_FACE + self.name
        if not os.path.exists(person_path):
            os.mkdir(person_path)
        print("摄像头是否关闭",self.cap.isOpened())
        while True:
            # cap.read()
            # 返回两个值：
            #    一个布尔值true/false，用来判断读取视频是否成功/是否到视频末尾
            #    图像对象，图像的三维矩阵
            flag, im_rd = self.cap.read()
            # 每帧数据延时1ms，延时为0读取的是静态帧
            kk = cv2.waitKey(1)
            # 人脸数 dets
            dets = detector(im_rd, 1)

            # 检测到人脸
            if len(dets) != 0:
                biggest_face = dets[0]
                # 取占比最大的脸
                maxArea = 0
                for det in dets:
                    w = det.right() - det.left()
                    h = det.top() - det.bottom()
                    if w * h > maxArea:
                        biggest_face = det
                        maxArea = w * h
                        # 绘制矩形框

                face_height = biggest_face.bottom() - biggest_face.top()
                face_width = biggest_face.right() - biggest_face.left()
                im_blank = np.zeros((face_height, face_width, 3), np.uint8)
                try:
                    for ii in range(face_height):
                        for jj in range(face_width):
                            im_blank[ii][jj] = im_rd[biggest_face.top() + ii][biggest_face.left() + jj]
                    # 解决python3下使用cv2.imwrite存储带有中文路径图片
                    if len(self.name) > 0:
                        cv2.imencode('.jpg', im_blank)[1].tofile(
                            PATH_FACE + self.name + "/img_face_" + str(self.pic_num) + ".jpg")  # 正确方法
                        self.pic_num += 1
                        print("写入本地：", str(PATH_FACE + self.name) + "/img_face_" + str(self.pic_num) + ".jpg")
                        # self.infoText.AppendText(
                        #     self.getDateAndTime() + "图片:" + str(PATH_FACE + self.name) + "/img_face_" + str(
                        #         self.pic_num) + ".jpg保存成功\r\n")
                except Exception as e:
                    print(e)
                    print("保存照片异常,请对准摄像头")

                if self.pic_num == 10:
                    print(345)
                    self.OnFinishRegister()
                    print("退出循环")
                    break
        self.cap.release()
        cv2.destroyAllWindows()
        print("退出")
        return

    def OnFinishRegister(self):
        print('释放摄像头')
        if self.pic_num > 0:
            pics = os.listdir(PATH_FACE + self.name)
            feature_list = []
            feature_average = []
            for i in range(len(pics)):
                pic_path = PATH_FACE + self.name + "/" + pics[i]
                print("正在读的人脸图像：", pic_path)
                img = iio.imread(pic_path)
                img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
                dets = detector(img_gray, 1)
                if len(dets) != 0:
                    shape = predictor(img_gray, dets[0])
                    face_descriptor = facerec.compute_face_descriptor(img_gray, shape)
                    feature_list.append(face_descriptor)
                else:
                    face_descriptor = 0
                    print("未在照片中识别到人脸")
            if len(feature_list) > 0:
                for j in range(128):
                    # 防止越界
                    feature_average.append(0)
                    for i in range(len(feature_list)):
                        feature_average[j] += feature_list[i][j]
                    feature_average[j] = (feature_average[j]) / len(feature_list)
                self.insertARow([self.id, self.name, feature_average], 1)
                # self.infoText.AppendText(self.getDateAndTime() + "工号:" + str(self.id)
                #                          + " 姓名:" + self.name + " 的人脸数据已成功存入\r\n")
                pass

        else:
            os.rmdir(PATH_FACE + self.name)
            print("已删除空文件夹", PATH_FACE + self.name)
        self.initData()


    def punchcard_cap(self):
        """
        人脸识别
        :param event:
        :return:
        """
        self.cap = cv2.VideoCapture(0)
        # cap.set(propId, value)
        # 设置视频参数，propId设置的视频参数，value设置的参数值
        # self.cap.set(3, 600)
        # self.cap.set(4,600)
        # cap是否初始化成功
        customer_id = ''
        while self.cap.isOpened():
            # cap.read()
            # 返回两个值：
            #    一个布尔值true/false，用来判断读取视频是否成功/是否到视频末尾
            #    图像对象，图像的三维矩阵
            flag, im_rd = self.cap.read()
            # 每帧数据延时1ms，延时为0读取的是静态帧
            kk = cv2.waitKey(1)
            # 人脸数 dets
            dets = detector(im_rd, 1)

            # 检测到人脸
            if len(dets) != 0:
                biggest_face = dets[0]
                # 取占比最大的脸
                maxArea = 0
                for det in dets:
                    w = det.right() - det.left()
                    h = det.top() - det.bottom()
                    if w * h > maxArea:
                        biggest_face = det
                        maxArea = w * h
                        # 绘制矩形框

                cv2.rectangle(im_rd, tuple([biggest_face.left(), biggest_face.top()]),
                              tuple([biggest_face.right(), biggest_face.bottom()]),
                              (255, 0, 255), 2)
                img_height, img_width = im_rd.shape[:2]
                image1 = cv2.cvtColor(im_rd, cv2.COLOR_BGR2RGB)
                # pic = wx.Bitmap.FromBuffer(img_width, img_height, image1)
                # 显示图片在panel上
                # self.bmp.SetBitmap(pic)

                # 获取当前捕获到的图像的所有人脸的特征，存储到 features_cap_arr
                shape = predictor(im_rd, biggest_face)
                features_cap = facerec.compute_face_descriptor(im_rd, shape)

                # 对于某张人脸，遍历所有存储的人脸特征
                for i, knew_face_feature in enumerate(self.knew_face_feature):
                    # 将某张人脸与存储的所有人脸数据进行比对
                    compare = return_euclidean_distance(features_cap, knew_face_feature)

                    if compare == "same":  # 找到了相似脸
                        print("same")
                        flag = 0
                        nowdt = self.getDateAndTime()
                        customer_id = str(self.knew_id[i])
                        customer_name = self.knew_name[i]
                    if customer_id:
                        break

               # if self.start_punchcard.IsEnabled():
                    #self.bmp.SetBitmap(wx.Bitmap(self.pic_index))
                    # _thread.exit()
            if customer_id:
                break
        return customer_id

    def getDateAndTime(self):
        dateandtime = strftime("%Y-%m-%d %H:%M:%S", localtime())
        return "[" + dateandtime + "]"

    def adapt_array(self, arr):
        out = io.BytesIO()
        np.save(out, arr)
        out.seek(0)

        dataa = out.read()
        # 压缩数据流
        return sqlite3.Binary(zlib.compress(dataa, zlib.Z_BEST_COMPRESSION))

    def convert_array(self, text):
        out = io.BytesIO(text)
        out.seek(0)

        dataa = out.read()
        # 解压缩数据流
        out = io.BytesIO(zlib.decompress(dataa))
        return np.load(out)

    def insertARow(self, Row, type):
        conn = sqlite3.connect(os.path.join(work_dir, "inspurer.db"))  # 建立数据库连接
        cur = conn.cursor()  # 得到游标对象
        print(Row)
        if type == 1:
            cur.execute("insert into worker_info (id,name,face_feature) values(?,?,?)",
                        (Row[0], Row[1], self.adapt_array(Row[2])))
            print("写人脸数据成功")
        cur.close()
        conn.commit()
        conn.close()

    def loadDataBase(self, type):

        conn = sqlite3.connect(os.path.join(work_dir, "inspurer.db"))  # 建立数据库连接
        cur = conn.cursor()  # 得到游标对象

        if type == 1:
            self.knew_id = []
            self.knew_name = []
            self.knew_face_feature = []
            cur.execute('select id,name,face_feature from worker_info')
            origin = cur.fetchall()
            for row in origin:
                self.knew_id.append(row[0])
                self.knew_name.append(row[1])
                self.knew_face_feature.append(self.convert_array(row[2]))
