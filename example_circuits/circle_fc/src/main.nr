use dep::noir_ml::{layers::fc, activations::poly, utils::arg_max};

global w1: [Field; 20] = [-455, 432187, -1006647, -1132192, -190208, 111821, 14611, 939281, -95110, 380825, -165184, -66335, -696411, -524333, -1118546, 817070, 27578, 1398714, -1289150, -370074];
global b1: [Field; 10] = [187505125999, -441391378641, -105263739824, 97819015384, -222036078572, 110821090639, 429528445005, -501845479012, -503157496452, -535839855671];

global w2: [Field; 20] = [-9751, 638844, -62484, -58605, -40924, -255673, 75017, 1278477, 1100375, 1144728, -96883, -527748, -88987, -382226, -408502, -203518, -60092, -821237, -1099514, -1002871];
global b2: [Field; 2] = [0, 0];

fn main(input: [Field; 2]) -> pub Field {
  let output = input;
  let output = poly(fc(output, w1, b1), 1000000000000);
  let output = arg_max(fc(output, w2, b2));
  output
}

////////////////////
//     TESTS      //
////////////////////
#[test]
fn test_circle_001() {
  let sample = [-181267, 336834];
  assert(main(sample) == 1);
}

#[test]
fn test_circle_002() {
  let sample = [4443, 966478];
  assert(main(sample) == 0);
}

#[test]
fn test_circle_003() {
  let sample = [-342958, -151764];
  assert(main(sample) == 1);
}

#[test]
fn test_circle_004() {
  let sample = [-293178, 962480];
  assert(main(sample) == 0);
}

#[test]
fn test_circle_005() {
  let sample = [192460, -394641];
  assert(main(sample) == 1);
}