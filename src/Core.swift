struct Signal {
    let demand: Int
    let capacity: Int
    let latency: Int
    let risk: Int
    let weight: Int
}

enum Policy {
    static let threshold = 152
    static let riskPenalty = 6
    static let latencyPenalty = 2
    static let weightBonus = 3

    static func score(_ signal: Signal) -> Int {
        signal.demand * 2 + signal.capacity + signal.weight * weightBonus
            - signal.latency * latencyPenalty - signal.risk * riskPenalty
    }

    static func classify(_ signal: Signal) -> String {
        score(signal) >= threshold ? "accept" : "review"
    }
}
