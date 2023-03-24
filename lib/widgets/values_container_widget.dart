import 'package:flutter/material.dart';

class ValuesContainer extends StatelessWidget {
  const ValuesContainer({
    super.key,
    required this.topData,
    required this.value,
    required this.addFunction,
    required this.removeFunction,
  });

  final String topData;
  final String value;
  final Function() addFunction;
  final Function() removeFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: 150,
      decoration: BoxDecoration(
          color: Colors.grey.shade700, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topData.toUpperCase(),
            style: TextStyle(fontSize: 16, color: Colors.grey.shade300),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: addFunction,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade500,
                  child: Icon(
                    Icons.add,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: removeFunction,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade500,
                  child: Icon(
                    Icons.remove,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
