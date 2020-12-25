import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart_event.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart_state.dart';
import 'package:gebeya_flutter_practicatl_exam/models/cartitem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  SharedPreferences sharedPreference;
  List<CartItem> cartItems = new List<CartItem>();

  CartBloc({@required sharedPreference}) : super(IdleState()) {
    this.sharedPreference = sharedPreference;
    if (this.sharedPreference.getString("cartItems") != null) {
      List<dynamic> cartitemsraw =
          jsonDecode(this.sharedPreference.getString("cartItems"));
      cartitemsraw.forEach((element) {
        cartItems.add(CartItem.fromJson(element));
      });
    }
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    yield BusyState();
    try {
      if (event is GetCartItems) {
        yield ReadyState(cartItems: cartItems);
      }
      if (event is AddToCart) {
        print(cartItems);
        bool exists = false;
        cartItems.forEach((element) {
          if (element.product.id == event.cartItem.product.id) {
            print('exists');
            exists = true;
          }
        });
        if(!exists){
          cartItems.add(event.cartItem);
          sharedPreference.setString("cartItems", jsonEncode(cartItems));
        }
        print('added to cart');
        print(cartItems);
        yield ReadyState(cartItems: cartItems);
      }
      if (event is UpdateCartItem) {
        int index = cartItems.indexOf(event.oldItem);
        cartItems[index] = event.cartItem;
        sharedPreference.setString("cartItems", jsonEncode(cartItems));
        yield ReadyState(cartItems: cartItems);
      }
      if (event is RemoveFromCart) {
        cartItems.remove(event.cartItem);
        sharedPreference.setString("cartItems", jsonEncode(cartItems));
        yield ReadyState(cartItems: cartItems);
      }
    } catch (error) {
      print(error);
      yield FailedState();
    }
  }
}
