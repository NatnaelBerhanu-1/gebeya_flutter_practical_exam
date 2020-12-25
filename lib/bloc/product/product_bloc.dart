import 'package:flutter/foundation.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/product/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/product/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  final ProductRepository productRepository;
  ProductBloc({@required this.productRepository}):assert(productRepository!=null), super(IdleState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async*{
    yield BusyState();
    try{
      if(event is GetProductsEvent){
        var products = await productRepository.getProducts();
        yield ProductsFetchedState(products: products);
      }
    }catch(error){
      print(error);
      yield FailedState();
    }
  }



}