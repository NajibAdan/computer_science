class Knight
    #a list of hard coded moves the knight can make. Its basic move is two steps forward and one step to the side on any direction
    VALID_MOVES = [
      [-2, -1],
      [-1, -2],
      [ 1, -2],
      [ 2, -1],
      [ 2,  1],
      [ 1,  2],
      [-1,  2],
      [-2,  1]
   ]

   #creates the Knight class given the start and end position
    def initialize(currentPosition,destination)
        @currentPosition = currentPosition
        @destination = destination
    end

    # finds the shortest path or returns an empty array if the end is the start position
    def find_path()
        visited = Array.new(8) {Array.new(8)}
        return [] if @destination == @currentPosition
        paths = [[@currentPosition]]
        visited[@currentPosition[0]][@currentPosition[1]] = true

        until paths.empty?
            new_paths = []
            paths.each do |path|
                next_positions = possibleMoves(path.last, visited)
                next_positions.each do |move|
                    newpath = path.dup << move
                    if move == @destination #if we reached our destination stop and return the path
                        return newpath
                    end
                     visited[move[0]][move[1]] = true
                    new_paths.push(newpath)
                end
            end
            paths = new_paths
        end
    end

    #returns all the possible moves at a given tile
    def possibleMoves(arr,visited)
        moves = []
        VALID_MOVES.each do |x,y|
            if valid?([arr[0]+x,arr[1]+y],visited)
                moves.push([arr[0]+x,arr[1]+y])
            end
        end
        return moves
    end

    # returns all the valid moves from the given list of possible moves
    def valid?(move,visited)
        return true if (move[0]>-1 &&  move[0]<8) && (move[1]>-1 && move[0]<8) && (!visited[move[0]][move[1]])
    end
end



