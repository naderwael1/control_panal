import 'package:flutter/material.dart';
import 'drawerArt.dart';
import 'drawerItemModel.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  final List<DrawerItemModel> mangerDrawerItems = const [
    DrawerItemModel(
      title: 'D A S H  B O A R D',
      icon: Icons.home,
    ),
    DrawerItemModel(
      title: 'E M P L W E E S T A T E',
      icon: Icons.man,
    ),
    DrawerItemModel(
      title: 'S E T T I N G S',
      icon: Icons.settings,
    ),
    DrawerItemModel(
      title: 'L O G   O U T',
      icon: Icons.logout,
    ),
  ];
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffdbdbdb),
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset('media/avatar.jpg'),
          ),
          mangerDrawerView(mangerDrawerItems: mangerDrawerItems)
        ],

      ),
    );
  }
}
/////////////////////////////////////////////////////
class mangerDrawerView extends StatelessWidget {
  const mangerDrawerView({
    super.key,
    required this.mangerDrawerItems,
  });

  final List<DrawerItemModel> mangerDrawerItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: mangerDrawerItems.length,
        itemBuilder: (context, index)
    {
        return CustomDrwerItem(drawerItemModel: mangerDrawerItems[index]);
    });
  }
}
