import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list_item.dart';
import 'package:flutter/material.dart';

class ExpenseListWidget extends StatelessWidget {
  final void Function(Expense expense) onRemoveExpense;
  const ExpenseListWidget({
    super.key,
    required this.expList,
    required this.onRemoveExpense,
  });

  final List<Expense> expList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expList.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withAlpha(150),
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              'Expense will be To Delet',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        key: ValueKey(expList[index]),
        onDismissed: (direction) {
          onRemoveExpense(expList[index]);
        },
        child: ExpenseListItem(expList[index]),
      ),
    );
  }
}
