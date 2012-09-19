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
  
  Also it will reset the &rtp, and will generate the help tag file.

* Install and Useage

  Use it with Vundle_.
  Put this in your vimrc, 
  should be put at the end of your Bundle part::
      
      Bundle 'Rykka/localbundle.vim'

      call localbundle#init()

  ``g:localbundle_rtp`` can be used to add another &rtp if needed.

  You can get the latest version at LocalBundle_

.. _Vundle: http://github.com/gmarik/vundle
.. _LocalBundle: https://github.com/Rykka/localbundle.vim 
