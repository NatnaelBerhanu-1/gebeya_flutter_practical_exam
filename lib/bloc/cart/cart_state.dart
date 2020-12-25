import 'package:equatable/equatable.dart';
import 'package:gebeya_flutter_practicatl_exam/models/cartitem.dart';

class CartState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BusyState extends CartState{}

class IdleState extends CartState{}

class ReadyState extends CartState{
  final List<CartItem> cartItems;
  ReadyState({this.cartItems}):assert(cartItems!=null);

  @override
  // TODO: implement props
  List<Object> get props => [cartItems];
}

class FailedState extends CartState{}