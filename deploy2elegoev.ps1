## deploy vagrant box to vagrant cloud
#

# prepare environment
#
#         vagrant cloud auth login elegoev
#

vag-bp -custboxname "ubuntu-18.04-docker" `
       -targetns "elegoev" `
       -targetrepo vagrantcloud `
       -boxdesc "vagrant basebox with ubuntu 18.04 & docker" `
       -versiondesc "initial version"
