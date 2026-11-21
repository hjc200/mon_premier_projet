double price({required double unit, required int quantity, double discount = 0}){
  return unit*quantity*(1-discount);
}

void main(){
  print(price(unit:500,quantity:3));
  print(price(unit:500,quantity:3,discount:0.1));
  print(price(quantity:2,unit:1000,discount:0.25));
}