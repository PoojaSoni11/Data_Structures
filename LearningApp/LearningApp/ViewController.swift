//
//  ViewController.swift
//  LearningApp
//
//  Created by Pooja Soni on 09/09/25.
//

import UIKit

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var titleLable: UILabel!
//    @IBOutlet weak var tableView: UITableView!
    
    var additionOfNumbers: (Int, Int) -> Int = { (num1 , num2) in
        return num1 + num2 ;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        findTheMaxDifference()
//        printaGoodMessage(isMorning: true) { () -> String in
//            assignedNAme(name: "Pooja")
//        }
        
//        printaGoodMessage(isMorning: true, name: "Pooja")
        
//        NetworkService.fetchPostData(<#T##self: NetworkService##NetworkService#>)
        //print("The strings are anagrams ::: \(findingtheAnagrams(s1:"race", s2: "let"))")
        //print("\(longestElementsSequence())")
        
        
        
        
        //:::::LinkedList
//        let linkedList = SampleLinkedList()
//        linkedList.createList()
        //reverse a linked list
//        linkedList.revertList(head: linkedList.head)
        
        //find thenth Node from the end of the linked list
        //linkedList.findtheNthNodeFromEnd(head: linkedList.head, num: 2)
        
        //Find the middle of the linked list
        //linkedList.FindTheMiddleOftheLinkedList()
        
        //Find whether the linked list is cyclic or not
        //print("List is cyclic ::::::: \(linkedList.FindTheListIsCircularOrNOT())")
        
        //Find the starting point/node of linked list if cyclic
        //linkedList.FindTheStartingPointOFCyclicNode()
        
        //Find the length of a cyclic loop in cyclic list
        //print("The Length of a cyclic Linked List::::: \(linkedList.FindLengthOFaCyclicLoop())")
        
        //Insert a new node in a sorted Linked List
        //linkedList.insertAnElementInASortedLinkedList(newNode: 2)
        
        //Find the intersecting node of two singly linked list
        //print("The intersecting node of two singly linked list ::::: \(linkedList.FindTheIntersectingNodeOFTwoLinkedLinkedLists())")
        
        //Print the linked lint from the End
        //linkedList.PrintLLFromTheEnd(head: linkedList.head)
        //Print The LL from end using stacks
        //print("The Linked List from the end is :::: \(linkedList.PrintLLFromEndUSingStack())")
        
        //To check whether the given LL is even /odd
        //linkedList.checkWhetherTheLLisOddOrEven()
        
        //merge Two Singly LinkedList
        //linkedList.mergeTwoLinkedLists()
        
        //Reverse the Linked List in Paris
        //linkedList.ReverseListinPairs()
        
        //Reverse the linked list with nodes
        //linkedList.ReverseLinkedListInPairsByNode()
        
        
        
        
        //_____________________________________________________________________________
        let BST = BinaryTree()
        //BST.createBinaryTree()
        BST.createTree()
    }
    
    
    
    
    func callURL() {
        
    }

    private func registerTableView() {
        
    }
 
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


//Data Structures
extension ViewController {
    //move all the zero to the end
    func moveAlltheZeroToEnd() {
        var array: [Int] = [9, 0, 1, 3, 4, 0, 6, 0, 8, 7]
        var pivot: Int = 0
        for i in 0..<array.count {
            if (array[i] != 0) {
                array[pivot] = array[i]
                pivot = pivot + 1
            }
        }
        print("array is :::: \(array)")
        
        while(pivot < array.count){
            array[pivot] = 0
            pivot = pivot + 1
        }
        print("array is :::: \(array)")
    }

    
    func moveAllZeroOptimized(){
        var array: [Int] = [9, 0, 1, 3, 4, 0, 6, 0, 8, 7]
        var pivot: Int = 0
        for i in 0..<array.count {
            if (array[i] != 0) {
                let temp = array[pivot]
                array[pivot] = array[i]
                array[i] = temp
                pivot = pivot + 1
            }
        }
        print("array is :::: \(array)")
    }
    
    // remove duplicate sorted array
    func removeDuplicatesFromArray() {
        var array: [Int] = [9, 1, 1, 0, 7, 5, 6, 5]
        var pivot: Int = 0
        for i in 0..<array.count {
            if (array[i] != array[pivot]) {
                pivot = pivot + 1
                array[pivot] = array[i]
            }
        }
        print("Duplicate Array is ::: \(array)")
        print("Duplicate array is ::: \(array[0..<pivot])")
    }
    
    func findTheMaxDifference() {
        let array: [Int] = [87,68, 91, 56, 43, 98, 6, 40]
        var min = Int.max
        var diffMax = Int.min;
        
        for i in 0..<array.count {
            if array[i] < min {
                min = array[i]
            } else {
                diffMax = max(diffMax, array[i] - min)
            }
        }
        print("Max Difference is :::: \(diffMax)")
    }
    
    
   
    func printaGoodMessage(isMorning: Bool , name: @autoclosure() -> String) {
        if isMorning {
            print("It is a good morningr for ::: \(name())")
        }
    }
    
    func assignedNAme(name: String) -> String {
        return name
    }
    
    func findingtheAnagrams(s1: String, s2: String) -> Bool {
        var dict: [Character:Int] = [:]
        var count = 1
        for (_, char) in s1.enumerated() {
            if dict.keys.contains(char){
                if let charCount = dict[char] {
                    count = charCount +  1
                }
            }
            dict[char] = count
        }
        
        for (_,char) in s2.enumerated() {
            if dict.keys.contains(char){
                if let charCount = dict[char]{
                    count = charCount - 1
                }
            }
            dict[char] = count
        }
        
        print("The dict is ::: \(dict)")
        return dict.values.allSatisfy {$0 == 0}
    }
    
    //two sun
    
    
    //[0,3,7,2,5,8,4,6,0,1]
    func longestElementsSequence() -> Int{
        var nums = [0,0,1,2,3,4,5,6,7,8]
        guard !nums.isEmpty else {return 0}
        
        var sortedArray = Set(nums).sorted() //[0,0,1,2,3,4,5,6,7,8]
        guard !sortedArray.isEmpty else {return 0}
        
        guard sortedArray.count > 1 else {return 1}
        
        var count: Int = 1, diff = sortedArray[1] - sortedArray[0] //0
        var lastDiffCount : Int = 0
        for i in 0..<sortedArray.count - 1{
            if sortedArray[i+1] - sortedArray[i] == diff {
                count += 1
            }else {
                lastDiffCount = max(lastDiffCount,count)
                count = 1
            }
            diff = sortedArray[i+1] - sortedArray[i]
        }
        print("The largest Sequence is :::: \(max(lastDiffCount,count))")
        return max(lastDiffCount,count)
    }
}



