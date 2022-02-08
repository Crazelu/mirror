import "dart:mirrors";

Map<Symbol, Object?> _calls = {};
_WhenCall? _whenCall;

void reset() {
  _calls.clear();
}

class Stub<T> {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    final stub = reflectClass(T);
    final memberName = invocation.memberName;
    Type? methodType;

    for (var type in stub.instanceMembers.values) {
      if (type.simpleName == memberName) {
        methodType = type.returnType.reflectedType;
        break;
      }
    }

    final result = _calls[memberName];
    _whenCall = _WhenCall(memberName);

    return result ?? _defaultResponse(methodType);
  }

  Object? _defaultResponse(Type? type) {
    try {
      switch (type) {
        case String:
          return "";
        case num:
        case int:
        case double:
          return 0;
        case List:
          return [];

        default:
          //construct instance of non-serializable object by calling it's constructor
          return reflectClass(type!).newInstance(Symbol.empty, []).reflectee;
      }
    } catch (e) {
      print(e);
    }
  }
}

Expectation<T> Function<T>(T _) get when {
  return <T>(_) {
    return Expectation<T>();
  };
}

class _WhenCall<T> {
  final Symbol memberName;

  _WhenCall(this.memberName);

  void _setValue(T value) {
    _calls[memberName] = value;
  }
}

class Expectation<T> {
  void thenReturn(T expected) {
    if (_whenCall != null) {
      _whenCall!._setValue(expected);
    }
  }
}

void expect(Object? actual, Object? expected) {
  if (expected == actual) {
    print("Test passed");
  } else {
    print('''
        Test failed
        Actual: $actual
          Received: $expected
      ''');
  }
}
