import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/product/product.dart';
import 'package:gebeya_flutter_practicatl_exam/models/product.dart';
import 'package:gebeya_flutter_practicatl_exam/screens/cart.dart';
import 'package:gebeya_flutter_practicatl_exam/widgets/productwidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.filter_list),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.notifications_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.filter_alt_outlined),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Center(
              child: Container(
                height: 30,
                width: 35,
                margin: EdgeInsets.only(right: 20),
                child: Stack(alignment: Alignment.center, children: [
                  Icon(Icons.shopping_cart),
                  Align(
                    alignment: Alignment.topRight,
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is ReadyState) {
                          if (state.cartItems.length > 0) {
                            return Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                              child: Center(
                                  child: Text(
                                    '${state.cartItems.length}',
                                    style: TextStyle(color: Colors.white),
                                  )
                              ),
                            );
                          }
                        }
                        return SizedBox();
                      }),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                height: 56.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1.0, blurRadius: 6.0)
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black26,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Search Your Product',
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Featured',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          GestureDetector(
                            onTap: () {
                              // to products page
                            },
                            child: Text('See all',
                                style: Theme.of(context).textTheme.bodyText2),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (BuildContext context, state) {
                        if(state is ProductsFetchedState){
                          return Expanded(
                            child: ListView.builder(
                              itemCount: state.products.length,
                              scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                              return ProductWidget(product: state.products[index]);
                            }),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                height: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best Sell',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          GestureDetector(
                            onTap: () {
                              // to products page
                            },
                            child: Text('See all',
                                style: Theme.of(context).textTheme.bodyText2),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (BuildContext context, state) {
                        if(state is ProductsFetchedState){
                          return Expanded(
                            child: ListView.builder(
                                itemCount: state.products.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  return ProductWidget(product: state.products[index]);
                                }),
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
