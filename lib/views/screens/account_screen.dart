import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 4,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.sunny_snowing,
                color: Colors.pink,
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                15.height,
                CircleAvatar(
                  radius: 65,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Test Name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "test@gmail.com",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (){
          
                    },
                    child: Text("Edit Profile"),
                  ),
                ),
                Divider(thickness: 2,color: Colors.grey,),
          
             ListTile(
               leading: Icon(Icons.settings),
               title: Text('Settings'),
               onTap: () {
          
                  },
          ),
          
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                  subtitle: Text("+88016901645441"),
                  onTap: () {
          
                  },
                ),
          
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text('Cart'),
                  onTap: () {
          
                  },
                ),
          
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Orders'),
                  onTap: () {
          
                  },
                ),

                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout',style: TextStyle(color: Colors.red),),
                  onTap: () {

                  },
                ),
          
              ],
            ),
          ),
        ));
  }
}
