import 'package:flutter/material.dart';
import 'file:///C:/Users/start/AndroidStudioProjects/newsapp/lib/Models/categoryMode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/screens/CategoryScreen.dart';

class CategoryContainer extends StatelessWidget {
  Category category =Category();
  CategoryContainer({this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.w),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
          CategoryScreen(categoryTitle: category.title,)));
        },
        child: Container(
          height: 90.sh,
          width: 250.w,
          decoration: BoxDecoration(image: DecorationImage(
            image: NetworkImage(category.imageUrl==null||category.imageUrl.isEmpty?
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg67aM9EXHJ4Idpmu_RH_7zw_MPFUhGJUjHw&usqp=CAU'
            :category.imageUrl),
            fit: BoxFit.cover
          ),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(category.title,
            style: TextStyle(
              fontSize: 30.sp,color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }
}
