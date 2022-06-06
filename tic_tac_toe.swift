import Foundation



func checkRows(_ board: inout [String], _ shape: String) -> Bool {
    var rowCount: Int = 0
    
    for row in stride(from: 0, through: 6, by: 3) {
        for col in 0...2 {
            if(board[row + col] == shape) { rowCount += 1 }
        }

        if(rowCount == 3) { 
            break 
        }

        rowCount = 0
    }

    if(rowCount == 3) { return true } else { return false }

}

func checkCols(_ board: inout [String], _ shape: String) -> Bool {
    var colCount: Int = 0
    
    for col in 0...2 {
        for row in stride(from: 0, through: 6, by: 3) {
            if(board[col + row] == shape) { colCount += 1 }
        }
    
        if(colCount == 3) { 
            break 
        }

        colCount = 0
    }

    if(colCount == 3) { return true } else { return false }

}

func checkDiags(_ board: inout [String], _ shape: String) -> Bool {
    var diagCount: Int = 0

    for diag in stride(from: 0, through: 8, by: 4) {
        if(board[diag] == shape) { diagCount += 1 }
    }

    if(diagCount == 3) { return true }
    else {
        diagCount = 0
        for diag in stride(from: 2, through: 6, by: 2) {
            if(board[diag] == shape) { diagCount += 1 }
    }

    if(diagCount == 3) { return true } else { return false }

    }
}

func checkAll(_ player: String, _ points: inout Int, _ movesCount: inout Int, _ board: inout [String], _ shape: String) -> Bool {
    var flag: Bool = false

    if(checkRows(&board, shape) == true) {
        points += 1
        print("GAME OVER! \(player) won!")
        print("Press button to exit.")
        while let delay = readLine() {
            flag = true
            break
        }     
    }
    else if(checkCols(&board, shape) == true) {
        points += 1
        print("GAME OVER! \(player) won!")
        print("Press button to exit.")
        while let delay = readLine() {
            flag = true
            break
        }
    }
    else if(checkDiags(&board, shape) == true) {
        points += 1
        print("GAME OVER! \(player) won!")
        print("Press button to exit.")
        while let delay = readLine() {
            flag = true
            break
        }
    }   
    else if(movesCount == 9) {
        print("GAME OVER! It comes to an end with tie.")
        print("Press button to exit.")
        while let delay = readLine() {
            flag = true
            break
        }
    }

    return flag 
}

//----------------------------------------------------------------------

class Board {
    var board3x3: [String] = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    init() { }

      func drawBoard() -> Void {
        print("\(self.board3x3[0]) | \(self.board3x3[1]) | \(self.board3x3[2])")
        print("----------")
        print("\(self.board3x3[3]) | \(self.board3x3[4]) | \(self.board3x3[5])")
        print("----------")
        print("\(self.board3x3[6]) | \(self.board3x3[7]) | \(self.board3x3[8])")
    }

}

  func move(_ location: Move) -> Board {
         var tempPosition = position
         tempPosition[location] = turn
         return Board(position: tempPosition, turn: turn.opposite, lastMove: location)
     }

// Find the best possible outcome for originalPlayer
 func minimax(_ board: Board, maximizing: Bool, originalPlayer: Piece) -> Int {
     // Base case - evaluate the position if it is a win or a draw
     if board.isWin && originalPlayer == board.turn.opposite { return 1 } // win
     else if board.isWin && originalPlayer != board.turn.opposite { return -1 } // loss
     else if board.isDraw { return 0 } // draw
  
     // Recursive case - maximize your gains or minimize the opponent's gains
     if maximizing {
         var bestEval = Int.min
         for move in board.legalMoves { // find the move with the highest evaluation
             let result = minimax(board.move(move), maximizing: false, originalPlayer: originalPlayer)
             bestEval = max(result, bestEval)
         }
         return bestEval
     } else { // minimizing
         var worstEval = Int.max
         for move in board.legalMoves {
             let result = minimax(board.move(move), maximizing: true, originalPlayer: originalPlayer)
             worstEval = min(result, worstEval)
         }
         return worstEval
     }
 }
  

  func findBestMove(_ board: Board) -> Move {
     var bestEval = Int.min
     var bestMove = -1
     for move in board.legalMoves {
         let result = minimax(board.move(move), maximizing: false, originalPlayer: board.turn)
         if result > bestEval {
             bestEval = result
             bestMove = move
         }
     }
     return bestMove
 } 

class Player {
    var name: String
    var points: Int
    var shape: String = ""

    init(_ name: String, _ points: Int) {
        self.name = name
        self.points = points
    }

    func showInfo() -> String {
        return "\(self.name) | \(self.points) point(s)"
    }

    // funckja ruchu użytkownika
    func playerMove(_ shape: String, _ board: inout Board, _ gameFields: inout [Int], _ movesCount: inout Int) -> Bool {
        var gameFlag: Bool = true

        print("\(self.name), choose field [1:9]")
        while let inputFieldStr = readLine() {
            if let inputField = Int(inputFieldStr) {
                guard (inputField<1 || inputField>9) else {
                    
                    if !gameFields.contains(inputField) {
                        system("clear")
                        print("\(self.name) has chosen: \(inputField)")

                        board.board3x3[inputField-1] = shape

                        board.drawBoard()                        

                    // pokazać pole gry

                        gameFields.append(inputField)
                        movesCount += 1
                    
                        break

                        } else {
                        print("Field already occupied! Try again.")
                        continue
                    }
                    
                }

            print("Error! Wrong input. Try again.")
            print("Choose field [1:9]")
            continue
            }
        }

      //sprawdzic warunki gry i wysłać odpowiednie flagi
            if(checkAll(self.name, &self.points, &movesCount, &board.board3x3, shape) == true) {
                gameFlag = false
            }
            else {
                gameFlag = true
            }

        return gameFlag
    }
}


class Menu { 
    var game: Game = Game()
    var players: [Player] = []
    var names: [String] = []

    init() {
        system("clear")
        print("Menu")
        print("1. Start game")
        print("2. Add player")
        print("3. Leaderboard")
        print("4. About")
        print("")
        print("Choose option:")

        while let tmpMenuChoice = readLine() {
            if let menuChoice = Int(tmpMenuChoice) {
                guard(menuChoice<1 || menuChoice>4) else {                    

                    switch (menuChoice) {
                        case 1:
                            if(players.count>=2) { 
                                self.game = Game(self.players) 
                            } 
                            else { 
                                system("clear")
                                print("There is too few players to begin the game!")
                                print("Press button to exit.")
                                while let delay = readLine() {
                                    break
                                } 
                            }
                        case 2:
                        self.addPlayer()
                        case 3:
                        self.showLeaderboard()
                        case 0:
                        break
                        default:
                        break

                    }
                    system("clear")
                    print("Menu")
                    print("1. Start game")
                    print("2. Add player")
                    print("3. Leaderboard")
                    print("4. About")
                    print("")
                    print("Choose option:")
                    continue
                }
            }
        }

         
    }
    func addPlayer() -> Void {
        system("clear")
        print("Enter player name:")
        while let tmpName = readLine() {
            guard(tmpName=="" || self.names.contains(tmpName)) else {
                self.players.append(Player(tmpName, 0))
                self.names.append(tmpName)
                print("Player \'\(tmpName)\' has been added.")
                print("")
                print("Do you want to enter new player? [Y/N]")
                if let tmpNew = readLine() {
                    if(tmpNew=="Y" || tmpNew=="y") {
                        system("clear")
                        print("Enter player name:")
                        continue 
                    }
                    else if(tmpNew=="N" || tmpNew=="n") { break }
                    else { break }
                }
                break
            }
            print("Wrong name! Try again")
            continue
        } 
    }

    func showLeaderboard() -> Void {
        system("clear")

        let sorted = self.players.sorted(by: { $0.points > $1.points })


        for(count, player) in sorted.enumerated() {
             print("\(count+1). \(player.showInfo())")
        }

        print("")
        print("Press button to exit.")
        while let delay = readLine() {
            break
        }
    }
}



class Game {
    //var shape: String = "X"
    var gameFields: [Int] = []
    var movesCount: Int = 0

    var allPlayers: [Player] = []
    var gamePlayers: [Player] = []

    var board: Board = Board()

    init() { }

    init(_ allPlayers: [Player]) {
        // można zmienić przekazywanie tablicy gry w inicie
        self.allPlayers = allPlayers

        system("clear")
        print("Which players are competing in this round?")
        print("Choose player's number from the list:")
        print("")
        for (count, player) in self.allPlayers.enumerated() {
            print("\(count+1). \(player.name)")
        }
        print("")
        

        for i in 1...2 {
            print("Player \(i): ")
            while let tmpPlayerNumber = readLine() {
                if let playerNumber = Int(tmpPlayerNumber) {
                    guard((playerNumber-1)>=self.allPlayers.count || playerNumber<=0) else {
                        
                            if(i==2 && self.allPlayers[playerNumber-1].name==self.gamePlayers[0].name) {
                                print("You cannot chose the same player! Try again.")
                                continue
                            } else {
                                self.gamePlayers.append(self.allPlayers[playerNumber-1])
                            }
                            
                        break
                    }
                    print("Wrong number! Try again.")
                    continue
                }
                break
            }
        }
        
        system("clear")
        print("Who chooses Tic Tac Toe shape first? \(self.gamePlayers[0].name) [1] or \(self.gamePlayers[1].name) [2]?")
        while let tmpFirstPlayer = readLine() {
            if let firstPlayer = Int(tmpFirstPlayer) {
                if(firstPlayer==1) {
                    print("\(self.gamePlayers[0].name), choose Tic Tac Toe shape: X or O")
                    while let inputShape = readLine() {
                        guard(!(inputShape=="x" || inputShape=="X" || inputShape=="o" || inputShape=="O")) else {
                            self.gamePlayers[0].shape = inputShape.uppercased()
                            system("clear")
                            if(self.gamePlayers[0].shape == "X") {
                                self.gamePlayers[1].shape = "O"
                                print("\(gamePlayers[0].name) has chosen \'X\'. \(gamePlayers[0].name) begins.")
                                self.board.drawBoard()
                                self.gameLoop(0, 1)
                            }
                            else {
                                self.gamePlayers[1].shape = "X"
                                print("\(gamePlayers[0].name) has chosen \'O\'. \(gamePlayers[1].name) begins.")
                                self.board.drawBoard()
                                self.gameLoop(1, 0)  
                            }
                            break
                        } 
                        
                        print("Error! Wrong player shape. Try again.")
                        print("Choose Tic Tac Toe shape: X or O")
                        continue
                    }
                } 
                else if(firstPlayer==2) {
                    print("\(self.gamePlayers[1].name), choose Tic Tac Toe shape: X or O")
                    while let inputShape = readLine() {
                        guard(!(inputShape=="x" || inputShape=="X" || inputShape=="o" || inputShape=="O")) else {
                            self.gamePlayers[1].shape = inputShape.uppercased()
                            system("clear")
                            if(self.gamePlayers[1].shape == "X") {
                                self.gamePlayers[0].shape = "O"
                                print("\(gamePlayers[1].name) has chosen \'X\'. \(gamePlayers[1].name) begins.")
                                self.board.drawBoard()
                                self.gameLoop(1, 0)
                            }
                            else {
                                self.gamePlayers[0].shape = "X"
                                print("\(gamePlayers[1].name) has chosen \'O\'. \(gamePlayers[0].name) begins.")
                                self.board.drawBoard()
                                self.gameLoop(0, 1)  
                            }
                            break
                        } 
                        print("Error! Wrong player shape. Try again.")
                        print("Choose Tic Tac Toe shape: X or O")
                        continue
                    }
                } else {
                    print("Wrong number! Try again.")
                    continue
                }
            }
            break
        }

    }

    func gameLoop(_ xPlayer: Int, _ oPlayer: Int) -> Void {
        while(true) {
            if(gamePlayers[xPlayer].playerMove(self.gamePlayers[xPlayer].shape, &self.board, &self.gameFields, &self.movesCount)==false) {break}
            if(gamePlayers[oPlayer].playerMove(self.gamePlayers[oPlayer].shape, &self.board, &self.gameFields, &self.movesCount)==false) {break}
        }
    }
}

//let g1 = Game()

let m1 = Menu()

//mainLoop()

 

