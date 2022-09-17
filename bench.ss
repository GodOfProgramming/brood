req "clock";

fn benchmark(descriptor, reps, func) {
  if !str.is_prefix(descriptor, "DISABLED") {
    print "running " + descriptor;
    let clock = Clock();

    for let i = 0; i < reps; i += 1 {
      clock.start();
      func(i);
      clock.stop();
    }

    print descriptor + " took " + (clock.elapsed() / reps) + " seconds";
  }
}
