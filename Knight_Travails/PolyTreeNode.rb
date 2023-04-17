require_relative "KnightPathFinder.rb"
class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
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
        # self.children << new_child if !self.children.include?(new_child)
        new_child.parent = self 
    end
    def remove_child(child)
        self.children.delete(child) 
        child.parent = nil 
    end

    def bfs(target)
        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if node.value == target
            node.children.each do |child|
                nodes << child
            end
        end
        nil
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            found = child.dfs(target)
            return found if found != nil
        end
        nil
    end

end