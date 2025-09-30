import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils/enums/category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMMMd();

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense({super.key, required this.onAddExpense});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _dateTime;
  Category initCat = Category.coffe;

  void _submittedForm() {
    double? amount = double.tryParse(_amountController.text);
    bool amountIsFalse = amount == null || amount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsFalse ||
        _dateTime == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Data'),
          content: Text('Please Entre Valid Data To Save'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: amount,
        date: _dateTime!,
        category: initCat,
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDateTimePicker() async {
    final dateNow = DateTime.now();
    final firstDate = DateTime(dateNow.year - 1, dateNow.month, dateNow.day);
    final fDate = await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: firstDate,
      lastDate: dateNow,
    );

    setState(() {
      _dateTime = fDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 48, 16, 16),
      child: Column(
        children: [
          Text(
            'Add New Expense',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          SizedBox(height: 10),
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: InputDecoration(
              label: FittedBox(child: Text('Title')),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount of Money'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _dateTime == null
                          ? "No Date Selected"
                          : formater.format(_dateTime!),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      onPressed: _showDateTimePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              DropdownButton(
                value: initCat,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                          style: TextStyle(
                            color:
                                MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Color.fromARGB(255, 5, 99, 125)
                                : Color.fromARGB(255, 96, 59, 181),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (Category? value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    initCat = value;
                  });
                },
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              SizedBox(width: 5),
              ElevatedButton(
                onPressed: _submittedForm,
                child: Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
