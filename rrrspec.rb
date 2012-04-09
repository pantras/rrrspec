#! /usr/bin/env ruby

SAMPLE_SPEC = "rrrspec-sample.rb"

def usage
    puts <<-END
        Usage: rrrspec <spec>
    END
    exit
end

class Rrrspec
    def initialize(tests)
        @tests = tests
        @results = Hash.new(0)
    end
 
    def run_spec(spec, lines)
        command = "rspec #{spec}"
        lines.each { |n| command << " -l #{n}" } if lines
        puts "command=#{command}"
        %x{#{command}}
    end

    def analyze_output(spec, output)
        failing_lines = []
        test = ""
        output.split(/\n/).each do |line|
            if line =~ /\d*\) (.*)/
                test = $1
            elsif line =~ /#{spec}:(\d*)/
                #puts "#{test} -> #{$1}"
                failing_lines << $1
                @results[test] +=1
            end
            break if line =~ /^Finished in \d/
        end
        return failing_lines
    end

    def rrrspec(spec, failures = nil)
        output = run_spec(spec, failures)
        failures = analyze_output(spec, output)
        rrrspec(spec, failures) unless failures.empty?
        # TODO add count to stop
    end

    def run
        @tests.each { |test| rrrspec(test) }
        @results.each { |test, fail| puts "#{test} failed #{fail} times" }
    end
end

if ARGV.size == 0
    if File.exist?(SAMPLE_SPEC)
        # run test
        rrrspec = Rrrspec.new(SAMPLE_SPEC)
    else
        usage
    end
else
    rrrspec = Rrrspec.new(ARGV)
end

rrrspec.run
