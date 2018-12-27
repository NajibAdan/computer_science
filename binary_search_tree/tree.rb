require './node.rb'

class Tree
    attr_accessor :root
    def build_tree(array)
        @root = Node.new(array.shift)
        array.each do |i|
            insert(@root,i)
        end
    end

    def insert(node,val)
        if (node.data > val)
            node.left ? insert(node.left,val) : node.left = Node.new(val)
        else
            node.right ? insert(node.right,val) : node.right = Node.new(val)
        end
    end

    def breadth_first_search(val)
        tracker = [@root]
        until tracker.empty?
            #puts 'check'
            node = tracker.shift
            return "#{val} found at #{node}" if node.data == val
            tracker.push(node.left) if node.left
            tracker.push(node.right) if node.right
        end
        return nil
    end

    def depth_first_search(val)
        tracker = [@root]
        until tracker.empty?
            node = tracker.shift
            #return nil if node.nil?
            return "#{val} found at #{node}" if node.data == val
            tracker.unshift(node.left) if node.left
            tracker.unshift(node.right) if node.right
        end
        return nil
    end

    def dfs_recs(data,node=@root)
        return "#{data} found at #{node}" if node.data == data
        dfs_recs(data,node.left) if node.left
        dfs_recs(data,node.right) if node.right
    end
end

