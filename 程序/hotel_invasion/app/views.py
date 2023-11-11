import random
import time
from datetime import datetime
from random import randint
from django.core.paginator import Paginator
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from .models import Room, WarningInfo, Order, Customer
from user.models import User
#from .Faceidentify import face_recognition


def login(req):
    return render(req, 'login.html')


def login_out(req):
    del req.session['username']
    return HttpResponseRedirect('/')


def index(request):
    # for i in range(1001,1012):
    #     print(randid())
    #     Customer.objects.create(
    #         name=randname(),
    #         face_id=str(i),
    #         sid=str(randid()),
    #         sex=random.choice(['男','女']),
    #
    #
    #     )
    username = request.session['username']
    total_user = User.objects.count()
    total_customer = Customer.objects.count()
    total_room = Room.objects.count()
    warnings_info = WarningInfo.objects.all()
    total_free_room = Room.objects.filter(status='空房').count()
    total_used_room = Room.objects.filter(status='入住').count()

    return render(request, 'index.html', locals())

def personal(request):
    username = request.session['username']
    role_id = request.session['role']
    user = User.objects.filter(name=username).first()
    return render(request,'personal.html',locals())
def randname():  # 姓名
    xing = [
        '赵', '钱', '孙', '李', '周', '吴', '郑', '王', '冯', '陈', '褚', '卫', '蒋', '沈', '韩', '杨', '朱', '秦', '尤', '许',
        '何', '吕', '施', '张', '孔', '曹', '严', '华', '金', '魏', '陶', '姜', '戚', '谢', '邹', '喻', '柏', '水', '窦', '章',
        '云', '苏', '潘', '葛', '奚', '范', '彭', '郎', '鲁', '韦', '昌', '马', '苗', '凤', '花', '方', '俞', '任', '袁', '柳',
        '酆', '鲍', '史', '唐', '费', '廉', '岑', '薛', '雷', '贺', '倪', '汤', '滕', '殷', '罗', '毕', '郝', '邬', '安', '常',
        '乐', '于', '时', '傅', '皮', '卞', '齐', '康', '伍', '余', '元', '卜', '顾', '孟', '平', '黄', '和', '穆', '萧', '尹',
        '姚', '邵', '堪', '汪', '祁', '毛', '禹', '狄', '贝', '明', '臧', '计', '伏', '成', '戴', '谈', '宋', '茅', '庞', '梁']
    ming1 = ['一', '二', '三', '四', '五', '六', '七', '八', '九']
    ming2 = [
        '的', '一', '是', '了', '我', '不', '人', '在', '他', '有', '这', '个', '上', '们', '来', '到', '时', '大', '地', '为',
        '子', '中', '你', '说', '生', '国', '年', '着', '就', '那', '和', '要', '她', '出', '也', '得', '里', '后', '自', '以',
        '会', '家', '可', '下', '而', '过', '天', '去', '能', '对', '小', '多', '然', '于', '心', '学', '么', '之', '都', '好',
        '看', '起', '发', '当', '没', '成', '只', '如', '事', '把', '还', '用', '第', '样', '道', '想', '作', '种', '开', '美',
        '总', '从', '无', '情', '己', '面', '最', '女', '但', '现', '前', '些', '所', '同', '日', '手', '又', '行', '意', '动',
        '方', '期', '它', '头', '经', '长', '儿', '回', '位', '分', '爱', '老', '因', '很', '给', '名', '法', '间', '斯', '知',
        '世', '什', '两', '次', '使', '身', '者', '被', '高', '已', '亲', '其', '进', '此', '话', '常', '与', '活', '正', '感',
        '见', '明', '问', '力', '理', '尔', '点', '文', '几', '定', '本', '公', '特', '做', '外', '孩', '相', '西', '果', '走',
        '将', '月', '十', '实', '向', '声', '车', '全', '信', '重', '三', '机', '工', '物', '气', '每', '并', '别', '真', '打',
        '太', '新', '比', '才', '便', '夫', '再', '书', '部', '水', '像', '眼', '等', '体', '却', '加', '电', '主', '界', '门',
        '利', '海', '受', '听', '表', '德', '少', '克', '代', '员', '许', '稜', '先', '口', '由', '死', '安', '写', '性', '马',
        '光', '白', '或', '住', '难', '望', '教', '命', '花', '结', '乐', '色', '更', '拉', '东', '神', '记', '处', '让', '母',
        '父', '应', '直', '字', '场', '平', '报', '友', '关', '放', '至', '张', '认', '接', '告', '入', '笑', '内', '英', '军',
        '候', '民', '岁', '往', '何', '度', '山', '觉', '路', '带', '万', '男', '边', '风', '解', '叫', '任', '金', '快', '原',
        '吃', '妈', '变', '通', '师', '立', '象', '数', '四', '失', '满', '战', '远', '格', '士', '音', '轻', '目', '条', '呢',
        '病', '始', '达', '深', '完', '今', '提', '求', '清', '王', '化', '空', '业', '思', '切', '怎', '非', '找', '片', '罗',
        '钱', '紶', '吗', '语', '元', '喜', '曾', '离', '飞', '科', '言', '干', '流', '欢', '约', '各', '即', '指', '合', '反',
        '题', '必', '该', '论', '交', '终', '林', '请', '医', '晚', '制', '球', '决', '窢', '传', '画', '保', '读', '运', '及',
        '则', '房', '早', '院', '量', '苦', '火', '布', '品', '近', '坐', '产', '答', '星', '精', '视', '五', '连', '司', '巴',
        '奇', '管', '类', '未', '朋', '且', '婚', '台', '夜', '青', '北', '队', '久', '乎', '越', '观', '落', '尽', '形', '影',
        '红', '爸', '百', '令', '周', '吧', '识', '步', '希', '亚', '术', '留', '市', '半', '热', '送', '兴', '造', '谈', '容',
        '极', '随', '演', '收', '首', '根', '讲', '整', '式', '取', '照', '办', '强', '石', '古', '华', '諣', '拿', '计', '您',
        '装', '似', '足', '双', '妻', '尼', '转', '诉', '米', '称', '丽', '客', '南', '领', '节', '衣', '站', '黑', '刻', '统',
        '断', '福', '城', '故', '历', '惊', '脸', '选', '包', '紧', '争', '另', '建', '维', '绝', '树', '系', '伤', '示', '愿',
        '持', '千', '史', '谁', '准', '联', '妇', '纪', '基', '买', '志', '静', '阿', '诗', '独', '复', '痛', '消', '社', '算',
        '义', '竟', '确', '酒', '需', '单', '治', '卡', '幸', '兰', '念', '举', '仅', '钟', '怕', '共', '毛', '句', '息', '功',
        '官', '待', '究', '跟', '穿', '室', '易', '游', '程', '号', '居', '考', '突', '皮', '哪', '费', '倒', '价', '图', '具',
        '刚', '脑', '永', '歌', '响', '商', '礼', '细', '专', '黄', '块', '脚', '味', '灵', '改', '据', '般', '破', '引', '食',
        '仍', '存', '众', '注', '笔', '甚', '某', '沉', '血', '备', '习', '校', '默', '务', '土', '微', '娘', '须', '试', '怀',
        '料', '调', '广', '蜖', '苏', '显', '赛', '查', '密', '议', '底', '列', '富', '梦', '错', '座', '参', '八', '除', '跑',
        '亮', '假', '印', '设', '线', '温', '虽', '掉', '京', '初', '养', '香', '停', '际', '致', '阳', '纸', '李', '纳', '验',
        '助', '激', '够', '严', '证', '帝', '饭', '忘', '趣', '支', '春', '集', '丈', '木', '研', '班', '普', '导', '顿', '睡',
        '展', '跳', '获', '艺', '六', '波', '察', '群', '皇', '段', '急', '庭', '创', '区', '奥', '器', '谢', '弟', '店', '否',
        '害', '草', '排', '背', '止', '组', '州', '朝', '封', '睛', '板', '角', '况', '曲', '馆', '育', '忙', '质', '河', '续',
        '哥', '呼', '若', '推', '境', '遇', '雨', '标', '姐', '充', '围', '案', '伦', '护', '冷', '警', '贝', '著', '雪', '索',
        '剧', '啊', '船', '险', '烟', '依', '斗', '值', '帮', '汉', '慢', '佛', '肯', '闻', '唱', '沙', '局', '伯', '族', '低',
        '玩', '资', '屋', '击', '速', '顾', '泪', '洲', '团', '圣', '旁', '堂', '兵', '七', '露', '园', '牛', '哭', '旅', '街',
        '劳', '型', '烈', '姑', '陈', '莫', '鱼', '异', '抱', '宝', '权', '鲁', '简', '态', '级', '票', '怪', '寻', '杀', '律',
        '胜', '份', '汽', '右', '洋', '范', '床', '舞', '秘', '午', '登', '楼', '贵', '吸', '责', '例', '追', '较', '职', '属',
        '渐', '左', '录', '丝', '牙', '党', '继', '托', '赶', '章', '智', '冲', '叶', '胡', '吉', '卖', '坚', '喝', '肉', '遗',
        '救', '修', '松', '临', '藏', '担', '戏', '善', '卫', '药', '悲', '敢', '靠', '伊', '村', '戴', '词', '森', '耳', '差',
        '短', '祖', '云', '规', '窗', '散', '迷', '油', '旧', '适', '乡', '架', '恩', '投', '弹', '铁', '博', '雷', '府', '压',
        '超', '负', '勒', '杂', '醒', '洗', '采', '毫', '嘴', '毕', '九', '冰', '既', '状', '乱', '景', '席', '珍', '童', '顶',
        '派', '素', '脱', '农', '疑', '练', '野', '按', '犯', '拍', '征', '坏', '骨', '余', '承', '置', '臓', '彩', '灯', '巨',
        '琴', '免', '环', '姆', '暗', '换', '技', '翻', '束', '增', '忍', '餐', '洛', '塞', '缺', '忆', '判', '欧', '层', '付',
        '阵', '玛', '批', '岛', '项', '狗', '休', '懂', '武', '革', '良', '恶', '恋', '委', '拥', '娜', '妙', '探', '呀', '营',
        '退', '摇', '弄', '桌', '熟', '诺', '宣', '银', '势', '奖', '宫', '忽', '套', '康', '供', '优', '课', '鸟', '喊', '降',
        '夏', '困', '刘', '罪', '亡', '鞋', '健', '模', '败', '伴', '守', '挥', '鲜', '财', '孤', '枪', '禁', '恐', '伙', '杰',
        '迹', '妹', '藸', '遍', '盖', '副', '坦', '牌', '江', '顺', '秋', '萨', '菜', '划', '授', '归', '浪', '听', '凡', '预',
        '奶', '雄', '升', '碃', '编', '典', '袋', '莱', '含', '盛', '济', '蒙', '棋', '端', '腿', '招', '释', '介', '烧', '误',
        '乾', '坤']
    x = randint(0, len(xing) - 1)
    y = randint(0, len(ming1) - 1)
    z = randint(0, len(ming2) - 1)
    return xing[x] + ming1[y] + ming2[z]


def deal_day(d, str_id):  # 日期处理
    id_day = randint(1, d)
    if id_day < 10:
        str_id.append("0")
        str_id.append(str(id_day))
    else:
        str_id.append(str(id_day))


def randid():  # 身份证
    str_id = []
    list1 = ['11', '12', '13', '14', '15', '21', '22', '23', '31', '32', '33', '34', '35', '36', '37', '41', '42', '43',
             '44', '45', '46', '50', '51', '52', '53', '54', '61', '62', '63', '64', '65', '81', '82', '83']  # 全国区域代码
    province_num = randint(1, len(list1) - 1)
    str_id.append(list1[province_num])
    city_num = randint(1000, 9999)
    str_id.append(str(city_num))
    id_year = randint(1950, 2010)
    str_id.append(str(id_year))
    id_month = randint(1, 12)
    if id_month < 10:
        str_id.append("0")
        str_id.append(str(id_month))
    else:
        str_id.append(str(id_month))
    if id_year % 4 == 0:  # 闰年
        if id_month == 2:
            deal_day(29, str_id)
        elif id_month in (1, 3, 5, 7, 8, 10, 12):
            deal_day(31, str_id)
        else:
            deal_day(30, str_id)
    else:
        if id_month == 2:
            deal_day(28, str_id)
        elif id_month in (1, 3, 5, 7, 8, 10, 12):
            deal_day(31, str_id)
        else:
            deal_day(30, str_id)
    rand_num = randint(100, 999)
    str_id.append(str(rand_num))
    check_num = randint(1, 10)
    if check_num == 10:
        str_id.append("x")
    else:
        str_id.append(str(check_num))
    return "".join(str_id)


def room_list(request):
    username = request.session['username']
    customers = Customer.objects.filter(is_ruzhu=0).all()
    orders = Order.objects.all()

    rooms = Room.objects.all()

    for i in rooms:
        r = Order.objects.filter(room_id=i.id).first()
        if r:
            i.date = str(r.start_time.strftime('%Y-%m-%d'))+ '~' + str(r.end_time.strftime('%Y-%m-%d'))
        i.floor = i.name[0]
    return render(request, 'room-list.html', locals())


def get_customer(request):
    """
    获取用户列表信息 | 模糊查询
    :param request:
    :return:
    """
    keyword = request.GET.get('name')
    page = request.GET.get("page", '')
    limit = request.GET.get("limit", '')
    response_data = {}
    response_data['code'] = 0
    response_data['msg'] = ''
    data = []
    if keyword is None:
        users_all = Customer.objects.all()
    else:
        users_all = Customer.objects.filter(name__contains=keyword).all()
    paginator = Paginator(users_all, limit)
    results = paginator.page(page)
    if results:
        for user in results:
            record = {
                "id": user.id,
                "name": user.name,
                "sid": user.sid,
                "face_id": user.face_id,
                "sex": user.sex,
                'create_time': user.live_time.strftime('%Y-%m-%d'),
            }
            data.append(record)
        response_data['count'] = len(users_all)
        response_data['data'] = data
    return JsonResponse(response_data)


def customer(request):
    """
    跳转用户页面
    """
    username = request.session['username']
    role = int(request.session['role'])
    user_id = request.session['user_id']
    newest_customer = Customer.objects.all().order_by('-face_id')[0]
    newest_face_id = str(int(newest_customer.face_id) + 1)
    return render(request, 'customer.html', locals())


def add_customer(request):
    """
    注册账号
    :return:
    """
    try:
        name = request.POST.get('username')
        sex = request.POST.get('sex')
        sid = request.POST.get('sid')
        user = Customer.objects.filter(sid=sid)
        if user:
            return JsonResponse({'message': '客户已存在,请直接登录'}, status=403)
        Customer.objects.create(
            name=name,
            sex=sex,
            sid=sid,
            face_id='',
        )
        response_data = {'message': '注册成功'}
        return JsonResponse(response_data)
    except Exception as e:
        print(e)
        return JsonResponse({'message': '注册失败'}, status=401)


def ruzhu(request):
    room_name = request.POST.get('room_name')
    customer_id = request.POST.get('customer_id')
    customer_obj = Customer.objects.filter(id=customer_id).first()
    print('11111')
    print(customer_obj)
    print(customer_obj.face_id)
    if not customer_obj.face_id:
        response_data = {'message': '人脸未录入，请先录入人脸！'}
        return JsonResponse(response_data,status=403)
    se_time = request.POST.get('time')
    start_time = se_time.split('-')[0]
    end_time = se_time.split('-')[1]
    start_time = start_time.split('/')[2].strip() + "-" + start_time.split('/')[0] + "-" + start_time.split('/')[1]
    end_time = end_time.split('/')[2].strip() + "-" + end_time.split('/')[0] + "-" + end_time.split('/')[1]
    Order.objects.create(
        customer=Customer.objects.filter(id=customer_id).first(),
        room=Room.objects.filter(name=room_name).first(),
        start_time=start_time,
        end_time=end_time,
    )
    Room.objects.filter(name=room_name).update(
        status='入住'
    )
    Customer.objects.filter(id=customer_id).update(
        is_ruzhu=1
    )
    response_data = {'message': '注册成功'}
    return JsonResponse(response_data)


def collect_face(request):
    print("开始采集人脸")
    from .recognize_face.workAttendanceSystem import WAS
    import wx
    #app = wx.App()
    frame = WAS()
    #frame.Show()
    #app.MainLoop()
    face_id = request.GET.get('face_id')
    customer_id = request.GET.get('customer_id')
    print(face_id)
    frame.id = face_id
    frame.name = Customer.objects.filter(id=customer_id).first().name
    frame.register_cap()
    print("11111")
    #app.ExitMainLoop()
    # slot2()
    Customer.objects.filter(id=customer_id).update(
        face_id=face_id
    )
    return JsonResponse({'msg': 'ok'})


def detection(request):
    from .recognize_face.workAttendanceSystem import WAS
    #import wx
    #app = wx.App()
    frame = WAS()
    room_name = request.GET.get('room_name')
    room = Room.objects.filter(name=room_name).first()
    print(room)
    order = Order.objects.filter(room=room).first()
    current_room_face_id = order.customer.face_id
    print("开始验证")
    face_id = frame.punchcard_cap()
    #app.ExitMainLoop()
    print(current_room_face_id,face_id,type(face_id),type(current_room_face_id))
    current_time = time.strftime('%Y-%m-%d',time.localtime())
    room_end_time = order.end_time
    current_time = datetime.strptime(current_time, "%Y-%m-%d")
    print(current_time,room_end_time)
    print(type(current_time),type(room_end_time))

    if room_end_time < current_time:
        return JsonResponse({'msg': '已超过入住时间，无法开门！', 'status': 'error'})
    if int(current_room_face_id) == int(face_id):
        return JsonResponse({'msg': '开门成功！', 'status': 'success'})
    warning_info = WarningInfo.objects.filter(room=room).first()
    if warning_info:
        WarningInfo.objects.filter(room=room).update(
            count = warning_info.count+1,
        )
    else:
        WarningInfo.objects.create(
            room_id=room.id
        )
    return JsonResponse({'msg': '开门失败！', 'status': 'error'})

def delete_order(request):
    room_name = request.POST.get('room_name')
    room = Room.objects.filter(name=room_name).first()
    Order.objects.filter(room=room).update(
        status=0
    )
    Room.objects.filter(name=room_name).update(
        status='空房'
    )
    Customer.object.filter(id=room.customer.id).update(
        is_ruzhu=0
    )
    return JsonResponse({'msg': '退房成功！', 'status': 'success'})

def del_customer(request):
    """
    删除客户
    """
    user_id = request.POST.get('id')
    result = Customer.objects.filter(id=user_id).first()
    try:
        if not result:
            response_data = {'error': '删除失败！', 'message': '找不到id为%s' % user_id}
            return JsonResponse(response_data, status=403)
        result.delete()
        response_data = {'message': '删除成功！'}
        return JsonResponse(response_data, status=201)
    except Exception as e:
        response_data = {'message': '删除失败！'}
        return JsonResponse(response_data, status=403)

def add_customer(request):
    """
    添加客户
    :param request:
    :return:
    """
    try:
        name = request.POST.get('username')
        sex = request.POST.get('sex')
        sid = request.POST.get('sid')
        user = Customer.objects.filter(sid=sid)
        if user:
            return JsonResponse({'message': '客户已存在,请直接登录'}, status=403)
        Customer.objects.create(
            name=name,
            sex=sex,
            sid=sid,
            is_ruzhu=0,
            face_id=''
        )
        response_data = {'message': '注册成功'}
        return JsonResponse(response_data)
    except Exception as e:
        print(e)
        return JsonResponse({'message': '注册失败'}, status=401)