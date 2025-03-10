import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/reusable_components/text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String route= "SearchScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    } ,
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 30.sp,
                      color: Theme.of(context).colorScheme.primary,
                    )
                ),
                SizedBox( width:  20.w),
                Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 22.sp,fontWeight: FontWeight.w700),),
              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              children: [
                Expanded(
                  child: EditText(
                    lapel: "Search for. .",
                    obscureText: false,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    formKay: GlobalKey(),
                    controller: SearchController(),
                    iconButton: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svg/search_icon.svg")),
                    decorate: false,
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Container(
                            width: 50.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text("Filter Options", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                          // باقي محتوى الـ Bottom Sheet هنا
                        ],
                      ),
                    ),
                  ),
                  child: Container(
                    width: 60.w,
                    height: 65.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border.all(color: const Color(0xffDEEAFD)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(child: SvgPicture.asset("assets/svg/filter_icon.svg")),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
