Pod::Spec.new do |s|
  s.name         = "OKFrameworkKit"
  s.version      = "1.1"
  s.summary      = "OKFrameworkKit is some category library"
  s.description  = <<-DESC
  OKFrameworkKit is some category librar.
                   DESC

  s.homepage     = "https://github.com/Herb-Sun/OKFrameworkKit"
  s.license      = "MIT"
  s.author             = { "huabei.sun" => "huabei.sun@okcoin.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Herb-Sun/OKFrameworkKit.git", :tag => "#{s.version}" }
  s.source_files  = "OKFrameworkKit", "OKFrameworkKit/**/*.{h,m}"

#s.public_header_files = "OKFrameworkKit/OKFrameworkKit.h"
  s.frameworks = "Foundation", "UIKit", "QuartzCore"
  s.requires_arc = true

end
