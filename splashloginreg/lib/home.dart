import 'package:flutter/material.dart';
import 'package:splashloginreg/ListViewPage.dart';
import 'Registration.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      home: SafeArea(
        child: SafeArea(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailCont =TextEditingController();
  TextEditingController pwdCont =TextEditingController();
  
  var _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Form(
        key: _key,
        child: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          children: <Widget>[
            Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/profile.png',
                  height: 100,
                  width: 100,
                ),
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign to continue",
                  style: TextStyle(
                      fontSize: 20, color: Colors.black.withOpacity(0.5)),
                )
              ],
            ),
            const SizedBox(
              height: 60.0,
            ),
            Container(
              padding:  EdgeInsets.all(20.0),
              child: TextFormField(
                controller: emailCont,
                validator: (val) {
                   if(val==""){
                  return "Please enter your email";
                } if(val!.length<5){
                  return "Email must be 4 charecter avobe";
                }if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)){
                  return "Please enter valid email";
                }if(val != emailCont.text){
                  return "Email not matching";
                }
                },
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "EMAIL",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: pwdCont,
                validator: (val) {
                   if(val==""){
                  return "Please enter your password";
                }if(val!.length<5){
                  return "Password must be 5 charecter avobe";
                }if(val != pwdCont.text){
                  return "Password not matching";
                }
                },
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "PASSWORD",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  print("Forgat Pass");
                },
                child: const Text(
                  "Forget Password",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(18),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.green,
              onPressed: () {
                _submit();
                if(_key.currentState!.validate()){
                  //print("Success");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListViewPage(),
                    ));
                }
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Registration(),
                    ));*/
              },
              child: const Text('Login',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Don't have account?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext) => Registration()));
                },
                child: const Text(
                  "create a new account",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )
            ])
          ],
        )),
      ),
    ));
  }

  //Valid data
  _submit(){
    var isValid = _key.currentState!.validate();
    if(isValid){

    }else{
      return;
    }
  }
}






