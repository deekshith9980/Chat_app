import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email  = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Groupie',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Create your account to explore",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Image.asset("assets/register.png"),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      labelText: "Full Name",
                      prefixIcon: Icon(Icons.person,color: Theme.of(context).primaryColor),
                    ),
                    onChanged: (val){
                      setState(() {
                        fullName = val;
                      });
                    },

                    validator: (val){
                      if(val!.isNotEmpty){
                        return null;
                      }
                      else{
                        return "Your name must not be empty";
                      }
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email,color: Theme.of(context).primaryColor),
                    ),
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },

                    validator: (val){
                      return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock,color: Theme.of(context).primaryColor),
                    ),
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },

                    validator: (val){
                      if(val!.length<8){
                        return "Password must be 8 characters";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )
                      ),
                      child: const Text("Register",style: TextStyle(fontSize: 16,color: Colors.white),),
                      onPressed: (){
                        register();
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text.rich(
                      TextSpan(
                          text: "Already have an account?  ",
                          style: const TextStyle(color: Colors.black,fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Login now",
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  nextScreen(context, LoginPage());
                                },
                                style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                )
                            )
                          ]
                      )
                  )
                ],
              )),
        ),
      ),
    );
  }
  register() async{
    if(formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.registerUserWithEmailAndPassword(fullName, email, password).then((value) async {
        if(value == true){
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
          nextScreenReplace(context, HomePage());
        }
        else{
          showSnackBar(
            context,Colors.red,value,
          );
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
