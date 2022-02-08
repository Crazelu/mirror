import 'stub.dart';

void main() {
  final cat = CatStub();

  when(cat.meow("hehe")).thenReturn("Hiiii");

  expect("Hiiii", cat.meow("hehe"));

  when(cat.meow("uu")).thenReturn("Heyy");

  expect("Heyy", cat.meow("uu"));
  expect("Hii", cat.meow("uu"));
  expect("Hiiii", cat.meow("hehe"));

  when(cat.limbCount()).thenReturn(10);
  expect(10, cat.limbCount());
}

abstract class Feline {
  String meow(String sound);
  int limbCount();
}

class Cat implements Feline {
  @override
  String meow(String sound) {
    print("Purrr $sound");
    return "Purrr $sound";
  }

  @override
  int limbCount() => 4;
}

class CatStub with Stub<CatStub>, Feline {}
