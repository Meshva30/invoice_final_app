import 'package:flutter/material.dart';

import '../../utils/list.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

int index=0;
class _editState extends State<edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'),),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: TextEditingController(text: productName[index]),
              decoration: InputDecoration(labelText: 'Product Name'),
              onChanged: (value) {
                productName[index] = value;
              },
            ),
            TextField(
              controller: TextEditingController(text: productQty[index].toString()),
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                productQty[index] = int.tryParse(value) ?? 0;
              },
            ),
            TextField(
              controller: TextEditingController(text: productAmount[index].toString()),
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                productAmount[index] = int.tryParse(value) ?? 0;
              },
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {

                    setState(() {

                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
