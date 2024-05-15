import 'package:piscine_app/models/product_model.dart';

//import '/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
