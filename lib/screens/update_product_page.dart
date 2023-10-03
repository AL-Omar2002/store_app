import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snack_bar.dart';

class UpadateProductPage extends StatefulWidget {
  UpadateProductPage({Key? key}) : super(key: key);
  static String id = 'UpdateProductPage';

  @override
  State<UpadateProductPage> createState() => _UpadateProductPageState();
}

class _UpadateProductPageState extends State<UpadateProductPage> {
  String? productName, desc, image;

  dynamic price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProdcutModel product =
        ModalRoute.of(context)!.settings.arguments as ProdcutModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Let\'s Update The Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 150),
                CustomTextField(
                  hintText: 'Enter The Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Enter The Description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Enter The Price',
                  onChanged: (data) {
                    price = data;
                  },
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Enter The Image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(height: 50),
                CustomButton(
                  textButton: 'Update it!',
                  onTap: () {
                    isLoading = true;
                    setState(() {});
                    try {
                      updateProduct(product);
                      showSnackBar(context, content: 'Success!');
                    } catch (e) {
                      isLoading = false;
                      setState(() {});
                      showSnackBar(context, content: '${e.toString()}.');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProdcutModel product) {
    UpdateProductService().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
      rating: product.rating,
    );
  }
}
