class ApacheKnoxShell < Formula
  desc "Apache Knox Shell"
  homepage "https://knox.apache.org"
  url "https://www.apache.org/dyn/closer.lua?path=knox/1.3.0/knoxshell-1.3.0.tar.gz"
  mirror "https://archive.apache.org/dist/knox/1.3.0/knoxshell-1.3.0.tar.gz"
  version "1.3.0"
  sha256 "cbe4a616ef208d47bd936984aa59cb757baafee52e2985a865748b606c62adf6"
  head "https://github.com/apache/knox.git"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]

    # Some binaries have really generic names (like `test`) and most seem to be
    # too special-purpose to be permanently available via PATH.
    #%w[gateway.sh ldap.sh].each do |script|
    #  (bin/script).write_env_script "#{libexec}/bin/#{script}", Language::Java.java_home_env("1.8")
    #end
  end

  test do
    system "true"
  end
end
