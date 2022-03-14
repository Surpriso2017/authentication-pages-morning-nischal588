
import 'package:flutter/material.dart';
import 'package:insta/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

firstSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Sign Up",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        "See your groeth and get consulting support!",
        style: TextStyle(
            fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 30,
      ),
      InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.tv),
              SizedBox(
                width: 10,
              ),
              Text(
                "Sign up with Google",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      )
    ],
  );
}

divide() {
  return Row(
    children: [
      Expanded(
          child: Divider(
        color: Colors.grey,
        thickness: 2,
      )),
      Text(
        "or Sign up with Email",
        style: TextStyle(color: Colors.grey),
      ),
      Expanded(
          child: Divider(
        color: Colors.grey,
        thickness: 2,
      ))
    ],
  );
}

secondSection(
    GlobalKey foormkey,
    TextEditingController emailController,
    TextEditingController passwordController,
    bool hidePassword,
    BuildContext context) {
  return Form(
    autovalidateMode: AutovalidateMode.always,
    key: foormkey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name*"),
        TextFormField(
          minLines: 1,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintMaxLines: 1,
              hintText: "Name",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  borderSide: BorderSide(color: Colors.grey))),
          validator: (val) {
            if (val != null && val.isNotEmpty) {
              return null;
            }
            return "name must not be empty";
          },
        ),
        SizedBox(
          height: 20,
        ),
        Text("Email*"),
        TextFormField(
          minLines: 1,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintMaxLines: 1,
              hintText: "mail@website.com",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  borderSide: BorderSide(color: Colors.grey))),
          validator: (val) {
            if (val != null && val.isNotEmpty) {
              return null;
            }
            return "Email must not be empty";
          },
        ),
        SizedBox(
          height: 20,
        ),
        Text("Password*"),
        TextFormField(
          controller: passwordController,
          obscureText: hidePassword,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              hintMaxLines: 1,
              hintText: "Min 8. character",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  borderSide: BorderSide(color: Colors.grey))),
          validator: (val) {
            if (val == null) {
              return "password should not be null";
            }
            if (val.length < 8) {
              return "Password must not be more than 8 characters ";
            }
            return null;
          },
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Checkbox(value: true, onChanged: (newValue) {}),
              Text(
                "I agree to the",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "Terms and Conditions",
                style: TextStyle(color: Color(0xff0B69FA)),
              )
            ],
          ),
        ),
        Center(
          child: MaterialButton(
            onPressed: () {
              if (foormkey != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            },
            minWidth: 290,
            color: Color(0xff0B69FA),
            child: Text("Sign Up"),
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            children: [
              Text("Already have an Account?"),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Color(0xff0B69FA)),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final foormKey = GlobalKey<FormState>();
  final hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              firstSection(),
              SizedBox(
                height: 20,
              ),
              divide(),
              SizedBox(
                height: 20,
              ),
              secondSection(foormKey, emailController, passwordController,
                  hidePassword, context)
            ]),
          ),
        ),
      ),
    );
    ;
  }
}
