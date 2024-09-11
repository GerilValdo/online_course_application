import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({
    super.key,
  });

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  String _gender = 'Pria';
  DateTime _selectDate = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _nameController,
          autocorrect: false,
          autofocus: true,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Nama',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          controller: _emailController,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          controller: _numberPhoneController,
          autocorrect: false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Nomor Telepon',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          controller: _passwordController,
          autocorrect: false,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 30),
        TextFormField(
          controller: _dateController,
          keyboardType: TextInputType.none,
          readOnly: true,
          decoration: InputDecoration(
              labelText: 'Tanggal Lahir', border: OutlineInputBorder()),
          onTap: () {
            showDatePicker(
                    helpText: 'Pilih Tanggal',
                    confirmText: 'Done',
                    fieldHintText: 'Masukkan Tanggal Lahir Anda',
                    fieldLabelText: 'Masukkan Tanggal',
                    initialDatePickerMode: DatePickerMode.year,
                    context: context,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2030))
                .then(
              (value) {
                print(value);
                if (value != null) {
                  setState(() {
                    _selectDate = value;
                    _dateController.text =
                        DateFormat.yMMMMd().format(_selectDate).toString();
                  });
                }
              },
            );
          },
        ),
        SizedBox(height: 5),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            Text(
              'Jenis Kelamin :',
              style: TextStyle(fontSize: 18),
            ),
            RadioMenuButton(
                value: 'Pria',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                child: Text('Pria')),
            RadioMenuButton(
                value: 'Wanita',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                child: Text('Wanita')),
          ],
        ),
      ],
    );
  }
}
