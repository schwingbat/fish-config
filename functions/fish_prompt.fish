function fish_prompt

  # Current directory
  set path (echo $PWD | string replace $HOME "~")
  set parts (string split "/" $path)
  set num_parts (count $parts)

  set_color grey

  if [ $num_parts -gt 4 ]
    # Print full path if <= 4 levels deep, otherwise abbreviate to save space.
    set num_between (math (count $parts) - 3)
    set minus_one (math $num_parts - 1)
    echo -n "$parts[1]/{$num_between}/$parts[$minus_one]/$parts[$num_parts] "
  else
    echo -n "$path "
  end

  set punch_project (cat $HOME/.punch/current)
  if [ $punch_project ]
    set_color red
    echo -n "[⌛$punch_project] "
  end

  # Git branch
  if test (git rev-parse --git-dir 2>/dev/null)
    set_color cyan
    set branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    echo -n "$branch"

    # Check for uncommitted changes
    set modified  (git status --porcelain | grep "^ M" | wc -l | string replace -a " " "")
    set deleted   (git status --porcelain | grep "^ D" | wc -l | string replace -a " " "")
    set untracked (git status --porcelain | grep "^??" | wc -l | string replace -a " " "")

    # • ⬤ ￭ ⚈ ● ᚶ ⚬
    set git_char "●"

    if [ $deleted != 0 -o $modified != 0 -o $untracked != 0 ]
      echo -n "["
    end

    if [ $deleted != 0 ]
      set_color red
      echo -n $git_char
    end

    if [ $modified != 0 ]
      set_color yellow
      echo -n $git_char
    end

    if [ $untracked != 0 ]
      set_color green
      echo -n $git_char
    end

    set_color cyan
    if [ $deleted != 0 -o $modified != 0 -o $untracked != 0 ]
      echo -n "]"
    end
    echo -n " "
  end

  # Prompt symbol
  set_color magenta
  echo "▶ "
end

function braille_number
  switch (echo $argv[1])
  case 0
    echo -n "⠀"
  case 1
    echo -n "⡀"
  case 2
    echo -n "⡄"
  case 3
    echo -n "⡆"
  case 4
    echo -n "⡇"
  case 5
    echo -n "⣇"
  case 6
    echo -n "⣧"
  case 7
    echo -n "⣷"
  case '*'
    echo -n "⣿"
  end
end

function block_number
  switch (echo $argv[1])
  case 0
    echo -n "⠀"
  case 1
    echo -n "▁"
  case 2
    echo -n "▂"
  case 3
    echo -n "▃"
  case 4
    echo -n "▄"
  case 5
    echo -n "▅"
  case 6
    echo -n "▆"
  case 7
    echo -n "▇"
  case '*'
    echo -n "█"
  end
end