require 'test/unit'

require_relative '../lib/homogeneous_descendant_linking_nestable'

### MOCK CLASS

# A mock class for simply testing the HomogeneousDescendantLinkingNestable
class MockTagClass
  include HomogeneousDescendantLinkingNestable
  attr_accessor :tag
end

### TESTS

class TestAdd < Test::Unit::TestCase
  def test_get_immediate_descendent
    tmp_tag = MockTagClass.new
    assert_true(!tmp_tag.nil?)
    c = tmp_tag.child_or_nil
    assert_nil(c)
    c = tmp_tag.child!
    assert_not_nil(c)
  end

  def test_get_distant_descendent
    tmp_tag = MockTagClass.new
    assert_true(!tmp_tag.nil?)
    c = tmp_tag.descendant_at(1)
    assert_nil(c)
    c = tmp_tag.child!
    assert_not_nil(c)
    c = tmp_tag.descendant_at(1)
    assert_not_nil(c)
    c.tag = "I'm tagged!"
    c = tmp_tag.descendant_at(9)
    assert_nil(c)
    c = tmp_tag
    9.times { c = c.child! }
    c = tmp_tag.descendant_at(8)
    assert_not_nil(c)
    c = tmp_tag.descendant_at(9)
    assert_not_nil(c)
    c = tmp_tag.descendant_at(10)
    assert_nil(c)
    c = tmp_tag.descendant_at(1)
    assert_true(c.tag.eql?("I'm tagged!"))
    c = tmp_tag.descendant_at(6)
    assert_not_nil(c)
    assert_true(c.tag.nil?)
  end

  def test_cutoff
    tmp_tag = MockTagClass.new
    assert_true(!tmp_tag.nil?)
    c = tmp_tag.descendant_at(1)
    assert_nil(c)
    c = tmp_tag.child!
    assert_not_nil(c)
    c = tmp_tag.descendant_at(1)
    assert_not_nil(c)
    c = tmp_tag.descendant_at(9)
    assert_nil(c)
    c = tmp_tag
    9.times { c = c.child! }
    c = tmp_tag.descendant_at(8)
    c.tag = 'descendent'
    assert_not_nil(c)
    c = tmp_tag.descendant_at(9)
    assert_not_nil(c)
    c = tmp_tag.descendant_at(10)
    assert_nil(c)
    c = tmp_tag.descendant_at(8)
    assert_true(c.tag.eql?('descendent'))
    c = tmp_tag.descendant_at(6)
    assert_not_nil(c)
    assert_true(c.tag.nil?)
    c = tmp_tag
    6.times { c = c.child! }
    assert_true(c.child_or_nil.child_or_nil.tag.eql?('descendent'))
    c.cutoff!
    assert_true(c.child_or_nil.nil?)
  end
end
