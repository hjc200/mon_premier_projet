

double price({required double unit, required int quantity, double discount = 0}){
  return unit*quantity*(1-discount);
}

void main(){
  final price =[300, 800 ,650, 1200, 450];
  print (price.where((P) => P>590).toList());
  print(price.map((p) => p*1.1).toList());
  print(price.fold<int>(0, (sum, p) => sum +p));
}