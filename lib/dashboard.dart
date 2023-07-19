import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 500),
          Center(
            child: Column(
              children: [Text("This is the dashboard Screen of the app")],
            ),
          ),
        ],
      ),
    );
  }
}
