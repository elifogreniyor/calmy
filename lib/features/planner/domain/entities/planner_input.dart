class PlannerInput {
  final int availableDays;
  final List<String> preferredDays;
  final int maxDailyHours;
  final String productivityPeriod;
  final String goalCategory;
  final String focusArea;
  final String intensity;
  final String primaryGoal;
  final bool weekendDifferentiation;
  final String? moodNote;

  PlannerInput({
    required this.availableDays,
    required this.preferredDays,
    required this.maxDailyHours,
    required this.productivityPeriod,
    required this.goalCategory,
    required this.focusArea,
    required this.intensity,
    required this.primaryGoal,
    required this.weekendDifferentiation,
    this.moodNote,
  });
}
