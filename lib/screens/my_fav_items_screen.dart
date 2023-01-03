import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_items_provider.dart';

class MyFavItemsScreen extends StatefulWidget {
  const MyFavItemsScreen({super.key});

  @override
  State<MyFavItemsScreen> createState() => _MyFavItemsScreenState();
}

class _MyFavItemsScreenState extends State<MyFavItemsScreen> {
   @override
  Widget build(BuildContext context) {
    print('build');
    final provider =
        Provider.of<FavouriteItemsProvider>(context );
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite items'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => MyFavItemsScreen()));
            },
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: provider.selecteditems.length ,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteItemsProvider>(
                        builder: ((context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selecteditems.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        leading: Text('Item $index'),
                        trailing: Icon(value.selecteditems.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined),
                      );
                    }));
                  }))
        ],
      ),
    );
  }
}