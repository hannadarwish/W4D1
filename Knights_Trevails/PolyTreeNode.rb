require_relative "KnightPathFinder.rb"
class PolyTreeNode

    attr_reader :root_node, :parent, :children

    def initialize(start_position)
        @root_node = start_position
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        if self.parent == nil
            @parent = new_parent
            new_parent.children << self
        else
            self.parent.children.delete(self)
            if new_parent != nil
                new_parent.children << self
            end
            @parent = new_parent
        end
    end
    def add_child(new_child)
        self.children << new_child if !self.children.include?(new_child)
        new_child.parent = self 
    end
    def remove_child(child)
        self.children.delete(child) 
        child.parent = nil 
    end
        

end