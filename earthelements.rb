class Palette::ColorScheme

  require 'colorist'
  include Colorist

  class Colorist::Color; def to_s() "%.2x%.2x%.2x" % [r, g, b]; end; end

  Colorist::Color::X11_COLOR_NAMES.each_pair do |color, hex_value|
    define_method color.to_sym do
      Colorist::Color.new(hex_value).to_s
    end
  end

  class ::String
    def darken(num)
      Colorist::Color.new(self).darken(num).to_s
    end

    def lighten(num)
      Colorist::Color.new(self).lighten(num).to_s
    end

    def +(other)
      combined = Colorist::Color.new(self) + Colorist::Color.new(other)
      combined.to_s
    end
  end
end


vim_colors "earthelements" do

  author "chriserin"
  notes "create different schemes for each context; make the context switches easier"

  reset true
  background :light

  background_color = white#("675735" + green).lighten 0.72
  default_font_color = "003300"
  string_color = "AA1134"
  Normal "004400", background_color

  #Folding
  Folded "808080", "ECECEC", :gui => "bold"
  link :vimFold, :FoldColumn, :to => :Folded

  LineNr "A52A2A"

  Type       default_font_color
  Comment    "AAB1BC"
  Statement  "000000"
  Keyword    "000000"
  Constant   "ff4411"
  String     string_color
  Boolean    default_font_color
  Repeat     default_font_color
  Identifier default_font_color#"006811", "cceeea"
  Function   default_font_color#"685616", "cceecc"
  Directory  "907800"
  Repeat     "420000"
  PreProc    "64634B"
  Folded     "64634B", "c8c4c0"
  Define     "685616"
  Ignore     "A8A890"
  Error      "a02000", white, :gui => "underline"
  Todo       "6A7164",  :gui => "underline"
  Search     "004400", "F0D890"
  Special    "808000"
  SpecialKey gray, :gui => "italic"

  StatusLine gray, "888480"
  StatusLineNC gray, "ABA7A4"
  VertSplit "ABA7A4", "ABA7A4"

  Visual     "F0F0C0"

  Delimiter  "6B6A17"

  DiffChange  "e4e2e0", :gui => "italic"
  DiffText    "f0e0a0"
  DiffAdd     "880000", :gui => "bold"
  DiffDelete  "f0a0a0", :gui => "bold"
  diffAdded   "000000", "ffffff"
  diffRemoved "dd0000", "ffffff"

  link :Character, :to => :String
  link :Number, :to => :Constant
  link :Float, :to => :Number

  link :rubyBoolean, :to => :Boolean
  link :rubyComment, :to => :Comment
  link :rubyString, :to => :String
  link :rubyStringDelimiter, :to => :String

  link :rubyClass, :to => :Type
  link :rubyControl, :to => :Repeat
  link :rubyBeginEnd, :to => :Repeat
  link :rubyHeredocStart, :to => :Comment
  link :rubyDefine, :to => :Function
  link :rubyHeredocEnd, :to => :Comment
  link :rubyModule, :to => :Type
  link :rubyOperator, :to => :Normal

  rubyAccess "000000", "ffbb55"
  rubyConditional "FF0000"

  rubyConstant "004400", :gui => "bold"
  rubySymbol "FF4411"

  rubyException               "ffffff", "ee4444"
  rubyMethodExceptional       "000000", "FF6666"
  rubyKeyword "003900"
  rubyLocalVariableOrMethod "eeeeee"
  rubyPseudoVariable "DD2200", :gui => "bold"
  rubyInterpolation default_font_color + string_color
  rubyInstanceVariable royal_blue + default_font_color + black
  rubyBlockParameterList "675735"
  rubyBlockParameter "675735"

  #method declarations
  function_color = default_font_color.darken(0.8)
  rubyMethodDeclaration function_color
  rubyDefine function_color, (background_color.darken 0.85)
  rubyFunction function_color, background_color.darken(0.95)
  rubyClass olive
  rubyModule purple + default_font_color
end
