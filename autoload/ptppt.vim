
let s:syn_incls = []

function! ptppt#setup_syn(name)
  let syn_file = 'syntax/'.a:name.'.vim'
  let syn_path = globpath(&rtp, syn_file)
  let syn_name = '@textGroup'.toupper(a:name)
  if !empty(syn_path) && index(s:syn_incls, a:name) is -1
    if exists('b:current_syntax')
      let backup_syntax = b:current_syntax
      unlet b:current_syntax
    endif
    execute 'syntax include' syn_name syn_file
    if exists('backup_syntax')
      let b:current_syntax = backup_syntax
    endif
  endif
  return a:name
endfunction

function! ptppt#setup_lines(name, bang)
  call ptppt#setup_syn(a:name)
  let syn_name = '@textGroup'.toupper(a:name)
  execute 'syntax region' a:name.'SnipLine matchgroup=Snip start="^```\s*'.a:name.'\s*$" end="^```\s*$"'
   \ ' contains='.syn_name.(a:bang ? ' concealends' : '')
endfunction 

function! ptppt#setup_inlines(name, bang)
  call ptppt#setup_syn(a:name)
  let syn_name = '@textGroup'.toupper(a:name)
  execute 'syntax region' a:name.'Snip matchgroup=Snip start="\%([^\\]\|^\)\@<=\%(\\{2}\)*`\%(.*`{.'.a:name.'}\)\@=" end="`\@<!`{.'.a:name.'}"'
   \ '  contains='.syn_name.(a:bang ?  ' concealends' : '')
endfunction

function! ptppt#check()
  let cpos = getcurpos()
  let prev_inline = copy(get(b:, 'ptppt_inline_matches', []))
  let b:ptppt_inline_matches = []
  keepp keepj %s/`.\{-}`{\.\(\w\+\)}/\=add(b:ptppt_inline_matches, submatch(1))/gne
  let b:ptppt_inline_matches = uniq(b:ptppt_inline_matches)
  for m in b:ptppt_inline_matches
    if index(prev_inline, m) isnot -1
      continue
    endif
    call ptppt#setup_inlines(m, 1)
  endfor
  let prev_line = copy(get(b:, 'ptppt_line_matches', []))
  let b:ptppt_line_matches = []
  keepp keepj %s/^```\s*\(\w\+\)\s*$/\=add(b:ptppt_line_matches, submatch(1))/gne
  for m in b:ptppt_line_matches
    if index(prev_line, m) isnot -1
      continue
    endif
    call ptppt#setup_lines(m, 0)
  endfor
  call setpos('.', cpos)
endfunction

