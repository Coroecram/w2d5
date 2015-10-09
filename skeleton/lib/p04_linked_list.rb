class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    return @head if  @head.next.nil?
    link = @head
    until link.next.nil?
      link = link.next
    end

    link
  end

  def empty?
    @head.key.nil?
  end

  def get(key)
    link = @head
    until link.nil?
      return link.value if link.key == key
      link = link.next
    end

    nil
  end

  def include?(key)
    link = @head
    until link.nil?
      return true if link.key == key
      link = link.next
    end

    false
  end

  def insert(key, val)
    if empty?
      @head = Link.new(key, val)
    else
      last.next = Link.new(key, val)
    end
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
