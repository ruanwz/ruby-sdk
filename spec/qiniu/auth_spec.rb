# -*- encoding: utf-8 -*-

require 'spec_helper'
require 'qiniu/auth/digest'
require 'qiniu/rs/tokens'

module Qiniu
  module RS
    describe Auth do

      before :all do
        @access_key = "iN7NgwM31j4-BZacMjPrOQBs34UG1maYCAQmhdCV"
        @secret_key = "6QTOr2Jg1gcZEWDQXKOGZh5PziC2MCV5KsntT70j"

		    @mac = Qiniu::Auth::Digest::Mac.new(@access_key, @secret_key)

		    @to_sign = "http://wolfgang.qiniudn.com/down.jpg?e=1373249874"
		    @signed = "iN7NgwM31j4-BZacMjPrOQBs34UG1maYCAQmhdCV:vT1lXEttzzPLP4i5T8YVz0AEjCg="

        @bucket = "a"
        @key = "myKey1"

        @put_basic_token = "iN7NgwM31j4-BZacMjPrOQBs34UG1maYCAQmhdCV:1QPEbnl4GhftWXCdfWKa4UCfdKU=:eyJkZWFkbGluZSI6MTM3MzQ1MDQ2Niwic2NvcGUiOiJhOm15S2V5MSJ9"
      end

      context ".sign_data" do
		    it "should works" do
		      token = @mac.sign(@to_sign)
		      token.should == @signed
        	puts token.inspect
        end
      end

=begin
      context ".upload_token" do
        it "should works" do
          pp = Qiniu::Rs::PutPolicy.new({
              :scope => %Q(#{@bucket}:#{@key}),
              :expires => 1800
            })
          token = pp.token(@mac)
          puts %Q(    #{pp.scope} : token -> #{token})
          token.should == @put_basic_token
        end
      end
=end

    end
  end
end
