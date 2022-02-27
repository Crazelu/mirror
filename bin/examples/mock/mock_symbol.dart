import 'package:equatable/equatable.dart';

class MockSymbol extends Equatable {
  final Symbol symbol;
  final List positionalArguments;
  final Map<Symbol, dynamic> namedArguments;

  factory MockSymbol.fromInvocation(Invocation invocation) {
    return MockSymbol(
      symbol: invocation.memberName,
      positionalArguments: invocation.positionalArguments,
      namedArguments: invocation.namedArguments,
    );
  }

  MockSymbol({
    required this.symbol,
    required this.positionalArguments,
    required this.namedArguments,
  });

  @override
  List<Object?> get props => [
        symbol,
        positionalArguments,
        namedArguments,
      ];

  @override
  String toString() {
    return "MockSymbol(symbol: ${symbol.toString()}, positionalArguments: $positionalArguments, namedArguments: $namedArguments)";
  }

  String _nameFromSymbol(Symbol symbol) {
    return symbol
        .toString()
        .replaceFirst('Symbol("', '')
        .replaceFirst('")', '');
  }

  String constructCall() {
    String positionalParams = "";
    for (int i = 0; i < positionalArguments.length; i++) {
      positionalParams += "${positionalArguments[i]}";
      if (i != positionalArguments.length - 1) positionalParams += ", ";
    }

    String namedParams = "";
    for (int i = 0; i < namedArguments.keys.length; i++) {
      final param = List<Symbol>.from(namedArguments.keys)[i];
      namedParams += "${_nameFromSymbol(param)}: ${namedArguments[param]}";
      if (i != namedArguments.keys.length - 1) namedParams += ", ";
    }

    if (namedParams.isNotEmpty) namedParams = "{$namedParams}";
    if (positionalParams.isNotEmpty && namedParams.isNotEmpty) {
      namedParams = ", " + namedParams;
    }

    return "${_nameFromSymbol(symbol)}($positionalParams$namedParams)";
  }
}
