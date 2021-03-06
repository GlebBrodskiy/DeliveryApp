import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> foodMenu = [
    'assets/images/food_1.png',
    'assets/images/food_2.png',
    'assets/images/food_3.png',
  ];
  List<String> foodMenuTitle = [
    'Spacy crab soup',
    'Pomadoro Pasta',
    'Chicken rolls'
  ];
  List<String> foodMenuSubtitle = ['Crab', 'Pasta, tomatoes', 'Chicken'];
  List<double> foodMenuPrice = [28.11, 42.13, 13.99];
  List<int> foodMenuOrderCounter = [1, 1, 1];
  double totalSum = 84.23;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        onGenerateRoute: (routeSettings) {
              return MaterialPageRoute<void>(
                builder: (context) =>Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildHeader(), _buildOrder(), _buildTotalMoney()],
        ),
      ),
    );});
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 60),
      child: Text(
        'Order details',
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildOrder() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Container(
        height: 450,
        width: 400,
        child: ListView.builder(
            itemCount: foodMenu.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.white.withOpacity(0.150),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          _buildOrderImage(index),
                          _buildOrderDetails(index),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildMinusButton(index),
                                Padding(
                                  padding: const EdgeInsets.only(left: 17),
                                  child: Text(
                                    '${foodMenuOrderCounter[index]}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                _buildPlusButton(index)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildPlusButton(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Container(
        height: 28,
        width: 28,
        child: TextButton(
          onPressed: () {
            setState(() {
              // foodMenuTotalForOne[index] = 0;
              // foodMenuTotalForOne[index] += foodMenuPrice[index];

              foodMenuOrderCounter[index] = foodMenuOrderCounter[index] + 1;
              totalSum += foodMenuPrice[index];
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(83, 232, 139, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          child: Text(
            '+',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildMinusButton(int index) {
    return Container(
      height: 28,
      width: 28,
      child: TextButton(
        onPressed: () {
          setState(() {
            foodMenuOrderCounter[index] = foodMenuOrderCounter[index] - 1;

            totalSum -= foodMenuPrice[index];
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.green.withOpacity(0.150)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
        child: Text(
          '-',
          style: TextStyle(color: Color.fromRGBO(83, 232, 139, 1)),
        ),
      ),
    );
  }

  Widget _buildOrderImage(int index) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Image.asset(foodMenu[index]),
        ),
      ),
    );
  }

  Widget _buildOrderDetails(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${foodMenuTitle[index]}',
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '${foodMenuSubtitle[index]}',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$ ${foodMenuPrice[index]}',
                style: TextStyle(
                    fontSize: 19, color: Color.fromRGBO(83, 232, 139, 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalMoney() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromRGBO(83, 232, 139, 1)),
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 22, right: 22),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub-Total',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('${double.parse(totalSum.toStringAsFixed(2))}',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Charge',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('10', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('20', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                    Text(
                        '${double.parse((totalSum + 10 + 20).toStringAsFixed(2))}',
                        style: TextStyle(color: Colors.white, fontSize: 23)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Your order was placed',
                            style: TextStyle(
                                color: Color.fromRGBO(83, 232, 139, 1)),
                          ),
                        ));
                      },
                      child: Text(
                        'Place My Order',
                        style: TextStyle(
                            color: Color.fromRGBO(83, 232, 139, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
