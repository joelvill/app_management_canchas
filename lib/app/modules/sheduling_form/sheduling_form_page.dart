import 'package:canchas_management/app/core/utils/canchas_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'sheduling_form_controller.dart';

class SchedulingFormPage extends StatelessWidget {
  const SchedulingFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SchedulingFormController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Agendar'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          width: double.infinity,
          height: size.height,
          child: Form(
            key: _.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _dropdownCanchas(_),
                _formDatepicker(context, _),
                _userInput(_),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: () => _.onSubmit(),
                  child: const Text('Guardar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userInput(SchedulingFormController c) {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Quien agenda?',
        labelText: 'Usuario',
      ),
      controller: c.userInput,
      validator: (v) => c.validatorUser(v!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _dropdownCanchas(SchedulingFormController c) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cancha',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          DropdownButton(
            isExpanded: true,
            value: c.selectCancha,
            items: _dropdownItems,
            onChanged: (String? value) {
              c.onChangeCancha(value!);
            },
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> get _dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [];

    canchasList.forEach((c) {
      menuItems.add(
        DropdownMenuItem(
          value: c.id.toString(),
          child: Text(c.name),
        ),
      );
    });

    return menuItems;
  }

  Widget _formDatepicker(BuildContext context, SchedulingFormController c) {
    return TextFormField(
      controller: c.dateInput,
      decoration: const InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: "Fecha",
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

          c.onChanceDate(formattedDate);
        }
      },
    );
  }
}
