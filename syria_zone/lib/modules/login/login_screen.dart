import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:syria_zone/modules/login/cubit/login_cubit.dart';
import 'package:syria_zone/modules/login/cubit/login_states.dart';
import 'package:syria_zone/modules/register/register_screen.dart';
import 'package:syria_zone/shared/combonents/combonents.dart';
import 'package:syria_zone/shared/networking/remote/dio_helper.dart';
import 'package:syria_zone/shared/styles/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  bool obsecure=true;
  var passwordSuffIcon =Icons.remove_red_eye;
  TextEditingController passwordController=TextEditingController();
  var formKey= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    emailController.text="ghaithmobayed5@gmail.com";
    passwordController.text="123456";
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (BuildContext context, state) {
            if (state is LoginSuccessfulState){
              if(state.loginModel!.status==true){
                //navigate(context: context, page: );
                print("true ${state.loginModel!.message}");
              }else{
                print("false ${state.loginModel!.message}");
              }
            }
          },
          builder: (BuildContext context, Object? state) {
            var cubit=LoginCubit.get(context);
            return Stack(
              
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
      
                  child: const Image(
                    image: AssetImage(
                      "assets/login/background.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20) ,
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height*3/4,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(10),
                          topEnd: Radius.circular(10)
                      ),
                      //border :Border.all(color: lightColor,width: 3)
                    ),
                    child: Form(
                      key: formKey ,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "welcom back",
                              style: TextStyle(
                                fontFamily: "test",
                                fontSize: 30,
                                color: darkColor
                              ),
                            ),
                            SizedBox(height: 50,),
                            makeField(
                                label: "Email Address",
                                prefixIconData: Icons.email,
                                controller: emailController,
                                keyboarbType: TextInputType.text,
                                validationText: "Email address must not be empty!"
                            ),
                            SizedBox(height: 20,),
                            makeField(
                                obsecure: obsecure,
                                label: "Password",
                                prefixIconData: Icons.email,
                                suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        obsecure= !obsecure;
                                        if(obsecure){
                                          passwordSuffIcon=Icons.visibility;
                                        }
                                        else
                                          passwordSuffIcon=Icons.visibility_off;
                                      });
                                    },
                                    icon: Icon(passwordSuffIcon)
                                ),
                                controller: passwordController,
                                keyboarbType: TextInputType.visiblePassword,
                                validationText: "Password must not be empty!"
                            ),
                            SizedBox(
                              height: 150,
                            ),
                            Column(
                              children: [
                                ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                  builder: (BuildContext context) {
                                    return makeMaterialButtom(onPressed: (){
                                      if(formKey.currentState!.validate()){
                                        cubit.login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    }, text: "Login");
                                  },
                                  fallback: (BuildContext context) {
                                    return Center(
                                      child: makeIndicatior(),
                                    );
                                  },
                        
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Row(
                                    children: [
                                      Expanded(child: makeline()),
                                      Text("or",style: TextStyle(color: Colors.grey),),
                                      Expanded(child: makeline()),
                                    ],
                                  ),
                                ),
                                makeMaterialButtom(onPressed: (){
                                  navigate(context: context, page: RegisterScreen());
                                }, text: "Register"),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
