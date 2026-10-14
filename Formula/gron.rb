class Gron < Formula
  desc "Make JSON greppable"
  homepage "https://github.com/vyrus001/gron"
  url "https://github.com/vyrus001/gron/releases/download/v0.8.0/gron-0.8.0.tar.gz"
  sha256 "f72cda1b011c5f3bf8ed563097ba291e4b63210af5f8f0182bdce02f46af6e99"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.gronVersion=#{version}")
  end

  test do
    assert_match "json.a = 1;", pipe_output("#{bin}/gron", '{"a":1}')
  end
end
