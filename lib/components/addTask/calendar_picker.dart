import 'package:flutter/material.dart';

class CalendarPicker extends StatefulWidget {
  const CalendarPicker({super.key});

  @override
  State<CalendarPicker> createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  final TextEditingController _dateController = TextEditingController();

  String selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16,
      ),
      child: TextField(
        controller: _dateController,
        decoration: InputDecoration(
          hintText:
              selectedDate == "" ? "Select Date" : selectedDate.toString(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: false,
          prefixIcon: const Icon(Icons.calendar_today),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        readOnly: true,
        // prevent lable from floating
        // prevent the labelText from floating upwards when the TextField is focused
        onTap: () => _selectDate(context),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate.toString().split(" ")[0];
      });
    }
  }
}

// class CalendarPicker extends StatelessWidget {
//   CalendarPicker({super.key});

// }
