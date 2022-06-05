req "ptr" => $sspec_ptr;

class Test {
  new(descriptor) {
    ret {descriptor};
  }

  fn assert(obj) {
    ret Assert(obj);
  }
}

class Assert {
  new(expect) {
    ret expect;
  }

  fn to_be(actual) {
    let expected = $sspec_ptr.deref(self);
    if expected != actual {
      print "FAIL: expected " + expected + " to be " + actual;
    }
  }

  fn to_be_truthy() {
    if !$sspec_ptr.deref(self) {
      print "FAIL: expected " + expected + " to be truthy";
    }
  }

  fn to_be_falsy() {
    if $sspec_ptr.deref(self) {
      print "FAIL: expected " + expected + " to be falsy";
    }
  }
}

ret {
  describe: (descriptor, func) {func(Test(descriptor));},
};
