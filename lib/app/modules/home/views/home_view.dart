import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stuff_accounting_app/app/internal/hex2color.dart';
import 'package:stuff_accounting_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Collection'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: Get.height / 18,
            ),
            const Center(
              child: Text(
                "SAA Fast Panel",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: controller.logout,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width / 1.35,
                height: Get.height / 15.5,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                        offset: Offset(0, 4),
                        blurRadius: 8)
                  ],
                ),
                child: TextField(
                    onChanged: ((value) {
                      controller.searchItems(search_query: value);
                    }),
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      labelStyle: TextStyle(
                          color: HexColor.fromHex("#343237"),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      hintStyle: TextStyle(
                          color: HexColor.fromHex("#828282"),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      filled: false,
                      fillColor: Colors.transparent,
                      labelText: "Search",
                      hintText: "The Last Of Us 2",
                    )),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Obx(() => ListView(
                children: controller.itemList.map((item) {
                  return ListTile(
                    title: Text(item.title),
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL,
                        arguments: item,
                      );
                    },
                  );
                }).toList(),
              ))),
    );
  }
}
