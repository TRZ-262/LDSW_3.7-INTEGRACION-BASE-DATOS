import 'package:catalogo/servicios/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CATALOGO'),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    color: Colors.blue,
                    child: const Text(
                      'Boton',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    var data = await UserServices().getIdeas();
                    print('HOLA');
                  }),
              const Text('HOLA'),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }
}

void getUsers() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");

  QuerySnapshot users = await collectionReference.get();

  if (users.docs.length != 0) {
    for (var doc in users.docs) {
      print(doc.data());
    }
  }
}
