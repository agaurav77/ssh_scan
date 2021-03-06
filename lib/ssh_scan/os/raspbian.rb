module SSHScan
  module OS
    class Raspbian
      attr_reader :version

      class Version
        def initialize(version_string)
          @version_string = version_string
        end

        def to_s
          @version_string
        end
      end

      def initialize(banner)
        @banner = banner
        @version = Raspbian::Version.new(raspbian_version_guess)
      end

      def raspbian_version_guess
        return nil if @banner.nil?
        match = @banner.match(/SSH-2.0-Raspbian-(\d+)/)
        return nil if match.nil?
        return match[1]
      end

      def common
        "raspbian"
      end

      def cpe
        "o:raspbian:raspbian"
      end
    end
  end
end
