import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_ther/core/shared_provider/home_screen_provider.dart';
import 'package:real_ther/presentation/Property_details/property_screen.dart';
import 'package:real_ther/presentation/screens/auth/otp_screen.dart';
import 'package:real_ther/presentation/screens/auth/reset_password_screen.dart';
import 'package:real_ther/presentation/screens/auth/sign_in_screen.dart';
import 'package:real_ther/presentation/screens/auth/sign_up_screen.dart';
import 'package:real_ther/presentation/screens/auth/verification_status_screen.dart';
import 'package:real_ther/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:real_ther/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';
import 'presentation/screens/auth/create_new_pass_screen.dart';
import 'presentation/screens/onboarding/onbording.dart';
import 'presentation/search_screen/search_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          OnBoarding.route: (context) => OnBoarding(),
          SignInScreen.route: (context) => SignInScreen(),
          SignUpScreen.route: (context) => SignUpScreen(),
          ResetPasswordScreen.route: (context) => ResetPasswordScreen(),
          OtpScreen.route: (context) => OtpScreen(),
          VerificationStatusScreen.route: (context) => VerificationStatusScreen(),
          CreateNewPassScreen.route: (context) => CreateNewPassScreen(),
          EditProfileScreen.route: (context) => EditProfileScreen(),
          HomeScreen.route: (context) => ChangeNotifierProvider(
                child: HomeScreen(),
                create: (context) => HomeScreenProvider(),
              ),
          PropertyScreen.route : (context) => PropertyScreen(),
          SearchScreen.route : (context) => SearchScreen(),
        },
        initialRoute: HomeScreen.route,
        theme: AppTheme.theme,
      ),
    );
  }
}
