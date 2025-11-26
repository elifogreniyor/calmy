import 'package:calmy/features/planner/data/datasources/planner_remote_ds.dart';
import 'package:calmy/features/planner/domain/entities/planner_input.dart';
import 'package:calmy/features/planner/domain/entities/weekly_plan.dart';
import 'package:calmy/features/planner/domain/repositories/planner_repository.dart';

class PlannerRepositoryImpl extends PlannerRepository {
  final PlannerRemoteDataSource remote;

  PlannerRepositoryImpl(this.remote);

  @override
  Future<WeeklyPlan> generateWeeklyPlan(PlannerInput input) async {
    final rawPlanText = await remote.generateWeeklyPlan(input);
    return WeeklyPlan(planText: rawPlanText);
  }
}
