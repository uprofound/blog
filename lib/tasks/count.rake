namespace :count do
  desc 'Сount the number of rb-files in a project'
  task cnt_rb_files: :environment do
    def scan(path)
      entries = Dir.new(path)
                   .entries
                   .reject { |x| %w[. ..].include? x }
                   .map { |x| File.join(path, x) }
    
      entries.reduce(0) do |counter, item|
        counter += scan(item) if File.directory?(item)
        counter += (File.extname(item) == '.rb') ? 1 : 0
      end
    end
    path = File.join('.')
    p scan(path)
  end
end

namespace :count do
  desc 'Сount the number of lines in the rb-files of the project'
  task cnt_lines_rb_files: :environment do
    def scan(path)
      entries = Dir.new(path)
                   .entries
                   .reject { |x| %w[. ..].include? x }
                   .map { |x| File.join(path, x) }
    
      line_count = 0
      entries.each do |item|
        line_count += scan(item) if File.directory?(item)
        File.open(item).each { |line| line_count += 1 } if File.extname(item) == '.rb'
      end
	  line_count
    end
    path = File.join('.')
    p scan(path)
  end
end

namespace :count do
  desc 'List lines-qty of rb-files in a project'
  task cnt_lines_rb_files_list: :environment do
    def scan(path)
      entries = Dir.new(path)
                   .entries
                   .reject { |x| %w[. ..].include? x }
                   .map { |x| File.join(path, x) }
    
      entries.each do |item|
        scan(item) if File.directory?(item)
        if File.extname(item) == '.rb'
          line_count = 0
          File.open(item).each { |line| line_count += 1 }
		  print line_count
          print ' lines in '
          puts item 
        end
      end
    end
    path = File.join('.')
    scan(path)
  end
end

