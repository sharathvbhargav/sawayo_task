import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:leave_manager/custom_widgets/big_text.dart';
import 'package:leave_manager/custom_widgets/grid_tile.dart';
import 'package:leave_manager/custom_widgets/small_text.dart';
import 'package:leave_manager/routes/route_helper.dart';
import 'package:leave_manager/utils/app_constants.dart';
import 'package:leave_manager/utils/colors.dart';
import 'package:leave_manager/utils/dimensions.dart';

class NewRequestPage extends StatefulWidget {
  const NewRequestPage({Key? key}) : super(key: key);

  @override
  State<NewRequestPage> createState() => _NewRequestPageState();
}

class _NewRequestPageState extends State<NewRequestPage> {
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  List<String> text = ['Annual', 'Parential', 'Unpaid', 'Special'];
  List<IconData> icons = [Icons.calendar_month, Icons.note_alt_sharp, Icons.paid, Icons.folder_special];
  late DateTime fromDate, toDate;
  void checkOptions(int index){

     setState(() {
       AppConstants.selectedIndex = index;
     });
  }

  List<Widget> getList() {
    List<Widget> childs = [];
    for (var i = 0; i < text.length; i++) {
      childs.add(
        GridTileView(
          icon: icons[i],
          text: text[i],
          onTap: () => checkOptions(i+1),
          isSelected: i+1 == AppConstants.selectedIndex,
        ),
      );
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    String fromDate = "";
    String toDate = "";
    if(AppConstants.minDate != null && AppConstants.maxDate != null ){
      _fromDateController.text =  DateFormat("dd-MM-yyyy").format(AppConstants.minDate!);
      _toDateController.text = DateFormat("dd-MM-yyyy").format(AppConstants.maxDate!);

    } else{
      print("not yet");
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child:  Container(
                  height: double.maxFinite,
                  margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10, top: Dimensions.height140),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BigText(text: "Sharath V Bhargav", size: 26),

                          SizedBox(height: Dimensions.height20),

                          SizedBox(
                            height: 220,
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: (3/2),
                              mainAxisSpacing: Dimensions.height10,
                              crossAxisSpacing: Dimensions.height10,
                              physics: const NeverScrollableScrollPhysics(),
                              children: getList(),
                            ),
                          ),

                          SizedBox(height: Dimensions.height20),

                          TextFormField(
                            controller: _fromDateController,
                            onTap: () {
                              Get.toNamed(RouteHelper.getCalender());
                            },
                            decoration: const InputDecoration(
                              labelText: "From",
                            ),
                          ),

                          SizedBox(height: Dimensions.height20),

                          TextFormField(
                            controller: _toDateController,
                            onTap: () {
                              Get.toNamed(RouteHelper.getCalender());
                            },
                            decoration: const InputDecoration(
                              labelText: "To",

                            ),
                          ),

                          SizedBox(height: Dimensions.height30),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: (){
                                if(AppConstants.selectedIndex == 0){
                                  showCustomDialog(context, "Leave Type", "Please select the type of leave to be applied", CoolAlertType.warning);
                                } else if(_fromDateController.text == ""){
                                  showCustomDialog(context, "From Date", "Please enter From date", CoolAlertType.warning);
                                } else if(_toDateController.text == "" ){
                                  showCustomDialog(context, "To Date", "Please enter To date", CoolAlertType.warning);
                                } else {
                                  print("SVB: ${AppConstants.maxDate!.difference(AppConstants.minDate!).inDays+1}");
                                  Get.toNamed(RouteHelper.getInitial((AppConstants.maxDate!.difference(AppConstants.minDate!).inDays)+1));
                                }
                              },
                              child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.all(Dimensions.height10),
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
                                child: const Center(child: SmallText(text: "Confirm", size: 20, color: AppColors.black,))
                              ),
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

  void showCustomDialog(BuildContext context, String title, String description, CoolAlertType type ) {
    CoolAlert.show(
      context: context,
      type: type,
      title: title,
      text: description,
      animType: CoolAlertAnimType.slideInDown,
      confirmBtnColor: AppColors.gradient1,
      backgroundColor: AppColors.black,
    );
  }
}
