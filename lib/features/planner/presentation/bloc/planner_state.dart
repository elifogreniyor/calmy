import 'package:calmy/features/planner/domain/entities/weekly_plan.dart';
import 'package:equatable/equatable.dart';

abstract class PlannerState extends Equatable {
  const PlannerState();

  @override
  List<Object> get props => [];
}

class PlannerInitial extends PlannerState {}

class PlannerLoading extends PlannerState {}

class PlannerLoaded extends PlannerState {
  final WeeklyPlan plan;
  const PlannerLoaded(this.plan);

  @override
  List<Object> get props => [plan];
}

class PlannerError extends PlannerState {
  final String message;
  const PlannerError(this.message);

  @override
  List<Object> get props => [message];
}
