import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/favourite_items_provider.dart';
import 'package:provider_practice/screens/my_fav_items_screen.dart';

class FavouriteItemsScreen extends StatefulWidget {
  const FavouriteItemsScreen({super.key});

  @override
  State<FavouriteItemsScreen> createState() => _FavouriteItemsScreenState();
}

class _FavouriteItemsScreenState extends State<FavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite items'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MyFavItemsScreen()));
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
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
