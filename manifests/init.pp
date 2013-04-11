# Public: Install tmux via homebrew
#
# Examples
#
#   include tmux
class tmux {
  include homebrew

  package { 'tmux': }
  case $osfamily {
    'Darwin' => {
      package { 'reattach-to-user-namespace':
      }

      file { "${boxen::config::bindir}/tmux-pbcopy.sh":
        source => 'puppet:///modules/tmux/darwin/tmux-pbcopy.sh',
      }
    },
    default  => {
      package { 'xsel':
        ensure => present,
      }
    },
  }
}
