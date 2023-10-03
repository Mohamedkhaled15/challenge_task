// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_challenge/home_cubit/home_cubit.dart';
import 'package:task_challenge/view_model/component/custom_text.dart';
import 'package:task_challenge/view_model/constant/colors.dart';
import 'package:task_challenge/view_model/constant/images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/home_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller=HomeModel();
  int currentIndex=1;


  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.25,
            centerTitle: true,
            title: Text('This is App',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),),
            backgroundColor: AppColors.primary,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
             setState(() {
               currentIndex=index;
             });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon:currentIndex==0? Image.asset(AppImages.home):Image.asset(AppImages.homeUnselected),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon:currentIndex==1? Image.asset(AppImages.more): Image.asset(AppImages.moreUnselected),
                  label: 'More'),
            ],
          ),
          body: Column(
            children: [
             Padding(
                  padding:  EdgeInsets.only(
                      top: appHeight*0.05,
                      left: appWidth*0.05,
                    bottom: appHeight*0.015,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Top Likes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                        )
                    ),
                  ),
                ),
              Divider(),
              Expanded(
                  child: Container(
                    // color: AppColors.secondary,
                    child: ListView.separated(
                        itemBuilder: (context,index){
                          return SizedBox(
                            height: appHeight*0.1,
                            child: Center(
                              child: ListTile(
                                leading: LeadingText(text: controller.leadingText[index],),
                                // trailing: controller.isSelected?Image.asset(AppImages. ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder:(context,index)=> Divider(
                          thickness: 0.5,
                        ),
                        itemCount: controller.isSelected.length
                    ),
                  ))

            ],
          ),

        );
      },
    );
  }
}
