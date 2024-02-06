void rotate(List<String> payload, int step) {
  var results = List.of(payload);

  var size = payload.length;

  step = step % size;

  for (var i = 0; i < size; i++) {
    int desired = (i + step) % size;
    results[desired] = payload[i];
  }

  print(results.toString());
}

void main(List<String> args) {

  // 0 -> no swap
  // 1 -> swap index 0 -> 1
  // 2 -> swap index 0 -> 2
  // 3 -> rotate to 1 right

  var payload = ["Volvo", "BMW", "Toyota", "Kijang"];


  for (var i = 0; i < payload.length - 1; i++) {
    String first = payload[0];
    payload[0] = payload[i];
    payload[i] = first;
    print(payload.toString());
  }

  rotate(payload, 1);

  // a."Volvo","BMW","Toyota","Kijang"
  // b. "BMW","Volvo","Toyota","Kijang"
  // c. "Toyota","Volvo","BMW","Kijang"
  // d. "Kijang","Toyota","Volvo","BMW"

  // OUTPUT
  // [Volvo, BMW, Toyota, Kijang]
  // [BMW, Volvo, Toyota, Kijang]
  // [Toyota, Volvo, BMW, Kijang]
  // [Kijang, Toyota, Volvo, BMW]
}
