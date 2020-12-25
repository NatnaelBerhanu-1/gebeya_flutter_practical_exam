import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gebeya_flutter_practicatl_exam/widgets/cartitemwidget.dart';
import '../bloc/cart/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications_outlined),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Cart',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.black54),
                  ),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is ReadyState) {
                      if (state.cartItems.length > 0)
                        return Expanded(
                          child: ListView.builder(
                              itemCount: state.cartItems.length,
                              itemBuilder: (context, index) {
                                return CartItemWidget(
                                    cartItem: state.cartItems[index]);
                              }),
                        );
                      else {
                        return Center(child: Text('No items in cart'));
                      }
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if (state is ReadyState) {
              if (state.cartItems.length > 0)
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Color(0xFF64B5FF)
                            ])),
                    child: FlatButton(
                        color: Colors.transparent,
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50.0,
                        onPressed: () {},
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                );
            }
            return SizedBox();
          })
        ],
      ),
    );
  }
}
