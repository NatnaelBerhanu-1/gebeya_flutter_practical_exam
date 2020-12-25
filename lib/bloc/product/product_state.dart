import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gebeya_flutter_practicatl_exam/models/product.dart';

class ProductState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IdleState extends ProductState{}

class BusyState extends ProductState{}

class ProductsFetchedState extends ProductState{
  final List<Product> products;
  ProductsFetchedState({@required this.products}):assert(products!=null);

  @override
  // TODO: implement props
  List<Object> get props => [products];
}

class FailedState extends ProductState{}