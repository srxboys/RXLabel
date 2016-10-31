Pod::Spec.new do |s|
  s.name         = 'RXLabel'
  s.version      = '1.0.0'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/srxboys/RXLabel'
  s.authors      = 'srxboys','srxboys@126.com'
  s.summary      = 'label Click to show more text'

  s.platform     =  :ios, '6.0'
  s.source       =  {git: 'https://github.com/srxboys/RXLabel.git', :tag => s.version}
  s.source_files = 'RXLabelView/*.{h,m}'
  s.requires_arc = true
end