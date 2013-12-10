guard 'rspec', :all_on_start => true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/factories/.+\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  watch(%r{^(app).rb$})                               { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^(views)/(.+)(?:\.slim|\.scss)$})          { |m| "spec/#{m[1]}/#{m[2]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
end
