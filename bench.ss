req "timer" as Timer;

export mod bench {
  fn benchmark(descriptor, reps, func) {
    if !str.is_prefix(descriptor, "DISABLED") {
      println "running " + descriptor;
      let timer = Timer();

      for let i = 0; i < reps; i += 1 {
        timer.start();
        func(i);
        timer.stop();
      }

      println descriptor + " took " + (timer.elapsed / reps) + " seconds";
    }
  }
}
