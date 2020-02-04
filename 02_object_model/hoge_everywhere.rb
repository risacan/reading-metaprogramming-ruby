# 次に挙げるクラスのいかなるインスタンスからも、hogeメソッドが呼び出せる
# それらのhogeメソッドは、全て"hoge"という文字列を返す
# - String
# - Integer
# - Numeric
# - Class
# - Hash
# - TrueClass

module HogeEverywhere
  def hoge
    "hoge"
  end
end

class String
  include HogeEverywhere
end

class Integer
  include HogeEverywhere
end

class Numeric
  include HogeEverywhere
end

class Class
  include HogeEverywhere
end

class Hash
  include HogeEverywhere
end

class TrueClass
  include HogeEverywhere
end