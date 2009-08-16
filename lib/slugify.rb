module Slugify
  
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :include, InstanceMethods
  end
  
  module ClassMethods
    def slugify(attr)
      @slug_source = attr
      before_save :make_slug
    end
  end
  
  module InstanceMethods
    def make_slug
      slug_source = self.class.instance_variable_get("@slug_source")
      self.slug = slugifier(self.send(slug_source))
    end
    
    def slugifier(str)
      str.gsub(/á|â|ã/,'a').gsub(/é|ê/,'e').gsub(/í/,'i').gsub(/ú|ü/,'u').gsub(/ó|ô|õ/,'o').gsub(/ç/,'c'). \
        gsub(/[^\w ]/, '').gsub(/ +/,'-').downcase
    end
  end
  
end

ActiveRecord::Base.send :include, Slugify