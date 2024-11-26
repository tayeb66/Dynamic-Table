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

  late final ScrollController scrollController1;
  late final ScrollController scrollController2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController1 = ScrollController();
    scrollController2 = ScrollController();

    scrollController1.addListener((){
      if(scrollController1.offset != scrollController2.offset){
        print("Didn't match offset");
        scrollController2.jumpTo(scrollController1.offset);
      }else{
        print("Match offset");
      }
    });

    scrollController2.addListener((){
      if(scrollController2.offset != scrollController1.offset){
        scrollController1.jumpTo(scrollController2.offset);
      }
    });

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
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: const TableBorder(right: BorderSide(color: Colors.white,width: 2.0)),
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),),
                        ),
                        children: [
                          SizedBox(height:40.0,child: Center(child: Text(tableHeaderList.first.toString(),textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                        ]
                      ),

                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      controller: scrollController1,
                      child: Table(
                        defaultColumnWidth: const FixedColumnWidth(200),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        border: const TableBorder(right: BorderSide(color: Colors.white,width: 2.0)),
                        children: [
                          ...List.generate(200, (index) {
                            return TableRow(
                                decoration: BoxDecoration(
                                  color: index % 2 == 0 ? Colors.blueAccent.withOpacity(0.4) : Colors.blueAccent.withOpacity(0.6),
                                  border: const Border(bottom: BorderSide(width: 2.0,color: Colors.white))
                                ),
                                children: const [
                                  SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                ]
                            );
                          },)
                        ],
                      ),
                    ),
                  ),
                  Table(
                    defaultColumnWidth: const FixedColumnWidth(200),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: const TableBorder(right: BorderSide(color: Colors.white,width: 2.0)),
                    children: [
                      TableRow(
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0))
                          ),
                          children: [
                            SizedBox(height: 40.0,child: Center(child: Text(tableHeaderList.first.toString(),textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
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
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      border: const TableBorder(right: BorderSide(color: Colors.white,width: 2.0)),
                      children: [
                        TableRow(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0)),
                            color: Colors.blueAccent,
                          ),
                            children: List.generate(tableHeaderList.length, (index) {
                              return SizedBox(height: 40.0,child: Center(child: Text(tableHeaderList[index].toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)));
                            },)
                        ),
                      ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          controller: scrollController2,
                          child: Table(
                            defaultColumnWidth: const FixedColumnWidth(200),
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            children:  [
                              ...List.generate(200, (index) {
                                return TableRow(
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0 ? Colors.blueAccent.withOpacity(0.4) : Colors.blueAccent.withOpacity(0.6),
                                      border: const Border(bottom: BorderSide(width: 2.0,color: Colors.white))
                                  ),
                                  children: const [
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                    SizedBox(height: 40.0,child: Center(child: Text("data",textAlign: TextAlign.center,))),
                                  ]
                                );
                              },)
                            ],
                          ),
                        ),
                      ),
                      Table(
                        defaultColumnWidth: const FixedColumnWidth(200),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
                                color: Colors.blueAccent,
                              ),
                              children: List.generate(tableHeaderList.length, (index) {
                                return SizedBox(height: 40.0,child: Center(child: Text(tableHeaderList[index].toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)));
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

