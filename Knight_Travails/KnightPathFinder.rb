require_relative "PolyTreeNode.rb"

class KnightPathFinder
    attr_reader :start_position, :considered_positions

    def initialize(start_position) # [0, 0]
        @root_node = PolyTreeNode.new(start_position)
        @considered_positions = [] 
        self.build_move_tree
    end

    def build_move_tree 
        queue = [@root_node]
        until queue.empty? 
            node = queue.shift 
            positions = new_move_positions(node.value)
            positions.each do |pos|
                next_node = PolyTreeNode.new(pos)
                node.add_child(next_node) 
                queue << next_node
            end
        end
    end

    def self.valid_position(pos)
        x = pos[0]
        y = pos[1] 
        if x.between?(0, 7) && y.between?(0, 7)
            return true
        else
            false
        end
    end 

    def self.generate_valid_moves(pos)
        possible_moves = [] 
        val_moves = []

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
            if self.valid_position(move) == true
                val_moves << move
            end
        end
        return val_moves
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.generate_valid_moves(pos)
        new_moves = []

        valid_moves.each do |valid_move|
            unless @considered_positions.include?(valid_move)
                new_moves << valid_move
                @considered_positions << valid_move
            end
        end
        new_moves
    end

end