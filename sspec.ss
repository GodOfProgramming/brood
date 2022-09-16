req "std";
req "console";
req "ps";

let $SSPEC_PASS = ".";
let $SSPEC_FAILURE = "X";

class Test {
  new(self, failures) {
    self <- { failures };
  }

  fn expect(self, obj) {
    ret Expect(obj, self.failures);
  }

  fn fail(self, msg) {
    self.failures.push(msg);
  }
}

class Expect {
  new(self, expected, failures) {
    self <- { expected, failures };
  }
  fn to_be(self, actual) {
    if self.expected == actual {
      console.write($SSPEC_PASS);
    } else {
      self.failures.push("expected " + self.expected + " to be " + actual);
      console.write($SSPEC_FAILURE);
    }
  }

  fn to_be_truthy(self) {
    if self.expected {
      console.write($SSPEC_PASS);
    } else {
      self.failures.push("expected " + expected + " to be truthy");
      console.write($SSPEC_FAILURE);
    }
  }

  fn to_be_falsy(self) {
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
  let t = Test(failures);
  if func {
    func(t);

    console.writeln();

    if failures.len() == 0 {
      print "PASSED: " + descriptor;
    } else {
      print "FAILED: " + descriptor;
      for let i = 0; i < failures.len(); i += 1 {
        print failures[i];
      }
      ps.exit(1);
    }
  } else {
    print "SKIPPED: "  + descriptor;
  }
}
