import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_ther/presentation/screens/auth/sign_in_screen.dart';

import '../../../core/reusable_components/text_field.dart';
import 'sign_up_screen.dart';

class CreateNewPassScreen extends StatefulWidget {
  const CreateNewPassScreen({super.key});

  static const String route = "CreateNewPassScreen";

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool showPassword = false;
  bool showPassword2 = false;
  final GlobalKey<FormState> formKay = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.only(left: 15, top: 49),
              child: IconButton(
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Theme.of(context).colorScheme.primary,
                    size: 35.sp,
                  )),
            ),
            Padding(
              padding: REdgeInsets.only(left: 34, top: 34, right: 34),
              child: Form(
                key: formKay,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create New Password",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Your New Password Must be Different from Previous Used Passwords.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("Password",
                        style: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10.h,
                    ),
                    EditText(
                      iconButton: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: showPassword == true
                              ? Icon(
                                  CupertinoIcons.eye,
                                  weight: 22.3.w,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : Icon(
                                  CupertinoIcons.eye_slash,
                                  weight: 22.3.w,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                      obscureText: !showPassword,
                      keyboardType: TextInputType.visiblePassword,
                      formKay: formKay,
                      controller: passwordController,
                      validate: (value) {
                        if (value == null) {
                          return "password Couldn't be empty";
                        }
                        if (value.length < 8) {
                          return "password Couldn't be less than 8 character";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("Confirm Password",
                        style: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10.h,
                    ),
                    EditText(
                      iconButton: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword2 = !showPassword2;
                            });
                          },
                          icon: showPassword2 == true
                              ? Icon(
                                  CupertinoIcons.eye,
                                  weight: 22.3.w,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : Icon(
                                  CupertinoIcons.eye_slash,
                                  weight: 22.3.w,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                      obscureText: !showPassword2,
                      keyboardType: TextInputType.visiblePassword,
                      formKay: formKay,
                      controller: passwordController2,
                      validate: (value) {
                        if (value != passwordController.text) {
                          return "Both Passwords must Match.";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (formKay.currentState!.validate()) {
                          print("done!");
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
                            "Reset Password",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(CupertinoIcons.arrow_right,
                              color: Theme.of(context).colorScheme.background,
                              size: 25.sp)
                        ],
                      ),
                    ),
                    SizedBox(height: 180.h,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, SignUpScreen.route);
                      },
                      child: Center(
                        child: Text("Don’t Have an Account? Sign Up", style: TextStyle(color: Theme.of(context).colorScheme.primary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
