import 'package:injectable/injectable.dart';
import 'package:calmy/core/services/gemini_service.dart';
import 'package:calmy/features/planner/domain/entities/planner_input.dart';

/// Uygulamanın dış dünyayla konuşan katmanı.
/// Burada Gemini'ye bağlanırız ve Promt'u oluştururuz.
/// Domain bu katmanı bilmez.
/// UI bu katmanı görmez.
///
/// Sorumluluk: Kullanıcıdan gelen PlannerInput bilgilerini
/// temiz bir 'prompt' metnine dönüştürüp Gemini'ye göndermek.
@lazySingleton
class PlannerRemoteDataSource {
  final GeminiService gemini;

  PlannerRemoteDataSource(this.gemini);

  Future<String> generateWeeklyPlan(PlannerInput input) async {
    // ✨ Prompt burada oluşturulur. Burası AI'ın beyni sayılır.
    final prompt =
        """
Aşağıdaki kullanıcı bilgilerine göre kişiselleştirilmiş 7 günlük
uygulanabilir bir haftalık plan oluştur.

### Kullanıcı Bilgileri
- Çalışabileceği toplam gün: ${input.availableDays}
- Tercih edilen günler: ${input.preferredDays.join(", ")}
- Günlük maksimum çalışma süresi: ${input.maxDailyHours} saat
- En verimli olduğu zaman: ${input.productivityPeriod}

### Hedefler
- Ana kategori: ${input.goalCategory}
- Odak alanı: ${input.focusArea}
- Öncelikli hedef: ${input.primaryGoal}

### Yoğunluk Seviyesi
- ${input.intensity}

### Hafta Sonu Farklı Program?
- ${input.weekendDifferentiation ? "Evet" : "Hayır"}

### Kullanıcının belirtilen ruh hali:
${input.moodNote ?? "Belirtilmedi"}

### Görev
Kullanıcının bu parametrelerine göre:

1) Her gün için maksimum 3 maddelik kısa görev listesi oluştur.
2) Görevleri gerçekçi, uygulanabilir ve kullanıcının enerji seviyesine uygun şekilde düzenle.
3) Eğer kullanıcı hafta sonu farklı program isterse hafta sonunu özel bir yapıya göre oluştur.
4) Gün isimlerini başlık olarak yaz (Pazartesi, Salı gibi).
5) Plan tamamen kişiye özel ve motive edici olsun.
""";

    // Gemini'ye gönderiyoruz
    final result = await gemini.generatePlan(prompt);

    // Response ham bir String olduğundan aynen döner
    return result;
  }
}
