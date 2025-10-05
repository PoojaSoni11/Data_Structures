//
//  BSTProblems.swift
//  LearningApp
//
//  Created by Pooja Soni on 30/09/25.
//

import Foundation

class BinaryNode<T> {
    var val : T
    var left : BinaryNode?
    var right: BinaryNode?
    
    public init(_ val: T) {
        self.val = val
    }
    
    func InOrderTraversal(visit: (T) -> Void){
        // 1. Traverse the left child first
        left?.InOrderTraversal(visit: visit)
        
        // 2. Finally, visit the current node itself.
        visit(val)
        
        // 3. Then, traverse the right child.
        right?.InOrderTraversal(visit: visit)
    }
    
    func PreOrderTraversal(visit: (T) -> Void){
        //1.Finally, visit the current node itself.
        visit(val)
        
        //2. Traverse the left child first
        left?.PreOrderTraversal(visit: visit)
        
        //3. Traverse the right child first
        right?.PreOrderTraversal(visit: visit)
    }
    
    func PostOrderTraversal(visit: (T) -> Void){
        //1. Traverse the left child first
        left?.PostOrderTraversal(visit: visit)
        
        //2. Traverse the right child first
        right?.PostOrderTraversal(visit: visit)
        
        //3.Finally, visit the current node itself.
        visit(val)
    }
    
    func LevelOrderTraversal(root: BinaryNode?, visit: (T) -> Void){
        guard root != nil else {return}
        var queue: [BinaryNode] = []
       
        queue.append(root!)
        
        while(!queue.isEmpty) {
            let temp = queue.removeFirst()
            visit(temp.val)
            
            if temp.left != nil {
                queue.append(temp.left!)
            }
            
            if temp.right != nil {
                queue.append(temp.right!)
            }
        }
    }
}

class BinaryTree {
    func createBinaryTree() {
        let root = BinaryNode("a")
        let node1 = BinaryNode("b")
        let node2 = BinaryNode("c")
        let node3 = BinaryNode("d")
        let node4 = BinaryNode("e")
        let node5 = BinaryNode("f")
        let node6 = BinaryNode("g")
        
        // --- Create a sample binary tree ---
        //         a
        //       /   \
        //      b     e
        //     / \   / \
        //    c   d f   g
        
        root.left = node1 // b
        node1.left = node2 // c
        node1.right = node3 // d
        
        root.right = node4
        node4.left = node5
        node4.right = node6
        
        
        print("Level Order Traversal :")
        var resultLevel: [String] = []
        root.LevelOrderTraversal(root: root, visit: { value in
            resultLevel.append(value)
        })
        print(resultLevel.map { String($0) }.joined(separator: " -> "))
        
        // --- Perform In-Order the traversal ---
        print("In-Order Traversal (Recursive):")
        var result: [String] = []
        root.InOrderTraversal { value in
            result.append(value)
        }
        print(result.map { String($0) }.joined(separator: " -> "))
        
        // --- Perform Pre-Order the traversal ---
        print("PreOrder Traversal (Recursive):")
        var resultPreOrder: [String] = []
        root.PreOrderTraversal { value in
            resultPreOrder.append(value)
        }
        print(resultPreOrder.map { String($0) }.joined(separator: " -> "))
        
        // --- Perform Post-Order the traversal ---
        print("PostOrder Traversal (Recursive):")
        var resultPostOrder: [String] = []
        root.PostOrderTraversal { value in
            resultPostOrder.append(value)
        }
        print(resultPostOrder.map { String($0) }.joined(separator: " -> "))
        
        
        // --- Example Usage ---
        print("\nPost-Order Traversal (Iterative):")
        let iterativeResult = postOrderTraversalIterative(root)
        print(iterativeResult.map { String($0) }.joined(separator: " -> "))
        
        // --- Example Usage ---
        print("\nPost-Order Traversal (Iterative): USing Two Stacks")
        let iterativeResult1 = postOrderTraversalUSingTwoStacks(root)
        print(iterativeResult1.map { String($0) }.joined(separator: " -> "))

        // Expected Output:
        // Post-Order Traversal (Iterative):
        // 4 -> 5 -> 2 -> 6 -> 7 -> 3 -> 1
    }
    
    func InOrderUSingIteration() {
        
    }
    
    /// Performs an iterative post-order traversal on a binary tree.
    /// - Parameter root: The root node of the tree.
    /// - Returns: An array of values in post-order.
    func postOrderTraversalIterative<T>(_ root: BinaryNode<T>?) -> [T] {
        guard let root = root else { return [] }
        
        var stack = [root]
        var result: [T] = []
        
        while !stack.isEmpty {
            let node = stack.popLast()!
            
            // Add the value to the front of the result list
            result.insert(node.val, at: 0)
            
            // Push left child first, so right child is processed first
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        return result
    }
    
    func postOrderTraversalUSingTwoStacks<T>(_ root: BinaryNode<T>?) -> [T] {
        guard let root = root else { return [] }
        var stack: [BinaryNode<T>?] = []
        stack.append(root)
        var auxStack: [BinaryNode<T>?] = []
         
        while !stack.isEmpty {
            let node = stack.popLast()!
            auxStack.append(node)
            
            if let left = node?.left {
                stack.append(left)
            }
            
            if let right = node?.right {
                stack.append(right)
            }
        }
        
        var resultArray:[T] = []
        while(!auxStack.isEmpty){
            let node = auxStack.popLast()!
            resultArray.append(node!.val)
        }
        return resultArray
    }
    
    
    //Ceate Binart Tree
    func createTree(){
        let root = BinaryNode(1)
        let node1 = BinaryNode(2)
        let node2 = BinaryNode(3)
        let node3 = BinaryNode(4)
        let node4 = BinaryNode(5)
        let node5 = BinaryNode(6)
        let node6 = BinaryNode(7)
        
        // --- Create a sample binary tree ---
        //         1
        //       /   \
        //      2     5
        //     / \   / \
        //    3   4 6   7
        
        root.left = node1 // b
        node1.left = node2 // c
        node1.right = node3 // d
        
        root.right = node4
        node4.left = node5
        node4.right = node6
        
        
        
        print("The ZigZag Level tarversal is ::::: \(ZigZagTraversalOfBT(root))")
//        printAllNodesFromRootToPath(root, pathArray: &[], pathIndex: &0)
        
        
        print("The ancestor of a node ::::: \(FindAncestorsOfaNode(root, key: 7))")
        
        print("The least common ancestor is :::: \(LeastCommonAncestor(root, key1: 4, key2: 7)?.val)")
        
        print("Before Adding a New Node:")
        var resultMirro: [Int] = []
        root.LevelOrderTraversal(root: root, visit: { value in
            resultMirro.append(value)
        })
        print(resultMirro.map { String($0) }.joined(separator: " -> "))
        
        print("Create a mirror For ::::: \(createAMirrorOfaTree(root))")
        
        print("After Adding a New Node:")
        var resultMirror: [Int] = []
        root.LevelOrderTraversal(root: root, visit: { value in
            resultMirror.append(value)
        })
        print(resultMirror.map { String($0) }.joined(separator: " -> "))
        
        print("The sum of All the nodes is :::: \(sumOfAllNodesInaBT(root))")
        
        print("Sum Exists in the Binary Tree::::: \(IsSumExists(root, sum: 15))")
        
        print("The level that has maximum Sum is :::::: \(maximumSumInaBT(root))")
        
        searchAnElementUSingIteration(root, key: 6)
        print("The Element which has to find is :::: \(searchAnElementInaTree(root, key: 0))")
        
        print("The Size of a Binary Tree is ::::: \(sizeOfaBinaryTreeUsingIteration(root))")
        print("The Size of a Binary Tree using Recursion:::: \(sizeOfABinaryTreeUSingRecursion(root))")
        
        
        print("\nInsert An ELement (Recursion): ")
    
        print("Before Adding a New Node:")
        var resultLevel: [Int] = []
        root.LevelOrderTraversal(root: root, visit: { value in
            resultLevel.append(value)
        })
        print(resultLevel.map { String($0) }.joined(separator: " -> "))
        
        let iterativeResult1 = InsertAnElementUsingRecursion(root, 8)
        print("After Adding a New Node :")
        var result: [Int] = []
        root.LevelOrderTraversal(root: root, visit: { value in
            result.append(value)
        })
        print(result.map { String($0) }.joined(separator: " -> "))
        
        InsertAnElementUSingIteration(root, newNode: BinaryNode(9))
        
        
        print("Before Removing  Node:")
        var resultBefordelete: [Int] = []
        root.LevelOrderTraversal(root: root, visit: { value in
            resultBefordelete.append(value)
        })
        print(resultBefordelete.map { String($0) }.joined(separator: " -> "))
        
        DeleteANodeRecursive(root, key: 3)
        
        print("After Removing Node:")
        var resultAfterdelete: [Int] = []
        root.LevelOrderTraversal(root: root, visit: { value in
            resultAfterdelete.append(value)
        })
        print(resultAfterdelete.map { String($0) }.joined(separator: " -> "))
        
        
        printLevelOrderTreeinReverseOrder(root)
        
        print("Height of a Binary Tree is ::::::: \(heightofaBinaryTreeUsingRecursion(root))")
        heightOfaBinaryTreeUSingIteration(root)
        
        findMaximumElementInaTree(root)
        print("The maximum Element of a tree Using (Recursion) ::::: \(findTheMaximumWithRecursion(root))")
        
        let diameter = diameterOFaBinaryTree(root: root)
        print("Diameter of a Tree is:::::: Height is \(diameter.0) Diameter is::: \(diameter.1)")
        
        print("Check the two BTs ae identical :::::: \(areIdentical(root, node2))")
        
        print("Shortest Path Of a Tree is :::: \(shortestPathOfaTree(root))")
    }
    //_____________________________Programs____________
    //Find the maximum element in a Binary Tree?
    func findMaximumElementInaTree<T>(_ root: BinaryNode<T>?){
        guard let root = root else {return}
        
        var maximum: Int = 0
        var queue : [BinaryNode<T>?] = []
        queue.append(root)
        maximum = root.val as! Int
        
        while(!queue.isEmpty){
            let node = queue.removeFirst()
            
           let currentValue =  node?.val as! Int
            
            if  currentValue > maximum {
                maximum = currentValue
            }
            
            if let left = node?.left {
                queue.append(left)
            }
            
            if let right = node?.right {
                queue.append(right)
            }
        }
        print("The maximum element is :::::: \(maximum)")
    }
    
    func findTheMaximumWithRecursion<T>(_ root: BinaryNode<T>?) -> Int{
        guard let root = root else { return 0 }
        
        let maxi = root.val as! Int
        let leftVal = findTheMaximumWithRecursion(root.left) as Int
        let rightVal = findTheMaximumWithRecursion(root.right) as Int
        
        return max(maxi, max(leftVal,rightVal))
    }
    
    //Search an Element inside a tree
    func searchAnElementInaTree<T>(_ root: BinaryNode<T>?, key: T) -> Bool{
        guard let root = root else { return false }
        
        if let currentVal = root.val as? Int, let keyVal = key as? Int, currentVal == keyVal {
            return true
        }
        
        let leftVal = searchAnElementInaTree(root.left, key: key)
        let rightVal = searchAnElementInaTree(root.right, key: key)
        
        return leftVal || rightVal
    }
    
    func searchAnElementUSingIteration<T>(_ root: BinaryNode<T>?, key: T){
        guard let root = root else { return }
        
        var queue : [BinaryNode<T>?] = []
        queue.append(root)
        var isThere: Bool = false
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if let currentVal = node?.val as? Int, let keyVal = key as? Int, currentVal == keyVal {
                isThere = true
                break
            }
            
            if let left = node?.left {
                queue.append(left)
            }
            
            if let right = node?.right {
                queue.append(right)
            }
        }
        
        print("The search Element using Iteration is :::: \(isThere)")
    }
    
    func sizeOfaBinaryTreeUsingIteration<T>(_ root: BinaryNode<T>?) -> Int{
        guard let root = root else { return 0 }
        
        var count : Int = 0
        var queue: [BinaryNode<T>] = []
        queue.append(root)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            count += 1
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        return count
    }
    
    func sizeOfABinaryTreeUSingRecursion<T>(_ root: BinaryNode<T>?) -> Int {
        guard let root = root else { return 0 }
        return 1 + sizeOfABinaryTreeUSingRecursion(root.left) + sizeOfaBinaryTreeUsingIteration(root.right)
    }
    
    func InsertAnElementUsingRecursion<T>(_ root: BinaryNode<T>?, _ key:T) -> BinaryNode<T> {
        guard let root = root else {
            return BinaryNode(key)
        }
        root.left = InsertAnElementUsingRecursion(root.left, key)
        return root
    }
    
    func InsertAnElementUSingIteration<T>(_ root: BinaryNode<T>?, newNode: BinaryNode<T>?){
        var queue: [BinaryNode<T>?] = []
        var result: [Int] = []
        if root == nil {
            queue.append(newNode)
        }else {
            queue.append(root)
            
            while(!queue.isEmpty) {
                let node = queue.removeFirst()
                result.append(node?.val as! Int)
                
                if node?.left == nil {
                    node?.left = newNode
                    result.append(newNode?.val as! Int)
                    break
                }else {
                    queue.append(node?.left)
                }
            }
            print(result.map { String($0) }.joined(separator: " -> "))
        }
    }
    
    func DeleteANodeRecursive<T>(_ rootNode: BinaryNode<T>?, key: T) -> BinaryNode<T>? {
        var root: BinaryNode<T>? = rootNode
        if root == nil {
            return nil
        } else {
            let node = root?.val as! Int
            let keyVal =  key as! Int
            
            if node == keyVal {
                if root?.left == nil && root?.right == nil {
                    root = nil
                }else if root?.left == nil {
                    root = root?.right
                }else if root?.right == nil {
                    root = root?.left
                }else {
                    let deepestNode = deepestNode(node: root?.left)
                    let temp = root?.val
                    root?.val = deepestNode.val
                    deepestNode.val = temp!
                    return DeleteANodeRecursive(deepestNode, key: key)
                }
            }
            
            root?.left = DeleteANodeRecursive(root?.left, key: key)
            root?.right = DeleteANodeRecursive(root?.right, key: key)
            return root
        }
    }
    
    func deepestNode<T>(node: BinaryNode<T>?) -> BinaryNode<T> {
        var queue : [BinaryNode<T>?] = []
        queue.append(node)
        
        var temp: BinaryNode<T>?
        
        while (!queue.isEmpty){
            temp = queue.removeFirst()!
            
            if let left = temp?.left {
                queue.append(left)
            }
            
            if let right = temp?.right {
                queue.append(right)
            }
        }
        return temp!
    }
    
    func printLevelOrderTreeinReverseOrder<T>(_ root : BinaryNode<T>?){
        guard let root = root else { return }
        
        var queue: [BinaryNode<T>?] = []
        var stack: [BinaryNode<T>?] = []
       
        queue.append(root)
        while !queue.isEmpty {
            let poppedNode = queue.removeFirst()
            
            stack.append(poppedNode)
            
            if let left = poppedNode?.left {
                queue.append(left)
            }
            
            if let right = poppedNode?.right {
                queue.append(right)
            }
        }
        
        while !stack.isEmpty {
            let popped = stack.popLast()
            print("\(popped??.val)")
        }
    }
    
    func heightofaBinaryTreeUsingRecursion<T>(_ root : BinaryNode<T>?) -> Int {
        guard let root = root  else { return 0}
        
        let left = heightofaBinaryTreeUsingRecursion(root.left)
        let right = heightofaBinaryTreeUsingRecursion(root.right)
        
        return 1 + max(left,right)
    }
    
    func heightOfaBinaryTreeUSingIteration<T>(_ root : BinaryNode<T>?) {
        guard let root = root else { return }
        
        var queue: [BinaryNode<T>?] = []
        var height: Int = 0
        queue.append(root)
        queue.append(nil)
        
        while !queue.isEmpty {
            let poppedNode = queue.removeFirst()
            
            if poppedNode == nil {
                if !queue.isEmpty {
                    queue.append(nil)
                }
                height += 1
            }
            
            if let left = poppedNode?.left {
                queue.append(left)
            }
            
            if let right = poppedNode?.right {
                queue.append(right)
            }
        }
        
        print("The height Of a Binary Tree Using Iteration ::::::: \(height)")
    }
    
    func diameterOFaBinaryTree<T>(root: BinaryNode<T>?) -> (Int,Int){
        guard let root = root else { return (0,0) }
        
        let left = diameterOFaBinaryTree(root: root.left)
        let right = diameterOFaBinaryTree(root: root.right)
         //(left.0 -> Hieght , left.1 -> Diameter)
        let height = max(left.0 , right.0) + 1
        
        let withoutNodes = left.0 + right.0
        let withNodes = max(left.1, right.1)
        
        let diameter = max(withoutNodes, withNodes)
        
        return (height,diameter)
    }
    
    //check whether two Trees are identical
    func areIdentical<T>(_ root1 : BinaryNode<T>? , _ root2: BinaryNode<T>?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }
        
        if root1 == nil || root2 == nil {
            return false
        }
        
        let data1 = root1?.val as! Int
        let data2 = root2?.val as! Int
        
        return data1 == data2 && areIdentical(root1?.left, root2?.left) && areIdentical(root1?.right, root2?.right)
    }
    
    ///find the level that has maximum sum in a BT
    func maximumSumInaBT<T>(_ root: BinaryNode<T>?) -> Int {
        guard let root =  root else { return 0}
        
        var level: Int = 0
        var maxSumLevel = 0
        var maxSum = 0
        var levelSum: Int = 0
        var queue: [BinaryNode<T>?] = []
        queue.append(root)
        queue.append(nil)
        
        while !queue.isEmpty {
            let popped = queue.removeFirst()
            
            if popped == nil {
                level += 1
                levelSum = max(maxSum, levelSum)
                if(levelSum > maxSum){
                    maxSum = levelSum
                    maxSumLevel = level
                }
                if !queue.isEmpty {
                    queue.append(nil)
                }
                levelSum = 0
            }else{
                if let value = popped?.val as? Int{
                    levelSum += value
                }
            }
            
            if let left = popped?.left {
                queue.append(left)
            }
            
            if let right = popped?.right {
                queue.append(right)
            }
        }
        return maxSumLevel
    }
    
    //Find the shortest Path of a tree
    func shortestPathOfaTree<T>(_ root: BinaryNode<T>?) -> Int {
        guard let root = root else {return 0}
        
        if root.left == nil && root.right == nil{
            return 1
        }else if root.left == nil {
            return 1 + shortestPathOfaTree(root.right)
        }else if root.right == nil {
            return 1 + shortestPathOfaTree(root.left)
        }else {
            let left = shortestPathOfaTree(root.left)
            let right = shortestPathOfaTree(root.right)
            
            return min(left,right) + 1
        }
    }
    
    //Check whether given sum exists in any path of a BT
    func IsSumExists<T>(_ root: BinaryNode<T>?, sum:Int) -> Bool {
        guard let root = root else { return sum == 0}
        
        let remainingSum = sum - (root.val as! Int)
        
        return IsSumExists(root.left, sum: remainingSum) || IsSumExists(root.right, sum: remainingSum)
    }
    
    //Sum of all elements in A Binary tree
    func sumOfAllNodesInaBT<T>(_ root : BinaryNode<T>?) -> Int {
        guard let root = root else {return 0}
        return root.val as! Int + sumOfAllNodesInaBT(root.left) + sumOfAllNodesInaBT(root.right)
    }
    
    
    func checkIFTwoBTAreMirrorOFEachOther<T>(_ root1: BinaryNode<T>?, _ root2: BinaryNode<T>?) -> Bool {
        
        if root1 == nil && root2 == nil {
            return true
        }else if root1 == nil || root2 == nil {
            return false
        }else if root1?.val as! Int != root2?.val as! Int {
            return false
        }else {
            return checkIFTwoBTAreMirrorOFEachOther(root1?.left, root2?.right) && checkIFTwoBTAreMirrorOFEachOther(root1?.right, root2?.left)
        }
    }
    
    func createAMirrorOfaTree<T>(_ root: BinaryNode<T>?) -> BinaryNode<T>? {
        guard let root = root else { return nil}
        
        _ = createAMirrorOfaTree(root.left)
        _ = createAMirrorOfaTree(root.right)
        
        let temp = root.left
        root.left = root.right
        root.right = temp
        
        return root
    }
    
    //LEast common ancestor of two nodes
    func LeastCommonAncestor<T>(_ root: BinaryNode<T>?,  key1: Int, key2: Int) -> BinaryNode<T>? {
        guard let root = root else { return nil }
        
        if root.val as! Int == key1 || root.val as! Int == key2 {
            return root
        }
        
        let left = LeastCommonAncestor(root.left, key1: key1, key2: key2)
        let right = LeastCommonAncestor(root.right, key1: key1, key2: key2)
        
        if left != nil && right != nil {
            return root
        }
        
        if left != nil {
            return left
        }
        
        if right != nil {
            return right
        }
        
        return root
    }
    
    func FindAncestorsOfaNode<T>(_ root: BinaryNode<T>?, key: Int) -> Bool{
        guard let root = root else { return false}
        
        if root.val as! Int == key || FindAncestorsOfaNode(root.left, key: key) || FindAncestorsOfaNode(root.right, key: key) {
            
            print("\(root.val)")
            return true
        }
        
        return false
    }
    
    
    func printAllNodesFromRootToPath<T>(_ root: BinaryNode<T>?, pathArray: inout [Int], pathIndex: inout Int) {
        guard let root = root else { return }
        
        pathIndex += 1
        pathArray[pathIndex] = root.val as! Int
        
        if root.left == nil && root.right == nil {
            print(pathArray)
        }else {
            printAllNodesFromRootToPath(root.left, pathArray: &pathArray, pathIndex: &pathIndex)
            printAllNodesFromRootToPath(root.right, pathArray: &pathArray, pathIndex: &pathIndex)
        }
    }
    
    func ZigZagTraversalOfBT<T>(_ root: BinaryNode<T>?) -> [[Int]] {
        // Handle the edge case of an empty tree.
        guard let root = root else {
            return []
        }
        
        // The final result array.
        var result: [[Int]] = []
        
        // Two stacks to manage nodes for current and next levels.
        var currentLevelStack: [BinaryNode<T>] = []
        var nextLevelStack: [BinaryNode<T>] = []
        
        // A flag to determine the traversal direction.
        var leftToRight = true
        
        // Start with the root node.
        currentLevelStack.append(root)
        
        while !currentLevelStack.isEmpty {
            var currentLevelValues: [Int] = []
            
            // Process all nodes in the current level stack.
            while let node = currentLevelStack.popLast() {
                currentLevelValues.append(node.val as! Int)
                
                // Push children to the next level stack based on direction.
                if leftToRight {
                    // For left-to-right, push left child then right child.
                    // This ensures the next level is processed right-to-left.
                    if let leftChild = node.left {
                        nextLevelStack.append(leftChild)
                    }
                    if let rightChild = node.right {
                        nextLevelStack.append(rightChild)
                    }
                } else {
                    // For right-to-left, push right child then left child.
                    // This ensures the next level is processed left-to-right.
                    if let rightChild = node.right {
                        nextLevelStack.append(rightChild)
                    }
                    if let leftChild = node.left {
                        nextLevelStack.append(leftChild)
                    }
                }
            }
            
            // Add the collected values for the completed level to the result.
            result.append(currentLevelValues)
            
            // Prepare for the next level.
            currentLevelStack = nextLevelStack
            nextLevelStack = [] // Clear the next level stack for the next iteration.
            leftToRight.toggle() // Flip the direction.
        }
        
        return result
    }
    
    
}

















struct Queue<T> {
    var queue: [T] = []
    
    /// Checks if the queue is empty.
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    /// Returns the number of elements in the queue.
    public var count: Int {
        return queue.count
    }
    
    
    mutating func push(_ val: T){
        queue.append(val)
    }
    
    mutating func pop() -> T?{
        guard !queue.isEmpty else {return nil}
        
        return queue.removeFirst()
    }
    
    /// Returns the element at the front of the queue without removing it.
    public var peek: T? {
        return queue.first
    }
}
