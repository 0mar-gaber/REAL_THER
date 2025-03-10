import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          backgroundImage: NetworkImage("https://img.freepik.com/free-photo/lifestyle-people-emotions-casual-concept-confident-nice-smiling-asian-woman-cross-arms-chest-confident-ready-help-listening-coworkers-taking-part-conversation_1258-59335.jpg?t=st=1739499048~exp=1739502648~hmac=9edcca72d8d8ce5ab84994fb36d49d35e281be91962cbc6d5df0d9054c36148a&w=996",),
          radius: 80.r,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Antonio P. Nielson",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 19.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "antonio.nielson321@gmail.com",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
