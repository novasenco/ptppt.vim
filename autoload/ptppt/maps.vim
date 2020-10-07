
function! ptppt#maps#enable()
  let cpos = getcurpos()
  let line = getline('.')
  let type = substitute(line, '^\s*\(\[ \]\|\[x\]\|+\|\).*', '\1', '')
  if type is '[ ]'
    sil keepp s/^\s*\[\zs /x/
  endif
  call setpos('.', cpos)
endfunction

function! ptppt#maps#disable()
  let cpos = getcurpos()
  let line = getline('.')
  let type = substitute(line, '^\s*\(\[ \]\|\[x\]\|+\|\).*', '\1', '')
  if type is '[x]'
    sil keepp s/^\s*\[\zsx/ /
  endif
  call setpos('.', cpos)
endfunction

function! ptppt#maps#toggle()
  let cpos = getcurpos()
  let line = getline('.')
  let type = substitute(line, '^\s*\(\[ \]\|\[x\]\|+\|\).*', '\1', '')
  if type is '[x]'
    sil keepp s/^\s*\[\zsx/ /
  elseif type is '[ ]'
    sil keepp s/^\s*\[\zs /x/
  endif
  call setpos('.', cpos)
endfunction

