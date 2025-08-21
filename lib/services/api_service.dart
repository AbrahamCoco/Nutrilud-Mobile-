import 'package:dio/dio.dart';

class ApiService {
  static const String baseURL = "http://192.168.0.71:8080/api/v1";

  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseURL),
  );

  // ========= USER API =========
  Future<Response> login(String usuario, String contrasenia) async {
    return await _dio.post(
      "/personal_access_token/login",
      data: {"usuario": usuario, "contrasenia": contrasenia},
    );
  }

  Future<Response> register(dynamic data) async {
    return await _dio.post("/users/insert", data: data);
  }

  Future<Response> uploadImage(FormData data) async {
    return await _dio.post("/personal_access_token/insert_archivo", data: data);
  }

  Future<Response> getUser(int id) async {
    return await _dio.get("/users/findById", queryParameters: {"id": id});
  }

  // ========= ADMIN API =========
  Future<Response> getAllAdminsAndNutris() async {
    return await _dio.get("/users/findAllAdminsAndNutris");
  }

  // ========= NUTRIOLOGO API =========
  Future<Response> getAllArticulos() async {
    return await _dio.get("/tarticulos/findAllArticles");
  }

  Future<Response> getArticuloId(int id) async {
    return await _dio.get("/tarticulos/findById", queryParameters: {"id": id});
  }

  Future<Response> getAgenda(int id) async {
    return await _dio.get(
      "/tdatos_consultas/findAgendaByNutriologo",
      queryParameters: {"id": id},
    );
  }

  Future<Response> addArticulo(dynamic data) async {
    return await _dio.post("/tarticulos/insert", data: data);
  }

  Future<Response> getAllPacientes() async {
    return await _dio.get("/users/findAllPacientes");
  }

  Future<Response> deletePaciente(int id) async {
    return await _dio.get("/users/deleteByIdPaciente", queryParameters: {"id": id});
  }

  Future<Response> getPacienteId(int id) async {
    return await _dio.get("/users/findByIdPaciente", queryParameters: {"id": id});
  }

  Future<Response> getAllConsultas(int id) async {
    return await _dio.get(
      "/tdatos_consultas/findConsultasByPaciente",
      queryParameters: {"id": id},
    );
  }

  Future<Response> addConsulta(dynamic data) async {
    return await _dio.post("/tdatos_consultas/insert", data: data);
  }

  Future<Response> addRecordatorio(dynamic data) async {
    return await _dio.post("/t_recordatorios/insert", data: data);
  }

  Future<Response> getRecordatorios(int id) async {
    return await _dio.get(
      "/t_recordatorios/findRecordatorioByPacienteId",
      queryParameters: {"id": id},
    );
  }

  Future<Response> updatePaciente(int id, dynamic data) async {
    return await _dio.post(
      "/users/updatePaciente",
      data: data,
      queryParameters: {"id": id},
    );
  }

  // ========= RUTAS DE ARCHIVOS =========
  String get viewUrl => "$baseURL/view/";
  String get pdfUrl => "$baseURL/files/";
}
