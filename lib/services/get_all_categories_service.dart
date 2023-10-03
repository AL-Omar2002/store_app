import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    List<ProdcutModel> getAllCategories = [];
    for (int i = 0; i < data.length; i++) {
      getAllCategories.add(ProdcutModel.fromJson(data[i]));
    }
    return getAllCategories;
  }
}
