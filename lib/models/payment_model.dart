class PaymentModel {
  final int? id;
  final String payment;
  final String date;
  final String notes;

  PaymentModel({
    this.id,
    required this.payment,
    required this.date,
    required this.notes,
  });

  toMap() {
    return {"id": id, 'payment': payment, 'date': date, "notes": notes};
  }
}
