//
//  Copyright © 2017 UserReport. All rights reserved.
//

import Foundation

extension TimeInterval{
    private func secondsToHoursMinutesSeconds () -> (Int?, Int?, Int?) {
        let hrs = self / 3600
        let mins = (self.truncatingRemainder(dividingBy: 3600)) / 60
        let seconds = (self.truncatingRemainder(dividingBy:3600)).truncatingRemainder(dividingBy:60)
        return (Int(hrs) > 0 ? Int(hrs) : nil , Int(mins) > 0 ? Int(mins) : nil, Int(seconds) > 0 ? Int(seconds) : nil)
    }
    
    func stringTime() -> String {
        
        let time = self.secondsToHoursMinutesSeconds()
        
        switch time {
        case (nil, let x? , let y?):
            return "\(x) min \(y) sec"
        case (nil, let x?, nil):
            return "\(x) min"
        case (let x?, nil, nil):
            return "\(x) hr"
        case (nil, nil, let x?):
            return "\(x) sec"
        case (let x?, nil, let z?):
            return "\(x) hr \(z) sec"
        case (let x?, let y?, nil):
            return "\(x) hr \(y) min"
        case (let x?, let y?, let z?):
            return "\(x) hr \(y) min \(z) sec"
        default:
            return "0 sec"
        }
    }
}
