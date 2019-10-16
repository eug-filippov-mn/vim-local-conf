function s:LoadWhitelist (wl_path)
    try
        return map(readfile(a:wl_path), {index, file_path -> expand(file_path)})
    catch /E484:/
        return []
    endtry 
endfunction

let s:wl_path = expand("$HOME/.vim/.vim-local-conf-wl")
let s:vim_local_conf_wl = s:LoadWhitelist(s:wl_path)

let s:current_dir_path = expand("%:p:h")
let s:current_local_conf_path = s:current_dir_path . "/.lvimrc"
if filereadable(s:current_local_conf_path) && index(s:vim_local_conf_wl, s:current_local_conf_path) != -1
    execute "source " .  s:current_local_conf_path
endif

