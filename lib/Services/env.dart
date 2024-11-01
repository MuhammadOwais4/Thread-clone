import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final String SupaBaseProjectURl=dotenv.env["SupaBaseProjectURl"]!;
static String projectAPIKey=dotenv.env["projectAPIKey"]!;

}