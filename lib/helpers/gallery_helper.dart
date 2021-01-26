import 'dart:io';

import 'package:image_picker/image_picker.dart';

class GalleryHelper {
  static Future<File> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    var image = File(pickedFile.path);
    if (image == null) {
      return null;
    }
    return image;
  }
}
