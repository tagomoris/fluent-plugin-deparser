class Fluent::DeparserOutput < Fluent::Output
  Fluent::Plugin.register_output('deparser', self)

  config_param :tag, :string, :default => 'april.fool'
  config_param :format, :string, :default => nil
  config_param :format_key_names, :string, :default => nil
  config_param :key_name, :string, :default => 'message'

  def configure(conf)
    super

    if @format
      if @format_key_names.nil?
        raise Fluent::ConfigError, "format_key_names MUST be specified with 'format'"
      end
      @format_key_names = @format_key_names.split(',')
    end
  end

  def emit(tag, es, chain)
    if @format.nil?
      es.each {|time,record|
        keys = record.keys.shuffle
        new_record = {@key_name => keys.map{|k| record[k]}.join(' ')}
        Fluent::Engine.emit(@tag, time, new_record)
      }
    else
      es.each {|time,record|
        new_record = {@key_name => (@format % @format_key_names.map{|k| record[k]})}
        Fluent::Engine.emit(@tag, time, new_record)
      }
    end
  end
end
