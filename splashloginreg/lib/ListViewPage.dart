import 'package:flutter/material.dart';
import 'package:splashloginreg/flowerData.dart';
import 'home.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView.builder(
        itemCount: FlowerData().items.length,
        itemBuilder: (context,position){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text("$position"),
                  ),
                  SizedBox(width: 10),
                  Text("${FlowerData().items[position]["name"]}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}