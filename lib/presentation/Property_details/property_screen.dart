import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_ther/core/reusable_components/property_details_widget.dart';
import 'package:real_ther/core/reusable_components/seller_details_widget.dart';
import 'package:real_ther/core/reusable_components/tabs_filter.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  static const String route = "PropertyScreen";

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  bool isLoved = false;

  List<String> filters = [
    "Car Parking",
    "GYM & Fitness ",
    "Wi-fi",
    "Restaurant",
    "Loundry",
    "Camera",
    "Garden",
    "Sport Center ",
    "Garden",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(children: [
                    Container(
                      height: 420.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r)),
                        child: Image(
                          image: NetworkImage(
                              "https://th.bing.com/th/id/R.890d7b92838da508c266af885097b288?rik=pssDQZU%2bchcRHA&pid=ImgRaw&r=0"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 34, top: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                CupertinoIcons.back,
                                color: Theme.of(context).colorScheme.primary,
                                size: 40.sp,
                              )),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLoved = !isLoved;
                              });
                            },
                            child: !isLoved
                                ? SvgPicture.asset(
                                    "assets/svg/heart_icon.svg",
                                    width: 34.w,
                                    height: 34.h,
                                  )
                                : SvgPicture.asset(
                                    "assets/svg/selected_heart_icon.svg",
                                    width: 34.w,
                                    height: 34.h,
                                  ),
                          )
                        ],
                      ),
                    )
                  ]),
                  PropertyDetailsWidget(),
                  SellerDetailsWidget(),
                  Container(
                    margin: REdgeInsets.only(left: 34, right: 34, top: 20),
                    child: Text(
                      "Overview",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 19.sp),
                    ),
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 34, right: 34, top: 20),
                    child: Text(
                      "The customer is very important, the customer will be followed by the customer. And these seven were named not by their own, but by the vote of all the people. The lust of Claudius, who was then in command.",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 34, right: 34, top: 20),
                    child: Text(
                      "Facilities",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 19.sp),
                    ),
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 34, top: 16, right: 20),
                    child: StaggeredGrid.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 8.w,
                        children: List.generate(
                          filters.length,
                          (index) => TabsFilter(
                            text: filters[index],
                            index: index,
                            selectedIndex: 99999,
                            onTap: (p0) {},
                          ),
                        )),
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 34, right: 34, top: 20),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 19.sp),
                    ),
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 34, top: 16, right: 20),
                    child: StaggeredGrid.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 8.w,
                      children: List.generate(
                          6,
                          (index) => Container(
                                width: 108.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.r),
                                    color: Colors.black),
                              )),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            Container(
              height: 128.h,
              color: Theme.of(context).colorScheme.secondary,
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 250.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                            child: Text(
                          "Estimate After 1 Year",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                      Container(
                        width: 144.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Compare",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SvgPicture.asset("assets/svg/compare.svg")
                          ],
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
