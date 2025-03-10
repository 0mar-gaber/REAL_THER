import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_ther/presentation/screens/edit_profile/edit_profile_screen.dart';

import '../../../../../core/reusable_components/profile_widget.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(35),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profiles",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, EditProfileScreen.route),
                  child: SvgPicture.asset(
                "assets/svg/edit_profil_icon.svg",
                height: 20.h,
                width: 20.w,
              )),
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          ProfileWidget(),
          SizedBox(
            height: 43.h,
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, EditProfileScreen.route),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.navigate_next_sharp,
                )
              ],
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Booking",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.navigate_next_sharp,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Options",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.navigate_next_sharp,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            "Preferences",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 26.h,
          ),
          Padding(
            padding: REdgeInsets.only(left: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Social",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.navigate_next_sharp,
                    )
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Languages",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.navigate_next_sharp,
                    )
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notification",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.navigate_next_sharp,
                    )
                  ],
                ),
                SizedBox(
                  height: 26.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.navigate_next_sharp,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "FAQs",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.navigate_next_sharp,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Terms of Use",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.navigate_next_sharp,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
        ],
      ),
    );
  }
}
