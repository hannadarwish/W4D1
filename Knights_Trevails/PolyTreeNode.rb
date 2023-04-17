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

end