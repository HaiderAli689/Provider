import 'package:countexamples/favourite/favourite.dart';
import 'package:countexamples/provider/auth_provider.dart';
import 'package:countexamples/res/round_buttons.dart';
import 'package:countexamples/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FocusNode emailfocusnode = FocusNode();
  FocusNode passwordfocusnode = FocusNode();

  RegExp emailValid = RegExp(r'^(?=.*?[A-Za-z])(?=.*?\d)(?=.*?[!@#$%^&*(),.?":{}|<>])');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();


    emailfocusnode.dispose();
    passwordfocusnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aithProvider = Provider.of<AuthProvider>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login View Model"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailfocusnode,

                decoration: InputDecoration(
                    hintText: 'Enter email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailfocusnode, passwordfocusnode);
                },
              ),
              SizedBox(height: 24,),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: passwordfocusnode,
                      obscureText: _obsecurePassword.value,
                      validator: (value){
                        bool emailValid = RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>])').hasMatch(_passwordController.text.toString());
                        if(!emailValid)
                          {
                            Utils.flushErrorBarMessage("Enter Valid Password", context);
                          }

                      },
                      decoration: InputDecoration(
                          hintText: 'Enter password',
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.password_sharp,
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value= !_obsecurePassword.value;
                              },
                              child: Icon(
                                  _obsecurePassword.value ? Icons.visibility_off_outlined :
                                  Icons.visibility_outlined
                              ))),
                    );
                  }),
              SizedBox(height: height * .1,),
              RoundButton(title: 'Login',
                  onPress: ()
              {

                aithProvider.login(_emailController.text.toString(), _passwordController.text.toString());
                if(_emailController.text.isEmpty)
                  {
                    Utils.flushErrorBarMessage("Please fill the blanks", context);

                  }else if(_passwordController.text.isEmpty)
                    {
                      Utils.flushErrorBarMessage("Please write the password", context);

                    }else if(_passwordController.text.length<12)
                    {
                      Utils.flushErrorBarMessage("You password should be strong in between 12 characters.", context);
                    }else if(_emailController.text.isNotEmpty)
                    {
                      Utils.snackBar("You have successfully login.", context);
                    } if(RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>])').hasMatch(_passwordController.text.toString())){
                      Utils.snackBar("Please add symbols to make strong password", context);
                }
                    else{
                  print("Api in not working");
                }
              }),
              SizedBox(height: 24,),
              TextButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (builder) => FavouriteScreen()));

                  }, child: Text("Agge Marr")),
            ],
          ),
        ),
      ),
    );
  }
}
