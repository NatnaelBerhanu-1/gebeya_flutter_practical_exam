import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart.dart';
import 'package:gebeya_flutter_practicatl_exam/models/cartitem.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  CartItemWidget({@required this.cartItem}) : assert(cartItem != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          height: 140,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: '${cartItem.product.imageUrl}',
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cartItem.product.name}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Lotto.LTD',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            '\$34.00',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          color: Color(0xFFf6f6f6),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (cartItem.amount > 1) {
                                    var oldItem = cartItem;
                                    cartItem.amount--;
                                    BlocProvider.of<CartBloc>(context).add(
                                        UpdateCartItem(cartItem: cartItem, oldItem: oldItem));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 8),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black54,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8),
                                child: Text(
                                  '${cartItem.amount}',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  var oldItem = cartItem;
                                  cartItem.amount++;
                                  BlocProvider.of<CartBloc>(context)
                                      .add(UpdateCartItem(cartItem: cartItem, oldItem: oldItem));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 8),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black54,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<CartBloc>(context)
                    .add(RemoveFromCart(cartItem: cartItem));
              },
              child: Icon(
                Icons.clear,
                color: Colors.black26,
              ),
            ),
          ),
        )
      ],
    );
  }
}
