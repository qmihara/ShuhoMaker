help:
	cat Makefile

setup:
	test -f Sources/Settings.swift || cp Sources/Settings.swift.base Sources/Settings.swift
	swift package generate-xcodeproj

build:
	swift build

generate-xcodeproj:
	swift package generate-xcodeproj

shuho:
	.build/debug/ShuhoMaker
