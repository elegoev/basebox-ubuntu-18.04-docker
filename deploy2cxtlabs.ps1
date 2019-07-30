## deploy vagrant box to vagrant cloud
#

# prepare environment
#
#         vagrant cloud auth login cxtlabs
#

vag-bp -custboxname "ubuntu-18.04-docker" `
       -targetns "cxtlabs" `
       -targetrepo vagrantcloud `
       -boxdesc "vagrant basebox with ubuntu 18.04 & docker" `
       -versiondesc "initial version"
