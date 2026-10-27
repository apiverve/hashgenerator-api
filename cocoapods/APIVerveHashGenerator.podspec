Pod::Spec.new do |s|
  s.name             = 'APIVerveHashGenerator'
  s.version          = '1.2.3'
  s.summary          = 'Hash Generator computes cryptographic hashes for any text string across algorithms such as MD5, SHA-256, SHA-512, and BLAKE2.'
  s.description      = <<-'DESC'
Hash Generator computes cryptographic hashes for any text string across algorithms such as MD5, SHA-256, SHA-512, and BLAKE2. It outputs digests for single or multiple algorithms in one request.

This iOS/macOS SDK provides a convenient way to access the Hash Generator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/hashgenerator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/hashgenerator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveHashGenerator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
