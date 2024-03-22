import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../utils/list.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final pdf = pw.Document();

  generatePdf() async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(children: [
            pw.ListView.builder(
                itemBuilder: (context, index) => pw.Container(
                  height: 80,
                  width: double.infinity,
                  padding: const pw.EdgeInsets.all(10),
                  margin: const pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 1.5,
                      )),
                ),
                itemCount: productName.length),

          ]);
        },
      ),
    );

    PdfPreview(
      build: (format) => pdf.save(),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(onTap: generatePdf(), child: Icon(Icons.picture_as_pdf))
        ],
      ),
    );
  }
}