import 'package:flutter/material.dart';
import 'file:///C:/Users/start/AndroidStudioProjects/newsapp/lib/Models/categoryMode.dart';
import 'package:newsapp/widgets/categroyContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCategories extends StatelessWidget {
List<Category>ca;
ListCategories({this.ca,});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: .224.sh,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ca.length,
          itemBuilder: (context,index)
          {
            return  CategoryContainer(
              category:ca[index],
            );
          }),
    );
  }
}
