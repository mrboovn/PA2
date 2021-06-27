class Board
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    attr_reader :max_height

    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num_stack)
        Array.new(num_stack) { Array.new(0)}
    end

    def initialize(num_stack, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(num_stack)
        if num_stack < 4 || @max_height < 4
            raise 'rows and cols must be >= 4'
        end
    end

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx].unshift(token)
            return true 
        else
            return false 
        end
    end

    def vertical_winner?(token)
        @stacks.each do |col| 
            counter = 0
            col.each do |ele|
                if ele == token 
                    counter += 1
                end
            end
            if counter == @max_height
                return true 
            end
        end
        return false 
    end

    def horizontal_winner?(token)
        (0...@stacks.length).each do |i|
            counter = 0
            (0...@stacks.length).each do |j|
                if @stacks[j][i] == token 
                    counter += 1
                end
            end
            if counter == @stacks.length
                return true 
            end
        end
        return false 
    end

    def winner?(token)
        if vertical_winner?(token) || horizontal_winner?(token)
            return true 
        else 
            return false 
        end
    end


end
