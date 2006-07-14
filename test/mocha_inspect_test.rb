require 'test_helper'
require 'mocha/mocha_inspect'

class MochaInspectTest
  def self.suite
    suite = Test::Unit::TestSuite.new('MochaInspectTests')
    suite << ObjectInspectTest.suite
    suite << TimeDateMochaInspectTest.suite
    suite << StringMochaInspectTest.suite
    suite << ArrayMochaInstanceTest.suite
    suite << HashMochaInspectTest.suite
    suite
  end
end

class ObjectInspectTest < Test::Unit::TestCase
  
  def test_should_provide_custom_representation_of_object
    object = Object.new
    assert_equal "#<#{object.class}: #{object.object_id}>", object.mocha_inspect
  end
  
end

class TimeDateMochaInspectTest < Test::Unit::TestCase
  
  def test_should_use_include_date_in_seconds
    time = Time.now
    assert_equal "#{time.inspect} (#{time.to_f} secs)", time.mocha_inspect
  end
  
  def test_should_use_to_s_for_date
    date = Date.new(2006, 1, 1)
    assert_equal date.to_s, date.mocha_inspect
  end
  
  def test_should_use_to_s_for_datetime
    datetime = DateTime.new(2006, 1, 1)
    assert_equal datetime.to_s, datetime.mocha_inspect
  end
  
end

class StringMochaInspectTest < Test::Unit::TestCase
  
  def test_should_replace_escaped_quotes_with_single_quote
    string = "my_string"
    assert_equal "'my_string'", string.mocha_inspect
  end
  
end

class ArrayMochaInstanceTest < Test::Unit::TestCase
  
  def test_should_use_inspect
    array = [1, 2]
    assert_equal array.inspect, array.mocha_inspect
  end
  
  def test_should_use_mocha_inspect_on_each_item
    array = [1, 2, "chris"]
    assert_equal "[1, 2, 'chris']", array.mocha_inspect
  end
  
end

class HashMochaInspectTest < Test::Unit::TestCase
  
  def test_should_keep_spacing_between_key_value
    hash = {:a => true}
    assert_equal '{:a => true}', hash.mocha_inspect
  end
  
  def test_should_use_mocha_inspect_on_each_item
    hash = {:a => 'mocha'}
    assert_equal "{:a => 'mocha'}", hash.mocha_inspect
  end
  
end