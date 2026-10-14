class Gron < Formula
  desc "Make JSON greppable"
  homepage "https://github.com/vyrus001/gron"
  url "https://github.com/vyrus001/gron/releases/download/v0.8.1/gron-0.8.1.tar.gz"
  sha256 "bf1864f83789a84078c24c154e94f29fdbd2f6eb6d51fc2a89771cd52407340b"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.gronVersion=#{version}")
  end

  test do
    assert_match "json.a = 1;", pipe_output("#{bin}/gron", '{"a":1}')
  end
end
