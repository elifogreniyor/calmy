import 'package:calmy/features/planner/domain/entities/weekly_plan.dart';

abstract class PlannerRepository {
  Future<WeeklyPlan> generateWeeklyPlan(String goals);
}
