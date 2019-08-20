Pod::Spec.new do |s|

  s.name         = "ADQRCodeUtil"
  s.version      = "1.0"
  s.summary      = "二维码扫描和生成"

  s.description  = <<-DESC
                   二维码扫描，二维码扫描 
                   DESC

  s.homepage     = "https://github.com/tiancanfei/ADQRCodeUtil"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "tiancanfei" => "bjwltiankong@163.com" }

  #支持平台
  s.platform     = :ios
  #支持平台版本，如果是swift版本必须是>9.0的
  s.platform     = :ios, "9.0"
  #仓库地址 (不要使用ssh)
  s.source       = { :git => "https://github.com/tiancanfei/ADQRCodeUtil.git", :tag => "#{s.version}" }

  #源文件位置
  s.source_files  = "ADQRCodeUtil/ADQRCodeUtil/*.{h,m}"

  #仓库地址 (暴露出来的头文件，如果是swift就不需要这行，swift没有头文件)
  s.public_header_files = "ADQRCodeUtil/ADQRCodeUtil/*.h"

  #需要的framewoke
  s.frameworks = "UIKit"

  s.resource_bundles = {
    'ADQRCodeUtil' => ['ADQRCodeUtil/ADQRCodeUtil/**/*.{storyboard,xcassets,xib,png}']
  }

 #是否arc
  s.requires_arc = true

end