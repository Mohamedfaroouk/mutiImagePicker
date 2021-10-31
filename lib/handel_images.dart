import 'package:easytest/get_images.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class HandelImages {
  List<Asset> selectedImages = [];

  Future<void> fetchImages() async {
    selectedImages = await StorageImages().images(selectedImages) ?? [];
  }

  void deleteImage(Asset e) {
    selectedImages.remove(e);
  }
}
