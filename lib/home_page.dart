import "package:flutter/material.dart";

class CalculateTip extends StatefulWidget {
  const CalculateTip({super.key});

  @override
  State<CalculateTip> createState() => _CalculateTipState();
}

class _CalculateTipState extends State<CalculateTip> {
  TextEditingController _billAmountController = TextEditingController();
  TextEditingController _tipPercentController = TextEditingController();

  bool roundTip = false;
  double tipAmount = 0;

  @override
  void dispose() {
    _billAmountController.dispose();
    _tipPercentController.dispose();
    super.dispose();
  }

  double calculateTip(){
    double tip = double.parse(_billAmountController.text) * double.parse(_tipPercentController.text) / 100;
    return tip;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Center(
            child: Column(
              children: [
                const Text("Calculate Tip",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _billAmountController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                    labelText: "Bill Amount",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF777777),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _tipPercentController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                    labelText: "Tip Percent (%)",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF777777),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Text("Round Up Tip?",
                      style: TextStyle(
                        fontSize: 20,
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      value: roundTip,
                      activeColor: const Color(0xFFCD5544),
                      onChanged: (bool value) {
                        setState(() {
                          roundTip = value;
                        });
                      }
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        double tip = calculateTip();
                        if (roundTip){
                          tipAmount = tip.roundToDouble();
                        }
                        else {
                          tipAmount = tip;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCD5544),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: const BeveledRectangleBorder(),
                      textStyle: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    child: const Text("Calculate"),
                  ),
                ),
                const SizedBox(height: 20),
                Text("Tip Amount: $tipAmount\$",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
