@main
struct TestRunner {
    static func main() {
        let signalcase_1 = Signal(demand: 59, capacity: 76, latency: 9, risk: 18, weight: 8)
        precondition(Policy.score(signalcase_1) == 92)
        precondition(Policy.classify(signalcase_1) == "review")
        let signalcase_2 = Signal(demand: 66, capacity: 89, latency: 17, risk: 6, weight: 11)
        precondition(Policy.score(signalcase_2) == 184)
        precondition(Policy.classify(signalcase_2) == "accept")
        let signalcase_3 = Signal(demand: 83, capacity: 103, latency: 10, risk: 5, weight: 12)
        precondition(Policy.score(signalcase_3) == 255)
        precondition(Policy.classify(signalcase_3) == "accept")
        let domainReview = DomainReview(signal: 57, slack: 33, drag: 16, confidence: 93)
        precondition(DomainReviewLens.score(domainReview) == 192)
        precondition(DomainReviewLens.lane(domainReview) == "ship")
    }
}
