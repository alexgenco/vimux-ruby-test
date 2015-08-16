if exists("g:loaded_vimux_ruby_test") || &cp
  finish
endif
let g:loaded_vimux_ruby_test = 1

if !exists("g:vimux_rspec_command")
  let g:vimux_rspec_command = "rspec"
endif

command! -nargs=0 RunAllRubyTests :call s:RunAllRubyTests()
command! -nargs=0 RunRubyFocusedTest :call s:RunRubyFocusedTest()

function s:RunAllRubyTests()
  call VimuxRunCommand(g:vimux_rspec_command . expand("%"))
endfunction

function s:RunRubyFocusedTest()
  call VimuxRunCommand(g:vimux_rspec_command . expand("%") . ":" . line("."))
endfunction
