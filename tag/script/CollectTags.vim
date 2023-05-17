function! CollectTags()
    let script_path = $VIMFILES . 'tag/script/tagSelector.py'
    echo script_path 
    let vimdata_path = $VIMDATA . '/'
    let tag_file_path = $VIMFILES . 'tag/tags'
    echo '--------'
    let cmd = 'python3 ' . script_path . ' ' . vimdata_path . ' ' . tag_file_path . ' selectFrom'
    execute '! ' . cmd
endfunction

