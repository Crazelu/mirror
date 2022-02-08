import 'stub.dart';

void main() {
  final cat = CatStub();

  when(cat.meow("hehe")).thenReturn("Hiiii");

  expect("Hiiii", cat.meow("hehe"));

  when(cat.meow("uu")).thenReturn("Heyy");

  expect("Heyy", cat.meow("uu"));
  expect("Hii", cat.meow("uu"));
  expect("Hiiii", cat.meow("hehe"));

  when(cat.limbCount()).thenReturn(4);
  expect(4, cat.limbCount());

  final sisterCat = CatStub();
  when(cat.getSister()).thenReturn(sisterCat);
  expect(sisterCat, cat.getSister());

  when(cat.a()).thenReturn(['expected']);
  expect(['expected'], cat.a());
}

abstract class Feline {
  String meow(String sound);
  int limbCount();
  CatStub getSister();
  List<String> a();
}

class Cat implements Feline {
  @override
  String meow(String sound) {
    print("Purrr $sound");
    return "Purrr $sound";
  }

  @override
  int limbCount() {
    // TODO: implement limbCount
    throw UnimplementedError();
  }

  @override
  CatStub getSister() {
    // TODO: implement getSister
    throw UnimplementedError();
  }

  @override
  List<String> a() {
    // TODO: implement a
    throw UnimplementedError();
  }
}

class CatStub with Stub<CatStub>, Feline {}
