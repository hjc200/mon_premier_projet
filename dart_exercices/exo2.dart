String? findtown(String code){
  if (code=='JPN') return 'japon';
  if (code=='BTA') return 'bertoua';
  return null;
}
void main(){
  print(findtown('JPN') ?? 'inconnu');
  print(findtown('xxx') ?? 'inconnu');
}