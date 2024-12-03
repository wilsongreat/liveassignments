import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liveassignments/config/app_colors.dart';
import 'package:liveassignments/data/app_assets.dart';
import 'package:liveassignments/provider/match_app_viewmodel.dart';

class HomeNavPage extends ConsumerStatefulWidget {
  const HomeNavPage({super.key});

  @override
  ConsumerState<HomeNavPage> createState() => _HomeNavPageState();
}

class _HomeNavPageState extends ConsumerState<HomeNavPage> {
    @override
    Widget build(BuildContext context) {
      final provider = ref.watch(matchAppViewmodelProvider.notifier);
      var selectedIndex = provider.selectedIndex;

      return Scaffold(
        body: SingleChildScrollView(
          child: provider.getDashBoardItems(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            setState(() {
              provider.onItemTapped(index);
            });
          },
          backgroundColor: AppColors.kWhite,
          selectedFontSize: 16,
          selectedIconTheme: const IconThemeData(color: AppColors.kBg, size: 24),
          selectedItemColor:  AppColors.kBg,
            unselectedItemColor:AppColors.kBlack ,
            unselectedLabelStyle:  const TextStyle(color: AppColors.kBlack),
            showUnselectedLabels:true,
          // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAsset.homeIcon, color: selectedIndex != 0 ?AppColors.kBlack : AppColors.kBg),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAsset.matchBallIcon,color: selectedIndex != 1 ?AppColors.kBlack : AppColors.kBg),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAsset.fantasyIcon,color: selectedIndex != 2 ?AppColors.kBlack : AppColors.kBg),
              label: 'Fantasy',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAsset.shopIcon,color: selectedIndex != 3 ?AppColors.kBlack : AppColors.kBg),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAsset.shopIcon, color: selectedIndex != 4 ?AppColors.kBlack : AppColors.kBg),
              label: 'My Profile',
            ),
          ],
        ),
      );
    }
  }

