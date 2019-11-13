#wee
class Tree_bin
  attr_reader :head
  class Node
    attr_accessor :val,
                  :l,
                  :r
    def initialize( new_node_value)
      @val = new_node_value
      @l   = nil
      @r   = nil
    end

  end
 

  def initialize
    $head = nil
  end

  def show(node = $head)
    if node == nil || node.val == nil
       return
    end
    show(node.l )
    puts node.val
    show(node.r )
  end

  def add_node (new_node_value)
    puts "add rand value #{ new_node_value}"
    if $head == nil
      $head = Node.new(new_node_value)
      return
    end
    $head = add_node1($head, new_node_value)
  end

  def add_node1( node, new_node_value)
    if node == nil
      node = Node.new(new_node_value)
      return node
    elsif new_node_value > node.val
      node.r = add_node1(node.r, new_node_value)
      return node
    elsif new_node_value < node.val
      node.l = add_node1(node.l, new_node_value)
      return node
    end
    return node
  end

  def del_fun(nodeL , nodeR)
    if nodeR.l == nil || nodeR.l.val == nil
      if nodeR.r == nil || nodeR.r.val == nil
        if nodeL == nodeR
          return_val = nil
          nodeL.val = nil
        else
          return_val = nodeR.val.clone
          nodeR.val = nil
        end
      else
        if nodeL == nodeR
          return_val = nodeR.r.val.clone
        else
          return_val = nodeR.val.clone
        end
        nodeR.val = nodeR.r.val
        nodeR.l  = nodeR.r.l
        nodeR.r = nodeR.r.r
      end
      return return_val
    elsif nodeL.r == nil || nodeL.r.val == nil
       if nodeL.l == nil || nodeL.l.val == nil
         return_val = nodeL.val.clone
         nodeL.val = nil
       else
         if nodeL == nodeR
           return_val = nodeL.l.val.clone
         else
           return_val = nodeL.val.clone
         end
         nodeL.val = nodeL.l.val
         nodeL.r = nodeL.l.r
         nodeL.l  = nodeL.l.l
       end
       return return_val
    else
      if nodeL != nodeR
        return del_fun(nodeL.r, nodeR.l)
      else
        return del_fun(nodeL.l, nodeR.r)
      end
    end
  end

  def search(node = $head, del_val)
    if node == nil || node.val == nil
      return false
    end
    if node.val == del_val
      puts "delete #{del_val}"
      node.val = del_fun(node , node)
      return true
    end
    if search(node.l, del_val)
      return true
    end
    if search(node.r, del_val)
      return true
    end
    return false
  end

  def delete_nobe (del_val)
    if !search($head,del_val)
        puts "not find #{del_val}"
    end
  end
end

def func_of_tree_bin()
  ex_tree_bin = Tree_bin.new
  (0...10).map{ex_tree_bin.add_node( rand(1..13))}
  puts "go up, from left to right"
  ex_tree_bin.show()
  ex_tree_bin.delete_nobe(rand (1..13))
  ex_tree_bin.delete_nobe(rand (1..13))
  ex_tree_bin.delete_nobe(rand (1..13))
  ex_tree_bin.delete_nobe(rand (1..13))
  ex_tree_bin.show()
end

func_of_tree_bin()
