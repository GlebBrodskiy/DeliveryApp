import 'package:delivery/screens/cart_screen.dart';
import 'package:delivery/screens/cat_fact_screen.dart';
import 'package:delivery/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class Navigating extends StatefulWidget {
  const Navigating({Key? key}) : super(key: key);

  @override
  _NavigatingState createState() => _NavigatingState();
}

class _NavigatingState extends State<Navigating> {
  int selectedIndex = 0;
  Widget _myMain = Main();
  Widget _myProfile = Profile();
  Widget _myCart = Cart();
  Widget _myChat = Chat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white.withOpacity(0.150),
        showUnselectedLabels: false,
        selectedItemColor: Color.fromRGBO(83, 232, 139, 1),
        unselectedItemColor: Color.fromRGBO(8, 145, 88, 1.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        selectedIconTheme: IconThemeData(
          size: 35,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded), label: 'Chat'),
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
      body: this.navigateNextPage(),
    );
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }

  Widget navigateNextPage() {
    if (this.selectedIndex == 0) {
      return this._myMain;
    } else if (this.selectedIndex == 1) {
      return this._myProfile;
    } else if (this.selectedIndex == 2) {
      return this._myCart;
    } else if (this.selectedIndex == 3) {
      return this._myChat;
    } else {
      return this._myMain;
    }
  }
}

List<String> nearestRestaurants = [
  'Vegan Resto',
  'Health Food',
  'Good Food',
  'Smart Resto'
];
List<int> howLongToGo = [12, 20, 8, 4];
List<String> restoImages = [
  'lib/screens/assets/1.png',
  'lib/screens/assets/RestaurantImage2.png',
  'lib/screens/assets/RestaurantImage3.png',
  'lib/screens/assets/4.png'
];
List<String> foodMenu = [
  'lib/screens/assets/food1.png',
  'lib/screens/assets/food2.png',
  'lib/screens/assets/food3.png',
];
List<String> foodMenuTitle = [
  'Spacy crab soup',
  'Pomadoro Pasta',
  'Chicken rolls'
];
List<String> foodMenuSubtitle = ['Crab', 'Pasta, tomatoes', 'Chicken'];
List<double> foodMenuPrice = [28.11, 42.16, 13.99];

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    print(foodMenu.length);
    return ListView(scrollDirection: Axis.vertical, children: [
      Container(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildAdvertising(),
                _buildRestaurantsHeader(),
                _buildRestaurantList(),
                _buildPopularMenuHeader(),
                _buildPopularMenu(0),
                _buildPopularMenu(1),
                _buildPopularMenu(2),
              ],
            )
          ],
        ),
      ),
    ]);
  }

  Widget _buildPopularMenu(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.white.withOpacity(0.150),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.asset(foodMenu[index]),
                  ),
                ),
                Padding(
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
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '\$ ${foodMenuPrice[index]}',
                      style: TextStyle(color: Color.fromRGBO(83, 232, 139, 1)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '''Find Your 
Favorite Food''',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.150),
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                  iconSize: 45,
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.green,
                  ),
                  color: Colors.white70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.750,
            height: MediaQuery.of(context).size.height * 0.065,
            padding: EdgeInsets.only(left: 25),
            child: TextField(
              style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.150),
                  labelText: 'What do you want to order?',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.160,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(0.150)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.toggle_off_outlined,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(minWidth: 0),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.toggle_on_outlined,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(minWidth: 0))
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildAdvertising() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: 400,
        height: 150,
        child: Stack(
          children: [
            Image.asset(
              'lib/screens/assets/Image.jpg',
              fit: BoxFit.cover,
              width: 400,
              height: 150,
            ),
            Positioned(
              child: Text(
                'Special Deal For\n October',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              top: 20,
              left: 200,
            ),
            Positioned(
              child: ElevatedButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: Text(
                  'Buy Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              top: 70,
              width: 100,
              left: 200,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nearest Restaurant',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'View More',
              style: TextStyle(color: Colors.orange[700]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRestaurantList() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 200.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: nearestRestaurants.length,
          itemBuilder: (context, int index) {
            return SizedBox(
              width: 200,
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    color: Colors.white.withOpacity(0.150),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 100,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              child: Image.asset(restoImages[index])),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4, top: 17),
                            child: Text(
                              nearestRestaurants[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 26,
                            ),
                            child: Text(
                              '${howLongToGo[index]} mins',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPopularMenuHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular Menu',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'View More',
              style: TextStyle(color: Colors.orange[700]),
            ),
          )
        ],
      ),
    );
  }
}

class Constant extends InheritedWidget {
  final Color neededColor;

  const Constant({required this.neededColor, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(Constant old) => neededColor != old.neededColor;

  static Constant? of(BuildContext context) {
    final Constant? result =
        context.dependOnInheritedWidgetOfExactType<Constant>();
    assert(result != null, 'No Constant found in context');
    return result!;
  }
}
