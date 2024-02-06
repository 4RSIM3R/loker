void main(List<String> args) {
  var vowels = 'aeiou';
  var consonants = 'bcdfghjklmnpqrstvwxyz';

  String lorem = """
Coding merupakan kegiatan yang dimana kamu memberitahukan komputer apa yang 
harus dia kerjakan untuk kamu. Sebuah kode yang ada pada skrip bisa diibaratkan layaknya 
bahasa sehari-hari. Setiap kode yang kamu tulis akan membantu komputer untuk mengetahui 
dan memahami apa yang ingin kamu lakukan pada komputer
  """;

  String input = lorem.replaceAll("\n", "").replaceAll("\t", "").replaceAll("  ", "").trim();
  String withoutSpace = input.replaceAll(" ", "").toLowerCase();
  List<String> word = input.trim().split(" ");
  Set<String> uniqueWord = word.toSet();
  String mostAppear = word.first;
  int mostCount = 0;

  String longest = word.reduce((current, e) => current.length > e.length ? current : e);

  print("Banyaknya Huruf : ${withoutSpace.length}");
  print("Banyaknya Kata : ${word.length}");

  var vowelCount = 0;
  var consonantCount = 0;
  var characterCount = 0;

  for (var i = 0; i < withoutSpace.length; i++) {
    if (vowels.contains(withoutSpace[i])) {
      vowelCount++;
    } else if (consonants.contains(withoutSpace[i])) {
      consonantCount++;
    } else {
      characterCount++;
    }
  }

  
  for (String str in uniqueWord) {
    int currentCount = word.where((element) => element == str).length;

    if (currentCount > mostCount) {
      mostCount = currentCount;
      mostAppear = str;
    }
  }

  print("Banyaknya Huruf Vokal : $vowelCount");
  print("Banyaknya Huruf Konsonan : $consonantCount");
  print("Banyaknya Huruf Karakter : $characterCount");
  print("Kata Terpanjang : $longest");
  print("Kata : '$mostAppear' muncul sebanyak : $mostCount");

  print(withoutSpace.length);
}
