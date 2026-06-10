import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(height: 80.h),

                CircleAvatar(
                  radius: 26.r,
                  backgroundColor: const Color.fromARGB(
                    59,
                    33,
                    149,
                    243,
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    color: Colors.blue,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Log in to continue to your account',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 30.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Align(alignment: Alignment.centerLeft,
                  child: Text('Password', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),),
                ),
                SizedBox(height: 10.h,),
                 TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    prefixIcon: const Icon(
                    Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}