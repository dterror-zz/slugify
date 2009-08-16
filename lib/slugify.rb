module Slugify
  
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end
  
  module ClassMethods
    def slugify(attr, opts_hash={})
      @slug_source = attr
      @slug_field = (opts_hash[:slug_field] || :slug)
      before_save :make_slug
    end
  end
  
  module InstanceMethods
    def make_slug
      slug_source = self.class.instance_variable_get("@slug_source")
      slug_field = self.class.instance_variable_get("@slug_field")
      begin
        self.send("#{slug_field}=", slugifier(self.send(slug_source)))
      rescue NoMethodError
        raise NoMethodError, "you used slugify with what seems to be an unexistant table field"
      end
    end
    
    def slugifier(str)
      str.gsub(/á|â|ã/,'a').gsub(/é|ê/,'e').gsub(/í/,'i').gsub(/ú|ü/,'u').gsub(/ó|ô|õ/,'o').gsub(/ç/,'c'). \
        gsub(/[^\w ]/, '').gsub(/ +/,'-').downcase
    end
  end
  
end

ActiveRecord::Base.send :include, Slugify