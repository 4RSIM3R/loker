void main(List<String> args) {
  for (var i = 1; i <= 10; i++) {
    String number = i.toString();
    String output = i <= 5 ? number.padLeft(i + 1, "0") : number.padRight(i + 1, "0");

    print('- $output');
  }
}

// OUTPUT

// - 01
// - 002
// - 0003
// - 00004
// - 000005
// - 6000000
// - 70000000
// - 800000000
// - 9000000000
// - 10000000000