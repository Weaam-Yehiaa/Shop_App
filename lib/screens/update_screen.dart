import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_app_tharwat/models/product_model.dart';
import 'package:shop_app_tharwat/services/update_product_service.dart';
import 'package:shop_app_tharwat/shared/custom_button.dart';
import 'package:shop_app_tharwat/shared/custom_text_field.dart';

class UpdateScreen extends StatefulWidget {

  static String id='UpdateScreen';

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? productName,desc,image;

  String? price;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall:isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                CustomTextFiled.CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data){
                    productName=data;
                  },
                ),
                SizedBox(
                  height: 12.0,
                ),
                CustomTextFiled.CustomTextField(
                  hintText: 'Product Description',
                  onChanged: (data){
                    desc=data;
                  },
                ),
                SizedBox(
                  height: 12.0,
                ),
                CustomTextFiled.CustomTextField(
                  hintText: 'Product Image',
                  onChanged: (data){
                    image=data;
                  },
                ),
                SizedBox(
                  height: 12.0,
                ),
                CustomTextFiled.CustomTextField(
                  hintText: 'Product Price',
                  inputType: TextInputType.number,

                  onChanged: (data){
                    price=data;
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),
                CustomButton(
                  name: 'Update',
                  onTap: () async {
                    isLoading=true;
                    setState(() {
                    });
                    try {
                      await updateProductFun(product);
                      print('sucess');
                    } on Exception catch (e) {
                     print(e.toString());
                    }
                    isLoading=false;
                    setState(() {
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductFun(ProductModel product) async {
    UpdateProductService().updateProduct(
        title:productName==null?product.title: productName!,
        price: price==null? product.price.toString():price!,
        desc: desc==null? product.description: desc!,
        image:image==null?product.image: image!,
        id: product.id,
        category:product.category,
    );
  }
}
