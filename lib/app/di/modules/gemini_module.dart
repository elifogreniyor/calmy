@module
abstract class GeminiModule {
  @lazySingleton
  GenerativeModel provideGeminiModel() {
    return GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'YOUR_API_KEY_HERE',
    );
  }

  @lazySingleton
  GeminiService provideGeminiService(GenerativeModel model) {
    return GeminiService(model);
  }
}
