import cv2
import os
from PIL import Image
import numpy as np

work_dir = os.path.dirname(os.path.abspath(__file__))


# 人脸检测，采集数据
def detection(NameId, number):
    cap = cv2.VideoCapture(0)  # 0表示默认系统摄像头
    faceCascade = cv2.CascadeClassifier(os.path.join(work_dir, 'haarcascade_frontalface_default.xml'))  # 加载人脸训练器xml文件
    font = cv2.FONT_HERSHEY_SIMPLEX

    count = 1
    while True:
        ok, img = cap.read()  # 读取摄像头数据, 必须返回两个参数
        if not ok:
            break

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)  # 转换为灰度图像

        # faces存放所有脸信息(要用灰度图片检测)
        faces = faceCascade.detectMultiScale(
            gray,
            scaleFactor=1.1,
            minNeighbors=5,
            minSize=(32, 32)
        )

        # 如果有脸，就把脸框起来画矩形
        for (x, y, w, h) in faces:
            cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0))
            cv2.putText(img, NameId, (x + w + 5, y - 5), font, 0.6, (0, 255, 0), 1)  # 1, 1分别代表字体大小和粗细
            cv2.imwrite(os.path.join(work_dir, 'FaceData/User_' + NameId + '_' + str(count) + '.jpg'),
                        gray[y:y + h, x:x + w])
            print('采集第', count, '张成功！')
            count += 1
        cv2.imshow('Detection', img)

        if count > number:
            print('人脸信息采集完毕！')
            break

        key = cv2.waitKey(10)  # 间隔10ms刷新
        if cv2.getWindowProperty('Detection', cv2.WND_PROP_AUTOSIZE) < 1:  # 鼠标关闭窗口
            break
        elif key == 8:  # 键盘按×退出
            break

    cap.release()  # 关闭摄像头
    cv2.destroyWindow('Detection')  # 删除窗口


# 训练人脸数据
def training():
    path = 'FaceData'
    all_image_path = [os.path.join(path, i) for i in os.listdir(path)]

    recognizer = cv2.face.LBPHFaceRecognizer_create()  # 创建一个训练器
    faceCascade = cv2.CascadeClassifier(os.apth.join(work_dir, 'haarcascade_frontalface_default.xml'))  # 加载人脸训练器xml文件

    count = 1
    # 训练需要两组数据ids、face_samples
    ids = []
    face_samples = []

    for each_image in all_image_path:
        id = int(os.path.split(each_image)[1].split('_')[1])
        PIL_image = Image.open(each_image).convert('L')  # 把图片转换成训练所需要的数据
        np_image = np.array(PIL_image, 'uint8')  # 把数据长度格式转换为8位
        faces = faceCascade.detectMultiScale(np_image)  # 检测转换的数据矩阵里面有没有脸
        for (x, y, w, h) in faces:
            face_samples.append(np_image)
            ids.append(id)
        print('已训练', count, '张')
        count += 1

    recognizer.train(face_samples, np.array(ids))
    recognizer.write('people_face.yml')
    print('人脸数据训练成功！')


# 开始识别
def recognition():
    cap = cv2.VideoCapture(0)  # 0表示默认系统摄像头
    font = cv2.FONT_HERSHEY_SIMPLEX
    recognizer = cv2.face.LBPHFaceRecognizer_create()  # 创建一个训练器
    faceCascade = cv2.CascadeClassifier(os.path.join(work_dir, 'haarcascade_frontalface_default.xml'))  # 加载人脸训练器xml文件
    recognizer.read(os.path.join(work_dir,'people_face.yml'))  # 加载训练好的文件
    face_id = ''
    while True:
        ok, img = cap.read()  # 读取摄像头数据, 必须返回两个参数

        if not ok:
            break
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)  # 转换为灰度图像

        # faces存放所有脸信息(要用灰度图片检测)
        faces = faceCascade.detectMultiScale(
            gray,
            scaleFactor=1.1,
            minNeighbors=5,
            minSize=(32, 32)
        )
        name_str = ''

        # 如果有脸，就把脸框起来画矩形
        for (x, y, w, h) in faces:
            cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0))
            # 开始识别人脸
            face_id, con = recognizer.predict(gray[y:y + h, x:x + w])
            print(face_id)

            if int(face_id) == 1001:
                name_str = 'Song Yang'
            cv2.putText(img, name_str + '(' + str(format(con, '.1f')) + '%)', (x + w + 5, y - 5), font, 0.6,
                        (0, 255, 0), 1)

        cv2.imshow('Recognition', img)
        key = cv2.waitKey(10)  # 间隔10ms刷新
        if name_str:
            break
        if cv2.getWindowProperty('Recognition', cv2.WND_PROP_AUTOSIZE) < 1:  # 鼠标关闭窗口
            break
        elif key == 8:  # 键盘按×退出
            break
    cap.release()  # 关闭摄像头
    cv2.destroyWindow('Recognition')  # 删除窗口
    return face_id


if __name__ == '__main__':
    pass
