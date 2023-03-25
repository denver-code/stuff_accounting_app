import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upc_controller.dart';

class UpcView extends GetView<UpcController> {
  const UpcView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UpcController controller = Get.put(UpcController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpcView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(controller.scannedCode.value)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.scanBarcode,
        tooltip: 'Scan barcode',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
