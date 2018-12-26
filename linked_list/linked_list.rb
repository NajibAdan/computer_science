require = "./node.rb"

class LinkedList
    attr_accessor :head


    def initialize
        @head = Node.new('HEAD')
        @current_node = @head
    end

    def next_node
        @current_node = @current_node.next
    end

    #prepend adds a new node to the start of the list
    def prepend(node)
        node.next = @head.next
        @head.next = node
    end

    #append adds a new node to the end of the list
    def append(node)
        if @head.next.nil?
            @head.next = node
        else
            tail
            @current_node.next = node
        end
    end

    #size returns the total number of nodes in the list
    def size
        head
        rounds = 1
        while !@current_node.next.nil? do
            self.next_node
            rounds += 1
        end
        rounds
    end

    #head returns the first node in the list
    def head
        @current_node = @head
    end

    #tail returns the last node in the list
    def tail
        until @current_node.next == nil do
            self.next_node
        end
    end

    #at(index) returns the node at the given index
    def at(index)
        head
        index.times do
            self.next_node
        end
        @current_node.data
    end

    #pop removes the last element from the list
    def pop
        head
        tempNode = ''
        until @current_node.next == nil do
            tempNode = @current_node
            self.next_node
        end
        tempNode.next = nil
        @tail = tempNode
    end

    #contains? returns true if the passed in value is in the list and otherwise returns false.
    def contains?(val)
        head
        until @current_node.next == nil do
            if @current_node.data == val
                return true
            end
            self.next_node
        end
        return true if @current_node.data == val
    end

    #find(data) returns the index of the node containing data, or nil if not found.
    def find(value)
        return 0 unless self.contains?(value)
        head
        loops = 0
        until @current_node.next == nil do
            if @current_node.data == value
                return loops
            end
            self.next_node
            loops += 1
        end
        return loops
    end

    #to_s represent your LinkedList objects as strings
    def to_s
        head
        until @current_node.next == nil
            print "(#{@current_node.data}) -> "
            self.next_node
        end
        print "(#{@current_node.data}) -> nil\n"
    end

    #inserts the node at the given index
    def insert_at(index)
        at(index)
        temp = @current_node.next
        blankNode = Node.new('Inserted Node')
        @current_node.next = blankNode
        blankNode.next = temp
    end

    #removes the node at the given index.
    def remove_at(index)
        at(index+1)
        temp = @current_node
        at(index-1)
        @current_node.next = temp
    end
end


