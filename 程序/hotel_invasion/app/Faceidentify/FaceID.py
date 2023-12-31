# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'FaceID.ui'
#
# Created by: PyQt5 UI code generator 5.15.4
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.

import face_recognition
import sys
from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(369, 262)
        self.label = QtWidgets.QLabel(Form)
        self.label.setGeometry(QtCore.QRect(11, 11, 351, 91))
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.pushButton = QtWidgets.QPushButton(Form)
        self.pushButton.setGeometry(QtCore.QRect(11, 110, 351, 41))
        self.pushButton.setObjectName("pushButton")
        self.pushButton_2 = QtWidgets.QPushButton(Form)
        self.pushButton_2.setGeometry(QtCore.QRect(11, 160, 351, 41))
        self.pushButton_2.setObjectName("pushButton_2")
        self.pushButton_3 = QtWidgets.QPushButton(Form)
        self.pushButton_3.setGeometry(QtCore.QRect(11, 210, 351, 41))
        self.pushButton_3.setObjectName("pushButton_3")

        def slot1():
            face_recognition.detection('1001', 100)

        def slot2():
            face_recognition.training()

        def slot3():
            face_recognition.recognition()

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

        self.pushButton.clicked.connect(slot1)
        self.pushButton_2.clicked.connect(slot2)
        self.pushButton_3.clicked.connect(slot3)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Form"))
        self.label.setText(_translate("Form", "人脸识别测试"))
        self.pushButton.setText(_translate("Form", "采集数据"))
        self.pushButton_2.setText(_translate("Form", "开始训练"))
        self.pushButton_3.setText(_translate("Form", "开始识别"))


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    w = QtWidgets.QMainWindow()
    ui = Ui_Form()
    w.setFixedSize(375, 265)
    ui.setupUi(w)
    w.show()
    sys.exit(app.exec_())
