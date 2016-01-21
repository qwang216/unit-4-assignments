//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*


Work on your solutions here.

Link: https://docs.google.com/document/d/1XioaEqk6VqUPA-ccQhkqP3eAoDthxYyOM9vSPB7fDkg/edit#heading=h.uopysoy45zmw

*/


// 1) Given a partially filled in Sudoku board and a set of coordinates in that board pointing to an empty square, write a function that returns a list containing all numbers that the empty square could be.

func getAllColArrayIndex(paramCol: Int) -> [String: [Int]] {
    // grab all the index Array that are associated with col
    let col = paramCol-1
    var xArray = [Int]()
    var xNumber = (col)/3
    xArray.append(xNumber)
    xNumber += 3
    xArray.append(xNumber)
    xNumber += 3
    xArray.append(xNumber)
    var xArrayAtIndex = [Int]()
    if (col % 3 == 0) {
        xArrayAtIndex.appendContentsOf([0,3,6])
    } else if (col % 3 == 1) {
        xArrayAtIndex.appendContentsOf([1,4,7])
    } else {
        xArrayAtIndex.appendContentsOf([2,5,8])
    }
    
    return ["sudokuSmallBox": xArray, "indexNumber":xArrayAtIndex]
}

func getAllRowArrayIndex(paramRow: Int) -> [String: [Int]] {
    // grab all the index Array that are associated with row
    let row = paramRow - 1
    var yArray = [Int]()
    var yNumber = (row)/3
    yArray.append(yNumber)
    yNumber += 1
    yArray.append(yNumber)
    yNumber += 1
    yArray.append(yNumber)
    
    // grall all the index number that are row Array
    var yArrayAtIndex = [Int]()
    if(row % 3 == 0){
        yArrayAtIndex.appendContentsOf([0,1,2])
    } else if (row % 3 == 1) {
        yArrayAtIndex.appendContentsOf([3,4,5])
    } else {
        yArrayAtIndex.appendContentsOf([6,7,8])
    }
    
    return ["sudokuSmallBox":yArray, "indexNumber":yArrayAtIndex]
}

func getValidNumbers(sudokuBoard: [[Int]], row: Int, col: Int) -> Set<Int>{
    let colDictionary = getAllColArrayIndex(col)
    let rowDictionary = getAllRowArrayIndex(row)
    
    var colValue = [Int]()
    for i in colDictionary["sudokuSmallBox"]! {
        for j in colDictionary["indexNumber"]! {
            colValue.append(sudokuBoard[i][j])
        }
    }
    
    var rowValue = [Int]()
    for i in rowDictionary["sudokuSmallBox"]! {
        for j in rowDictionary["indexNumber"]! {
            rowValue.append(sudokuBoard[i][j])
        }
    }
    
    let combinedRowColValue = Set(colValue).union(Set(rowValue))
    let completeNumber = Set([0,1,2,3,4,5,6,7,8,9])
    
    return completeNumber.subtract(combinedRowColValue)
}

let sudokuBoard =   [[5,0,8,9,0,0,0,0,0],
                    [0,7,3,6,0,0,9,0,8],
                    [1,9,0,4,0,8,0,3,5],
                    [0,7,0,0,0,2,0,1,0],
                    [0,0,0,0,0,0,0,0,0],
                    [0,6,0,9,0,0,0,8,0],
                    [1,9,0,2,0,3,0,8,7],
                    [3,0,6,0,0,7,1,9,0],
                    [0,0,0,0,0,9,3,0,4]]
getValidNumbers(sudokuBoard, row: 4, col: 4)



// 2) rotate a matrix by ninety degrees
//      Input: matrix:[[Int]]
//      Output: matrix: [[Int]]
//
//      Sample Input: [[1,2,3,4],
//                      [5,6,7,8],
//                      [9,0,1,2],
//                      [3,4,5,6]]
//
//      Sample Output: [[3,9,5,1],
//                      [4,0,6,2],
//                      [5,1,7,3],
//                      [6,2,8,4]]

func rotateMatrixNinetyDegree(matrix: [[Int]]) -> [[Int]] {
    var rotatedMatrix = [[Int]]()
    for i in 0..<matrix[0].count {
        var rowMatrix = [Int]()
        for j in 0..<matrix.count {
            rowMatrix.insert(matrix[j][i], atIndex: 0)
        }
        rotatedMatrix.append(rowMatrix)
    }
    
    return rotatedMatrix
}
let matrix = [[1,2,3,4],
            [5,6,7,8],
            [9,0,1,2],
            [3,4,5,6]]
rotateMatrixNinetyDegree(matrix)


// 3) Design an optimal algorithm for sorting four elements A, B, C, and D. By optimal, I mean one that sorts using the minimum number of comparisons. Hint: you may want to start by putting the first two items in order and the last two items in order... that takes two comparisons. How many more comparisons do you need to find the minimum element? The maximum? Once you’ve found the min and max, what if any additional comparisons are needed?


// Once the the first two and the last two are in order then compare the 3rd element with the 2nd element. If the 3rd element is greater than 2nd element then four elements are in order, if not then switch 3rd and 2nd element. If additional comparision are needed then I would compare the first and the last element.
