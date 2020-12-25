class Product{
  int id;
  String name;
  double price;
  String currency;
  String imageUrl;

  Product({this.id, this.name, this.price, this.currency, this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      name: json['nom'],
      price: double.parse(json['price'].toString()),
      currency: json['currency'],
      imageUrl: json['imageUrl']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'price': price,
      'currency': currency,
      'imageUrl': imageUrl
    };
  }

}