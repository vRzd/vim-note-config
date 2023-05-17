" Vim syntax file
" Language:	ECA Engine
" Maintainer:	Dave Kirby
" Updated:	2007-01-31
"		ripped off from Python syntax highlighter
"
" Options to control Python syntax highlighting:
"
" For highlighted numbers:
"
"    let eca_highlight_numbers = 1
"
" For highlighted builtin functions:
"
"    let eca_highlight_builtins = 1
"
" For highlighted standard exceptions:
"
"
" Highlight erroneous whitespace:
"
"    let eca_highlight_space_errors = 1
"
" If you want all possible highlighting (the same as setting the
" preceding options):
"
"    let eca_highlight_all = 1
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn keyword ecaStatement	action after aggregate 
syn keyword ecaStatement	break check classification configuration
syn keyword ecaStatement	constant continue disable do
syn keyword ecaStatement	end error event
syn keyword ecaStatement	False follow halt
syn keyword ecaStatement	module
syn keyword ecaStatement	None obsolete on
syn keyword ecaStatement	override parameters raise
syn keyword ecaStatement	return returns rule suppress
syn keyword ecaStatement	then True version when
syn keyword ecaStatement	with
syn keyword ecaRepeat	        for while
syn keyword ecaConditional	if else elif
syn keyword ecaOperator	        and in  not or

syn keyword ecaStatement	def class nextgroup=ecaFunction skipwhite
syn match   ecaFunction	"[a-zA-Z_][a-zA-Z0-9_]*" contained
" AS will be a keyword in Python 3
syn keyword ecaPreCondit	import 
syn match   ecaComment	"#.*$" contains=ecaTodo
syn keyword ecaTodo		TODO FIXME XXX contained

" strings
syn region ecaString		matchgroup=Normal start=+[uU]\='+ end=+'+ skip=+\\\\\|\\'+ contains=ecaEscape
syn region ecaString		matchgroup=Normal start=+[uU]\="+ end=+"+ skip=+\\\\\|\\"+ contains=ecaEscape
syn region ecaString		matchgroup=Normal start=+[uU]\="""+ end=+"""+ contains=ecaEscape
syn region ecaString		matchgroup=Normal start=+[uU]\='''+ end=+'''+ contains=ecaEscape
syn region ecaRawString	matchgroup=Normal start=+[uU]\=[rR]'+ end=+'+ skip=+\\\\\|\\'+
syn region ecaRawString	matchgroup=Normal start=+[uU]\=[rR]"+ end=+"+ skip=+\\\\\|\\"+
syn region ecaRawString	matchgroup=Normal start=+[uU]\=[rR]"""+ end=+"""+
syn region ecaRawString	matchgroup=Normal start=+[uU]\=[rR]'''+ end=+'''+
syn match  ecaEscape		+\\[abfnrtv'"\\]+ contained
syn match  ecaEscape		"\\\o\{1,3}" contained
syn match  ecaEscape		"\\x\x\{2}" contained
syn match  ecaEscape		"\(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match  ecaEscape		"\\$"

if exists("eca_highlight_all")
  let eca_highlight_numbers = 1
  let eca_highlight_builtins = 1
  let eca_highlight_space_errors = 1
endif

if exists("eca_highlight_numbers")
  " numbers (including longs and complex)
  syn match   ecaNumber	"\<0x\x\+[Ll]\=\>"
  syn match   ecaNumber	"\<\d\+[LljJ]\=\>"
  syn match   ecaNumber	"\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"
  syn match   ecaNumber	"\<\d\+\.\([eE][+-]\=\d\+\)\=[jJ]\=\>"
  syn match   ecaNumber	"\<\d\+\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

if exists("eca_highlight_builtins")
  " builtin functions, types and objects, not really part of the syntax
  "syn keyword ecaBuiltin	True False bool enumerate set frozenset help
endif


if exists("eca_highlight_space_errors")
  " trailing whitespace
  syn match   ecaSpaceError   display excludenl "\S\s\+$"ms=s+1
  " mixed tabs and spaces
  syn match   ecaSpaceError   display " \+\t"
  syn match   ecaSpaceError   display "\t\+ "
endif

" This is fast but code inside triple quoted strings screws it up. It
" is impossible to fix because the only way to know if you are inside a
" triple quoted string is to start from the beginning of the file. If
" you have a fast machine you can try uncommenting the "sync minlines"
" and commenting out the rest.
syn sync match ecaSync grouphere NONE "):$"
syn sync maxlines=200
"syn sync minlines=2000

if version >= 508 || !exists("did_eca_syn_inits")
  if version <= 508
    let did_eca_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink ecaStatement	Statement
  HiLink ecaFunction		Function
  HiLink ecaConditional	Conditional
  HiLink ecaRepeat		Repeat
  HiLink ecaString		String
  HiLink ecaRawString	String
  HiLink ecaEscape		Special
  HiLink ecaOperator		Operator
  HiLink ecaPreCondit	PreCondit
  HiLink ecaComment		Comment
  HiLink ecaTodo		Todo
  HiLink ecaDecorator	Define
  if exists("eca_highlight_numbers")
    HiLink ecaNumber	Number
  endif
  if exists("eca_highlight_builtins")
    HiLink ecaBuiltin	Function
  endif
  if exists("eca_highlight_space_errors")
    HiLink ecaSpaceError	Error
  endif

  delcommand HiLink
endif

let b:current_syntax = "eca"

" vim: ts=8
