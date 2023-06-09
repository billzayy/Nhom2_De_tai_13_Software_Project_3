import 'package:flutter/material.dart';
import 'package:software_project_3/src/domain/model/message_model.dart';

class LeftContent extends StatelessWidget {
  final MessageModel? last;
  final MessageModel current;
  final MessageModel? next;
  final bool isHienThiGio;

  const LeftContent({
    Key? key,
    required this.current,
    required this.last,
    required this.next,
    this.isHienThiGio = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    current.messages ?? '',
                    style: const TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
