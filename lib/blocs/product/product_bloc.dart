import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';
import '/repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;
  StreamSubscription? _categoryproductSubscription;

  StreamSubscription? _productcategorySubscription;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {


          
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
    on<LoadCategoryProducts>(_ongetCategoryProducts);

    _productSubscription =
        _productRepository.getAllProducts().listen((products) {
      print(products);
      add(
        UpdateProducts(products),
      );
    });
    //
    // _categoryproductSubscription = _productRepository
    //     .getCategoryProducts(event.category.name)
    //     .listen((products) {
    //   print(products);
    //   add(
    //     UpdateProducts(products),
    //   );
    // });
    //
  }
  //
  Future<void> _ongetCategoryProducts(
    LoadCategoryProducts event,
    Emitter<ProductState> emit,
  ) async {
    //  await Future<void>.delayed(const Duration(seconds: 1));

    final List<Product> categoryproducts =
        await _getcategoryproducts(event.category);
    //_productRepository.getCategoryProducts(event.category) ;
    // print(event.categoryproducts);
    emit(CategoryProductLoaded(products: categoryproducts));
  }

  //
  Future<List<Product>> _getcategoryproducts(String category) async {
    print(category);
    List<Product> categoryproducts;
    if (category.compareTo('All') == 0) {
      categoryproducts = await _productRepository.getAllProducts().first;
    } else {
      categoryproducts =
          await _productRepository.getCategoryProducts(category).first;
    }
    print("categoryproducts:");
    print(categoryproducts);

    return categoryproducts.toList();
  }

  //
  //
  //

  void _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    //  await Future<void>.delayed(const Duration(seconds: 1));

    emit(ProductLoaded(products: event.products));
  }

  void _onUpdateProducts(
    UpdateProducts event,
    Emitter<ProductState> emit,
  ) {
    emit(ProductLoaded(products: event.products));
  }

//filter products by category

//
  @override
  Future<void> close() async {
    _productSubscription?.cancel();
    super.close();
  }
}
