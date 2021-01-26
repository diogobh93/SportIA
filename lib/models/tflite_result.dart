class TFLiteResult {
  int id;
  double confidence;
  String label;

  TFLiteResult(this.id, this.confidence, this.label);

  TFLiteResult.fromModel(dynamic model) {
    id = model['index'];
    confidence = model['confidence'];
    label = model['label'];
  }
}
