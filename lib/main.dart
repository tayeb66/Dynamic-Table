import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LinkedScrollControllerGroup controllerGroup = LinkedScrollControllerGroup();
  ScrollController scrollController = ScrollController();

  ScrollController? c1;
  ScrollController? c2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    c1 = controllerGroup.addAndGet();
    c2 = controllerGroup.addAndGet();

  }

  List tableHeaderList = [
    "Equipment",
    "Created",
    "Created At",
    "Description",
    "Assigned",
    "Status",
    "Corrected",
    "Corrected At",
    "Action",
    "Work Order",
    "ACTT Comp",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Table",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Table(
                    defaultColumnWidth: const FixedColumnWidth(200),
                    border: TableBorder.all(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0),topLeft: Radius.circular(10.0))),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                        ),
                        children: [
                          Text(tableHeaderList.first.toString(),textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ]
                      ),

                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      controller: c1,
                      child: Table(
                        defaultColumnWidth: const FixedColumnWidth(200),
                        border: TableBorder.all(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0),topLeft: Radius.circular(10.0))),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          ...List.generate(200, (index) {
                            return const TableRow(
                                children: [
                                  Text("data",textAlign: TextAlign.center,),
                                ]
                            );
                          },)
                        ],
                      ),
                    ),
                  ),
                  Table(
                    defaultColumnWidth: const FixedColumnWidth(200),
                    border: TableBorder.all(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0),topLeft: Radius.circular(10.0))),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                          children: [
                            Text(tableHeaderList.first.toString(),textAlign: TextAlign.center,),
                          ]
                      ),

                    ],
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Table(
                      defaultColumnWidth: const FixedColumnWidth(200),
                        border: TableBorder.all(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10.0),topRight: Radius.circular(10.0))),
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                            children: List.generate(tableHeaderList.length, (index) {
                              return Text(tableHeaderList[index].toString());
                            },)
                        ),
                      ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: c2,
                          scrollDirection: Axis.vertical,
                          child: Table(
                            defaultColumnWidth: const FixedColumnWidth(200),
                            border: TableBorder.all(borderRadius: BorderRadius.circular(10.0)),
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            children:  [
                              ...List.generate(200, (index) {
                                return const TableRow(
                                  children: [
                                    Text("datadatadatadatadatadatadatadatadatadatadatadatadatadata"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                    Text("data"),
                                  ]
                                );
                              },)
                            ],
                          ),
                        ),
                      ),
                      Table(
                        defaultColumnWidth: const FixedColumnWidth(200),
                        border: TableBorder.all(borderRadius: BorderRadius.circular(10.0)),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                              children: List.generate(tableHeaderList.length, (index) {
                                return Text(tableHeaderList[index].toString());
                              },)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

