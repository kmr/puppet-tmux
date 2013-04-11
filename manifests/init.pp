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
    },
    default  => {
      package { 'xsel':
        ensure => present,
      }
    },
  }
}
