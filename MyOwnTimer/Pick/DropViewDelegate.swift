//
//  DropViewDelegate.swift
//  MyOwnTimer
//
//  Created by 김지인 on 2021/10/12.
//

import SwiftUI

struct DropViewDelegate : DropDelegate {
    
    let currentItem: RamenItem //현재 아이템
    @Binding var ramenList: [RamenItem]
    @Binding var draggedItem: RamenItem? //드래그가 되고 있는 아이템
    
    @Binding var isEditModeOne: Bool
    
    //드랍에서 벗어났을 때
    func dropExited(info: DropInfo) {
        print("dropExited!")
    }
    
    //드랍 처리
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    //드랍 변경
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return nil
    }
    //드랍 유효 여부
    func validateDrop(info: DropInfo) -> Bool {
        return true
    }
    //드랍 시작
    func dropEntered(info: DropInfo) {
        
        if !isEditModeOne { return }
        
        guard let draggedItem = self.draggedItem else {
            return
        }
        // 드래깅 된 아이템이랑 현재 내 아이템과 다르면 변경
        if draggedItem != currentItem{
            let from = ramenList.firstIndex(of: draggedItem)!
            let to = ramenList.firstIndex(of: currentItem)! //false로
            withAnimation {
//                self.ramenList.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
                let fromItem = ramenList[from]
                ramenList[from] = ramenList[to]
                ramenList[to] = fromItem
            }
        }

    }
}
