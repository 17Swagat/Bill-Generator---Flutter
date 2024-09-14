import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:app_billgenerator/model/product.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'dart:io';

class CustomRow {
  final String itemName;
  final String itemPrice;
  final String amount;
  final String total;
  final String vat;

  CustomRow(this.itemName, this.itemPrice, this.amount, this.total, this.vat);
}

class PdfInvoiceService {
  Future<Uint8List> createHelloWorld() {
    // @new:
    final pdf = pw.Document();
    pdf.addPage(pw.Page(build: (context) {
      return pw.Center(
        child: pw.Text('Hello World'),
      );
    }));
    return pdf.save();

    // @old:
    // throw UnimplementedError();
    // TODO 5 - 8 (Optional) only to showcase the pdf generation
    // TODO 5: Create a pdf document
    // TODO 6: Add a page
    // TODO 7: Write Hello World in the Center
    // TODO 8: Save the document and return the Uint8List
  }

  Future<Uint8List> createInvoice(List<Product> soldProducts) async {
    // throw UnimplementedError();
    // new:
    final pdf = pw.Document();
    final List<CustomRow> elements = [
      CustomRow('Item Name', 'Item Price', 'Amount', 'Total', 'Vat'),
      for (var product in soldProducts)
        CustomRow(
          product.name,
          product.price.toStringAsFixed(2),
          product.amount.toStringAsFixed(2),
          (product.price * product.amount).toStringAsFixed(2),
          (product.price / 100 * product.vatInPercent).toStringAsFixed(2),
        ),
      CustomRow(
        "Sub Total",
        "",
        "",
        "",
        "Rs ${getVatTotal(soldProducts)}",
      ),
      CustomRow(
        "VAT Total",
        "",
        "",
        "",
        "Rs ${getVatTotal(soldProducts)}",
      ),
      CustomRow(
        "Total",
        "",
        "",
        "",
        "Rs ${getVatTotal(soldProducts)}",
      ),
    ];

    final image = (await rootBundle.load('images/on_pdf/pdf_logo.jpg'))
        .buffer
        .asUint8List();
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(children: [
          pw.Image(pw.MemoryImage(image),
              width: 150, height: 150, fit: pw.BoxFit.cover),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(children: [
                  pw.Text('Customer Name'),
                  pw.Text('Customer Address'),
                  pw.Text('Customer City'),
                ]),
                pw.Column(children: [
                  pw.Text('Max Weber'),
                  pw.Text('Weird Street Name 1'),
                  pw.Text('70702 Not my city'),
                  pw.Text('Invoice-Nr: 0001'),
                ]),
              ])
        ]);
      },
    ));

    return pdf.save();

    // @old:
    // TODO 13: Create a pdf document
    // TODO 14: Create a list of "CustomRow" which contains each row of the item list
    // TODO 15: Load the image via the rootBundle
    // TODO 16: Add a page to the PDF and add one by one the elements
    // TODO 17: Save the PDF and return the Uint8List
  }

  Future<Uint8List> createInvoice_2(List<Product> soldProducts) async {
  final pdf = pw.Document();
  final image = (await rootBundle.load('images/on_pdf/pdf_logo.jpg'))
      .buffer
      .asUint8List();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Column(
        children: [
          pw.Image(
            pw.MemoryImage(image),
            width: 150,
            height: 150,
            fit: pw.BoxFit.cover,
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Customer Name'),
                  pw.Text('Customer Address'),
                  pw.Text('Customer City'),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Max Weber'),
                  pw.Text('Weird Street Name 1'),
                  pw.Text('70702 Not my city'),
                  pw.Text('Invoice-Nr: 0001'),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              pw.TableRow(
                children: [
                  pw.Text('Item Name'),
                  pw.Text('Item Price'),
                  pw.Text('Amount'),
                  pw.Text('Total'),
                  pw.Text('Vat'),
                ],
              ),
              for (var product in soldProducts)
                pw.TableRow(
                  children: [
                    pw.Text(product.name),
                    pw.Text(product.price.toStringAsFixed(2)),
                    pw.Text(product.amount.toStringAsFixed(2)),
                    pw.Text((product.price * product.amount).toStringAsFixed(2)),
                    pw.Text((product.price / 100 * product.vatInPercent).toStringAsFixed(2)),
                  ],
                ),
              pw.TableRow(
                children: [
                  pw.Text("Sub Total", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(""),
                  pw.Text(""),
                  pw.Text(""),
                  pw.Text("Rs ${getVatTotal(soldProducts)}"),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Text("VAT Total", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(""),
                  pw.Text(""),
                  pw.Text(""),
                  pw.Text("Rs ${getVatTotal(soldProducts)}"),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Text("Total", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(""),
                  pw.Text(""),
                  pw.Text(""),
                  pw.Text("Rs ${getVatTotal(soldProducts)}"),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );

  return pdf.save();
}

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    // @new:
    // throw UnimplementedError();
    final output = await getTemporaryDirectory();
    var filepath = '${output.path}/$fileName.pdf';
    final file = File(filepath); // :-> NOTE: "not possible for Web"
    await file.writeAsBytes(byteList); // byteList := "pdf"
    await OpenFile.open(filepath);

    // @old:
    // TODO 9: Create a filepath where you want to save it (Flutter use getTemporaryDirectory())
    // TODO 10: Create a File instance with the filepath
    // TODO 11: Write into the file the byteArray
    // TODO 12: Open the document with OpenDocument
  }

  String getSubTotal(List<Product> products) {
    return products
        .fold(0.0,
            (double prev, element) => prev + (element.amount * element.price))
        .toStringAsFixed(2);
  }

  String getVatTotal(List<Product> products) {
    return products
        .fold(
          0.0,
          (double prev, next) =>
              prev + ((next.price / 100 * next.vatInPercent) * next.amount),
        )
        .toStringAsFixed(2);
  }
}
