" cpp.vim - C++ 文件插件（编译运行 + 语法高亮 + 三空格缩进）
" 作者：DeepSeek
" 修改：移除缩进提示，修复缩进设置

" 防止重复加载
if exists("g:loaded_cpp_plugin") || &compatible
  finish
endif
let g:loaded_cpp_plugin = 1

" ===== 第一部分：编译运行功能 =====
autocmd FileType cpp nnoremap <buffer> <F5> :call CompileRunCPP()<CR>
autocmd FileType cpp inoremap <buffer> <F5> <Esc>:call CompileRunCPP()<CR>
autocmd FileType cpp vnoremap <buffer> <F5> <Esc>:call CompileRunCPP()<CR>

function! CompileRunCPP()
  " 先保存当前文件
  silent update

  " 获取当前文件名（不含扩展名）
  let l:filename = expand('%:r')

  " 构建编译运行命令
  let l:cmd = 'echo "\033[32m编译中...\033[0m" && ' .
            \ 'g++ -std=c++11 -Wall -O2 ' . shellescape(expand('%')) .
            \ ' -o ' . shellescape(l:filename) . ' && ' .
            \ 'echo "\n\033[31m运行中...\033[0m" && ' .
            \ './' . shellescape(l:filename) . ' ; ' .
            \ 'rm -f ' . shellescape(l:filename)

  " 执行命令
  execute '!' . l:cmd

  " 返回插入模式（如果之前是在插入模式）
  if mode() == 'i'
    startinsert
  endif
endfunction

" ===== 第二部分：语法高亮功能 =====
autocmd FileType cpp call CppSyntaxHighlight()

function! CppSyntaxHighlight()
  " 1. 定义高亮组
  highlight cppMain     guifg=#FAEBD7 ctermfg=30
  highlight cppStd      guifg=#FFFFF0 ctermfg=66
  highlight cppCout     guifg=#F0FFF0 ctermfg=182
  highlight cppCin      guifg=#F0FFFF ctermfg=129
  highlight cppSemi     guifg=#FFE4E1 ctermfg=201
  highlight cppEndl     guifg=#2F4F4F ctermfg=162
  highlight cppStreamOp guifg=#F5FFFA ctermfg=218

  " 2. 添加自定义匹配规则
  " 主函数匹配
  syntax match cppMainFunc "\<main\>"

  " std 匹配（匹配单独的 std 和 std::）
  syntax match cppStdNs "\<std::\?" contains=cppStdKeyword
  syntax keyword cppStdKeyword std contained
  syntax match cppUsingStd "\<std\>"  " 专门匹配 using namespace std 中的 std

  " 输入输出对象
  syntax keyword cppCoutKeyword cout
  syntax keyword cppCinKeyword cin
  syntax keyword cppEndlKeyword endl

  " 流操作符
  syntax match cppStreamOp "<<\|>>"

  " 分号
  syntax match cppSemicolon ";"

  " 3. 链接高亮组
  highlight link cppMainFunc cppMain
  highlight link cppStdKeyword cppStd
  highlight link cppUsingStd cppStd
  highlight link cppCoutKeyword cppCout
  highlight link cppCinKeyword cppCin
  highlight link cppEndlKeyword cppEndl
  highlight link cppStreamOp cppStreamOp
  highlight link cppSemicolon cppSemi

  " 4. 流操作区域
  syntax region cppStream start=/\v\s*(cout|cin)\s*<</ end=/;/
        \ contains=cppCoutKeyword,cppCinKeyword,cppEndlKeyword,cppStreamOp,cppSemicolon
endfunction

" ===== 第三部分：三空格缩进设置 =====
function! SetCppIndent()
  " 设置三空格缩进
  setlocal shiftwidth=3
  setlocal tabstop=3
  setlocal softtabstop=3
  setlocal expandtab

  " 移除诊断信息 (按用户要求删除)
  let g:cpp_indent_set = 1
endfunction

" 文件类型检测时设置缩进
autocmd FileType cpp call SetCppIndent()

" 进入C++缓冲区时再次检查设置
autocmd BufEnter *.cpp,*.h,*.hpp,*.cxx,*.hxx call SetCppIndent()
