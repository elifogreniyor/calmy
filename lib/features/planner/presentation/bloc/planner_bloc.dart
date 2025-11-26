import 'package:flutter_bloc/flutter_bloc.dart';

import 'planner_event.dart';
import 'planner_state.dart';

import 'package:calmy/features/planner/domain/usecases/generate_weekly_plan.dart';

class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  final GenerateWeeklyPlan generateWeeklyPlan;

  PlannerBloc(this.generateWeeklyPlan) : super(PlannerInitial()) {
    on<GenerateWeeklyPlanEvent>(_onGenerateWeeklyPlan);
  }

  Future<void> _onGenerateWeeklyPlan(
    GenerateWeeklyPlanEvent event,
    Emitter<PlannerState> emit,
  ) async {
    emit(PlannerLoading());

    try {
      final plan = await generateWeeklyPlan(event.input);
      emit(PlannerLoaded(plan));
    } catch (e) {
      emit(PlannerError(e.toString()));
    }
  }
}
