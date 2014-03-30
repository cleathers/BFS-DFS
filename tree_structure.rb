require 'debugger'

class TreeNode
  attr_accessor :parent, :children, :value
  def initialize(value, parent = nil)
    @children = []
    @value = value
    @parent = parent

  end

  def remove_child(child_node)
    child_node.parent = nil
    @children.delete(child_node)
  end

  def add_child(child_node)
    @children << child_node
    child_node.parent = self
  end

  def dfs(value)
    return self if self.value == value
    found = nil
    @children.each do |child|
      found = child.dfs(value)
      if found != nil
        return found
      end
    end
    return found
  end

  def bfs(value)

    queue = []
    queue << self


    until queue.empty?
      currently_evaluated_node = queue.shift
      currently_evaluated_node.children.each do |child|
        queue << child
      end
      break if currently_evaluated_node.value == value
    end

    if currently_evaluated_node.value == value
      return currently_evaluated_node
    else
      return nil
    end
  end

end
