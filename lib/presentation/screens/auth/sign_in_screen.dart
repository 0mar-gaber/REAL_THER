import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_ther/core/reusable_components/text_field.dart';
import 'package:real_ther/presentation/screens/auth/reset_password_screen.dart';
import 'package:real_ther/presentation/screens/auth/sign_up_screen.dart';
import 'package:real_ther/presentation/screens/home/home_screen.dart';

import '../../../core/constant.dart';

class SignInScreen extends StatefulWidget {
  static const String route = "SignInScreen";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();

}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Padding(
          padding: REdgeInsets.only(
              top: 99,
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


                Text("Let’s Sign In You In", style: TextStyle(color: Theme
                    .of(context)
                    .colorScheme
                    .primary, fontSize: 22.sp, fontWeight: FontWeight.bold),),
                SizedBox(height: 7.h,),
                Text("Welcome Back You’ve Been Missed", style: TextStyle(
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
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, ResetPasswordScreen.route),
                      child: Text("Forgot Password ?", style: TextStyle(color: Color(0xff888888),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                SizedBox(height: 40.h,),

                OutlinedButton(
                  onPressed: () {
                    if (formKay.currentState!.validate()) {
                      Navigator.pushNamed(context, HomeScreen.route);
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
                        "Sign In",
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
                SizedBox(height: 70.h,),

                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, SignUpScreen.route);
                  },
                  child: Center(
                    child: Text("Don’t Have an Account? Sign Up", style: TextStyle(color: Theme.of(context).colorScheme.primary,
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
