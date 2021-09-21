import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:delivery/widgets/constant_inherited_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> foodMenu = [
    'assets/images/food_1.png',
    'assets/images/food_2.png',
    'assets/images/food_3.png',
  ];
  final List<String> foodMenuTitle = [
    'Spacy crab soup',
    'Pomadoro Pasta',
    'Chicken rolls'
  ];
  final List<String> foodMenuSubtitle = ['Crab', 'Pasta, tomatoes', 'Chicken'];
  final List<double> foodMenuPrice = [28.11, 42.13, 13.99];

  String? profileName;
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  // void _rename(value) {
  //   setState(() {
  //     profileName = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.150),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              _buildProfileImage(),
              SlidingSheet(
                color: Colors.black,
                backdropColor: Colors.transparent,
                elevation: 8,
                cornerRadius: 40,
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.6, 0.9],
                  // positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                builder: (context, state) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMemberGold(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildProfileName(),
                              _buildProfileEditing()
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 30),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white.withOpacity(0.150)),
                                child: _buildVoucher()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 34),
                            child: Text(
                              'Favorite',
                              style: TextStyle(
                                  color: Provider.of<Color>(context),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: _buildFavoriteFood(),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Image.asset(
        'assets/images/profile.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildMemberGold() {
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 21),
      child: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.orange.withOpacity(0.2),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "Member gold",
                style: TextStyle(color: Colors.yellow[700]),
              ))),
    );
  }

  Widget _buildProfileName() {
    return Padding(
      padding: const EdgeInsets.only(left: 21, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constant(
            neededColor: Colors.white,
            child: Builder(builder: (context) {
              return Text(
                profileName ?? 'Anam Wusono',
                style: TextStyle(
                    color: Constant.of(context)?.neededColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'anamwp66@gmail.com',
              style: TextStyle(color: Colors.grey[700]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileEditing() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () async {
                profileName = await showDialog<String>(
                    // barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      final TextEditingController nameEditTextController =
                          TextEditingController(text: profileName);

                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text('Profile name'),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                controller: nameEditTextController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.greenAccent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.greenAccent, width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    hintText: 'Enter your name',
                                    hintStyle: TextStyle(color: Colors.white),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.150)),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      print(nameEditTextController.text);
                                      Navigator.of(context)
                                          .pop(nameEditTextController.text);
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.touch_app_rounded,
                                  color: Colors.greenAccent,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                // .then((value){setState(() {
                //   _rename(value);
                // });});
              },
              child: Container(
                width: 48,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Image.asset('assets/images/pencil.png'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVoucher() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('lib/screens/assets/voucher.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ValueListenableBuilder(
            builder: (BuildContext context, int value, Widget? child) {
              return Text(
                'You Have ${_counter.value} Voucher',
                style: TextStyle(color: Colors.white, fontSize: 18),
              );
            },
            valueListenable: _counter,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: TextButton(
            onPressed: () {
              _counter.value++;
            },
            child: Text(
              'Press me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFavoriteFood() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: foodMenu.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 115,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(foodMenu[index]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodMenuTitle[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 8),
                        child: Text(
                          foodMenuSubtitle[index],
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: Colors.greenAccent,
                          ),
                          Text(
                            '${foodMenuPrice[index]}',
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.greenAccent.shade400),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))))),
                          onPressed: () {},
                          child: Text(
                            'Buy Again',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
