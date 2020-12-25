import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gebeya_flutter_practicatl_exam/models/cartitem.dart';

class CartEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetCartItems extends CartEvent{}

class AddToCart extends CartEvent{
  final CartItem cartItem;
  AddToCart({@required this.cartItem}):assert(cartItem!=null);
}

class RemoveFromCart extends CartEvent{
  final CartItem cartItem;
  RemoveFromCart({@required this.cartItem}):assert(cartItem!=null);

  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}

class UpdateCartItem extends CartEvent{
  final CartItem oldItem;
  final CartItem cartItem;
  UpdateCartItem({@required this.oldItem, @required this.cartItem}):assert(cartItem!=null&&oldItem!=null);

  @override
  // TODO: implement props
  List<Object> get props => [oldItem, cartItem];
}

