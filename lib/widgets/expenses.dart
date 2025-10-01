import 'package:expense_tracker/data/notifiers.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils/enums/category.dart';
import 'package:expense_tracker/widgets/charts/chart.dart';
import 'package:expense_tracker/widgets/expense_add/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list_widget.dart';
import 'package:flutter/material.dart';

final List<Expense> ExpList = [
  Expense(
    title: 'one sandwatch',
    amount: 25,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: 'one frensh coffe',
    amount: 20,
    date: DateTime.now(),
    category: Category.coffe,
  ),
];

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expenses> {
  // to display overlay Model
  void _showOverlayModelBottomSheet() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addNewExpense),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      ExpList.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final _expenseIndex = ExpList.indexOf(expense);
    setState(() {
      ExpList.remove(expense);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Expense Deleted successfully'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              ExpList.insert(_expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _showOverlayModelBottomSheet,
            icon: Icon(Icons.add),
          ),
          ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context, value, child) {
              return IconButton(
                onPressed: () {
                  isDarkMode.value = !isDarkMode.value;
                },
                icon: value == true
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode),
              );
            },
          ),
        ],
      ),
      body: width < 600
          ? SafeArea(
              child: Column(
                children: [
                  Chart(expenses: ExpList),
                  Expanded(
                    child: ExpenseListWidget(
                      expList: ExpList,
                      onRemoveExpense: _removeExpense,
                    ),
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Row(
                children: [
                  Expanded(child: Chart(expenses: ExpList)),
                  Expanded(
                    child: ExpenseListWidget(
                      expList: ExpList,
                      onRemoveExpense: _removeExpense,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
