//
//  LinkedList.swift
//  LearningApp
//
//  Created by Pooja Soni on 25/09/25.
//

import Foundation

class ListNode {
    public var value: Int
    public var next: ListNode?
    
    public init(_ val: Int, _ next: ListNode? = nil){
        self.value =  val
        self.next = next
    }
}

class SampleLinkedList {
    
    var head: ListNode?
    var cycLicHead: ListNode?
    
    func createList() {
        // 1. Create a sample linked list: 1 -> 2 -> 3 -> 4 -> 5
        let node6 = ListNode(6)
        let node5 = ListNode(5,node6)
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3)
        head = ListNode(1, node2)
        
        
        //For Cyclic
        let cycNode1 = ListNode(1)
        let cycNode2 = ListNode(2)
        let cycNode3 = ListNode(3)
        let cycNode4 = ListNode(4)
        let cycNode5 = ListNode(5)
        
        cycNode1.next = cycNode2
        cycNode2.next = cycNode3
        cycNode3.next = cycNode4
        cycNode4.next = cycNode5
        cycNode5.next = cycNode2
        
        cycLicHead = cycNode1
        
        printLinkedList(head: head)
    }
    
    func revertList(head: ListNode?){
        var prev: ListNode? = nil
        var current = head
        
        while (current != nil) {
            let tempNode = current?.next
            current?.next = prev // 1 -> nil
            prev = current
            current = tempNode
        }
        printLinkedList(head: prev)
    }
    
    func printLinkedList(head: ListNode?){
        var current = head
        var result: [Int] = []
        while (current != nil) {
            result.append(current!.value)
            current = current?.next
        }
        print("List :::: \(result)")
    }
    
    func findtheNthNodeFromEnd(head: ListNode?, num: Int){
        //with the help of slow pointer and fast pointer we can achieve this from last
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        for i in 1..<num {
            guard fast != nil else {
                return // Or handle error appropriately
            }
            print("Nth Node Index is :::: \(i)")
            fast = fast?.next
        }
        
        while fast?.next != nil {
            slow = slow?.next
            fast =  fast?.next
        }
        print("N th Node is  :::: \(slow?.value ?? -1)")
    }
    
    func FindTheMiddleOftheLinkedList(){
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        print("The middle of the linked List is :::: \(slow?.value ?? -1)")
    }
    
    func FindTheListIsCircularOrNOT() -> Bool {
        var slow: ListNode? = cycLicHead
        var fast: ListNode? = cycLicHead
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                return true
            }
        }
        return false
    }
    
    func FindTheStartingPointOFCyclicNode() {
        var slow: ListNode? = cycLicHead
        var fast: ListNode? = cycLicHead
        
        var isCyclic: Bool = false
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                isCyclic = true
                break
            }
        }
        
        if isCyclic {
            slow = cycLicHead
            while (slow !== fast) {
                slow = slow?.next
                fast = fast?.next
            }
            print("The starting point of the cyclic list is:::: \(slow?.value)")
        }
    }
    
    func FindLengthOFaCyclicLoop() -> Int{
        var slow: ListNode? = cycLicHead
        var fast: ListNode? = cycLicHead
        
        var isCyclic: Bool = false
        var count: Int = 1
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                isCyclic = true
                break
            }
        }
        
        if isCyclic {
            fast = fast?.next
            while slow !== fast {
                fast = fast?.next
                count += 1
            }
            return count
        }
        return 0
    }
    
    func insertAnElementInASortedLinkedList(newNode: Int) {
        let newAddedNode = ListNode(newNode)
        var current = head
        var prev = head
        
        while current != nil && newAddedNode.value >= current!.value {
            prev = current
            current = current?.next
        }
        
        prev?.next = newAddedNode
        newAddedNode.next = current
        
        printLinkedList(head: prev)
    }
    
    func FindTheIntersectingNodeOFTwoLinkedLinkedLists() -> Int {
        var list1: ListNode?
        var list2: ListNode?
        
        var l1count:Int = 0
        var l2Count :Int = 0
        var diff: Int = 0
        

        //list 1
        let node7 = ListNode(7)
        let node6 = ListNode(6, node7)
        let node5 = ListNode(5, node6)
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2,node3)
        list1 = ListNode(1, node2)
        
        //list 2
        let nodeL1 = ListNode(9,node5)
        list2 = ListNode(8, nodeL1)
        
        var head1: ListNode? = list1
        var head2: ListNode? = list2
        
        while (list1 != nil) {
            l1count += 1
            list1 = list1?.next
        }
        
        while(list2 != nil) {
            l2Count += 1
            list2 = list2?.next
        }
        
        if l2Count > l1count {
            diff = l2Count - l1count
            let temp = head1
            head1 = head2
            head2 = temp
        }else {
            diff = l1count - l2Count
        }
        
        for i in 0..<diff {
            head1 = head1?.next
        }
        
        while head1 != nil && head2 != nil {
            if head1 === head2 {
                return head1?.value ?? -1
            }
            head1 = head1?.next
            head2 = head2?.next
        }
        return -1
    }
    
    func PrintLLFromTheEnd(head: ListNode?) {
        if head == nil {return }
        
        PrintLLFromTheEnd(head: head?.next)
        
        print("The data of the is ::: \(head?.value)")
    }
    
    func PrintLLFromEndUSingStack() {
        if head  == nil { return }
        
        var stack: [Int] = []
        
        while(head != nil) {
            stack.append(head!.value)
            head = head?.next
        }
        
        while let value = stack.popLast() {
            print(value)
        }
    }
    
    func checkWhetherTheLLisOddOrEven(){
        
        if head == nil {return}
        
        var fp = head // 1 -> 2 ->3 -> 4 ->5 -> 6
        
        while fp != nil && fp?.next != nil {
            fp = fp?.next?.next
        }
        
        if fp == nil {
            print("The list is ::::: even")
        }else {
            print("The list is ::::: odd")
        }
        
        
        /*
         Other way to find out the listis even or odd is
         */
        
        var count = 1
        
        if head != nil {
            count += 1
            head = head?.next
        }
        
        if count % 2 == 0 {
            print("The list is ::::: even")
        }else {
            print("The list is ::::: odd")
        }
    }
    
    func mergeTwoLinkedLists(){
        var list1: ListNode?
        var list2: ListNode?

        //list 1
        let node7 = ListNode(7)
        let node6 = ListNode(6, node7)
        let node4 = ListNode(4, node6)
        let node3 = ListNode(3, node4)
        list1 = ListNode(1, node3)
        
        //list 2
        let node5 = ListNode(5)
        list2 = ListNode(2, node5)
        
        var finalLL: ListNode? = ListNode(0)
        
        if list1 == nil {
            finalLL?.next = list2
            return
        }
        
        if list2 == nil {
            finalLL?.next = list1
            return
        }
        
        while(true) {
            if list1 == nil {
                finalLL?.next = list2
                break
            }
            if list2 == nil {
                finalLL?.next = list1
                break
            }
            if (list1?.value ?? 0) <= (list2?.value ?? 0) {
                finalLL?.next = list1
                list1 = list1?.next
            }else {
                finalLL?.next = list2
                list2 = list2?.next
            }
            finalLL = finalLL?.next
            print("data of merged list::: \(finalLL?.value)")
        }
        printLinkedList(head: finalLL?.next)
    }
    
    func ReverseListinPairs() { //reverse Linked List by Data
        var temp: ListNode? = head
        
        while (temp != nil && temp?.next != nil){
            let tempNode = temp?.value
            temp?.value = temp!.next!.value
            temp?.next?.value = tempNode!
            temp = temp?.next?.next
        }
        printLinkedList(head: head)
    }
    
    func ReverseLinkedListInPairsByNode(){
        var current = head
        var temp1: ListNode?, temp2: ListNode? = nil
        
        while current != nil && current?.next != nil {
            if temp1 != nil {
                temp1?.next?.next = current?.next
            }
            
            temp1 = current?.next
            current?.next = current?.next?.next
            temp1?.next = current
            
            if temp2 == nil {
                temp2 = temp1
            }
            current = current?.next
        }
        printLinkedList(head: temp2)
    }
}
