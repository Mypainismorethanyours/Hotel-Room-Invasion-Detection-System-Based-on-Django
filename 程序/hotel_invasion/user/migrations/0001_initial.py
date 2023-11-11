# Generated by Django 3.2.8 on 2022-09-29 15:30

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(default='', max_length=50, verbose_name='姓名')),
                ('password', models.CharField(default='123', max_length=50, verbose_name='密码')),
                ('image', models.ImageField(default='static/media/default.png', upload_to='static/media', verbose_name='图片')),
                ('phone', models.CharField(default='', max_length=50, verbose_name='邮箱')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('modify_time', models.DateTimeField(auto_now=True, verbose_name='最后修改时间')),
                ('role', models.IntegerField(default=2, verbose_name='角色')),
                ('description', models.TextField(verbose_name='个人描述')),
            ],
            options={
                'db_table': 'user',
            },
        ),
    ]
