// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
