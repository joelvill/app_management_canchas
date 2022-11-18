import 'package:canchas_management/app/data/models/scheduling.dart';
import 'package:canchas_management/app/modules/home/home_controller.dart';
import 'package:canchas_management/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Agendamientos'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.SCHEDULINGFORM);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            itemCount: _.schedulingList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              return SchedulingItem(
                scheduling: _.schedulingList[index],
                controller: _,
              );
            },
          ),
        ),
      ),
    );
  }
}

class SchedulingItem extends StatelessWidget {
  const SchedulingItem({
    Key? key,
    required this.scheduling,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;
  final SchedulingModel scheduling;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListTile(
      title: Text(
        controller.canchaName(scheduling.canchaId),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.01,
          ),
          _iconWithText(Icons.person, 'Usuario:', scheduling.user),
          _iconWithText(
            Icons.calendar_today,
            'Fecha:',
            DateFormat('dd-MM-yyyy').format(scheduling.date),
          ),
          const SizedBox(
            height: 5.0,
          ),
          _iconWithText(Icons.cloud, 'Probabilidad de lluvia:', '70%'),
        ],
      ),
      trailing: IconButton(
        onPressed: (() {
          print('Delete');
          showAlertDialog(context, scheduling.id, controller);
        }),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _iconWithText(IconData icon, String textOne, String textSecond) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 15,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          textOne,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          textSecond,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }

  showAlertDialog(BuildContext context, String id, HomeController controller) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        controller.removeSheduling(id);
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Borrar Agendamiento"),
      content: const Text("Seguro/a que desea borrar este agendamiento?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
