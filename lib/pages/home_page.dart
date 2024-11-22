import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget { // Correction ici
  const MyHomePage({super.key });

  @override 
  State<MyHomePage> createState() => _MyHomePage();
  
}

  class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
               const SizedBox(height: 60,),
                 TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Adresse e-mail",
                    filled: true,
                    fillColor: Colors.black
                  ),
                )
            ],
          )),
      ),
    );
  }
}