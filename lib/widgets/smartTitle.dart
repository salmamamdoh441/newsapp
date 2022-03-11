import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('SmartCode',style: TextStyle(color: Colors.deepPurple,
            fontSize: 30.sp,fontWeight: FontWeight.bold),),
        Text(' News',style: TextStyle(color: Colors.grey,
            fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w600),)
      ],
    );
  }
}
