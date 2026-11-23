import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ben_kimim/oyun_ben_kimim.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(benKimimConfig.title.length, 33);
    expect(benKimimConfig.tagline.length, 33);
    for (final s in benKimimConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(benKimimConfig.gameId, benKimimId);
    expect(benKimimRules.gameId, benKimimId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(benKimimRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: benKimimId, optionalMechanics: benKimimRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(benKimimRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
