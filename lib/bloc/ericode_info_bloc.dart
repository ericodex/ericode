import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ericode_info_event.dart';
part 'ericode_info_state.dart';

class EricodeInfoBloc extends Bloc<EricodeInfoEvent, EricodeInfoState> {
  EricodeInfoBloc() : super(EricodeInfoInitial()) {
    on<EricodeInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
