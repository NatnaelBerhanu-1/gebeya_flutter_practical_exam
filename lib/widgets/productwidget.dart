import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gebeya_flutter_practicatl_exam/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gebeya_flutter_practicatl_exam/screens/productdetail.dart';


class ProductWidget extends StatelessWidget{
  final Product product;

  ProductWidget({@required this.product}):assert(product!=null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product: this.product)));
      },
      child: Container(
        height: 180.0,
        width: 150,
        padding: EdgeInsets.only(left:8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
                ),
                child: Image(
                  image: CachedNetworkImageProvider('${product.imageUrl}'),
                  height: 160,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                '${product.currency}${product.price}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Text(
              '${product.name}',
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),

          ],
        ),
      ),
    );
  }
}