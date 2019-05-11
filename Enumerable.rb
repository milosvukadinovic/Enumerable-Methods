module Enumerable
  def my_each
      i = 0
      arr = self.to_a
      while i < self.size
          yield arr[i]
          i += 1
      end
      self
  end
  def my_each_with_index
      i = 0
      arr = self.to_a
      while i < self.size
          yield arr[i], i
          i += 1
      end
      self
  end
  def my_select
      arr = self.to_a
      arr_return = Array.new
      i = 0
      while i < self.size
          if yield(arr[i])
              arr_return.push(arr[i])
          end
          i += 1
      end
      arr_return
  end
  def my_all?
      arr = self.to_a
      false_counter = 0
      i = 0
      while i < self.size
          break if false_counter > 0
          if block_given?
              if yield(arr[i]) == false
                  false_counter += 1
              end
          elsif arr[i].nil? or arr[i] == false
              false_counter += 1
          end
          i += 1
      end
      false_counter == 0 ? true : false
  end
  def my_any?
      arr = self.to_a
      true_counter = 0
      i = 0
      while i < self.size
          break if true_counter > 0
          if block_given?
              if yield(arr[i]) == true
                  true_counter += 1
              end
          elsif arr[i] != nil and arr[i] != false
              true_counter += 1
          end
          i += 1
      end
      true_counter == 0 ? false : true
  end
  def my_none?
      arr = self.to_a
      true_counter = 0
      i = 0
      while i < self.size
          break if true_counter > 0
          if block_given?
              if yield(arr[i]) == true
                  true_counter += 1
              end
          elsif arr[i] != nil and arr[i] != false
              true_counter += 1
          end
          i += 1
      end
      true_counter == 0 ? true : false
  end
  def my_count(item = nil)
      arr = self.to_a
      counter = 0
      i = 0
      return self.size if item.nil? and block_given? == false
      while i < self.size
          if block_given?
              counter += 1 if yield(arr[i]) == true
          else
              counter += 1 if arr[i] == item
          end
          i += 1
      end
      counter
  end
  def my_map(proc = nil)
      arr = self.to_a
      new_arr = Array.new
      i = 0
      while i < self.size
          if block_given?
              new_arr << yield(arr[i])
          else
              new_arr << proc.call(arr[i])
          end
          i += 1
      end
      new_arr
  end
  def my_inject(arg1 = nil, arg2 = nil)
      arr = self.to_a
      val = arr[0]
      i = 1
      if arg2 
          i = 0 
          sym = arg2 
          val = arg1 
      else 
          sym = arg1 
      end
      if block_given? and arg1
          i = 0 
          val = arg1 
      end
      if block_given?
          while i < self.size
              val = yield val, arr[i]
              i += 1
          end
      else
         while i < self.size
              val = val.send(sym, arr[i])
              i += 1
         end
      end
      val
  end
end