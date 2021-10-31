import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageImages {
  Future<List<Asset>?> images(selectedassets) async {
    try {
      if (await Permission.storage.isGranted) {
        return await MultiImagePicker.pickImages(
            selectedAssets: selectedassets, maxImages: 5, enableCamera: true);
      } else {
        await Permission.storage.request();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
