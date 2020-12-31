# copyright: 2020, Urs Voegele

title "check docker"

# check docker version
control "tmp-1.0" do                        # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "Check docker version"              # A human-readable title
  desc "Check docker version"
  describe docker.version do
    its('Server.Version') { should cmp >= '20.10'}
    its('Client.Version') { should cmp >= '20.10'}
    its('Server.Version') { should cmp <  '21.00'}
    its('Client.Version') { should cmp <  '21.00'}
  end
end
