
if get(g:, 'ptppt_auto_check', 1)
  call ptppt#check()
  augroup PtpptCheck
    autocmd!
    autocmd InsertLeave <buffer> call ptppt#check()
  augroup end
endif

setl conceallevel=2
setl concealcursor=n

if !(get(g:, 'no_plugin_maps') || get(g:, 'no_ptppt_maps'))
  nnoremap <buffer> <nowait> <leader>e :call ptppt#maps#disable()<cr>
  nnoremap <buffer> <nowait> <leader>d :call ptppt#maps#enable()<cr>
  nnoremap <buffer> <nowait> <leader>t :call ptppt#maps#toggle()<cr>
endif

