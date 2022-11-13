// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  ValueChanged<T?> onChanged;
  final T value;
  final T groupValue;
  final Widget? title;

  CustomRadioButton({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          elevation: 5,
          child: InkWell(
            onTap: () {
              setState(() {
                onChanged(value);
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (title != null) title,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
