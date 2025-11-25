import 'package:calmy/features/planner/domain/entities/planner_input.dart';
import 'package:calmy/features/planner/domain/entities/weekly_plan.dart';
import 'package:calmy/features/planner/domain/repositories/planner_repository.dart';

class GenerateWeeklyPlan {
  final PlannerRepository repository;

  GenerateWeeklyPlan(this.repository);

  Future<WeeklyPlan> call(PlannerInput input) {
    return repository.generateWeeklyPlan(input);
  }
}
