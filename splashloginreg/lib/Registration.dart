import 'package:flutter/material.dart';
import 'package:splashloginreg/home.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pwdCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();

  var _key= GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: _key,
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text("Registration"),
                  centerTitle: true,
                ),
                body: SafeArea(
                    child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  children: <Widget>[
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Create Account",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Create a new Account",
                          style: TextStyle(
                              fontSize: 20, color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (val){
                          if(val==""){
                            return "Please enter your Name";
                          }else if(val!.length<4){
                            return "Name must be 4 charecter avobe";
                          }
                        },
                        //controller: _nameCtrl,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "NAME",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child:  TextFormField(
                        controller: emailCont,
                        validator: (val) {
                          if(val==""){
                            return "Please enter your email";
                          }else if(val!.length<5){
                            return "Email mustbe 4 charecter avobe";
                          }if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)){
                            return "Please enter valid email";
                          }
                          
                        },
                       // controller: _emailCtrl,
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
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
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (val){
                          if(val==""){
                            return "Please enter your phone number";
                          }else if(val!.length<11){
                            return "Number must be 11 charecter avobe";
                          }
                        },
                        //controller: _phoneCtrl,
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "PHONE",
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.grey,
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child:  TextFormField(
                        controller: pwdCont,
                        validator: (val){
                          if(val==""){
                            return "Please enter your password";
                          }else if(val!.length<5){
                            return " Password must be 5 charecter avobe";
                          }
                        },
                       // controller: _passCtrl,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
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
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        validator: (val){
                          if(val==""){
                            return "Please enter your confirm password";
                          } if(val!.length<5){
                            return "Confirm password must be 5 charecter avobe";
                          }if(val != pwdCont.text){
                            return "Confirm password not matching";
                          }
                        },
                        //controller: _cPassCtrl,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "CONFIRM PASSWORD",
                          prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(borderRadius: 
                          BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none)
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // ignore: deprecated_member_use
                    /*FlatButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration()));
                },
              )*/
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
                              builder: (context) => const LoginPage(),
                            ));
                        }
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Registration(),
                            ));*/
                      },
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                
                    SizedBox(
                      height: 40,
                    ),
                     Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children : [
                  Text("Already have a account?",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => LoginPage()));
                    },
                    child: Text("Login",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),),
                  )
                ]
              )
                    
                    /*Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        children: const [
                          Text("Already have a account?"),
                         
                          Text(
                            " Login",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    )*/
                  ],
                ))),
          ),
        ),
      ),
    );
  }

//Valid Data
  _submit(){
    var isValid = _key.currentState!.validate();
    if(isValid){

    }else{
      return;
    }
  }
}
