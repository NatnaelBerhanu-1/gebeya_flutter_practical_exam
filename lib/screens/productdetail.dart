import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart_bloc.dart';
import 'package:gebeya_flutter_practicatl_exam/models/cartitem.dart';
import 'package:gebeya_flutter_practicatl_exam/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  ProductDetailPage({@required this.product}):assert(product!=null);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedSize = 'M';
  String toSelect = 'size';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top:16.0, left: 16.0, right: 16.0, bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: CachedNetworkImageProvider(
                      '${widget.product.imageUrl}'),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${widget.product.name}',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '${widget.product.currency}${widget.product.price}',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                        fontSize: 20),
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Text(
                            '4.5',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Very Good',
                          ),
                        )
                      ],
                    ),
                    Text(
                      '49 Review(s)',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black26,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a diam id urna fermentum vulputate. Maecenas sed vestibulum erat, a lacinia dolor. In et accumsan massa, in efficitur libero. Donec dui mi, maximus eget ullamcorper nec, egestas sit amet turpis. Duis dui nunc, rutrum eu consectetur at, faucibus vel velit. Nam vitae scelerisque ipsum. Sed tempor congue tellus.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16.0)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            toSelect = 'size';
                          });
                        },
                        child: Text(
                          'Select Size',
                          style: toSelect=='size' ? Theme.of(context).textTheme.headline6 : Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.black38),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            toSelect = 'color';
                          });
                        },
                        child: Text(
                          'Select Color',
                          style: toSelect=='color' ? Theme.of(context).textTheme.headline6 : Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.black38),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black26,
                ),
                toSelect == 'size' ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sizeWidget('S', context),
                      sizeWidget('M', context),
                      sizeWidget('L', context),
                      sizeWidget('XXL', context),
                    ],
                  ),
                ): Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                          boxShadow:  [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                spreadRadius: 3,
                                offset: Offset(0, 4))
                          ]
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50.0,
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                      onPressed: (){
                        BlocProvider.of<CartBloc>(context).add(AddToCart(cartItem: CartItem(amount: 1, product: widget.product)));
                      },
                      child: Text('ADD TO CART'),
                      color: Color(0xFFe1e1e1),
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    ),

                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: (){},
                    child: Text('BUY NOW',style: TextStyle(color: Colors.white),),
                    color: Theme.of(context).primaryColor,
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget sizeWidget(text, context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = text;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
            color: selectedSize == text
                ? Theme.of(context).primaryColor
                : Color(0xFFf3f3f3),
            boxShadow: [
              selectedSize == text
                  ? BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 3,
                      offset: Offset(0, 4))
                  : BoxShadow(color: Colors.white)
            ]),
        width: 45,
        height: 45,
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: selectedSize == text ? Colors.white : Colors.black38),
          ),
        ),
      ),
    );
  }
}
