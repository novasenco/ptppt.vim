
command! -bang -nargs=1 SyntaxLines call ptppt#setup_lines(<q-args>, <bang>0)
command! -bang -nargs=1 SyntaxInlines call ptppt#setup_inlines(<q-args>, <bang>0)

