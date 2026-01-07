#!/usr/bin/env ruby
require 'json'
require 'fileutils'

class CM
  PATH = File.join(Dir.home, '.config', 'cm', 'commands.json')

  def initialize
    FileUtils.mkdir_p(File.dirname(PATH))
    @data = File.exist?(PATH) ? JSON.parse(File.read(PATH)) : {}
  end

  # Create
  def c(l, k, v)
    puts "cm c <list> <key> <value>" unless l && k && v
    (@data[l] ||= {})[k] = v
    save
  end

  # Read
  def r(l = nil)
    target = l ? @data[l] : @data
    if target.nil? || target.empty?
      puts "No entries."
    else
      puts JSON.pretty_generate(target)
    end
  end

  # Update
  def u(l, k, k2)
  return puts "Usage: cm u <list> <key> <new_key>" unless l && k && k2
  
  if @data.dig(l, k)
    @data[l][k2] = @data[l][k]
    @data[l].delete(k)
    save
  else
    puts "Entry not found."
  end
  end

  # Delete
  def d(l, k = nil)
    if k
      @data[l]&.delete(k)
    else
      @data.delete(l)
    end
    save
  end

  private

  def save
    File.write(PATH, JSON.pretty_generate(@data))
  end
end

cm = CM.new
cmd, list, key, val = ARGV

case cmd
when 'c' then cm.c(list, key, val)
when 'r' then cm.r(list)
when 'u' then cm.u(list, key, val)
when 'd' then cm.d(list, key)
else
  puts "\nWelcome to CRUD MONKEY (cm)\n\n"
  puts "\nUsage: cm [c|r|u|d] <list> <key> <value>\n\n"
  puts "  c  Create/Add a command"
  puts "  r  Read list or all"
  puts "  u  Update existing key"
  puts "  d  Delete key or entire list\n\n"
end
