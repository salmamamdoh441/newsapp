import 'dart:async';

import 'package:animations/animations.dart';
import 'package:connectivity/connectivity.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/Models/newsModel.dart';
import 'package:newsapp/helper/api_helper.dart';
import 'package:newsapp/screens/Article.dart';
import 'file:///C:/Users/start/AndroidStudioProjects/newsapp/lib/Models/categoryMode.dart';
import 'package:newsapp/screens/searchScreen.dart';
import 'package:newsapp/widgets/listCategories.dart';
import 'package:newsapp/widgets/smartTitle.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/provider/country.dart';


class HomeScreen extends StatefulWidget {
  static String id ='HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Connectivity _connectivity = Connectivity();

  ApiHelper apiHelper=ApiHelper();
List<NewsModel>news=[];
ConnectivityResult result;
getNews()
{

    apiHelper.getNews(context).then((value){
    if(mounted){
      setState(() {
        news=value;

      });}
    });


}
  List<Category>categories=
      [
        Category(title: 'General',),
        Category(title: 'Business'),
        Category(title: 'Sports'),
        Category(title: 'Entertainment'),
        Category(title: 'Health'),

      ];

  StreamSubscription sub;
  bool isConnected=false;

  @override

 void initState(){
    super.initState();
 sub=   _connectivity.onConnectivityChanged.listen((result) {
      setState(() {

        isConnected=(result !=ConnectivityResult.none);
      });
    });

  }

  void dispose(){
    getNews();
   sub.cancel();
   super.dispose();
  }




  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('dsf');
        },
        child: OpenContainer(

          transitionDuration: Duration(milliseconds: 700),

           openBuilder: (context,a){
             return
           SearchScreen();

           },
          closedBuilder: (context,a){
            return
              Icon(Icons.search,color: Colors.white,);
          },
          closedColor: Colors.deepPurple,
        ),

      ),
      appBar:AppBar(
bottom:
  PreferredSize(
    preferredSize: Size(30.h, 50.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding:  EdgeInsets.all(ScreenUtil().setWidth(5)),
          child: CountryCodePicker(
            showOnlyCountryWhenClosed: true,
onChanged: (v){
              Provider.of<CountryProv>(context,listen: false).onChanged(v.code);
              print(v.code);
},
            initialSelection: 'eg',
          ),
        ),
      ],
    ),
  ),

        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Padding(
          padding:  EdgeInsets.all(8.0),
          child:  SmartTitle()
        ),
      ),
      body:!isConnected?Center(child: Center(child: Icon(Icons.wifi_off,color: Colors.deepPurple,size: 50.w,)),): Column(
        children: [
          ListCategories(ca: categories,),
        Container(
          height: .585.sh,
          width: 1.sw,
          child: FutureBuilder(
              future: getNews(),
              builder: (context,snapshot)
          {

            return Container(height: .7.sh,
              width: 1.sw,
              child: ListView.builder(
              itemCount: news.length
              ,itemBuilder: (context,index){
                return  Padding(
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
                    news[index].imageUrl:'https://www.gstatic.com/earth/social/00_generic_facebook-001.jpg'

                      ,fit: BoxFit.cover,),),
                  ),
                );
              }),
            );
          }),
        )
        ],
      ),
    );
  }
}
