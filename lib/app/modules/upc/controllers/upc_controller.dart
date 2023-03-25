import 'package:get/get.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class UpcController extends GetxController {
  RxString scannedCode = RxString('');

  Future<void> scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      scannedCode.value = result.rawContent;
      print(scannedCode.value);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
