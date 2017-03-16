import 'package:angular2/angular2.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'strums',
    directives: const [NgFor, StrumComponent],
    templateUrl: 'strums.html')
class StrumsComponent {
  List<int> patterns = new List.generate(256, (idx) => idx);
}

/// TODO: component description
@Component(
    selector: 'strum',
    directives: const [NgFor, NgIf, GlyphComponent],
    styleUrls: const ['strum.css'],
    templateUrl: 'strum.html')
class StrumComponent {
  @Input()
  int count = 8;

  int _patternId;
  int get patternId => _patternId;
  @Input()
  set patternId(int value) {
    _patternId = value;
    beats = [];
    while (value > 0) {
      beats.add(value % 2 == 1);
      value = value ~/ 2;
    }
    while (beats.length < count) beats.add(false);
  }

  String icon(bool strum, int index) {
    if (!strum) return 'check_box_outline_blank';
    return index % 2 == 0 ? 'arrow_downward' : 'arrow_upward';
  }

  List<bool> beats;
}
