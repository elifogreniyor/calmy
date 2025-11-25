import 'package:calmy/core/services/gemini_service.dart';
import 'package:calmy/features/planner/domain/entities/planner_input.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PlannerRemoteDataSource {
  final GeminiService gemini;

  PlannerRemoteDataSource(this.gemini);

  Future<String> generateWeeklyPlan(PlannerInput input) async {
    final prompt =
        """
Kullanıcının haftalık plan parametreleri:

Çalışabileceği toplam gün sayısı: ${input.availableDays}
Tercih edilen günler: ${input.preferredDays.join(", ")}

Günlük maksimum çalışma süresi: ${input.maxDailyHours} saat
En verimli olduğu zaman: ${input.productivityPeriod}

Hedef kategorisi: ${input.goalCategory}
Odak alanı: ${input.focusArea}

Yoğunluk seviyesi: ${input.intensity}
Öncelikli hedef: ${input.primaryGoal}

Hafta sonu farklı program isteniyor mu?: ${input.weekendDifferentiation ? "Evet" : "Hayır"}

${input.moodNote != null ? "Kullanıcının ruh hali / notu: ${input.moodNote}" : ""}

Görev:
Bu parametrelere göre, 7 günlük sade, uygulanabilir bir haftalık plan oluştur.
- Her gün için 3 maddelik kısa görev listesi yaz.
- Görevler spesifik, gerçekçi ve enerji seviyesine uygun olsun.
- Eğer kullanıcı hafta sonu farklı program istiyorsa bunu yansıt.
""";

    final result = await gemini.generatePlan(prompt);
    return result;
  }
}
