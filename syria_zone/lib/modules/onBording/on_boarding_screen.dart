import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:syria_zone/modules/login/login_screen.dart';
import 'package:syria_zone/shared/combonents/combonents.dart';
import 'package:syria_zone/shared/networking/local/cach_helper.dart';
import 'package:syria_zone/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingItem {
  String imagePath;
  String screenTitle;
  String screenBody;

  BoardingItem({
    required this.imagePath,
    required this.screenTitle,
    required this.screenBody,
  });
}


class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool islast=false;

  List<BoardingItem>Items=[
    BoardingItem(
        imagePath: "assets/onboarding/3.png",
        screenTitle: "screenTitle1",
        screenBody: "screenBody"
    ),
    BoardingItem(
        imagePath: "assets/onboarding/2.png",
        screenTitle: "screenTitle2",
        screenBody: "screenBody"
    ),
    BoardingItem(
        imagePath: "assets/onboarding/4.jpeg",
        screenTitle: "screenTitle3",
        screenBody: "screenBody"
    ),
  ];

  var pageviewController=new PageController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed: (){finishOnBoarding(context);}, child: Text("Skip",style: TextStyle(color: darkColor),)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller:pageviewController ,
                  itemBuilder: (context,index)=>buildOnBoardingItem(
                        imagePath: Items.elementAt(index).imagePath,
                        screenTitle: Items.elementAt(index).screenTitle,
                        screenBody: Items.elementAt(index).screenBody
                    ),
                  itemCount: Items.length,
                  onPageChanged: (int index){
                    if(index==Items.length-1) {
                      setState(() {
                      islast=true;
                    });
                    } else {
                      setState(() {
                        islast=false;
                      });
                    }
                  },

                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageviewController ,
                    count: Items.length,
                    effect: SwapEffect(
                      type: SwapType.yRotation,
                      dotColor: darkColor,
                      activeDotColor: Colors.deepOrangeAccent
                    ),

                  ),
                  Spacer(),
                  Padding(
                      padding:EdgeInsets.all(10),
                      child: FloatingActionButton(
                        onPressed: (){
                          if(islast) {
                            finishOnBoarding(context);
                          }
                          else {
                            pageviewController.nextPage(
                              duration:Duration(milliseconds: 750) ,
                              curve:Curves.fastLinearToSlowEaseIn
                          );
                          }
                        },
                        child: Icon(Icons.arrow_right,color: Colors.white,),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: CircleBorder(),
                        backgroundColor: darkColor,
                      ),
                  ),
                ],
              )

            ],
          ),
        ),
      );
  }
}

Widget buildOnBoardingItem({
  required String imagePath,
  required String screenTitle,
  required String screenBody,

}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage(imagePath)
        ),
      ),
      SizedBox(height: 10,),
      Text(
        "Screen Title",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          fontFamily: "test",

        ),
      ),
      SizedBox(height: 10,),
      Text(
        "Screen body",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    ],
  );
}

void finishOnBoarding(context ){
  navigateWithoutBack(context, LoginScreen());
  // CachHelper.setData(key: "onBoarding", value: true).then((value){
  //   if(value ){
  //     navigateWithoutBack(context, LoginScreen());
  //   }
  // }).catchError((error){
  //   print('error in saving the value of onBoarding:${error.toString()}');
  // });
}