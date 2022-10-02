#if swift(>=5.7)
  import Clocks

  @available(iOS 16.0, *)
  extension DependencyValues {
    public var continuousClock: any Clock<Duration> {
      get { self[ContinuousClockKey.self] }
      set { self[ContinuousClockKey.self] = newValue }
    }
    public var suspendingClock: any Clock<Duration> {
      get { self[SuspendingClockKey.self] }
      set { self[SuspendingClockKey.self] = newValue }
    }

    private enum ContinuousClockKey: DependencyKey {
      static let liveValue: any Clock<Duration> = ContinuousClock()
      static let testValue: any Clock<Duration> = UnimplementedClock(label: "ContinuousClock")
    }
    private enum SuspendingClockKey: DependencyKey {
      static let liveValue: any Clock<Duration> = SuspendingClock()
      static let testValue: any Clock<Duration> = UnimplementedClock(label: "SuspendingClock")
    }
  }
#endif