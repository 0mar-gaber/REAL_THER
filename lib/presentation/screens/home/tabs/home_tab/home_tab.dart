import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:real_ther/core/reusable_components/popular_nearest_you_widget.dart';
import 'package:real_ther/core/reusable_components/recommend_for_you_widget.dart';

import '../../../../../core/reusable_components/text_field.dart';
import '../../../../../core/shared_provider/home_screen_provider.dart';
import '../../../../search_screen/search_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenProvider homeScreenProvider =
    Provider.of<HomeScreenProvider>(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 44.h)),
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 34.w),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/location_icon.svg",
                  height: 36.h,
                  width: 20.w,
                ),
                SizedBox(width: 15.w),
                Flexible(
                  flex: 3,
                  child: Text(
                    "Location\nManhattan, NewYork",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Spacer(flex: 1),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 35.r,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-photo/lifestyle-people-emotions-casual-concept-confident-nice-smiling-asian-woman-cross-arms-chest-confident-ready-help-listening-coworkers-taking-part-conversation_1258-59335.jpg?t=st=1739499048~exp=1739502648~hmac=9edcca72d8d8ce5ab84994fb36d49d35e281be91962cbc6d5df0d9054c36148a&w=996"),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 25.h)),
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 34.w),
          sliver: SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 130.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  bottomLeft: Radius.circular(20.r))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 130.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffD8D8D8),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r))),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: REdgeInsets.all(25),
                  child: Text(
                    "Discover\nFind your\nBest Living Places.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 32.w),
          sliver: SliverToBoxAdapter(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, SearchScreen.route),
              child: Row(
                children: [
                  Expanded(
                    child: EditText(
                      lapel: "Search for. .",
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      formKay: GlobalKey(),
                      controller: SearchController(),
                      iconButton: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/svg/search_icon.svg")),
                      decorate: false,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 60.w,
                    height: 65.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border.all(color: Color(0xffDEEAFD)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                        child: SvgPicture.asset("assets/svg/filter_icon.svg")),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 25.h)),
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 34.w),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Popular Nearest You",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    homeScreenProvider.changeTab(1);
                  },
                  child: Text(
                    "View All ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 21.h)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300.h,
            child: ListView.separated(
                padding: REdgeInsets.symmetric(horizontal: 34.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => PopularNearestYouWidget(),
                separatorBuilder: (context, index) => SizedBox(
                      width: 20.h,
                    ),
                itemCount: 5),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 25.h)),
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 34.w),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Recommend for You",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "View All ",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: REdgeInsets.only(
            top: 21.h,
            left: 34.w,
            right: 34.w,
            bottom: 20.h
          ),
          sliver: SliverGrid.builder(
            itemBuilder: (context, index) => RecommendForYouWidget() ,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 18.w,
                mainAxisSpacing: 50.h,

              )
          ),
        )

      ],
    );
  }
}
