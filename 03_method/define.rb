# Q1.
# 次の動作をする A1 class を実装する
# - "//" を返す "//"メソッドが存在すること

class A1
  def self.add_method(method_name)
    define_method(method_name) do
      "//"
    end
  end

  add_method("//")
end

# Q2.
# 次の動作をする A2 class を実装する
# - 1. "SmartHR Dev Team"と返すdev_teamメソッドが存在すること
# - 2. initializeに渡した配列に含まれる値に対して、"hoge_" をprefixを付与したメソッドが存在すること
# - 2で定義するメソッドは下記とする
#   - 受け取った引数の回数分、メソッド名を繰り返した文字列を返すこと
#   - 引数がnilの場合は、dev_teamメソッドを呼ぶこと

class A2
  def initialize(arr)
    A2::add_method(arr)
  end

  def dev_team
    "SmartHR Dev Team"
  end

  def self.add_method(array)
    array.each do |key|
      method_name = "hoge_#{key}"
      define_method(method_name) do |count|
        return dev_team if count.nil?

        method_name * count
      end
    end
  end
end

# Q3.
# 次の動作をする OriginalAccessor モジュール を実装する
# - OriginalAccessorモジュールはincludeされたときのみ、my_attr_accessorメソッドを定義すること
# - my_attr_accessorはgetter/setterに加えて、boolean値を代入した際のみ真偽値判定を行うaccessorと同名の?メソッドができること

module OriginalAccessor
  def self.included(klass)
    klass.extend(DefineMyAttrAccessor)
  end
end

module DefineMyAttrAccessor
  attr_accessor :name
  def my_attr_accessor(name)
    @name = name
    #attr_accessor :"#{name}"

    define_method("#{name}=") do |arg|
      @name = arg
    end

    define_method(name) do
      @name
    end

    # わからねぇ...
    define_method("#{name}?") do
      @name
    end
  end
end