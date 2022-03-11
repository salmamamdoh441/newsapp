import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchScreen extends StatefulWidget {
static String id ='SearchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String>list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepPurple,

        title:  Padding(
          padding:  EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SmartCode',style: TextStyle(color: Colors.deepPurple,
                  fontSize: 30.sp,fontWeight: FontWeight.bold),),
              Text(' News',style: TextStyle(color: Colors.grey,
                  fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w600),)
            ],
          ),
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(15.w),
            child: TextFormField(
decoration: InputDecoration(
  prefixIcon: Icon(Icons.search),
  labelText: 'Searh Here',
  labelStyle: TextStyle(fontSize: 15.sp),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20)
  )
),
            ),
          ),
          Expanded(child:
         list==null?
         Center(
           child: Image.network('https://i.dlpng.com/static/png/6430467_preview.png')
         ):
         ListView.builder(itemBuilder: (context,index)
          {
           return Container();
          }))
        ],
      ),
    );
  }
}
