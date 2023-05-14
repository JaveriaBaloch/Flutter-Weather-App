import 'dart:ui';

import 'package:flutter/material.dart';

import 'forecastCard.dart';
Widget bottomView(AsyncSnapshot<Map<String, dynamic>> snapshot){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(("7-days weather forecast").toUpperCase(), style: TextStyle(color: Colors.grey, fontSize: 14),),

      Container(
        height: 210,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index)=>const SizedBox(width: 10),
            itemCount: 5,
            itemBuilder: ((context,index)=>ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Container(
                width: 180,
                height: 210,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xfff08dca),Colors.deepPurple],
                  begin: Alignment.topLeft,end: Alignment.bottomRight)
                ),
                child: foreCastCard(snapshot,index),
              ),
            )
            )
            )
      )
    ],
  );
}