import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_zone/modules/register/cubit/register_cubit.dart';
import 'package:syria_zone/modules/register/cubit/register_states.dart';
import 'package:syria_zone/shared/combonents/combonents.dart';
import 'package:syria_zone/shared/styles/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterScreen extends StatefulWidget {


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  bool obsecure=true;
  var passwordSuffIcon =Icons.remove_red_eye;
  var formKey= GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // 🔧 Set status bar icons to white (light)
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Optional
        statusBarIconBrightness: Brightness.light, // ✅ White icons
        statusBarBrightness: Brightness.dark, // iOS compatibility
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) =>RegisterCubit(),
        child: BlocConsumer<RegisterCubit,RegisterStates>(
          listener: (BuildContext context, RegisterStates state) {  },
          builder: (BuildContext context, RegisterStates state) {
            var cubit= RegisterCubit.get(context);
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
                    ),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                  fontFamily: "test",
                                  fontSize: 30,
                                  color: darkColor
                              ),
                            ),
                            SizedBox(height: 50,),
                            makeField(
                                label: "Name",
                                prefixIconData: Icons.person,
                                controller: nameController,
                                keyboarbType: TextInputType.text,
                                validationText: "Name must not be empty!"
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: makeField(
                                  label: "Email Address",
                                  prefixIconData: Icons.email,
                                  controller: emailController,
                                  keyboarbType: TextInputType.text,
                                  validationText: "Email address must not be empty!"
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: makeField(
                                  label: "Phone Number",
                                  prefixIconData: Icons.phone_iphone,
                                  controller: phoneController,
                                  keyboarbType: TextInputType.phone,
                                  validationText: "Phone Number must not be empty!"
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: makeField(
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
                                  validationText: "Password must not be empty!",
                              ),
                            ),
                            SizedBox(height: 50,)   ,
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder:  (context) => makeMaterialButtom(
                                  onPressed: (){
                                    if(formKey.currentState!.validate()){
                                      cubit.register(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text,
                                          phone: phoneController.text
                                      );
                                    }
                                  },
                                  text: "Register"
                              ),
                              fallback: (context) => Center(child: makeIndicatior()),
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
