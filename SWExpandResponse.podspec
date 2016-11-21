Pod::Spec.new do |s|

  s.name         = "SWExpandResponse"

  s.version      = "0.0.2"

  s.homepage      = 'https://github.com/zhoushaowen/SWExpandResponse'

  s.ios.deployment_target = '7.0'

  s.summary      = "扩大UIView响应范围"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Zhoushaowen" => "348345883@readyidu.com" }

  s.source       = { :git => "https://github.com/zhoushaowen/SWExpandResponse.git", :tag => s.version }

  s.source_files  = "SWExpandResponse/SWExpandResponse/*.{h,m}"
  
  s.requires_arc = true

end