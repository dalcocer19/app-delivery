import 'package:flutter/material.dart';

import '../../../../utils/my_colors.dart';

class RestaurantOrdersListPage extends StatefulWidget {
  const RestaurantOrdersListPage({super.key});

  @override
  State<RestaurantOrdersListPage> createState() => _RestaurantOrdersListPageState();
}

class _RestaurantOrdersListPageState extends State<RestaurantOrdersListPage> {

  /*ClientProductsListController _con = new ClientProductsListController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Restaurant orders list'),
      ),
    );
  }

  Widget _menuDrawer() {
    return GestureDetector(
      //onTap: _con.openDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset(
          'assets/img/menu.png',
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: MyColors.primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'nombre usuario',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Text(
                    'email',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),

                    maxLines: 1,
                  ),
                  Text(
                    'Telefono',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),

                    maxLines: 1,
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 10),
                    child: FadeInImage(
                        image: AssetImage('assets/img/no-image.png'), placeholder: AssetImage('assets/img/no-image.png'),
                        fit: BoxFit.contain,
                        fadeInDuration: Duration(milliseconds: 50)
                    ),
                  )

                ],
              )
          ),
          const ListTile(
              title: Text('Editar perfil'),
              trailing: Icon(Icons.edit_outlined)
          ),
          const ListTile(
            title: Text('Mis pedidos'),
            trailing: Icon(Icons.shopping_cart_outlined),
          ),
          const ListTile(
            title: Text('Seleccionar rol'),
            trailing: Icon(Icons.person_outline),
          ),
          ListTile(
            //onTap: _con.logout,
            title: Text('Cerrar sesion'),
            trailing: Icon(Icons.power_settings_new),
          )
        ],
      ),
    );
  }
}
