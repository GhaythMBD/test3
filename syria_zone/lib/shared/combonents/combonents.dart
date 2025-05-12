import 'package:flutter/material.dart';
import 'package:syria_zone/shared/styles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget makeField(
        {required String label,
        IconData? prefixIconData,
        Widget? suffixIcon,
        String? validationText,
        bool obsecure=false,
        required TextEditingController controller,
        double radius = 30,
        TextInputType keyboarbType = TextInputType.name}) =>
    TextFormField(
      obscureText: obsecure,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
          label: Text(label),
          prefixIcon: Icon(prefixIconData),
          suffixIcon:suffixIcon,
      ),
      keyboardType: keyboarbType,
      controller: controller,
      validator: (value) {
        if(value==null||value.isEmpty){
          return validationText;
        }
        return null;
      },


    );

Widget makeMaterialButtom(
{
  required VoidCallback? onPressed,
  required String text
}
    )=>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        color: darkColor,
        minWidth: double.infinity,
        padding: EdgeInsets.all(10),
        onPressed: onPressed,
        height: 20,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "test",
              fontSize: 15,
              color: Colors.white
          ),
        ),
      ),
    );

Widget makeline({Color? color=Colors.grey})=>
  Container(
    color: color,

    height: 1,
    width: double.infinity,
  );

void navigateWithoutBack(context , newScreen){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => newScreen,), (route) => false,);
}

void navigate({required context , required page}){
  Navigator.push(context, MaterialPageRoute(builder: (context) => page,));
}

Widget makeIndicatior()=>LoadingAnimationWidget.threeRotatingDots(
    color: darkColor,
    size: 35
);

Future<bool?> makeFlutterToast({
  required String message,

}){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
Color red=Colors.red;
Color green=Colors.green;
enum ToastColors{
  red,
  green
}
