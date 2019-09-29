require_relative "./min_heap.rb"
# This method uses a heap to sort an array.
# Time Complexity: O(n(log(n)) where n is the length of the list
# Space Complexity: O(n) where n is the length of the list
def heap_sort(list)
  sorted_list = []

  if list.length < 2
    return list
  else
    heap = MinHeap.new()

    list.each { |list_item| heap.add(list_item) }

    while !heap.empty?
      sorted_list << heap.remove()
    end
    return sorted_list
  end
end
