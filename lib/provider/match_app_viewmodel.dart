import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liveassignments/config/app_colors.dart';
import 'package:liveassignments/presentation/pages/matches/match_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'match_app_viewmodel.g.dart';

@riverpod

class MatchAppViewmodel extends _$MatchAppViewmodel {
  @override
  FutureOr<dynamic> build() {
    return null;
  }


  int selectedIndex = 0;
  void onItemTapped(int index) {
    // setState(() {
      selectedIndex = index;
    // });
  }

  Widget getDashBoardItems() {
    switch (selectedIndex) {
      case 0:
        return  Container(
          height: 200,
          width: 200,
          color: AppColors.kRed,
        );
      case 1:
        return MatchPage();
      case 2:
        return Container(
          height: 200,
          width: 200,
          color: AppColors.kYellow,
        );
      default:
        return Container(
          height: 200,
          width: 200,
          color: AppColors.kBg,
        );
    }
  }


}