import 'dart:io';

import 'package:SportIA/helpers/gallery_helper.dart';
import 'package:SportIA/helpers/tflite_helper.dart';
import 'package:SportIA/models/tflite_result.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _image;
  List<TFLiteResult> _response = [];

  @override
  void initState() {
    super.initState();
    TFLiteHelper.loadModel();
  }

  @override
  void dispose() {
    TFLiteHelper.dispose();
    super.dispose();
  }

  _pickImage() async {
    // Busca imagem da galeria do celular
    final image = await GalleryHelper.pickImage();
    if (image == null) {
      return null;
    }

    // Envia imagem para verificação IA
    final outputs = await TFLiteHelper.classifyImage(image);

    setState(() {
      _image = image;
      _response = outputs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('SportIA'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_photo_alternate),
        onPressed: _pickImage,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildImage(),
            if (_image != null) _buildResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(19.0, 19.0, 19.0, 20.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: _image == null
                ? Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Text(
                      'Adicione uma imagem de Futebol ou Natação',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize:
                              16 * MediaQuery.of(context).textScaleFactor),
                    ),
                  )
                : Image.file(
                    _image,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildResult() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 120.0),
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(
            color: Colors.grey[200],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _resultListIA(),
      ),
    );
  }

  Widget _resultListIA() {
    return Center(
      child: ListView.builder(
        itemCount: _response.length,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (BuildContext context, int index) {
          String label = _response[index].label.split(' ')[1];
          String precision =
              (_response[index].confidence * 100.0).toStringAsFixed(2);

          return Column(
            children: <Widget>[
              Text(
                'Esporte identificado: $label',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Precisão IA',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.0,
              ),
              CircularPercentIndicator(
                radius: 65.0,
                lineWidth: 5.0,
                percent: _response[index].confidence,
                center: new Text(
                  "$precision%",
                  style: TextStyle(color: Colors.green),
                ),
                progressColor: Colors.green,
              ),
            ],
          );
        },
      ),
    );
  }
}
