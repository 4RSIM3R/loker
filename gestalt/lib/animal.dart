class Animal {
  String name;
  Animal({required this.name});

  String bersuara() {
    return "Aku adalah hewan";
  }
}

class Cat extends Animal {
  Cat({required super.name});

  @override
  String bersuara() {
    return "$name Bersuara Meow";
  }
}

class Dog extends Animal {
  Dog({required super.name});

  @override
  String bersuara() {
    return "$name Bersuara Woof";
  }
}

void main(List<String> args) {
  Animal cat = Cat(name: "Kucing");
  Animal dog = Dog(name: "Anjing");

  print(cat.bersuara());
  print(dog.bersuara());

}
