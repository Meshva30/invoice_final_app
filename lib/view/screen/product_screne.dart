
import 'package:flutter/material.dart';

import '../../utils/list.dart';


class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  TextEditingController txtCustomerName = TextEditingController();
  TextEditingController txtProductName = TextEditingController();
  TextEditingController txtProductPrice = TextEditingController();
  TextEditingController txtProductQty = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff0F2C59),
        leading:  Icon(Icons.menu, size: 30,color: Colors.white,),
        title: const Text("Invoice Generator",style: TextStyle(color: Colors.white),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              textFieldBox(
                  txtCustomerName,
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  'Customer Name'),
              textFieldBox(
                  txtProductName,
                  const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                  'Product Name'),
              textFieldBox(
                  txtProductPrice,
                  const Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                  'Price'),
              textFieldBox(
                  txtProductQty,
                   Icon(
                    Icons.numbers_sharp,
                     color: Colors.white,
                  ),
                  'Qty',),
              const SizedBox(
                height: 100,
              ),
              InkWell(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff0F2C59)),
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                onTap: () {

                  setState(() {
                    int finalprice = int.parse(txtProductQty.text) * int.parse(txtProductPrice.text);
                    productName.add(txtProductName.text);
                    productAmount.add(finalprice);
                    productQty.add(txtProductQty.text);
                    Navigator.of(context).pushReplacementNamed('cart');
                  });

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget textFieldBox(TextEditingController name, Icon i1, String pname) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      style: TextStyle(color: Colors.white),
      controller: name,
      decoration: InputDecoration(
        labelText: pname,
        prefixIcon: i1,
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.indigo))
      ),
    ),
  );
}
