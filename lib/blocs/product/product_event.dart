part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  final List<Product> products;

  const LoadProducts({
    this.products = const <Product>[],
  });

  @override
  List<Object> get props => [products];
}

class UpdateProducts extends ProductEvent {
  final List<Product> products;

  UpdateProducts(this.products);

  @override
  List<Object> get props => [products];
}

//

class LoadCategoryProducts extends ProductEvent {
  //final List<Product> categoryproducts;
  final String category;

  const LoadCategoryProducts(
      {
      //this.categoryproducts = const <Product>[]
      required this.category});

  @override
  List<Object> get props => [category];
}

class FilterProducts extends ProductEvent {
  final Category category;

  const FilterProducts({required this.category});

  @override
  List<Object> get props => [category];
}
