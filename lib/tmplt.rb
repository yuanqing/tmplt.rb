class Tmplt

  class << self

    def render(tmpl, data)
      raise ArgumentError unless tmpl.is_a?(String) && (data.is_a?(Hash))
      tmpl.gsub(/{{(.+?)}}/) do
        val = access(data, $1)
        if val.is_a?(Proc)
          val = val.call(data)
        end
        is_number?(val) ? val.to_s : String.try_convert(val)
      end
    end

    private

    def is_number?(obj)
      true if Float(obj) rescue false
    end

    def access(data, keys)
      keys.split(".").each do |key|
        key.strip!
        if key.start_with?(":")
          data = data[key[1..-1].to_sym] # drop the ":"
        else
          if key.to_i.to_s == key # true if key is a number
            data = data[key.to_i]
          else
            data = data[key.to_s] || data[key.to_sym]
          end
        end
        break unless data
      end
      data
    end

  end

end
