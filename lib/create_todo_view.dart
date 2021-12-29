import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTodaView extends StatelessWidget {
  CreateTodaView({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Create Todo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              maxLines: 1,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                hintText: 'Pleas Enter Your Title',
                labelText: 'Title',
              ),
              validator: (value) {
                if (value!.isEmpty){
                  return 'Title Field is required!';
                }
              },
            ),
      
            const SizedBox(height: 10,)
             TextFormField (
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                hintText: 'Pleas Enter Your description',
                labelText: 'description',
              ),
              validator: (value) {
                 if (value!.isEmpty){
                  return 'Description Field is required!';
                }
              },
            ),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(
                child: TextFormField (
                controller: _dateController,
                onTap: () {
                  showDatePicker(context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime.now(), 
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  ).then((selectedDate) {
                    print(selectedDate);
                    final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
                    _dateController.text = _dateFormat.format(selectedDate!);
                  });
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                  hintText: 'Pleas Enter Your date',
                  labelText: 'date',
                ),
                validator: (value) {
                   if (value!.isEmpty){
                  return 'date Field is required!';
                }
                },
                ),
              ),
               const SizedBox(width: 15,),
               Expanded(
                 child: TextFormField (
                           controller: _timeController,
                           onTap: () {
                             showTimePicker(context: context, initialTime: TimeOfDay.now()).
                             then((selectedTime){
                               _timeController.text = selectedTime!.format(context);
                             });
                           },
                     decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                  hintText: 'Pleas Enter Your time',
                  labelText: 'date',
                           ),
                           validator: (value) {
                              if (value!.isEmpty){
                  return 'Time Field is required!';
                }
                           },
                 ),
               ),
            ],
            )
            const SizedBox(
              height: 30,
              ),
            TextButton(
              style:TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(37, 43, 130,1),
                padding: const EdgeInsets.all(16)
              ),
              onPressed: (){
                if (_formKey.currentState!.validate()){
                  print('succes');
                  print(_titleController.text);
                  print(_descriptionController.text);
                  print(_dateController.text + " " + _timeController.text);
                }else{
                  print('failed');
                }
              },
             child: const Text (
               'Create',
               style: TextStyle(color: Colors.white),
             ) )
          ],
        ),
      ),
    );
  }
}
