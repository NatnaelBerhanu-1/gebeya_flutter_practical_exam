import 'package:gebeya_flutter_practicatl_exam/models/product.dart';

class CartItem{
  Product product;
  int amount;

  CartItem({this.product, this.amount});

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(
      product: Product.fromJson(json['product']),
      amount: json['amount']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'amount': amount,
      'product': product
    };
  }
}