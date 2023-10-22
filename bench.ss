req "timer" as Timer;

export mod {
  fn benchmark(descriptor, reps, func) {
    if !str.is_prefix(descriptor, "DISABLED") {
      print "running " + descriptor;
      let timer = Timer();

      for let i = 0; i < reps; i += 1 {
        timer.start();
        func(i);
        timer.stop();
      }

      print descriptor + " took " + (timer.elapsed / reps) + " seconds";
    }
  }
}
