import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../utils/list.dart';

final pdf = pw.Document();

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartSCreenState();
}

class _CartSCreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff0F2C59),
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.white,
        ),
        title: const Text(
          "Invoice Generator",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            child: const Icon(
              Icons.picture_as_pdf_rounded,
              size: 30,
              color: Colors.white,
            ),
            onTap: () async {
              for (int i = 0; i < productAmount.length; i++) {
                total = total + productAmount[i];
              }
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => preview(),
                  ));
            },
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => productBox(index),
        itemCount: productName.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff0F2C59),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('item');
        },
      ),
    );
  }

  Widget productBox(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                leading: Text(
                  '${productName[index]}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                title: Text(
                  '${productQty[index]} Qty',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                trailing: Text(
                  '${productAmount[index]}/-',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('edit').then((value) {
                setState(() {});
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                productName.removeAt(index);
                productQty.removeAt(index);
                productAmount.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  }
}

Future<Uint8List> GeneratePdf() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "INVOICE",
              style: pw.TextStyle(fontSize: 35, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 40),
            pw.Row(children: [
              pw.Text("Billed to:", style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(width: 30),
              pw.Text("Jonathan Patterson", style: pw.TextStyle(fontSize: 20)),
            ]),
            pw.SizedBox(height: 5),
            pw.Row(children: [
              pw.Text("Pay to:", style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(width: 50),
              pw.Text("Liceria & Co.", style: pw.TextStyle(fontSize: 20)),
            ]),
            pw.SizedBox(height: 5),
            pw.Row(children: [
              pw.Text("Bank:", style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(width: 60),
              pw.Text("Borcelle Bank", style: pw.TextStyle(fontSize: 20)),
            ]),
            pw.SizedBox(height: 5),
            pw.Row(children: [
              pw.Text("Account Name:", style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(width: 10),
              pw.Text("Avery Davis", style: pw.TextStyle(fontSize: 20))
            ]),
            pw.SizedBox(height: 5),
            pw.Row(
              children: [
                pw.Text("Account No:", style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(width: 10),
                pw.Text("0123 4567 8901", style: pw.TextStyle(fontSize: 20))
              ],
            ),
            pw.SizedBox(height: 40),
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Table(
                    border: pw.TableBorder.all(),
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(color: PdfColors.indigo),
                            alignment: pw.Alignment.center,
                            margin: pw.EdgeInsets.all(5),
                            child: pw.Text('Product Name',
                                style: pw.TextStyle(color: PdfColors.white)),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(color: PdfColors.indigo),
                            alignment: pw.Alignment.center,
                            margin: pw.EdgeInsets.all(5),
                            child: pw.Text('Quantity',
                                style: pw.TextStyle(color: PdfColors.white)),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(color: PdfColors.indigo),
                            alignment: pw.Alignment.center,
                            margin: pw.EdgeInsets.all(5),
                            child: pw.Text('Amount',
                                style: pw.TextStyle(color: PdfColors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Container(
                    height: 200,
                    width: 450,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        width: 2,
                        color: PdfColors.black,
                      ),
                    ),
                    child: pw.Column(
                      children: [
                        pw.ListView.builder(
                            itemBuilder: (context, index) => pw.Container(
                                  height: 20,
                                  width: double.infinity,
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceEvenly,
                                      children: [
                                        pw.Text(
                                          '      ${productName[index]}',
                                          style:
                                              const pw.TextStyle(fontSize: 17),
                                        ),
                                        pw.Text(
                                          '                   ${productQty[index]}',
                                          style:
                                              const pw.TextStyle(fontSize: 17),
                                        ),
                                        pw.Text(
                                          '                ${productAmount[index]}',
                                          style:
                                              const pw.TextStyle(fontSize: 17),
                                        ),
                                      ]),
                                ),
                            itemCount: productName.length),
                        pw.Text(
                            '                                                    Total    ${total}',
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 40),
                  pw.Row(children: [
                    pw.Text('invoice no:',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                    pw.SizedBox(width: 20),
                    pw.Text('01234',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                  ]),
                  pw.Row(children: [
                    pw.Text('date:',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                    pw.SizedBox(width: 50),
                    pw.Text('12.06.2024',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                  ]),
                  pw.Row(children: [
                    pw.Text('due date:',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                    pw.SizedBox(width: 20),
                    pw.Text('26.06.2024',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                  ]),
                  pw.SizedBox(height: 40),
                  pw.Container(

                    child: pw.Text('                               Thank you!',
                        style: pw.TextStyle(
                          fontSize: 30,
                          fontWeight: pw.FontWeight.bold,
                        )),
                  )
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  PdfPreview(
    build: (format) => pdf.save(),
  );
  return pdf.save();
}

class preview extends StatefulWidget {
  const preview({super.key});

  @override
  State<preview> createState() => _previewState();
}

class _previewState extends State<preview> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => GeneratePdf(),
    );
  }
}
