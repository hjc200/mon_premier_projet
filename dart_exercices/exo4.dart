class product{
  final String name;
  final int price;
  const product(this.name, this.price);

  bool get isFree => price ==0 ;
  String describe() => '$name: $price XAF';
}

Future<String> fetchGreeting() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'welcome mon server';
}
Future<void> main() async {
  const rice =product('Rice', 750);
  print(rice.describe());
  print(rice.isFree);
  print(await fetchGreeting());
}