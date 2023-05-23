import 'package:flutter/material.dart';

class MultiLevelDropDownExample extends StatefulWidget {
  const MultiLevelDropDownExample({Key? key}) : super(key: key);

  @override
  State<MultiLevelDropDownExample> createState() =>
      _MultiLevelDropDownExampleState();
}

class _MultiLevelDropDownExampleState extends State<MultiLevelDropDownExample> {
  final List<String> audiMake = [
    'A3',
    'A4',
  ];
  final List<String> bmwMake = [
    '1 Series',
    '2 Series',
  ];

  late Map<String, List<String>> dataset = {
    'Audi': audiMake,
    'BMW': bmwMake,
  };
  String? selectedCardModel = "Audi";
  String? selectedMake;

  onCarModelChanged(String? value) {
    setState(() {
      selectedCardModel = value;
      selectedMake = dataset[selectedCardModel]!.first;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCardModel = "Audi";
    selectedMake = dataset[selectedCardModel]!.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton(
                hint: const Text("Demo"),
                value: selectedCardModel,
                items: dataset.keys.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList(),
                onChanged: onCarModelChanged),
            const SizedBox(
              height: 30,
            ),
            DropdownButton(
                value: selectedMake,
                items: (dataset[selectedCardModel] ?? []).map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedMake = newValue;
                  });
                })
          ],
        ),
      ),
    );
  }
}
