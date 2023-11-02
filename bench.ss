use std::str;
use std::time::mono;

export mod bench {
  fn benchmark(descriptor, reps, func) {
    if !str::is_prefix(descriptor, "DISABLED") {
      println "running " + descriptor;

      let now = mono::now();

      for let i = 0; i < reps; i += 1 {
        func(i);
      }

      let elapsed = mono::elapsed(now);

      println(str::concat(descriptor, " took ", elapsed, " seconds"));
    }
  }
}
