
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView(
              shrinkWrap: false,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 25),
                  child: Text(
                    'Chats',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 31,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _buildChat('Andrew Pivovarov', 'Let\'s go for lunch!', context),
                _buildChat('Darya IOS', 'I have made my task!',context),
                _buildChat('Кирилл Кошечкин', 'С днем рождения!!!',context),
                _buildChat('David Maiko', 'Here are some new featu...',context),
                _buildChat('Valya Grusheva', 'DataBase was reloaded!',context),
                _buildChat('Artem Lebedev', 'New design is ready',context),
                _buildChat('Антонина Собачкина', 'Забери зарплату',context),
                _buildChat('Лариса Крысина', 'У тебя завтра митинг?',context),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChat(String name, String message, BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Row(children: [
            Icon(Icons.message_rounded, color: Colors.greenAccent, size: 36,),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(color: Colors.grey, fontSize: 18),),
                  Text(message, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 20),)
                ],),
            )

          ],
          ),
        ),
      ),
    );
  }
}
