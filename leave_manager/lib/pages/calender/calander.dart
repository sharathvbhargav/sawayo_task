import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leave_manager/custom_widgets/big_text.dart';
import 'package:leave_manager/custom_widgets/small_text.dart';
import 'package:leave_manager/routes/route_helper.dart';
import 'package:leave_manager/utils/app_constants.dart';
import 'package:leave_manager/utils/colors.dart';
import 'package:leave_manager/utils/dimensions.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late DateTime min;
  late DateTime max;
  bool isSingleDay = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height:double.maxFinite,
          child: Stack(
            children: [
              //Body of teh Page
              Align(
                alignment: Alignment.bottomCenter,
                child:  Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.height140),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height45),
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        child: const BigText(text: "New Request", size: 26,)
                      ),
                      SizedBox(height: Dimensions.height10),
                      SizedBox(
                        height: 480,
                        child: ScrollableCleanCalendar(
                          daySelectedBackgroundColor: AppColors.gradient2,
                          daySelectedBackgroundColorBetween: AppColors.unselected,
                          calendarController: CleanCalendarController(
                            minDate: DateTime.now().subtract(const Duration(days: 30)),
                            maxDate: DateTime.now().add(const Duration(days: 365)),
                            onRangeSelected: (minDate,maxDate){
                              min = minDate;
                              max = maxDate!;
                            },
                            onDayTapped: (date){
                              if(!isSingleDay) {
                                isSingleDay = true;
                                min = date;
                                max = date;
                              }
                            }
                          ),
                          layout: Layout.BEAUTY,
                          calendarCrossAxisSpacing: 0,

                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              AppConstants.minDate = min;
                              AppConstants.maxDate = max;
                              Get.toNamed(RouteHelper.getNewRequest());
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.all(Dimensions.height10),
                              margin: EdgeInsets.only(right: Dimensions.height10),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.gradient1,
                                    AppColors.gradient2,
                                  ],
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(1.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                                borderRadius: BorderRadius.circular(Dimensions.radius20)
                              ),
                              child: const Center(
                                child: SmallText(
                                  text: "Select",
                                  size: 20, color: AppColors.black,)
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
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
                    color: AppColors.background,
                    image: const DecorationImage(
                      image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                      fit: BoxFit.fill,
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
