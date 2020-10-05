import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  MainMenuScreen({Key key}) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {

  int index = 0;

  //list product new
  List<ProductModel> getProductNewList(){
    List<ProductModel> productList = new List<ProductModel>();
    productList.add(new ProductModel("Blouse", "assets/item1.png", "OVS", 30, 0));
    productList.add(new ProductModel("T-Shirt Sailing", "assets/item2.png", "Manggo Boy", 10, 0));
    productList.add(new ProductModel("Jeans", "assets/item3.png", "Cool", 45, 0));
    productList.add(new ProductModel("Blouse", "assets/item4.png", "OVS", 30, 0));
    return productList;
  }

  //list product sale
  List<ProductModel> getProductSaleList(){
    List<ProductModel> productList = new List<ProductModel>();
    productList.add(new ProductModel("Evening Dress", "assets/item3.png", "Dorothy Perkins", 15, 20));
    productList.add(new ProductModel("Sport Dress", "assets/item4.png", "Sitlly", 22, 15));
    productList.add(new ProductModel("Blouse", "assets/item1.png", "OVS", 30, 0));
    productList.add(new ProductModel("T-Shirt Sailing", "assets/item2.png", "Manggo Boy", 10, 0));
    
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainView(),
            productNewView(),

            //main view two
            mainTwoView(),
            productSaleView(),
            productNewView(),

            //main view three
            mainThreeView()
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 45,
        child: BottomNavigationBar(
          selectedItemColor: cModeDarkColorButtom,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 20, color: (index ==0) ? cModeDarkColorButtom : Colors.grey,),
            title: Text("Home", style: TextStyle(fontSize: 8,color: (index ==0) ? cModeDarkColorButtom : Colors.grey,) ,)),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, size: 20, color: (index ==1) ? cModeDarkColorButtom : Colors.grey,),
            title: Text("Shop", style: TextStyle(fontSize: 8,color: (index ==1) ? cModeDarkColorButtom : Colors.grey,) ,)),
            BottomNavigationBarItem(icon: Icon(Icons.next_week, size: 20, color: (index ==2) ? cModeDarkColorButtom : Colors.grey,),
            title: Text("Bag", style: TextStyle(fontSize: 8, color: (index ==2) ? cModeDarkColorButtom : Colors.grey,) ,)),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border, size: 20, color: (index ==3) ? cModeDarkColorButtom : Colors.grey,),
            title: Text("Favorites", style: TextStyle(fontSize: 8, color: (index ==3) ? cModeDarkColorButtom : Colors.grey,) ,)),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 20, color: (index ==4) ? cModeDarkColorButtom : Colors.grey,),
            title: Text("Profile", style: TextStyle(fontSize: 8, color: (index ==4) ? cModeDarkColorButtom : Colors.grey,) ,))
          ],
          onTap: (int index){
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }

  Widget mainView(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Big Banner.png"),
          fit: BoxFit.fitWidth
        )
      ),
      height: 400,
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left:10, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fashion \nsale", style: TextStyle(fontSize: 45, color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width * .40,
              height: MediaQuery.of(context).size.width * .08,
              child: RaisedButton(
                child: Text("Check"),
                textColor: cModeDarkColorButtonText,
                color: cModeDarkColorButtom,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productNewView(){
    final productItems = getProductNewList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top:10),
          child: ListTile(
            title: Text("New", style: TextStyle(color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold, fontSize: 30 ),),
            subtitle: Text("You've never seen it before!", style: TextStyle(color: cModeDarkColorFontSubTitle, fontWeight: FontWeight.bold, fontSize: 10),),
            trailing: Text("View all", style: TextStyle(color: cModeDarkColorFontSubTitle, fontWeight: FontWeight.bold, fontSize: 10),),
          ),
        ),
        Container(
          height: 260,
          child: ListView.builder(
            itemCount: productItems.length,
            padding: EdgeInsets.only(top: 10, left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Container(
                            width: 148,
                            height: 172,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:AssetImage(productItems[index].image),
                                fit: BoxFit.fill 
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left:10),
                        child: Container(
                          width: 35,
                          height: 18,
                          alignment: Alignment.center,
                          child: Text("NEW", style: TextStyle(color: cModeDarkColorFontTitle, fontSize: 10),),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 160, left:123),
                        child: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF363740),
                            borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey, size: 15,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 165),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              height: 2,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  return Icon(Icons.star_border, color: Colors.grey, size: 15);
                                }
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text("(0)", style: TextStyle(color: Colors.grey, fontSize: 10),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(productItems[index].store, style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(productItems[index].name, style: TextStyle(color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(productItems[index].price.toString() + "\$", style: TextStyle(color: cModeDarkColorFontTitle, fontSize: 10)),
                  )
                  
                ],
              );
            }
            ),
        )
      ],
    );
  }

  Widget mainTwoView(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/street-clothes.png"),
          fit: BoxFit.fitWidth
        )
      ),
      height: 200,
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left:10, bottom: 40),
        child: Text("Street Clothes", style: TextStyle(fontSize: 30, color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold),),
      ),
    );
  }

  Widget productSaleView(){
    final productItems = getProductSaleList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top:10),
          child: ListTile(
            title: Text("Sale", style: TextStyle(color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold, fontSize: 30 ),),
            subtitle: Text("Super summer sale", style: TextStyle(color: cModeDarkColorFontSubTitle, fontWeight: FontWeight.bold, fontSize: 10),),
            trailing: Text("View all", style: TextStyle(color: cModeDarkColorFontSubTitle, fontWeight: FontWeight.bold, fontSize: 10),),
          ),
        ),
        Container(
          height: 260,
          child: ListView.builder(
            itemCount: productItems.length,
            padding: EdgeInsets.only(top: 10, left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Container(
                            width: 148,
                            height: 172,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:AssetImage(productItems[index].image),
                                fit: BoxFit.fill 
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left:10),
                        child: Container(
                          width: 35,
                          height: 18,
                          alignment: Alignment.center,
                          child: Text( "-" + productItems[index].discount.toString() + "%", style: TextStyle(color: cModeDarkColorFontTitle, fontSize: 10),),
                          decoration: BoxDecoration(
                            color: cModeDarkColorButtom,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 160, left:123),
                        child: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF363740),
                            borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey, size: 15,),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 165),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              height: 2,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  return Icon(Icons.star, color: Colors.orangeAccent, size: 15);
                                }
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text("(10)", style: TextStyle(color: Colors.grey, fontSize: 10),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(productItems[index].store, style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(productItems[index].name, style: TextStyle(color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: double.parse(productItems[index].price.toString().length.toString()) * 6.2,
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                                height: 10,
                              ),
                            ),
                            Text(productItems[index].price.toString() + "\$ ", 
                              style: TextStyle(color: Colors.grey, fontSize: 10)),
                          ],
                        ),
                        Text((productItems[index].price - (productItems[index].price * productItems[index].discount/100) ).toStringAsFixed(0) + "\$", 
                              style: TextStyle(color: cModeDarkColorButtom, fontSize: 10)),
                      ],
                    ) 
                  )
                  
                ],
              );
            }
            ),
        )
      ],
    );
  }

  Widget mainThreeView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/new-collection.png"),
              fit: BoxFit.fill
            )
          ),
          height: 300,
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left:20, bottom: 30),
            child: Text("New collection", style: TextStyle(fontSize: 38, color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold),),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: 192,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, top: 15, bottom: 30),
                    child: Text("Summer Sale", style: TextStyle(fontSize: 32, color: cModeDarkColorButtom, fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  height: 150,
                  width: 192,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/black.png"),
                      fit: BoxFit.fill
                    )
                  ),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 10, top: 15, bottom: 30),
                    child: Text("Black", style: TextStyle(fontSize: 32, color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),

            Container(
              height: 300,
              width: 192,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/man-hat.png"),
                  fit: BoxFit.fill
                )
              ),
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10, top: 30, bottom: 30),
                child: Text("Men's \nHats", style: TextStyle(fontSize: 32, color: cModeDarkColorFontTitle, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        )

      ],
    );
  }
}