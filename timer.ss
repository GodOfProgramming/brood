use std::time::mono;

export class Timer {
  self as struct {
    elapsed: 0,
    timestamp: mono::now(),
  }

  new(self) {
    self.elapsed = 0;
  }

  fn restart(self) {
    self.timestamp = mono::now();
  }

  fn stop(self) {
    if self.timestamp {
      self.elapsed += mono::elapsed(self.timestamp);
      self.timestamp = nil;
    }
  }
}