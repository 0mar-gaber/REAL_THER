import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_ther/presentation/screens/auth/reset_password_screen.dart';
import 'package:real_ther/presentation/screens/auth/verification_status_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  static const String route = "OtpScreen";

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ModalRoute.of(context)?.settings.arguments ?? "";
    String? otpCode;

    return Scaffold(
      body: Column(
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
            padding: REdgeInsets.only(left: 34, right: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "Verification.!",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "We have Sent the Code Verification to \n$phoneNumber",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 68.h,
                ),
                OtpTextField(
                  autoFocus: false,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  borderRadius: BorderRadius.circular(12.r),
                  focusedBorderColor: Colors.white,
                  disabledBorderColor: Colors.white,
                  enabledBorderColor: Colors.white,
                  borderWidth: 0,
                  fieldWidth: 75.w,
                  contentPadding: REdgeInsets.all(25),
                  textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp),
                  showCursor: false,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.secondary,
                    filled: true,
                  ),
                  numberOfFields: 4,
                  borderColor: Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every text field is filled
                  onSubmit: (String verificationCode) {
                    otpCode = verificationCode;
                    print(otpCode);
                    Navigator.pushNamedAndRemoveUntil(context, VerificationStatusScreen.route,(route) => false,);
                  }, // end onSubmit
                ),
                SizedBox(
                  height: 31.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16.sp , fontWeight: FontWeight.w700),
                      // Default text style
                      children: [
                        TextSpan(
                          text: 'I Did’t Receive the Code ',
                        ),
                        TextSpan(
                          text: 'Resend Again',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
