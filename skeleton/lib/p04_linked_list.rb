class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, prev = nil, nxt = nil)
    @key, @val, @prev, @next = key, val, prev, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head = Link.new
    @tail = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    return @head if @head.next.nil?
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
      return link.val if link.key == key
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
      last.next = Link.new(key, val, last)
    end
  end

  def remove(key)
    link = @head
    until link.key == key || link.next.nil?
      prev_link = link
      link = link.next
      next_link = link.next
    end
    if link = @head
      @head = Link.new
    elsif link.next.nil?
      prev_link.next = nil
    else
      prev_link.next, next_link.prev = next_link, prev_link
    end

    end

  def each
    yield @head if @head.next.nil?
    link = @head
    until link.nil?
      yield link
      link = link.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
