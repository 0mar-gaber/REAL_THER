import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 25.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 72.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Padding(
              padding: REdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "Filter",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                    "assets/svg/close_circle_icon.svg",
                    width: 26.w,
                    height: 26.h,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
