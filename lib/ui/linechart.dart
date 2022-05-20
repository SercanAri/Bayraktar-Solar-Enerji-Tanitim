import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinePage extends StatelessWidget {
  List<SalesData> data = [
    SalesData('Oca', 35),
    SalesData('Şub', 10),
    SalesData('Mar', 34),
    SalesData('Nis', 32),
    SalesData('May', 40),
    SalesData('Haz', 60),
    SalesData('Tem', 50),
    SalesData('Agu', 55),
    SalesData('Eyl', 40),
    SalesData('Eki', 35),
    SalesData('Kas', 30),
    SalesData('Ara', 40),
  ];

  LinePage({Key? k}) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: '2021 Aylık Satış Verileri'),
          legend: Legend(
            isVisible: true,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
              dataSource: data,
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.sales,
              name: 'Satışlar',
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
