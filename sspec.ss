req "std";
req "console";

let $SSPEC_PASS = ".";
let $SSPEC_FAILURE = "X";

class Test {
  new(failures) {
    ret {failures};
  }

  fn expect(obj) {
    ret Expect(obj, self.failures);
  }
}

class Expect {
  new(expected, failures) {
    ret { expected, failures };
  }

  fn to_be(actual) {
    if self.expected == actual {
      console.write($SSPEC_PASS);
    } else {
      self.failures.push("expected " + self.expected + " to be " + actual);
      console.write($SSPEC_FAILURE);
    }
  }

  fn to_be_truthy() {
    if self.expected {
      console.write($SSPEC_PASS);
    } else {
      self.failures.push("expected " + expected + " to be truthy");
      console.write($SSPEC_FAILURE);
    }
  }

  fn to_be_falsy() {
    if !self.expected {
      console.write($SSPEC_PASS);
    } else {
      self.failures.push("expected " + expected + " to be falsy");
      console.write($SSPEC_FAILURE);
    }
  }
}


fn describe(descriptor, func) {
  let failures = std.Vec();
  func(Test(failures));

  console.writeln();

  if failures.len() == 0 {
    print "PASSED: " + descriptor;
  } else {
    print "FAILED: " + descriptor;
    for let i = 0; i < failures.len(); i += 1 {
      print failures[i];
    }
  }
}
