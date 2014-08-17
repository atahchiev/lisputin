module Lisputin
  class Base
  end

  class SimpleValue < Base
    attr_reader :value

    def initialize(value)
      @value = value
    end
  end

  class Number < SimpleValue
  end

  class Integer < Number
  end

  class Float < Number
  end

  class String < SimpleValue
  end

  class Boolean < SimpleValue
  end

  class Cons < Base
    attr_reader :head, :tail
    
    def initialize(head, tail: Empty)
      @head, @tail = head, tail
    end
  end

  class Procedure < Base
    attr_reader :name, :args, :body

    def initialize(name, args, body)
    end
  end

  class EmptyList < Base
  end

  Empty = EmptyList.new
end
