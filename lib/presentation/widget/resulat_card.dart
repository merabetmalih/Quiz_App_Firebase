import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3/configs/AppColors.dart';


import 'base_card.dart';

class ResultCard extends StatelessWidget{
  final bool isCorrect;
  final String titleLabel;

  const ResultCard({
    required this.titleLabel,
    required this.isCorrect
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      titleLabel: titleLabel,
      borderColor: isCorrect ? AppColors.green : AppColors.tomato,
      iconColor: isCorrect ? AppColors.green : AppColors.tomato,
      icon: isCorrect ? Icons.check : Icons.clear,
      onTap: () {  },
    );
  }


}