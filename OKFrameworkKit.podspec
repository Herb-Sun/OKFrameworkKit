Pod::Spec.new do |s|
  s.name         = "OKFrameworkKit"
  s.version      = "1.1.2"
  s.summary      = "OKFrameworkKit is some category library"
  s.homepage     = "https://github.com/Herb-Sun/OKFrameworkKit"
  s.license      = "MIT"
  s.author       = { "huabei.sun" => "huabei.sun@okcoin.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = '7.0'
  s.source       = { :git => "https://github.com/Herb-Sun/OKFrameworkKit.git", :tag => s.version.to_s }
  s.source_files  = "OKFrameworkKit", "OKFrameworkKit/**/*.{h,m}"

  s.public_header_files = "OKFrameworkKit/OKFrameworkKit.h"
  s.source_files = 'OKFrameworkKit/OKFrameworkKit.h'
  s.frameworks = "Foundation", "UIKit", "QuartzCore"
  s.requires_arc = true

  s.subspec 'Macros' do |ss|
    ss.source_files = 'OKFrameworkKit/Macros/*.h'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'OKFrameworkKit/Foundation/**/*.{h,m,c}'
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files = 'OKFrameworkKit/UIKit/**/*.{h,m,c}'
    ss.dependency = 'OKFrameworkKit/Foundation'
  end

  s.subspec 'QuartzCore' do |ss|
    ss.source_files = 'OKFrameworkKit/QuartzCore/**/*.{h,m,c}'
  end
end
