def bubble_sort(array)
  n = array.length
  swapped = true
  while swapped do
    swapped = false
    for i in 1..n - 1
      if array[i - 1] > array[i]
        temp = array[i - 1]
        array[i - 1] = array[i]
        array[i] = temp
        swapped = true
      end
    end
  end
  array
end
