import 'package:food_delivery/pages/calender/calander.dart';
import 'package:food_delivery/pages/home/main_profile_page.dart';
import 'package:food_delivery/pages/new_request/new_request_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String newRequest = "/new-request";
  static const String calender = "/calender";

  static String getInitial(int days) => "$initial?days=$days";
  static String getNewRequest() => newRequest;
  static String getCalender() => calender;

  static List<GetPage> routes = [
    //Initial Page
    GetPage(
      name: initial,
      page: (){
        var days = Get.parameters['days'];
        return MainProfilePage(days:days);
      },
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 650)
    ),

    //New Request page
    GetPage(
        name: newRequest,
        page: (){
          return const NewRequestPage();
        },
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 650)
    ),

    //Calender page
    GetPage(
        name: calender,
        page: (){
          return const Calender();
        },
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 650)
    ),
  ];
}