#!/usr/bin/env ruby

require "find"

configs = [] # Array to hold list of config files to save
Find.find("etc") do |path|
  configs << path if File.basename(path) == 'run'
  configs << path if File.basename(path) == 'finish'
  configs << path if File.dirname(path).match(/\/env\//)
  configs << path if File.dirname(path).match(/\/control\//)
end

pkgbuild = File.readlines("PKGBUILD")

File.open("PKGBUILD","w") do |f|
  pkgbuild.each do |l|
    if l[0,6] == "backup"
      l = "backup=(\'#{configs.join("\' \'")}\')"
    end
    f.puts l.chomp
  end
end
