import 'package:flutter/material.dart';
import 'package:food_delivery/custom_widgets/big_text.dart';
import 'package:food_delivery/custom_widgets/counter_text.dart';
import 'package:food_delivery/custom_widgets/small_text.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class MainProfilePage extends StatefulWidget {
  String? days;
  MainProfilePage({Key? key, required this.days}) : super(key: key);

  @override
  State<MainProfilePage> createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {

  @override
  Widget build(BuildContext context) {

    //Get Values for number of days for all 3 parameters
    int usedDays;
    if(widget.days == null){
      usedDays = 0;
    } else {
      usedDays = int.parse(widget.days!);
    }
    int total = 30;
    int used = usedDays;
    int available = total - used;

    //Main Page UI Design
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: Dimensions.height380,
          child: Stack(
            children: [
              //Body of teh Page
              Align(
                alignment: Alignment.bottomCenter,
                child:  Container(
                  height: 220,
                  margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, bottom: Dimensions.height30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height30, right: Dimensions.width20, left: Dimensions.width20),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BigText(text: "Sharath V Bhargav", size: 26,),
                                  SizedBox(height: Dimensions.height10),
                                  const SmallText(text: "Software Engineer", size: 18,)
                                ],
                              ),

                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(RouteHelper.getNewRequest());
                                },
                                child: Container(
                                  width: Dimensions.height45,
                                  height: Dimensions.height45,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30), color: Colors.black),
                                  child: Icon(Icons.add, color: Colors.white, size: Dimensions.size24),
                                ),
                              ),
                            ],
                          ),

                          Container(
                            color: AppColors.divider,
                            height: 2,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(top: Dimensions.height20),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: Dimensions.height20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CounterText(header: "Available", valueText: "$available Days"),
                                Container(color: AppColors.divider, height: Dimensions.height45, width: 2),
                                CounterText(header: "All", valueText: "$total Days"),
                                Container(color: AppColors.divider, height: Dimensions.height45, width: 2),
                                CounterText(header: "Used", valueText: "$used Days"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Circular Network image
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.height20),
                  width: Dimensions.imgSize,
                  height: Dimensions.imgSize,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all( Radius.circular(100.0)),
                    border: Border.all(
                      color: AppColors.background,
                      width: 10.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
