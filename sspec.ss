class Option {
  new(self, value) {
    self.value = value;
  }

  fn set(self, value) {
    self.value = value;
  }
}

let $VERBOSE = Option(false);

let $PASS = ".";
let $FAILURE = "X";

class SpecTest {
  new(self, failures) {
    self.failures = failures;
  }

  fn expect(self, obj) {
    ret SpecExpect(obj, self.failures);
  }

  fn fail(self, msg) {
    self.failures.push(msg);
  }
}

class SpecExpect {
  new(self, expected, failures) {
    self.expected = expected;
    self.failures = failures;
  }

  fn to_be(self, actual) {
    if self.expected == actual {
      console.write($PASS);
    } else {
      if $VERBOSE.value {
        self.failures.push("expected " + std.debug(self.expected) + " to be " + std.debug(actual));
      } else {
        self.failures.push("expected " + self.expected + " to be " + actual);
      }
      console.write($FAILURE);
    }
  }

  fn to_be_truthy(self) {
    if self.expected {
      console.write($PASS);
    } else {
      self.failures.push("expected " + expected + " to be truthy");
      console.write($FAILURE);
    }
  }

  fn to_be_falsy(self) {
    if !self.expected {
      console.write($PASS);
    } else {
      self.failures.push("expected " + expected + " to be falsy");
      console.write($FAILURE);
    }
  }
}

export mod {
  let verbose: $VERBOSE;

  fn describe(descriptor, func) {
    let failures = [];
    let t = SpecTest(failures);
    if func {
      func(t);

      console.writeln();

      if failures.len {
        print "PASSED: " + descriptor;
      } else {
        print "FAILED: " + descriptor;
        for let i = 0; i < failures.len; i += 1 {
          print failures[i];
        }
        ps.exit(1);
      }
    } else {
      print "SKIPPED: "  + descriptor;
    }
  }
}
