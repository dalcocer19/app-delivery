import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:introduccion_hello_world/src/models/rol.dart';
import 'package:introduccion_hello_world/src/pages/roles/roles_controller.dart';

class RolesPages extends StatefulWidget {
  const RolesPages({super.key});

  @override
  State<RolesPages> createState() => _RolesPagesState();
}

class _RolesPagesState extends State<RolesPages> {

  final RolesController _con = RolesController();
  
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, () {
        setState(() {});
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona un rol'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.14),
        child: ListView(
          children: _con.user != null ? _con.user!.roles!.map((Rol rol) {
            return _cardRol(rol);
          }).toList() : []
        ),
      )
    );
  }

  Widget _cardRol(Rol rol) {
    return GestureDetector(
      onTap: () {
        _con.goToPage('${rol.route}');
      },
      child: Column(
        children: [
          Container(
            height: 100,
            child: FadeInImage(
              placeholder: const AssetImage('assets/img/no-image.png'),
              image: rol.image != null ? NetworkImage('${rol.image}') : const AssetImage('assets/img/no-image.png'),
              fit: BoxFit.contain,
              fadeInDuration: const Duration(milliseconds: 50),
      
            ),
          ),
          const SizedBox(height: 15),
          Text(
            rol.name ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black
            ),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
