
syn match ptpptSlideTitle "\%^.*"

" syn region ptpptBulletRegion start="^\s*+" end="\n\ze\%(\S\|$\)" contains=ptpptBullet
syn match ptpptBullet "^\s*\zs+" conceal cchar=•

syn region ptpptEmptyBoxRegion start="^\s*\[ \]" end="^\zs\%(\S\|$\)" contains=ptpptEmptyBox,ptpptEmptyBoxright
syn match ptpptEmptyBox "^\s*\zs\[ \]\@=" conceal cchar=☐
syn match ptpptEmptyBox "\%(^\s*\zs\[ \)\@<=\]" conceal cchar= 

syn region ptpptCheckBoxRegion start="^\s*\[x\]\@=" end="^\zs\%(\S\|$\)" contains=ptpptCheckBox,ptpptCheckBoxRight
syn match ptpptCheckBox "^\s*\zs\[x\]\@=" conceal cchar=☑
syn match ptpptCheckBox "\%(^\s*\zs\[x\)\@<=\]" conceal cchar= 

hi! link ptpptSlideTitle Title
hi! link Snip Conceal

