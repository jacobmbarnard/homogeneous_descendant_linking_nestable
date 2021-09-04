# Gives the ability to recursively access the next descendant object,
# or to find a given descendant at a specified index.
#
# As the title of the module implies, descendants are singly linked
# by their immediate ancestor (i.e. parent), and a descendant is the same
# class as its parent. A parent has an instance variable to access then
# child object, but not the other way around; hence, singly nestable.
#
# Classes that mix in this module need to be able to initialize properly
# without any parameters supplied to the initialize method.
module HomogeneousDescendantLinkingNestable
  # Gets the next single descendant of the calling object.
  # The child will be of the same class as the parent class.
  def child_or_nil
    @child
  end

  # Gets the @child object if it is not nil. If it is nil,
  # then a new instance of the same class as the calling
  # object is created and assigned to @child, then child
  # is returned.
  def child!
    @child = self.class.new if child_or_nil.nil?
    @child
  end

  # Recursively nils out the descendant chain, starting with @child.
  def cutoff!
    @child.cutoff! unless @child.nil?
    @child = nil
  end

  # Gets the descendent object at the specified index.
  #
  # @param index [Integer] the index of the descendant to retrieve
  # @return the descendant at the specified index
  def descendant_at(index)
    i = 0
    c = self
    while i < index
      c = c.child_or_nil
      return nil if c.nil?

      i += 1
    end
    c
  end
end
