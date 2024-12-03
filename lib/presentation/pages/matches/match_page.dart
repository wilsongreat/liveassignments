import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liveassignments/config/app_colors.dart';
import 'package:liveassignments/data/app_assets.dart';
import 'package:liveassignments/presentation/components/custom_input.dart';
import 'package:liveassignments/presentation/components/custom_text.dart';
import 'package:liveassignments/presentation/components/gap.dart';
import 'package:liveassignments/utils/screen_utils.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> with SingleTickerProviderStateMixin {
  int currentTabIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: fullHeight(context) / 3,
          width: fullWidth(context),
          padding: const EdgeInsets.only(left: 15,right:15,top: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAsset.pitchImg),
              fit: BoxFit.cover
            )
          ),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(flex:2,child: Icon(Icons.menu,size: 40,color: AppColors.kWhite,)),
                    Expanded(flex: 3,child: Center(child: Image.asset(AppAsset.scorer_icon,height: 40,width: 60,))),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        hint: 'Search...' ,
                        fillColor: Colors.transparent,
                        prefixIcon: AppAsset.search_icon,
                        prefixIconPad: 13,
                        hintColor: AppColors.kBlack,
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                        prefixIconSize: const Size(8, 8),
                      ),
                    )
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    matchTypeTab(icon: AppAsset.globe_icon,label: 'All',tabIndex: 0),
                    matchTypeTab(icon: AppAsset.epl_icon,label: 'EPL',tabIndex: 1),
                    matchTypeTab(icon: AppAsset.laliga_icon,label: 'La Liga',tabIndex: 2),
                    matchTypeTab(icon: AppAsset.seriesAIcon,label: 'Series A',tabIndex: 3),
                    matchTypeTab(icon: AppAsset.bundesliga_icon,label: 'Bundesliga',tabIndex: 4),
                    matchTypeTab(icon: AppAsset.ligue1_icon,label: 'Ligue 1',tabIndex: 5),
                  ],
                ),
                const Gap(20),
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.home), text: 'Home'),
                    Tab(icon: Icon(Icons.search), text: 'Search'),
                    Tab(icon: Icon(Icons.person), text: 'Profile'),
                  ],
                ),
                TabBarView(
                  controller: _tabController,
                  children: [Container(),Container(),Container()],
                ),
              ],
            ),

        )
      ],
    );
  }

  Widget matchTypeTab({required String icon, required String label,required int tabIndex}){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              currentTabIndex = tabIndex;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color:currentTabIndex == tabIndex ? AppColors.kBg : AppColors.kBlack
            ),
            child: SvgPicture.asset(icon,color: AppColors.kWhite,height: 50,width: 50,),
          ),
        ),
        const Gap(10),
        TextView(text: label, fontSize: 14,color:currentTabIndex == tabIndex ?  AppColors.kWhite:AppColors.kGrey,)
      ],
    );
  }

}

