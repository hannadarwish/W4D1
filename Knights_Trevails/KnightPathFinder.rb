require_relative "PolyTreeNode.rb"

class KnightPathFinder
    attr_reader :start_position

    def initialize(start_position) # [0, 0]
        @start_position = start_position
        @move_tree = self.build_move_tree(start_position)
    end
    def build_move_tree(start_position)
        PolyTreeNode.new(start_position)
    end
    def self.valid_moves(pos)
        @considered_positions = [] 
        x, y = pos 
        case x, y 
        when 

    end
    def valid_position(pos)
        x, y = pos 
        if x.between?(0, 7) && y.between?(0, 7)
            return true
        else
            false
        end
    end


    



end