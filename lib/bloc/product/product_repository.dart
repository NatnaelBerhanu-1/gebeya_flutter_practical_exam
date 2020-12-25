import 'dart:convert';

import 'package:gebeya_flutter_practicatl_exam/models/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository{
  final String baseUrl = "https://store-api.glitch.me/api/";
  Future<List<Product>> getProducts() async{
    List<Product> products = List<Product>();
    try{
      var response = await http.get("${baseUrl}products");
      print(response.body);
      List<dynamic> rawProducts = jsonDecode(response.body);
      rawProducts.forEach((element) {
        products.add(Product.fromJson(element));
      });
      return products;
    }catch(error){
      print(error);
      throw Exception('Failed to get product');
    }
  }
}