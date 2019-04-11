import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';



class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];
  List list = [loadingTag];

  @override
  void initState() {
    _retrieveData();
  }

 @override
  Widget build(BuildContext context) {
    print('build');
    print(list[0]);
      print('build after');
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        print(index);
        String indexs = index.toString();
        if (indexs is String) {
    print("The value is a String, but I needed "
        "to check with an explicit condition.");
  }
        if (list[index] == loadingTag) {
          //不足100条，继续获取数据
          if (list.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        //显示单词列表项
        return   _newsRow(list[index]);
        return ListTile(
         onTap: (){
            print(_words[index]);
            Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new ContentScreen(text: _words[index]))
    );
          }
          );
        },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      const data = {
	"has_more": true,
	"message": "success",
	"data": [{
		"single_mode": true,
		"abstract": "欧盟10日召开紧急峰会商讨英国延期脱欧事宜，欧洲领导人经过商讨，最终同意英国延期脱欧。欧盟外交人士称，欧盟27国领导人同意英国脱欧延长至10月底，正等待英国答复。",
		"middle_mode": true,
		"more_mode": false,
		"tag": "news_world",
		"label": ["英国", "唐纳德·图斯克", "欧洲", "文翠珊", "爱尔兰共和国"],
		"comments_count": 387,
		"tag_url": "news_world",
		"title": "又“拖”了！欧盟27国同意英国脱欧延期至10月底",
		"chinese_tag": "国际",
		"source": "中国新闻网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/5757091251/",
		"media_avatar_url": "//p3.pstatp.com/large/97d001bf3f3cba72913",
		"source_url": "/group/6678405084591686147/",
		"article_genre": "article",
		"item_id": "6678405084591686147",
		"is_feed_ad": false,
		"behot_time": 1554953680,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/1526286649246daeefcb1d4",
		"group_id": "6678405084591686147",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/1526286649246daeefcb1d4"
	}, {
		"single_mode": true,
		"abstract": "绵延60余年的中国户籍制度迎来力度最大的一次变革。4月8日，国家发展改革委下发《2019年新型城镇化建设重点任务》的通知。",
		"middle_mode": true,
		"more_mode": false,
		"tag": "news_house",
		"label": ["经济", "农村", "购房", "银行", "金融", "中国建设银行", "日本", "社会保险", "中国人民银行"],
		"comments_count": 155,
		"tag_url": "search/?keyword=æ¿äº§",
		"title": "中国户籍制度大变革 房价还会上涨吗？",
		"chinese_tag": "房产",
		"source": "央视网新闻",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/50025817786/",
		"media_avatar_url": "//p1.pstatp.com/large/bc20000b91968707dab",
		"source_url": "/group/6678193746678383107/",
		"article_genre": "article",
		"item_id": "6678193746678383107",
		"is_feed_ad": false,
		"behot_time": 1554953230,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/d5f520b6275246c18a94e113ecd3fd8b",
		"group_id": "6678193746678383107",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/d5f520b6275246c18a94e113ecd3fd8b"
	}, {
		"single_mode": true,
		"abstract": "喝水的重要性不言而喻，不光能够解决口渴，更能促进我们身体有害物质的代谢，保证身体健康。它们分别是在超市购买的6款普通瓶装水，净水器过滤后的直饮水以及开水器烧开后的白开水。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_media",
		"label": ["净水器", "恒大冰泉", "农夫山泉", "康师傅", "广州", "广东"],
		"comments_count": 309,
		"tag_url": "search/?keyword=ä¼ åª",
		"title": "8款饮用水大横评 那些年我们喝过的水是假的？",
		"chinese_tag": "传媒",
		"source": "环球网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/5954781019/",
		"media_avatar_url": "//p1.pstatp.com/large/4d00054b126ceaf920",
		"image_list": [{
			"url": "//p1.pstatp.com/list/pgc-image/RNFwyPAA0DJJuH"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNGHT9k4IHs2ee"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNGHT9y9LgcfgS"
		}],
		"source_url": "/group/6678426840895324680/",
		"article_genre": "article",
		"item_id": "6678426840895324680",
		"is_feed_ad": false,
		"behot_time": 1554952780,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/RNFwyPAA0DJJuH",
		"group_id": "6678426840895324680",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/RNFwyPAA0DJJuH"
	}, {
		"single_mode": true,
		"abstract": "人类史上首张黑洞照片问世北京时间4月10日，“事件视界望远镜”项目在美国华盛顿、中国上海和台北、智利圣地亚哥、比利时布鲁塞尔、丹麦灵比和日本东京同时召开的新闻发布会上，以英语、汉语、西班牙语、丹麦语和日语发布“事件视界望远镜”的第一项重大成果——人类有史以来获得的第一张黑洞照片。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "science_all",
		"label": ["黑洞", "阿尔伯特·爱因斯坦", "宇宙", "相对论", "月球", "上海", "摄影", "银河", "美国国家航空航天局", "地球", "新闻", "法国", "体育"],
		"comments_count": 2379,
		"tag_url": "search/?keyword=ç§å­¦",
		"title": "黑洞照片来了！爱因斯坦说对了！",
		"chinese_tag": "科学",
		"source": "中国青年网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/3582660809/",
		"media_avatar_url": "//p2.pstatp.com/thumb/1398/4664054183",
		"image_list": [{
			"url": "//p9.pstatp.com/list/pgc-image/RNFGcLY6AcNA9r"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNFGcLnI90pzfr"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNFGcLz4eezmaQ"
		}],
		"source_url": "/group/6678257643229807116/",
		"article_genre": "article",
		"item_id": "6678257643229807116",
		"is_feed_ad": false,
		"behot_time": 1554952330,
		"image_url": "//p9.pstatp.com/list/190x124/pgc-image/RNFGcLY6AcNA9r",
		"group_id": "6678257643229807116",
		"middle_image": "http://p9.pstatp.com/list/pgc-image/RNFGcLY6AcNA9r"
	}, {
		"single_mode": true,
		"abstract": "4月9日晚间，日本航空自卫队一架F-35A战斗机在日本东北部海域上空失去联系，后被确认坠毁。事故战斗机的飞行员在飞行中突然喊出“knockitoff”，然后即失去联系，日方地面雷达也随即失去了该机信号。",
		"middle_mode": true,
		"more_mode": false,
		"tag": "news_politics_general",
		"comments_count": 78,
		"tag_url": "search/?keyword=None",
		"title": "日本坠毁的这架F-35A 原本意义重大",
		"label": ["日本", "战斗机", "F-35闪电II战斗攻击机", "航空", "技术", "雷达", "安倍晋三", "工程师", "亚洲"],
		"source": "人民日报海外网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/3242684112/",
		"media_avatar_url": "//p2.pstatp.com/large/1687/8327084584",
		"source_url": "/group/6678177953999749635/",
		"article_genre": "article",
		"item_id": "6678177953999749635",
		"is_feed_ad": false,
		"behot_time": 1554951880,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/RNE0mP3EJ4zi1w",
		"group_id": "6678177953999749635",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/RNE0mP3EJ4zi1w"
	}, {
		"single_mode": true,
		"abstract": "在本轮督导中，各督导组在人员配备上延续了以往“正部级挂帅”高规格，而“打伞破网”“打财断血”等则被列为本轮督导的重点。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_politics",
		"label": ["黑社会", "陈一新", "杜航伟", "广东", "昆明", "乔传秀", "合肥", "安徽", "上海", "刑法", "海南", "江苏", "新疆", "重庆", "贵州", "吴新雄", "四川", "姚增科", "跳槽那些事儿", "江西", "青海"],
		"comments_count": 395,
		"tag_url": "search/?keyword=æ¶æ¿",
		"title": "正部级挂帅！11个中央督导组进驻地方督战扫黑",
		"chinese_tag": "时政",
		"source": "中国新闻网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/5757091251/",
		"media_avatar_url": "//p3.pstatp.com/large/97d001bf3f3cba72913",
		"image_list": [{
			"url": "//p9.pstatp.com/list/pgc-image/RNFvP9j32ErWk3"
		}, {
			"url": "//p3.pstatp.com/list/pgc-image/RNFvPA16Qpk2Tj"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNFvPAEELaPXp6"
		}],
		"source_url": "/group/6678299398553731588/",
		"article_genre": "article",
		"item_id": "6678299398553731588",
		"is_feed_ad": false,
		"behot_time": 1554951430,
		"image_url": "//p9.pstatp.com/list/190x124/pgc-image/RNFvP9j32ErWk3",
		"group_id": "6678299398553731588",
		"middle_image": "http://p9.pstatp.com/list/pgc-image/RNFvP9j32ErWk3"
	}, {
		"single_mode": true,
		"abstract": "当地时间4月8日上午，36岁的女演员艾莉森⋅麦克出现在纽约布鲁克林的美国地方法院。她当庭认罪，承认为性爱邪教NXIVM操控女性、把她们发展为性奴，并在法庭上流泪向这些女性道歉。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_world",
		"label": ["头条女神", "墨西哥", "好莱坞", "美国电视剧", "传销", "超人前传", "侠胆雄狮", "高能小子终极装备", "艾莉森·麦克", "太空堡垒卡拉狄加", "超人", "纽约", "艾美奖", "文章"],
		"comments_count": 565,
		"tag_url": "news_world",
		"title": "女明星认罪！美国爆出惊天黑幕！",
		"chinese_tag": "国际",
		"source": "环球网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/5954781019/",
		"media_avatar_url": "//p1.pstatp.com/large/4d00054b126ceaf920",
		"image_list": [{
			"url": "//p1.pstatp.com/list/pgc-image/RND9JPTDrEWzdV"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RND9JPiIin5nqt"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RND9JPuHbGvYe6"
		}],
		"source_url": "/group/6678123240881127949/",
		"article_genre": "article",
		"item_id": "6678123240881127949",
		"is_feed_ad": false,
		"behot_time": 1554950980,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/RND9JPTDrEWzdV",
		"group_id": "6678123240881127949",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/RND9JPTDrEWzdV"
	}, {
		"single_mode": true,
		"abstract": "答：此次调图进一步优化了运输组织，为科学配置运力资源、提高运输供给质量创造了条件。一是青岛进入北京3小时交通圈。",
		"middle_mode": true,
		"more_mode": false,
		"tag": "news_society",
		"label": ["高峰", "青岛", "兰州", "昆明", "成都", "发现佩奇", "上海", "京津冀", "白洋淀", "石家庄", "大连", "西安", "郑州", "佳木斯"],
		"comments_count": 53,
		"tag_url": "news_society",
		"title": "全国铁路再迎调图 回家的路又快了一点",
		"chinese_tag": "社会",
		"source": "经济日报",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/50098460684/",
		"media_avatar_url": "//p3.pstatp.com/large/bc2000374269918957f",
		"source_url": "/group/6678278818270020103/",
		"article_genre": "article",
		"item_id": "6678278818270020103",
		"is_feed_ad": false,
		"behot_time": 1554950530,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/REFEiuTCEwwwmN",
		"group_id": "6678278818270020103",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/REFEiuTCEwwwmN"
	}, {
		"single_mode": true,
		"abstract": "女人一辈子的怀孕次数和卵巢息息相关，正常情况下，卵巢每个月会排一次卵，一般都会排一个卵子，众所周知，卵子和精子结合形成受精卵，之后逐渐发育成胎儿。如果在排卵期或排卵前后同房，怀孕的几率就会大大增加。一个女人，一辈子最多能怀孕多少次？",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_baby",
		"label": ["怀孕", "不完美妈妈", "计划生育"],
		"comments_count": 167,
		"tag_url": "news_baby",
		"title": "一个女人，一辈子最多能怀孕多少次？",
		"chinese_tag": "育儿",
		"source": "悟空问答",
		"group_source": 10,
		"has_gallery": false,
		"media_url": "/c/user/95419380940/",
		"media_avatar_url": "//p3.pstatp.com/large/6edb0000040295b48883",
		"image_list": [{
			"url": "//p1.pstatp.com/list/1e06e0000f2390e805d78"
		}, {
			"url": "//p3.pstatp.com/list/1e0710000f06914e05ebb"
		}, {
			"url": "//p1.pstatp.com/list/1a09100083efb743a0a68"
		}],
		"source_url": "/group/6677822177481326856/",
		"article_genre": "wenda",
		"item_id": "6677822177481326856",
		"is_feed_ad": false,
		"behot_time": 1554950080,
		"image_url": "//p1.pstatp.com/list/190x124/1e06e0000f2390e805d78",
		"group_id": "6677822177481326856",
		"middle_image": "http://p1.pstatp.com/list/1e06e0000f2390e805d78"
	}, {
		"single_mode": true,
		"abstract": "当地时间4月9日下午，李克强总理与欧盟领导人会晤接近尾声时，现场相继响起两次热烈的掌声。据参加此次会晤的一位中国官员透露，当《第二十一次中国－欧盟领导人会晤联合声明》正式通过后，会场上响起了长时间的掌声。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_world",
		"label": ["中欧关系", "让-克洛德·容克", "李克强", "联合国", "欧洲", "唐纳德·图斯克", "布鲁塞尔", "经济", "投资", "Twitter", "胜利退出演艺圈"],
		"comments_count": 539,
		"tag_url": "news_world",
		"title": "中欧联合声明通过后，现场两次响起长时间掌声",
		"chinese_tag": "国际",
		"source": "环球网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/5954781019/",
		"media_avatar_url": "//p1.pstatp.com/large/4d00054b126ceaf920",
		"image_list": [{
			"url": "//p1.pstatp.com/list/pgc-image/RNDyofP7ctwiX3"
		}, {
			"url": "//p3.pstatp.com/list/pgc-image/RNDyofi2JXE3HQ"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNDyofv2asevkR"
		}],
		"source_url": "/group/6678175945771188743/",
		"article_genre": "article",
		"item_id": "6678175945771188743",
		"is_feed_ad": false,
		"behot_time": 1554949821,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/RNDyofP7ctwiX3",
		"group_id": "6678175945771188743",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/RNDyofP7ctwiX3"
	},{
		"single_mode": true,
		"abstract": "我炒菜也喜欢用蚝油，可能是从事了厨师行业后带来的影响吧，若是不放，总觉得少了点什么味道。况且蚝油是万能的调料品，一款顶好几种，菜肴放了蚝油，味精和鸡精都不必放了，毕竟它的鲜味特别突出。甚至白糖也可不放，盐也要适量减少，因为蚝油特点是～鲜咸带甜。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_health",
		"label": ["蠔油", "牡蛎", "调味品", "味精", "李锦裳", "酱油", "豆瓣酱", "牛奶"],
		"comments_count": 464,
		"tag_url": "news_health",
		"title": "最近炒菜喜欢放耗油，经常吃耗油对身体有没有坏处？",
		"chinese_tag": "健康",
		"source": "悟空问答",
		"group_source": 10,
		"has_gallery": false,
		"media_url": "/c/user/58570218552/",
		"media_avatar_url": "//p7.pstatp.com/large/3f050023851510b33fda",
		"image_list": [{
			"url": "//p9.pstatp.com/list/1e07200003c810d43b4f3"
		}, {
			"url": "//p1.pstatp.com/list/1e07200003c82758cda0b"
		}, {
			"url": "//p9.pstatp.com/list/1e07300003c413049cc17"
		}],
		"source_url": "/group/6673172508000125187/",
		"article_genre": "wenda",
		"item_id": "6673172508000125187",
		"is_feed_ad": false,
		"behot_time": 1554944572,
		"image_url": "//p9.pstatp.com/list/190x124/1e07200003c810d43b4f3",
		"group_id": "6673172508000125187",
		"middle_image": "http://p9.pstatp.com/list/1e07200003c810d43b4f3"
	}, {
		"single_mode": true,
		"abstract": "不过，在美国政府的“庇护”下，“全能神”的头目赵维山和被他包装成“基督转世”的情人杨向斌不仅逃出了中国，更令这个毒害社会的违法邪教组织进一步堕落成了西方反华势力的“马前卒”。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_media",
		"label": ["以色列", "BuzzFeed", "基督教", "社交网络", "政治", "Twitter", "环球时报", "麦当劳", "本尼·甘茨"],
		"comments_count": 1465,
		"tag_url": "search/?keyword=ä¼ åª",
		"title": "这个在中国作恶多端的邪教组织，在国外撞枪口被收拾了！",
		"chinese_tag": "传媒",
		"source": "中国经济网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/50502346296/",
		"media_avatar_url": "//p7.pstatp.com/large/b726000628f3d294ca51",
		"image_list": [{
			"url": "//p3.pstatp.com/list/pgc-image/RNDIpTY30lPRjV"
		}, {
			"url": "//p9.pstatp.com/list/pgc-image/RNDIpTq3rb3R1y"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNDIpU3ESYAkIH"
		}],
		"source_url": "/group/6678132969409872391/",
		"article_genre": "article",
		"item_id": "6678132969409872391",
		"is_feed_ad": false,
		"behot_time": 1554944342,
		"image_url": "//p3.pstatp.com/list/190x124/pgc-image/RNDIpTY30lPRjV",
		"group_id": "6678132969409872391",
		"middle_image": "http://p3.pstatp.com/list/pgc-image/RNDIpTY30lPRjV"
	}, {
		"single_mode": true,
		"abstract": "《寻秦记》电影版近日在贵州低调开机，古天乐、林峯等人已经到达贵州入组拍摄。古天乐林峯身着剧组服装古天乐与友人低调现身商场影版《寻秦记》剧组车辆通行证曝光",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_entertainment",
		"label": ["古天乐", "寻秦记", "林峯", "贵州"],
		"comments_count": 136,
		"tag_url": "news_entertainment",
		"title": "影版《寻秦记》路透图曝光 古天乐林峯低调现身贵州",
		"chinese_tag": "娱乐",
		"source": "中国青年网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/3582660809/",
		"media_avatar_url": "//p2.pstatp.com/thumb/1398/4664054183",
		"image_list": [{
			"url": "//p9.pstatp.com/list/pgc-image/RNEgJyH1V0npqk"
		}, {
			"url": "//p3.pstatp.com/list/pgc-image/RNEgJyc3FUzv4k"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNEgJz77KDY9Vt"
		}],
		"source_url": "/group/6678443957237580291/",
		"article_genre": "article",
		"item_id": "6678443957237580291",
		"is_feed_ad": false,
		"behot_time": 1554944112,
		"image_url": "//p9.pstatp.com/list/190x124/pgc-image/RNEgJyH1V0npqk",
		"group_id": "6678443957237580291",
		"middle_image": "http://p9.pstatp.com/list/pgc-image/RNEgJyH1V0npqk"
	}, {
		"single_mode": true,
		"abstract": "国家发改委日前公布《2019年新型城镇化建设重点任务》，其中关于落户放宽的新政，给大城市里的“漂泊族”们带来了希望。",
		"middle_mode": true,
		"more_mode": false,
		"tag": "news_house",
		"label": ["农村", "经济", "京津冀", "购房", "社会保险", "农民"],
		"comments_count": 1898,
		"tag_url": "search/?keyword=æ¿äº§",
		"title": "大城市落户开闸，一线城市户口更好拿了？房价会涨吗？",
		"chinese_tag": "房产",
		"source": "国是直通车",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/52449597743/",
		"media_avatar_url": "//p3.pstatp.com/large/ef4001667dcb688dcbc",
		"source_url": "/group/6677888486592217611/",
		"article_genre": "article",
		"item_id": "6677888486592217611",
		"is_feed_ad": false,
		"behot_time": 1554943882,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/abbd94eb49bd4720859880d75281516b",
		"group_id": "6677888486592217611",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/abbd94eb49bd4720859880d75281516b"
	}, {
		"single_mode": true,
		"abstract": "羊肉自古就是珍馐，都知道有些朝代不能擅杀耕牛，但是对于羊其实更金贵，只有皇族士大夫阶层才有机会吃。哪怕现在羊肉也是畜类肉中鲜嫩、滋补的“门面担当”，不过题主的这个问法，我觉得答案并不唯一，下面我们来分享一下几个羊身上不好买、特别好吃的部分。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_food",
		"label": ["温暖冬至", "美食", "羊肉串", "和牛", "羊汤", "家牛", "动物"],
		"comments_count": 59,
		"tag_url": "news_food",
		"title": "羊身上有一块很“好”的肉，羊肉贩子都不舍得卖留给自己吃，是哪一块肉呢？",
		"chinese_tag": "美食",
		"source": "悟空问答",
		"group_source": 10,
		"has_gallery": false,
		"media_url": "/c/user/93303357049/",
		"media_avatar_url": "//p3.pstatp.com/large/61740004cbdf58dfc98f",
		"image_list": [{
			"url": "//p3.pstatp.com/list/1e0730000e71753fe6042"
		}, {
			"url": "//p1.pstatp.com/list/1e0700000e43135e4b86c"
		}, {
			"url": "//p1.pstatp.com/list/1e0670000e7506233ba2a"
		}],
		"source_url": "/group/6677737114173440269/",
		"article_genre": "wenda",
		"item_id": "6677737114173440269",
		"is_feed_ad": false,
		"behot_time": 1554943652,
		"image_url": "//p3.pstatp.com/list/190x124/1e0730000e71753fe6042",
		"group_id": "6677737114173440269",
		"middle_image": "http://p3.pstatp.com/list/1e0730000e71753fe6042"
	}, {
		"single_mode": true,
		"abstract": "在声称对造成3名美军士兵死亡的汽车炸弹袭击负责后，塔利班武装组织再放“猛料”。塔利班当天宣称，击落了美军一架B-52重型战略轰炸机。",
		"middle_mode": true,
		"more_mode": false,
		"tag": "news_world",
		"label": ["塔利班", "轰炸机", "武器", "阿富汗猎犬", "叙利亚", "伊斯兰教", "战斗机", "导弹"],
		"comments_count": 154,
		"tag_url": "news_world",
		"title": "塔利班放“猛料”：击落美军一架B-52战略轰炸机",
		"chinese_tag": "国际",
		"source": "环球网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/5954781019/",
		"media_avatar_url": "//p1.pstatp.com/large/4d00054b126ceaf920",
		"source_url": "/group/6678442426773799435/",
		"article_genre": "article",
		"item_id": "6678442426773799435",
		"is_feed_ad": false,
		"behot_time": 1554943422,
		"image_url": "//p9.pstatp.com/list/190x124/pgc-image/RNIB8nWBtjaAiH",
		"group_id": "6678442426773799435",
		"middle_image": "http://p9.pstatp.com/list/pgc-image/RNIB8nWBtjaAiH"
	}, {
		"chinese_tag": "育儿",
		"media_avatar_url": "//p7.pstatp.com/large/b726000628f3d294ca51",
		"is_feed_ad": false,
		"tag_url": "news_baby",
		"title": "武汉家长花大价钱给孩子剪了个头，上学第一天就被老师在群里点名：立即整改！",
		"single_mode": false,
		"middle_mode": false,
		"abstract": "武汉一位家长趁放假带孩子做了个头没想到上学第一天就被老师在家长群点名“发型不合规，请家长晚上带孩子整改”。",
		"tag": "news_baby",
		"label": ["美发", "不完美妈妈", "武汉", "韩国", "长江日报", "设计", "时尚", "幼儿园", "高跟鞋", "装修", "高能小子终极装备", "首饰", "湖北", "化妆", "技术", "智力游戏"],
		"behot_time": 1554943192,
		"source_url": "/group/6678140574161175044/",
		"source": "中国经济网",
		"more_mode": false,
		"article_genre": "article",
		"comments_count": 117,
		"group_source": 2,
		"item_id": "6678140574161175044",
		"has_gallery": false,
		"group_id": "6678140574161175044",
		"media_url": "/c/user/50502346296/"
	}, {
		"single_mode": true,
		"abstract": "不久前央视财经《经济半小时》栏目不断接到来自河南、湖南两地村民的投诉信，群众们反映他们刚刚住进的新房子存在严重的房屋质量问题。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_society",
		"label": ["渑池", "河南", "湖南", "桑植", "中国中央电视台", "农村"],
		"comments_count": 1571,
		"tag_url": "news_society",
		"title": "这里的“扶贫房”墙砖一掰就碎，随时可能坍塌！",
		"chinese_tag": "社会",
		"source": "中国青年网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/3582660809/",
		"media_avatar_url": "//p2.pstatp.com/thumb/1398/4664054183",
		"image_list": [{
			"url": "//p1.pstatp.com/list/pgc-image/RNFNTMnIqyxHOt"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNFNTN11XQmQBX"
		}, {
			"url": "//p3.pstatp.com/list/pgc-image/RNFNTNE2JM8Iwl"
		}],
		"source_url": "/group/6678264660879213064/",
		"article_genre": "article",
		"item_id": "6678264660879213064",
		"is_feed_ad": false,
		"behot_time": 1554942962,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/RNFNTMnIqyxHOt",
		"group_id": "6678264660879213064",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/RNFNTMnIqyxHOt"
	}, {
		"single_mode": true,
		"abstract": "文玩|字画|品鉴|茶道四川广汉约三四公里，有三座突兀在成都平原上的黄土堆，1929年春，当地农民燕道诚在宅旁挖水沟时，发现了一坑精美的玉器。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_collect",
		"label": ["四川", "陶器", "青铜器", "历史", "文化", "考古", "文物", "广汉", "博物馆", "文章", "金蛙王", "文玩"],
		"comments_count": 576,
		"tag_url": "search/?keyword=æ¶è",
		"title": "世界超级文明，四川“三星堆”13大未解之谜到底是什么？",
		"chinese_tag": "收藏",
		"source": "顶尖藏品",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/3697008547/",
		"media_avatar_url": "//p1.pstatp.com/large/5b4e0003e42ac19f87d9",
		"image_list": [{
			"url": "//p1.pstatp.com/list/pgc-image/RM3oEtMGSrmA0Z"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RM3oEtdCBbeWXi"
		}, {
			"url": "//p3.pstatp.com/list/pgc-image/RM3oEtqELUgxzl"
		}],
		"source_url": "/group/6673595726171210248/",
		"article_genre": "article",
		"item_id": "6673595726171210248",
		"is_feed_ad": false,
		"behot_time": 1554942732,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/RM3oEtMGSrmA0Z",
		"group_id": "6673595726171210248",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/RM3oEtMGSrmA0Z"
	}, {
		"single_mode": true,
		"abstract": "该贴文提及“阿六仔满到炸开的地方”“这时候我们突然爱国情操爆棚，来自台湾台湾”等说法↓所谓“阿六仔”系岛内对大陆民众的一种蔑称。",
		"middle_mode": true,
		"more_mode": true,
		"tag": "news_entertainment",
		"label": ["许玮甯", "台湾", "文章", "Instagram", "社交网络", "文化", "意大利", "自媒体", "政治"],
		"comments_count": 600,
		"tag_url": "news_entertainment",
		"title": "许玮甯点赞“台独”言论后深夜发文道歉 网友警告：别做两面人",
		"chinese_tag": "娱乐",
		"source": "环球网",
		"group_source": 2,
		"has_gallery": false,
		"media_url": "/c/user/5954781019/",
		"media_avatar_url": "//p1.pstatp.com/large/4d00054b126ceaf920",
		"image_list": [{
			"url": "//p1.pstatp.com/list/pgc-image/RNIExyIEs66wJE"
		}, {
			"url": "//p9.pstatp.com/list/pgc-image/RNIExyZ8yTHbKp"
		}, {
			"url": "//p1.pstatp.com/list/pgc-image/RNIExymBgO4ysK"
		}],
		"source_url": "/group/6678446345583329800/",
		"article_genre": "article",
		"item_id": "6678446345583329800",
		"is_feed_ad": false,
		"behot_time": 1554942502,
		"image_url": "//p1.pstatp.com/list/190x124/pgc-image/RNIExyIEs66wJE",
		"group_id": "6678446345583329800",
		"middle_image": "http://p1.pstatp.com/list/pgc-image/RNIExyIEs66wJE"
	}],
	"next": {
		"max_behot_time": 1554942502
	}
};
list.removeLast();
print(data['data']);
      list.addAll(
data['data']
      );
      list.add(loadingTag);
      print('list');
      print(list);
      // _words.insertAll(_words.length - 1,
      //     //每次生成20个单词
      //     generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      // );
      setState(() {
        //重新构建列表
      });
    });
  }


Widget _newsRow(newsInfo){
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new ListTile(title:new Text(newsInfo["title"],textScaleFactor: 1.5,),) ,
            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),),
          // _generateItem(newsInfo),//根据图片数量返回对应样式的图片
          new Container(
            padding:const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 10.0),
            child:new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(   
                  child: new Text(newsInfo["source"]),
                ),
                new Expanded(
                  child: new Text('2019-04-12'),
                ),
              ],
          )),
          
        ],
      ),
    );
  }

  //根据获取到的图片数量控制图片的显示样式
  _generateItem(Map newsInfo) {
    if (newsInfo["image_list"].length == 2) {
return null;
    }
    if (newsInfo["image_list"].length == 3){
return _generateThreePicItem(newsInfo);
    }
    if (newsInfo["image_list"].length == 1) {
      return _generateOnePicItem(newsInfo);
    } 
  }

  //仅有一个图片时的效果
  _generateOnePicItem(Map newsInfo){
    return new Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Expanded(
          child: new Container(
            padding: const EdgeInsets.all(3.0),
            child: new SizedBox(
              child: new Image.network(
                newsInfo['image_list'][0]['url'],
                fit: BoxFit.fitWidth,
              ),
              height: 200.0,
            )
          )
        )
      ],
    );
  }

//有三张图片时的效果
  _generateThreePicItem(Map newsInfo){
    return new Row(
      children: <Widget>[
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['image_list'][0]['url'])
            )
        ),
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['image_list'][1]['url'])
            )
        ),
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['image_list'][2]['url'])
            )
        )
      ],
    );
  }
}
class TabPage2 extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return new InfiniteListView();
  }
}

class ContentScreen extends StatelessWidget {
   const ContentScreen({
    Key key,  
    @required this.text,
    }):super(key:key);
    final String text;
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(text),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: new Text(text),
      ),
    );
  }
}


