import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget { // Correction ici
  const MyHomePage({super.key });

  @override 
  State<MyHomePage> createState() => _MyHomePage();
  
}

  class _MyHomePage extends State<MyHomePage> {

    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final  _passwordController = TextEditingController();
    bool _isObscure = true;
    final FocusNode _focusNode = FocusNode();

    @override
  void initState() {
    super.initState();
    // Ajouter un listener pour le FocusNode
    _focusNode.addListener(() {
      setState(() {}); // Met à jour l'état lorsque le focus change
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Libérer le FocusNode
    _passwordController.dispose(); // Libérer le controller
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/image.png'
              ),
              //const Padding(padding: EdgeInsets.only(bottom: 10),),
              Image.asset(
                'assets/images/1566_Bboxx Primary Logo.png', 
                height: 200,
                width: 200,
              ),
              //const Padding(padding: EdgeInsets.only(top: 10)),
              const SizedBox(height: 10,),
                Padding(padding: const EdgeInsets.all(15),
                 child:  TextFormField(
                  controller: _emailController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Veuillez remplir correctement le champs Adresse e-mail";
                    }else if(!value.contains("@")){
                      return "Veuillez remplir correctement le champs Adresse e-mail";
                    }else if(!value.contains(".")){
                      return "Veuillez remplir correctement le champs Adresse e-mail";
                    }
                  },
                  decoration:   const InputDecoration(
                    labelText: "Adresse e-mail",
                    labelStyle:  TextStyle(color: Colors.black),
                    floatingLabelStyle: TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2.0)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                    
                    //border: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(5.0),
                      //borderSide: BorderSide.none
                    )
                  ),
                  
                  //style: const TextStyle(color: Colors.black),
                //)
                ),
               const SizedBox(height: 10,),
                Padding(padding: const EdgeInsets.all(15),
                 child:  TextFormField(
                  focusNode: _focusNode,
                  controller: _passwordController,
                  obscureText: _isObscure,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Veuillez entrer le bon mot de passe";
                    }
                    return null;
                  },
                  decoration:   InputDecoration(
                    labelText: "Mot de passe",
                    labelStyle:  const TextStyle(color: Colors.black),
                    floatingLabelStyle: const TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:  const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2.0)),
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }, icon: Icon(_isObscure ? Icons.visibility: Icons.visibility_off, color: _focusNode.hasFocus? Colors.blue : Colors.black
                    ))
                    //border: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(5.0),
                      //borderSide: BorderSide.none
                      
                    )
                  ),
                  
                  //style: const TextStyle(color: Colors.black),
                //)
                ), 
                Padding(padding: const EdgeInsets.all(15), 
                child: 
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      //
                    }
                    return null;
                  }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)
                      )
                    ),
                  child: const Text("Se connecter", style: TextStyle(fontSize: 20),)),
                )
              )
            ],
          )),
      ),
    );
  }
}