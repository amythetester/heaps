class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn) where n is the length of the heap
  # Space Complexity: 0(1)
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn) where n is the length of the heap
  # Space Complexity: 0(1)
  def remove()
    if @store.empty?
      return nil
    end

    swap(0, @store.length - 1)
    result = @store.pop

    heap_down(0) unless @store.empty?
    return result.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"

    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(n) where n is the length of @store
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time Complexity: O(logn) where n is the length of the heap
  # Space Complexity: 0(1)
  def heap_up(index)
    parent_node_index = index.odd? ? (index - 1) / 2 : (index - 2) / 2

    if @store[index].key >= @store[parent_node_index].key || index == 0
      return
    else
      swap(index, parent_node_index)
      heap_up(parent_node_index)
    end
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2

    if @store[left_child] == nil
      return
    elsif @store[right_child] == nil && @store[index].key > @store[left_child].key
      swap(index, left_child)
      return
    elsif @store[right_child] == nil
      return
    else
      min_child = @store[right_child].key < @store[left_child].key ? right_child : left_child

      if @store[index].key > @store[min_child].key
        swap(index, min_child)
        heap_down(min_child)
      end
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
