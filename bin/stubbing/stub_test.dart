import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'main.dart';
import 'stub.dart' show when;

void main() {
  test(
    '''
      Given a Cat is created
      when meow is called with "hehe"
      Purrr hehe should be returned
    ''',
    () {
      Feline cat = Cat();
      expect("Purrr hehe", cat.meow("hehe"));
    },
  );
  test(
    '''
      Given a CatStub is created
      when meow is called with "hehe"
      Purrr hehe should be returned
    ''',
    () {
      Feline cat = CatStub();
      when(cat.meow("hehe")).thenReturn("Purrr hehe");
      expect("Purrr hehe", cat.meow("hehe"));
    },
  );
}
