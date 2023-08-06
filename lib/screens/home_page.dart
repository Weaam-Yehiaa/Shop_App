import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_tharwat/helper/api.dart';
import 'package:shop_app_tharwat/models/product_model.dart';
import 'package:shop_app_tharwat/screens/update_screen.dart';
import 'package:shop_app_tharwat/services/get_all_categories_service.dart';
import 'package:shop_app_tharwat/services/get_all_products_service.dart';
import 'package:shop_app_tharwat/shared/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
            'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
            ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon( FontAwesomeIcons.cartPlus,
                color: Colors.black,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
        child: FutureBuilder<List<ProductModel>>(
          future:AllProductsService().getAllProducts() ,
          builder: (context,snapshot){

            if(snapshot.hasData)
              {
                List<ProductModel>products=snapshot.data!;
                print(products.length);
                return GestureDetector(

                  child: GridView.builder(
                      clipBehavior: Clip.none,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        //control numbers of columns
                        crossAxisCount: 2,
                        //byt7km f nsbt width:height
                        childAspectRatio:1.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100,
                      ) ,
                      itemBuilder:(context,index){
                        return CustomCard(products[index],context);
                      }
                  ),
                );
              }
            else  return Center(
                child: CircularProgressIndicator()
            );
          },
        )
      ),

    );
  }
}
