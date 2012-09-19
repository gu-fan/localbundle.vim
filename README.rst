Intro
=====

This is a vim plugin for the Vundle_ users.
seperated from my previous forked vundle repo to a single plugin.

It will move all file of the bundles in ~/.vim/bundle/ into ~/.vim/localbundle/

and remove runtimepath of these bundles. 
and add  ~/.vim/localbundle/ to &rtp.

This will greatly increasing the loading and working speed with
a big numbers of bundles.

* Command:

  ``:LocalBundle``

  This will copy all bundles in ~/.vim/bundle/ into ~/.vim/localbundle/
  
  Also it will reset the &rtp, and will generate the help tag file.

* Install:

  add ``Rykka/localbundle.vim`` to your vimrc

.. _Vundle: http://github.com/gmarik/vundle
