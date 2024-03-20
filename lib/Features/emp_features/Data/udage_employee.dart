

import '../../../core/utils/helper/api_helper.dart';
import '../models/product_model.dart';

class UpdateEmployee {
  Future<EmployeeModel> updateEmployee(
      {required String title,
       // required String price,
        required String description,
        required String category,
        required String image}) async {
    Map<String, dynamic> data =
    await ApiHelper().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      //'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return EmployeeModel.fromJson(data);
  }


}