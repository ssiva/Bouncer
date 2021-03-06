//
//  FilterServiceWordList.swift
//  Bouncer
//
//  Created by Daniel Bernal on 3/10/19.
//  Copyright © 2019 Daniel Bernal. All rights reserved.
//

import Foundation

final class FilterWordListService: FilterService {
    
    private let wordListService: WordListService
    
    // FIXME: Do not use defaults, go for Swinject or DIP to avoid it
    init(wordListService: WordListService = WordListFileStorageService()) {
        self.wordListService = wordListService
    }
    
    func isValidMessage(sender: String?, message: String?) -> Bool {
        guard let sender = sender?.lowercased() else { return false }
        guard let messageBody = message?.lowercased() else { return false }        
        let wordList = wordListService.read()
        
        for word in wordList {
            if sender.contains(word.lowercased()) || messageBody.contains(word.lowercased()) {
                return false
            }
        }
        
        return true
    }
}
