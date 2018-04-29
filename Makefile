upload-dep:
	go get -u github.com/tcnksm/ghr
	go get github.com/mitchellh/gox
# https://github.com/mitchellh/gox
build:
	gox -output="dist/$(TAG)/hello_$(TAG)_{{.OS}}_{{.Arch}}" -osarch="darwin/amd64 linux/amd64 windows/amd64" .
# https://github.com/tcnksm/ghr
# GITHUB_TOKEN envrionment variable
upload:
	ghr -u suzuki-shunsuke $(TAG) dist/$(TAG)
