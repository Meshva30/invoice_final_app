import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.of(context).pushNamed('item');

        },child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading:  Icon(Icons.menu, size: 30,color: Colors.white,),
        title:  Text("Invoice Generator",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}