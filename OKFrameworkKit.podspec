Pod::Spec.new do |s|
  s.name         = "OKFrameworkKit"
  s.version      = "1.1.4"
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
  s.resources    = 'OKFrameworkKit/Foundation/NSDate/NSDateTimeAgo.bundle'
  s.requires_arc = true

  s.subspec 'Macros' do |ss|
    ss.source_files = 'OKFrameworkKit/Macros/*.h'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'OKFrameworkKit/Foundation/**/*.{h,m,c}'
    
    ss.subspec 'NSArray' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSArray/**/*.{h,m}'
    end

    ss.subspec 'NSBundle' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSBundle/**/*.{h,m}'
    end

    ss.subspec 'NSData' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSData/**/*.{h,m}'
    end

    ss.subspec 'NSDate' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSDate/**/*.{h,m}'
    end

    ss.subspec 'NSDateFormatter' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSDateFormatter/**/*.{h,m}'
    end

    ss.subspec 'NSFileManager' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSFileManager/**/*.{h,m}'
    end

    ss.subspec 'NSLocale' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSLocale/**/*.{h,m}'
    end

    ss.subspec 'NSNotificationCenter' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSNotificationCenter/**/*.{h,m}'
    end

    ss.subspec 'NSNumber' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSNumber/**/*.{h,m}'
    end

    ss.subspec 'NSObject' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSObject/**/*.{h,m}'
    end

    ss.subspec 'NSString' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSString/**/*.{h,m}'
    end

    ss.subspec 'NSTimer' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSTimer/**/*.{h,m}'
    end

    ss.subspec 'NSURL' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSURL/**/*.{h,m}'
    end

    ss.subspec 'NSUserDefaults' do |sss|
      sss.source_files = 'OKFrameworkKit/Foundation/NSUserDefaults/**/*.{h,m}'
    end

  end

  s.subspec 'UIKit' do |ss|
    ss.source_files = 'OKFrameworkKit/UIKit/**/*.{h,m,c}'
    ss.dependency 'OKFrameworkKit/Foundation'
  end

  s.subspec 'QuartzCore' do |ss|
    ss.source_files = 'OKFrameworkKit/QuartzCore/**/*.{h,m,c}'
  end
end
