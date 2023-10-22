use time.mono;

export class {
  new(self) {
    self.elapsed = 0;
  }

  fn start(self) {
    self.timestamp = mono.now();
  }

  fn stop(self) {
    if self.timestamp {
      self.elapsed += mono.elapsed(self.timestamp);
      self.timestamp = nil;
    }
  }
}