class Tmsu < Formula
    desc "TMSU lets you tag your files and then access them through a virtual filesystem."
    homepage "http://tmsu.org/"
    head "https://github.com/oniony/TMSU.git", branch: "master"

    depends_on "go" => :build

    def install
      ENV["GO111MODULE"] = "on"
      ENV["GOPATH"] = buildpath

      system "go", "build", *std_go_args

      man1.install "misc/man/tmsu.1"
    end

    test do
      assert_match "tmsu version", shell_output("#{bin}/tmsu --version")
    end
  end
