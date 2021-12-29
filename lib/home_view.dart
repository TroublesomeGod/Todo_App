import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:to_do_app/create_todo_view.dart';
import 'package:to_do_app/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = 'Todo';

  final List<Map<String, dynamic>> _completedData = [];

  final List<Map<String, dynamic>> _unCompletedData = [];

  final List<Map<String, dynamic>> data = [
    {
      'title': 'There are many variations of passages.',
      'description':
          'but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. ',
      'date_time': 'Today',
      'status': true,
    },
    {
      'title': 'testing',
      'description':
          'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.',
      'date_time': 'Yesterday',
      'status': false,
    },
    {
      'title': 'Contrary to popular belief.',
      'description':
          'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,',
      'date_time': 'Tomorrow',
      'status': true,
    },
    {
      'title': 'Lorem Ipsum is simply dummy text.',
      'description':
          'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      'date_time': 'Mon. 15 Dec',
      'status': false,
    }
  ];

  @override
  Void initState() {
    for (Map<String, dynamic> element in data) {
      if (!element['status']) {
        _unCompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Yhao Task',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        leading: const Center(
            child: FlutterLogo(
          size: 40,
        )),
        actions: [
          PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text('Todo'), value: 'Todo'),
                  const PopupMenuItem(
                      child: Text('Completed'), value: 'Completed')
                ];
              }),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CreateTodaView();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 34, 103, 1),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return TaskCardWidget( dateTime: selectedItem =='todo'
             ? _unCompletedData [index] ['date_time']
            : _completedData [index]['date_time'],

             title: selectedItem =='todo'
             ? _unCompletedData [index] ['title']
            : _completedData [index]['title'],

         description: selectedItem =='todo'
             ? _unCompletedData [index] ['description']
            : _completedData [index]['description'],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: selectedItem == 'Todo'
              ? _unCompletedData.length
              : _completedData.length),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: (){
              showBarModalBottomSheet (context: context, buider: (context){
                return ListView.separated (itemBuilder:(context,index) {
                   return TaskCardWidget( 
                     dateTime: _completedData[index]['date_time'],
                     description: _completedData[index]['description'],
                     title: _completedData[index]['title'],
                   );
                },
                  separatorBuilder: (context,index){}. itemCount:_completedData.length)
              });
            },
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(
                37,
                43,
                103,
                1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Completed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${_completedData.length}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


 class TaskCardWidget extends StatelessWidget {
   const TaskCardWidget({ Key? key, required this.title, required this.description, required this.dateTime}) :  super(key: key);

final String title;
final String description;
final String dateTime;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              size: 28,
              color: customColor(date: dateTime),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title ,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(37, 34, 103, 1))),
                  Text( description ,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 17, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: customColor(
                      date:dateTime),
                ),
                Text(dateTime,
                  style: TextStyle(
                    color: customColor(
                        date:dateTime),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
