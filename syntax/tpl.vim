" Vim syntax file
" Language:	tpl Pattern Language
" Maintainer:	Luke Stedman
" Updated:	2007-07-18
"		ripped off from the eca syntax highlighter written by Dave
"		Kirby
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


" tpl constands and special keywords
syn keyword tplBoolean		true false
syn keyword tplNone		none
syn match tplNumber		"[0-9]\+\(\.[0-9]\+\)\?"
syn keyword tplWordOperator	not and or

" tpl loops
syn keyword tplLoop             for in do break continue
syn match tplLoop               "end for"

" tpl conditionals
syn keyword tplConditional      if then elif else
syn match tplConditional        "end if"

" tpl blocks and headers keywords
syn keyword tplRequired		overview triggers body metadata default constants requires mapping
syn match tplRequired		"\(identify\|table\|definitions\|configuration\|enumeration\|syncmapping\) [A-Za-z_0-9]\+ [1-9]\+.[0-9]\+" 
syn match tplRequired       "define [A-Za-z_]\+"
syn match tplRequired       "tpl [1-9]\+.[0-9]\+ module [A-Za-z_]\+\(.[A-Za-z]\+\)*" 
syn match tplRequired    	"pattern [A-Za-z0-9_]\+ [1-9]\+.[0-9]*" 
syn match tplRequired       "end \(configutation\|define\|definitions\|enumeration\|syncmapping\|mapping\)"
syn match tplRequired       "end \(identify\|constants\|table\|body\|pattern\|triggers\|overview\|metadata\)"

" tpl statements
syn keyword tplStatement	on as where traverse defined matches tags stop from import created confirmed modified has subword substring
syn match tplStatements		"regex.extract\(All\)\?("
syn match tplStatements		"log.\(debug\|info\|warn\|error\|critical\)("
syn match tplStatements		"\(xpath\|inference\|model\|discovery\|sync\).[A-Za-z._]\+("
syn match tplStatements		"\(list\|number\|text\).[A-Za-z._]\+("
syn match tplStatements		"\(size\|search\|expand\)("
syn match tplStatements		"\((\|)\)"
" not sure about the following line being right/required.. Wilko
" syn match tplStatements		"[A-Za-z_]*\[" 
syn match tplStatements		"[\[\]]"

" tpl built in functions/objects
syn keyword tplBuiltin		DiscoveredProcess DiscoveredPackages SoftwareInstance

" tpl attributes
" syn keyword tplAttribute	

" tpl Operators
syn match tplOperator		"\(=\|:=\|<=\|>=\|<>\|<\|=\|>\|+\|-\|\*\|/\|%\|;\)"

" tpl TODO keyword
syn keyword tplTodo             TODO FIXME XXX contained

" tpl strings
" modded not to include whitespace to the left of unqualified strings which
" shows as highlighted with some colour schemes:
" (qualifier\s*)?"  as opposed to (qualifier)?\s*"
syn region tplString start=/\(\(raw\|regex\|windows_cmd\|unix_cmd\)\s*\)\?'/ end=/'/
syn region tplString start=/\(\(raw\|regex\|windows_cmd\|unix_cmd\)\s*\)\?'''/ end=/'''/
syn region tplString start=/\(\(raw\|regex\|windows_cmd\|unix_cmd\)\s*\)\?"/ end=/"/
syn region tplString start=/\(\(raw\|regex\|windows_cmd\|unix_cmd\)\s*\)\?"""/ end=/"""/

" tpl comments
syn match tplComment  		"//.*$" contains=tplTodo

" vim setting fo rthe number of lines outside the current view to higlight on
syn sync match ecaSync grouphere NONE "):$"
syn sync maxlines=200

if version >= 508 || !exists("did_tpl_syn_inits")
  if version <= 508
    let did_tpl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later

  hi def link tplConditional		Conditional
  hi def link tplWordOperator		Operator
  hi def link tplLoop			Repeat
  hi def link tplBoolean		Boolean
  hi def link tplNone			Constant
  hi def link tplRequired		Preproc
  hi def link tplStatement		Statement
  hi def link tplStatements		Statement
  hi def link tplBuiltin		Include
  hi def link tplOperator		Identifier
  hi def link tplFunction		Function
  hi def link tplDescription		String
  hi def link tplString			String
  hi def link tplOperator		Operator
  hi def link tplComment		Comment

  delcommand HiLink
endif

let b:current_syntax = "tpl"

" vim: ts=8
