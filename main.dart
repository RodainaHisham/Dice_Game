import 'dart:math';
import 'dice.dart';

import 'package:flutter/material.dart';
void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice Game",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:Color(0xFFC5B6A5),
          brightness: Brightness.light,

        ),
      ),
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget{
  @override
  State<DiceScreen> createState() => DiceScreenState();
}


class DiceScreenState extends State<DiceScreen> {
  static const String happyImage = 'assets/dice_happy.png';
  static const String sadImage = 'assets/dice_sad.png';
  int value_1 = 1;
  int value_2 = 1;
  int total = 2;
  String imagePath = sadImage;
  String resultText = 'You Lose';


  void roll(){
    setState(() {
      value_1 = Random().nextInt(6)+1 ;
      value_2 = Random().nextInt(6)+1 ;
      total = value_1 + value_2 ;
    });

    if(total>=10){
      imagePath = happyImage;
      resultText = 'You Win';
    }
    else{
      imagePath = sadImage;
      resultText = 'You Lose';
    }

  }


  void reset(){

    setState((){
          value_1 = 1 ;
          value_2 =1 ;
          total =2 ;
          imagePath = sadImage;
          resultText = 'You Lose';

            }
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.casino, color:Colors.white),
          title: Text('Dice Game',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 2,
            color: Colors.white,
            fontFamily: 'Roboto',
          )),
          backgroundColor: const Color(0xFFF2C3B9),
          centerTitle: true,
      ),
      body: Center(

        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16)),
            const SizedBox(height: 16),
            Text("total is $total", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
              color: Colors.red[200]!,
              fontFamily: 'Roboto',
            ),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Image.asset(imagePath),
              ),
            ),
            Text(
              resultText,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.red[200]!,
                fontFamily: 'Roboto',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Dice(value: value_1),
                Dice(value: value_2),
              ],
            ),
            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: ElevatedButton( style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2C3B9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),onPressed: roll, child: Text("roll"))) ,
                  SizedBox(width:20),
                  Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2C3B9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),onPressed: reset , child: Text("reset")))
                ]),


          ],
        ),
      ),

    );
    throw UnimplementedError();
  }





}