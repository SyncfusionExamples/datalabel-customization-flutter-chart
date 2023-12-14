import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.brown
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Container(
            width: 320,
            height: 500,
            child: SfCartesianChart(
                backgroundColor: Colors.white,
                plotAreaBackgroundColor: Colors.white,
                onDataLabelRender: (DataLabelRenderArgs args) {
                  TextStyle? textStyle;
                  // args.text = '${args.text}\nSold';
                  if (args.pointIndex == 0) {
                    // args.color = colorList[args.pointIndex];
                    textStyle =
                        args.textStyle.copyWith(color: Colors.orange[700]);
                  }
                  if (args.pointIndex == 1) {
                    // args.color = colorList[args.pointIndex];
                    textStyle =
                        args.textStyle.copyWith(fontFamily: 'DancingScript');
                  }
                  if (args.pointIndex == 2) {
                    // args.color = colorList[args.pointIndex];
                    textStyle = args.textStyle.copyWith(fontSize: 20);
                  }
                  if (args.pointIndex == 3) {
                    // args.color = colorList[args.pointIndex];
                    textStyle =
                        args.textStyle.copyWith(fontStyle: FontStyle.italic);
                  }
                  if (args.pointIndex == 4) {
                    // args.color = colorList[args.pointIndex];
                    textStyle =
                        args.textStyle.copyWith(fontWeight: FontWeight.bold);
                  }
                  args.textStyle = textStyle ?? args.textStyle;
                },
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      dataSource: <SalesData>[
                        SalesData('Jan', 10),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 12),
                        SalesData('May', 40)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      //Enable datalabel settings
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ))
                ]),
          ),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
