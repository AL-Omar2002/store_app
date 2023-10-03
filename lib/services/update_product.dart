import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProdcutModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required int id,
    required RatingModel rating,
  }) async {
    Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category,
        },
        token: 'asdfghjkl8520');
    return ProdcutModel.fromJson(data);
  }
}
