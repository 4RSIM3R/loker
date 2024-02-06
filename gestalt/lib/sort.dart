void main(List<String> args) {
  var temp = [];

  int oddTotalCount = 0;
  int oddCount = 0;

  int biggest = 0;

  var items = [
    [9, 5, 2],
    [1, 3, 8],
    [10, 15, 12],
    [4, 7, 6],
    [13, 11, 14],
  ];

  for (var i = 0; i < items.length; i++) {
    int sum = items[i].reduce((a, b) => a + b);
    if (sum % 2 != 0) oddTotalCount++;
    if (sum > biggest) biggest = sum;
    temp.add(sum);
  }

  for (var i = 0; i < items.length; i++) {
    for (var j = 0; j < items[i].length; j++) {
      if (items[i][j] % 2 != 0) oddCount++;
    }
  }

  print("Jumlah Elemen Dengan Total Ganjil : $oddTotalCount");
  print("Jumlah Bilangan Ganjil : $oddCount");
  print("Index Elemen Terbesar : ${temp.indexOf(biggest)}");

  items.sort((a, b) {
    int first = a.reduce((value, element) => value + element);
    int second = b.reduce((value, element) => value + element);
    return second.compareTo(first);
  });


  print(items.toString());
  print(temp.reversed.toString());
}
