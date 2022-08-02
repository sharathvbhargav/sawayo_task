import 'package:get/get.dart';
class Dimensions {
  //Scale Factor is Height: 844 (iPhone)
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //Height Scales
  static double height1p2 = screenHeight/703.34;
  static double height2 = screenHeight/422;
  static double height3 = screenHeight/281.34;
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27;
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;
  static double height60 = screenHeight/14.06;
  static double height100 = screenHeight/8.44;
  static double height140 = screenHeight/6.50;
  static double height380 = screenHeight/2.22;

  //Width Scales
  static double width5 = screenHeight/168.8;
  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/56.27;
  static double width20 = screenHeight/42.2;
  static double width30 = screenHeight/28.13;
  static double width45 = screenHeight/18.76;

  //Font Sizes
  static double font12 = screenHeight/70.34;
  static double font14 = screenHeight/60.28;
  static double font16 = screenHeight/52.75;
  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;

  //Radius
  static double radius15 = screenHeight/56.27;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  //Icon Size
  static double size12 = screenHeight/70.34;
  static double size16 = screenHeight/52.75;
  static double size24 = screenHeight/35.17;

  //Home Page Dimensions
  static double pageView = screenHeight/2.64;
  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;
  static double listImgSize = screenWidth/3.25;
  static double listViewTextContainer = screenWidth/3.9;

  //Profile page Dimensions
  static double imgSize = screenHeight/6;
  static double containerHeight = screenHeight/3;
}