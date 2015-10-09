class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 42 if empty?
    each_with_index.map do |el, i|
      if el.nil?
        69 + i
      else
        el.hash^(length+i)
      end
    end.join("").to_i
  end

end

class String

  def hash
    Integer(chars.map { |char| char.ord}.join)
  end

end

class Hash
  def hash
    (keys.sort + values.sort).hash

  end
end
