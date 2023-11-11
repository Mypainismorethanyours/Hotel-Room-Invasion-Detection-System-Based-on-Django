from django.db import models


# Create your models here.
class Room(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField('房间名', default='', max_length=50)
    price = models.IntegerField('房间价格', default=0)
    room_type = models.CharField('房间类别', default='大床房', max_length=50)
    image = models.CharField('图片', max_length=255, default='static/media/default.png')
    status = models.CharField('状态', default='', max_length=50)
    create_time = models.DateTimeField('创建时间', auto_now_add=True)
    description = models.TextField('房间描述', default='')

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'room'


class Customer(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField('住客姓名', default='', max_length=100)
    sid = models.CharField('身份证号码', default='', max_length=50)
    face_id = models.CharField('人脸ID', default='', max_length=10, null=True)
    sex = models.CharField('性别', default='', max_length=10)
    is_ruzhu = models.IntegerField(default=0)
    live_time = models.DateTimeField('到店时间', auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'customer'


class Order(models.Model):
    id = models.AutoField(primary_key=True)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, default='', verbose_name='关联顾客')
    room = models.ForeignKey(Room, on_delete=models.CASCADE, default='', verbose_name='关联房间')
    start_time = models.DateTimeField(max_length=100, help_text="入住时间")
    end_time = models.DateTimeField(auto_now=True, help_text="退房时间")
    status = models.IntegerField('入住状态,1为在住，0为结束', default=1)

    def __str__(self):
        return ''

    class Meta:
        db_table = 'order'


class WarningInfo(models.Model):
    id = models.AutoField(primary_key=True)
    room = models.ForeignKey(Room, on_delete=models.CASCADE, default='', verbose_name='关联房间')
    count = models.IntegerField('警告次数', default=1)
    create_time = models.DateTimeField('创建时间', auto_now_add=True)

    def __str__(self):
        return ''

    class Meta:
        db_table = 'warning_info'

class Face(models.Model):
    id= models.CharField('',default='',max_length=255,primary_key=True)
    name = models.CharField('',default='',max_length=255)
    face_feature = models.CharField('',default='',max_length=1000)


    def __str__(self):
        return self.name

    class Meta:
        db_table = 'face'
