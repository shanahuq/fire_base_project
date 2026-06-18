import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/ui_design/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = true;
  bool isVisible = false;
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

 
    Future<void> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registration Success")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LogInPage()),
    );

  } on FirebaseAuthException catch (e) {

    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email already exists. Please login."),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogInPage()),
      );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Registration Failed")),
      );
    }

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString())),
    );
  }
}

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
                Center(
                  child: CircleAvatar(
                    radius: 26.r,
                    backgroundColor: const Color.fromARGB(44, 124, 77, 255),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.deepPurpleAccent,
                      size: 25.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Register to get started with your account',
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
                    'Full Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your Name',
                    prefix: const Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
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
                  controller: email_controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: ' Email',
                    hintText: 'Enter your Email',
                    prefix: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextField(
                  obscureText: isVisible,
                  controller: password_controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ' Password',
                    hintText: 'Enter your Password',
                    prefix: const Icon(Icons.lock_outline, color: Colors.grey),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextField(
                  obscureText: isVisible,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: ' Password',
                    hintText: 'Confirm your Password',
                    prefix: const Icon(Icons.lock_outline, color: Colors.grey),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.deepPurpleAccent,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('I agree to the  ', style: TextStyle(fontSize: 12.sp)),
                    Text(
                      'Terms of Use  ',
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text('and  ', style: TextStyle(fontSize: 12.sp)),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    signUp(email_controller.text, password_controller.text);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: const Color.fromARGB(163, 0, 0, 0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
