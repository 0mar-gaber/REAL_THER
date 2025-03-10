import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_ther/presentation/screens/auth/otp_screen.dart';
import 'package:real_ther/presentation/screens/auth/sign_in_screen.dart';

import '../../../core/constant.dart';
import '../../../core/reusable_components/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String route = "SignUpScreen";


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children:[ Padding(
            padding: REdgeInsets.only(
                top: 90,
                left: 35,
                right: 34
            ),
            child: Form(
              key: formKay,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: double.infinity),
                  Row(
                    children: [
                      SizedBox(width: 96.w,),
                      Image(image: AssetImage("assets/png/LOGO2.png")),
                    ],
                  ),


                  SizedBox(height: 50.h,),


                  Text("Get Started.!", style: TextStyle(color: Theme
                      .of(context)
                      .colorScheme
                      .primary, fontSize: 22.sp, fontWeight: FontWeight.bold),),
                  SizedBox(height: 7.h,),
                  Text("Create an Account to Continue", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),),


                  SizedBox(height: 30.h,),




                  Text("Email ID", style: TextStyle(color: Color(0xff888888),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),),
                  SizedBox(height: 10.h,),
                  EditText(
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    formKay: formKay,
                    controller: emailController,
                    validate: (value) {
                      if (!RegExp(Constant.emailRegex).hasMatch(value!)) {
                        return "Enter valid email";
                      }
                      if (value.isEmpty) {
                        return 'Email should\'t be empty ';
                      }
                      return null;
                    },
                    iconButton: IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset("assets/svg/email_icon.svg",height: 17.h,width: 25.w,)
                    ),
                  ),



                  SizedBox(height: 20.h,),

                  Text("Phone number", style: TextStyle(color: Color(0xff888888),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),),
                  SizedBox(height: 10.h,),
                  EditText(
                    maxLength: 11,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    formKay: formKay,
                    controller: phoneNumberController,
                    validate: (value) {
                      if (value == null || value.length != 11) {
                        return "Enter valid number";
                      }
                      if (value.isEmpty) {
                        return 'phone number should\'t be empty ';
                      }
                      return null;
                    },
                    iconButton: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.phone,color: Theme.of(context).colorScheme.primary,size: 25.sp,)
                    ),
                  ),



                  SizedBox(height: 20.h,),



                  Text("Password", style: TextStyle(color: Color(0xff888888),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600)),
                  SizedBox(height: 10.h,),
                  EditText(
                    iconButton: IconButton(onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }, icon: showPassword == true
                        ? Icon(CupertinoIcons.eye,weight: 22.3.w,color: Theme.of(context).colorScheme.primary,)
                        : Icon(CupertinoIcons.eye_slash,weight: 22.3.w,color: Theme.of(context).colorScheme.primary,))
                    ,
                    obscureText: !showPassword,
                    keyboardType: TextInputType.visiblePassword,
                    formKay: formKay,
                    controller: passwordController,
                    validate: (value) {
                      if(value == null){
                        return "password Couldn't be empty";
                      }
                      if(value.length < 8 ){
                        return "password Couldn't be less than 8 character";

                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 60.h,),

                  OutlinedButton(
                    onPressed: () {
                      if (formKay.currentState!.validate()) {
                       Navigator.pushNamed(context, OtpScreen.route , arguments: phoneNumberController.text);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(double.maxFinite, 68.h),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .background,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(CupertinoIcons.arrow_right,color: Theme.of(context).colorScheme.background,size: 25.sp)
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),

                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, SignInScreen.route);
                    },
                    child: Center(
                      child: Text("Already Have an Account? Sign In", style: TextStyle(color: Theme.of(context).colorScheme.primary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800)),
                    ),
                  ),





                ],
              ),
            ),
          ),
          ] ),
    );
  }
}
