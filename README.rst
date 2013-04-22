Intro
=====

This is a vim plugin for the Vundle_ users.
seperated from my previous forked vundle repo to a single plugin.

It will copy all file of the bundles in ~/.vim/bundle/ into ~/.vim/localbundle/

and remove runtimepath of these bundles. 
and add  ~/.vim/localbundle/ to &rtp.

This will greatly increasing the loading and working speed with
a big numbers of bundles.

* Command:

  ``:LocalBundle``

  This will copy all bundles in ~/.vim/bundle/ into ~/.vim/localbundle/
  
  It will reset the &rtp, and generate the help tag file.

* Install and Useage

  Use it with Vundle_.
  Put this in your vimrc, 
  should be put at the end of your Bundle part::
      
      Bundle 'Rykka/localbundle.vim'
      if isdirectory(expand('~/.vim/bundle/localbundle.vim'))
          call localbundle#init()
      endif


  Use 'set rtp^=' to add another &rtp if needed.

  You can review the log by ``g:localbundle_log``

  You can get the latest version at LocalBundle_

* Options:

  ``g:localbundle_dir``

  Your destination dir for localbundle.

.. _Vundle: http://github.com/gmarik/vundle
.. _LocalBundle: https://github.com/Rykka/localbundle.vim 
