require_relative "PolyTreeNode.rb"

class KnightPathFinder
    attr_reader :start_position, :considered_positions

    def initialize(start_position) # [0, 0]
        @root_node = PolyTreeNode.new(start_position)
        @move_tree = self.build_move_tree(start_position)
        @considered_positions = [] 
    end

    def build_move_tree(start_position)
        # PolyTreeNode.new(start_position)
        # add new nodes to the queue.
        # until queue is empty, keep creating new nodes (until 64)
        # bfs
    end

    def self.valid_moves(pos)
        possible_moves = [] 
        valid_moves = []

        x, y = pos 
        possible_moves << [x+2, y-1]
        possible_moves << [x+1, y-2]
        possible_moves << [x-1, y+2]
        possible_moves << [x-2, y+1]
        possible_moves << [x+1, y+2]
        possible_moves << [x+2, y+1]
        possible_moves << [x-1, y-2]
        possible_moves << [x-2, y-1]

        possible_moves.each do |move|
            if valid_position(move) == true
                valid_moves << move
            end
        end
        return valid_moves
    end

    def valid_position(pos)
        x, y = pos 
        if x.between?(0, 7) && y.between?(0, 7)
            return true
        else
            false
        end
    end
    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        if !@considered_positions.empty?
            @considered_positions.each do |pos| 
                if valid_moves.include?(pos) 
                    valid_moves.delete(pos)
                end
            end
        end
        valid_moves.each do |valid_move|
            @considered_positions << valid_move
        end
    return @considered_positions
    end

end