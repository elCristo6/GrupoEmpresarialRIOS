import '../models/articulos.dart';
import '../models/usercc.dart';

class Remision {
  final int? id;
  final String ciudad;
  final String transportador;
  final String ccTransportador;
  final String direccion;
  final String placa;
  final String despachado;
  final String recibido;
  final double totalPeso;
  final String empresa;
  final UserCC userCC;
  final List<Articulo> articulos;
  final DateTime createdAt;
  final DateTime updatedAt;

  Remision({
    this.id,
    required this.ciudad,
    required this.transportador,
    required this.ccTransportador,
    required this.direccion,
    required this.placa,
    required this.despachado,
    required this.recibido,
    required this.totalPeso,
    required this.empresa,
    required this.userCC,
    required this.articulos,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'ciudad': ciudad,
        'transportador': transportador,
        'ccTransportador': ccTransportador,
        'direccion': direccion,
        'placa': placa,
        'despachado': despachado,
        'recibido': recibido,
        'totalPeso': totalPeso,
        'empresa': empresa,
        'userCC': userCC.toJson(),
        'articulos': articulos.map((articulo) => articulo.toJson()).toList(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory Remision.fromJson(Map<String, dynamic> json) => Remision(
        id: json['id'],
        ciudad: json['ciudad'],
        transportador: json['transportador'],
        ccTransportador: json['ccTransportador'],
        direccion: json['direccion'],
        placa: json['placa'],
        despachado: json['despachado'],
        recibido: json['recibido'],
        totalPeso: json['totalPeso'],
        empresa: json['empresa'],
        userCC: UserCC(cc: json['cc']),
        articulos: (json['articulos'] as List)
            .map((i) => Articulo.fromJson(i))
            .toList(),
        //createdAt: json['createdAt'],
        //updatedAt: json['updatedAt']
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
  @override
  String toString() {
    String articulosStr =
        articulos.map((articulo) => articulo.toString()).join(", ");
    /*return 'Remision NO: $id, ciudad: $ciudad, transportador: $transportador, ccTransportador: $ccTransportador, direccion: $direccion, '
        'placa: $placa, despachado: $despachado, recibido: $recibido, totalPeso: ${totalPeso.toInt()}KG, empresa: $empresa, articulos: $articulosStr, Creado: ${createdAt.toIso8601String()}';*/
    return 'Remision NO: $id, ciudad: $ciudad, transportador: $transportador, ccTransportador: $ccTransportador, direccion: $direccion, '
        'placa: $placa, despachado: $despachado, recibido: $recibido, totalPeso: ${totalPeso.toInt()}KG, empresa: $empresa, '
        'userCC: ${userCC.cc}, articulos: $articulosStr, Creado: ${createdAt.toIso8601String()}';
  }
}
