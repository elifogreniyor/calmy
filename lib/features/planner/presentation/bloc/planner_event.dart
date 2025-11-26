import 'package:calmy/features/planner/domain/entities/planner_input.dart';
import 'package:equatable/equatable.dart';

abstract class PlannerEvent extends Equatable {
  const PlannerEvent();

  @override
  List<Object?> get props => [];
}

class GenerateWeeklyPlanEvent extends PlannerEvent {
  final PlannerInput input;

  const GenerateWeeklyPlanEvent(this.input);

  @override
  List<Object?> get props => [input];
}
