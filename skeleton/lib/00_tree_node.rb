require 'byebug'

class PolyTreeNode
  
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []

  end

  def parent=(node)
      
    unless self.parent.nil?
      self.parent.children.delete(self)
    end
    
    if node != nil
      @parent = node
      unless node.children.include?(self) 
        node.children << self
      end
    else
      @parent = node
    end
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "Node is not a child" if !self.children.include?(node)
    node.parent = nil
  end

  def dfs(target)
    # debugger
    return self if self.value == target
    
      self.children.each do |child|
        result = child.dfs(target)
        unless result.nil?
          return result
        end
      end
    nil
  end

  def bfs(target_value)
    
    queue = []
    queue << self

    until queue.empty?
      node = queue.shift
      if node.value == target_value
        return node
      else
        queue += node.children
      end
    end
    nil
  end

end



