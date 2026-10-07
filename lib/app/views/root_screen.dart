import 'package:flutter/material.dart';
import 'package:ride_now/app/views/home/rides.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const RidesScreen(),
    Center(child: Text("Activity")),
    Center(child: Text("Wallet")),
    Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectedIndex == 0 ? Colors.transparent : Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning,",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Alex Rider",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          /// Notification
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(child: Icon(Icons.notifications_none, size: 22)),
                  Positioned(
                    top: 3,
                    right: 0,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Profile
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=12",
                ),
              ),
            ),
          ),
        ],
      ),

      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.orange,
              selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
              unselectedItemColor: Colors.grey,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.explore, color: Colors.orange),
                  ),
                  label: "Home",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_outlined),
                  activeIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.receipt_long),
                  ),
                  label: "Activity",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_outlined),
                  activeIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.wallet),
                  ),
                  label: "Wallet",
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.person),
                  ),
                  label: "Account",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
