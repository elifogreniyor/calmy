import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel model;

  GeminiService(this.model);

  Future<String> generatePlan(String userContext) async {
    final response = await model.generateContent([
      Content.text("Create a weekly plan for: $userContext"),
    ]);

    return response.text ?? "";
  }
}
