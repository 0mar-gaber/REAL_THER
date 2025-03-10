import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_ther/core/reusable_components/tabs_filter.dart';

import '../../../core/constant.dart';
import '../../../core/reusable_components/text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const String route = "EditProfileScreen";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey();
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKay,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        CupertinoIcons.back,
                        size: 30.sp,
                      )),
                  SizedBox(width: 20.w),
                  Text(
                    "Edit Profiles",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Column(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-photo/lifestyle-people-emotions-casual-concept-confident-nice-smiling-asian-woman-cross-arms-chest-confident-ready-help-listening-coworkers-taking-part-conversation_1258-59335.jpg?t=st=1739499048~exp=1739502648~hmac=9edcca72d8d8ce5ab84994fb36d49d35e281be91962cbc6d5df0d9054c36148a&w=996",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Change Profile Picture",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp),
                  )
                ],
              ),
              SizedBox(height: 35.h),
              Text(
                "Profile Info",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "User Name",
                style: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              EditText(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                formKay: formKay,
                controller: emailController,
                validate: (value) {
                  if (!RegExp(Constant.emailRegex).hasMatch(value!)) {
                    return "Enter valid user name";
                  }
                  if (value.isEmpty) {
                    return 'Email should\'t be empty ';
                  }
                  return null;
                },
                iconButton: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Email ID",
                style: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
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
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/email_icon.svg",
                      height: 17.h,
                      width: 25.w,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Phone number",
                style: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25.sp,
                    )),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170.w,
                    height: 60.h,
                    child: TabsFilter(
                      text: "Male",
                      index: 0,
                      selectedIndex: selectedIndex,
                      onTap: (newIndex) {
                        setState(() {
                          selectedIndex = newIndex ;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 170.w,
                    height: 60.h,
                    child: TabsFilter(
                      text: "Female",
                      index: 1,
                      selectedIndex: selectedIndex,
                      onTap: (newIndex) {
                        setState(() {
                          selectedIndex = newIndex ;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: REdgeInsets.only(left: 20, right: 20),
                child: OutlinedButton(
                  onPressed: () {
                    if (formKay.currentState!.validate()) {}
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
                        "Update",
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
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
