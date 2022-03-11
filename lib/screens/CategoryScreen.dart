import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Models/newsModel.dart';
import 'package:newsapp/helper/api_helper.dart';
import 'package:newsapp/screens/Article.dart';

class CategoryScreen extends StatefulWidget {
 static String id ='categoryScreen';
 String categoryTitle;
 CategoryScreen({this.categoryTitle});


  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ApiHelper apiHelper=ApiHelper();
  List<NewsModel>news=[];
  getNews()
  {

    apiHelper.getNewsByCategory(widget.categoryTitle,context).then((value){
     if(mounted) {
       setState(() {
         news = value;
       });
     }
    });


  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SmartCode',style: TextStyle(color: Colors.deepPurple,
                      fontSize: 30.sp,fontWeight: FontWeight.bold),),
                  Text(' News',style: TextStyle(color: Colors.grey,
                      fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w600),
                  ),

                ],
              ),
              Text(widget.categoryTitle,style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w600,
              color: Colors.black),
              ),

            ],
          ),
        ),
      ),

      body:       FutureBuilder(
          future: getNews(),
          builder: (context,snapshot)
          {

            return Container(height: .9.sh,
              width: 1.sw,
              child: ListView.builder(
                  itemCount: news.length
                  ,itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)
                      =>ArticleView(url: news[index].url,)));
                    },
                    child: Container(height: .3.sh,width: .9.sw,
                      color: Colors.deepPurple,
                      child: Image.network(news[index].imageUrl!=null?
                      news[index].imageUrl:
'https://www.gstatic.com/earth/social/00_generic_facebook-001.jpg'
                        ,fit: BoxFit.cover,),),
                  ),
                );
              }),
            );
          }),
    );
  }
}
