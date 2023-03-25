import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stuff_accounting_app/app/internal/models/item.dart';
import 'package:stuff_accounting_app/app/routes/app_pages.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stuff_accounting_app/config.dart';

class HomeController extends GetxController {
  GetStorage storage = GetStorage();
  final searchController = TextEditingController();
  List<Item> staticItemList = <Item>[];
  RxList<Item> itemList = RxList<Item>();

  logout() async {
    storage.remove("token");
    Get.offAndToNamed(Routes.AUTHORISATION);
  }

  Future<List<Item>> fetchItems() async {
    final response = await http.get(
        Uri.parse(
          '$SERVER_URI/private/items/my/',
        ),
        headers: <String, String>{
          'Authorisation': storage.read("token"),
        });

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  void saveItems(List<Item> items) {
    final itemListJson = items.map((item) => item.toJson()).toList();
    storage.write('items', itemListJson);
  }

  void loadItems() {
    final box = GetStorage();
    final itemListJson = box.read<List<dynamic>>('items');
    if (itemListJson != null) {
      final items = itemListJson.map((json) => Item.fromJson(json)).toList();
      itemList.assignAll(items);
      staticItemList.assignAll(items);
    }
  }

  void searchItems({search_query}) {
    final query = search_query.toLowerCase();
    if (query == "") {
      return loadItems();
    }
    final filteredItems = staticItemList.where((item) {
      final titleLower = item.title.toLowerCase();
      final descriptionLower = item.description.toLowerCase();
      return titleLower.contains(query) || descriptionLower.contains(query);
    }).toList();

    if (filteredItems.isEmpty) {
      filteredItems.add(Item.fromJson({
        'title': "Looks like there are no items that meet your querry",
        'description': "",
        'picture': "picture",
        'upc': "upc",
        'owner': "owner",
        'tag': "tag",
        'id': "id",
      }));
    }
    itemList.assignAll(filteredItems);
  }

  void clearSearch() {
    searchController.clear();
    loadItems();
  }

  @override
  void onInit() async {
    super.onInit();
    final items = await fetchItems();
    saveItems(items);
    loadItems();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
