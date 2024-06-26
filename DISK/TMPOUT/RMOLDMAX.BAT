     echo off
     cls
     if %1.==. goto help

     if not exist OLDMAX.%1\*.* goto nofiles

     echo Y > rmoldmax.rsp
     erase OLDMAX.%1 < rmoldmax.rsp
     del rmoldmax.rsp

    :nofiles
     rmdir OLDMAX.%1 > nul
     cls
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   �    Directory OLDMAX.%1 has been removed.                         �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
     goto done

    :help
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   �                        RMOLDMAX.BAT                             �
echo   �                                                                 �
echo   �    This batch file will first erase all files in a selected     �
echo   �    directory containing backup files from your 386MAX or        �
echo   �    BLUEMAX installation, and then remove the directory.         �
echo   �                                                                 �
echo   �    The backup directories are named OLDMAX.n, with the          �
echo   �    latest backup directory being the one with largest number.   �
echo   �                                                                 �
echo   �    A directory of OLDMAX directories follows.  When you have    �
echo   �    selected a backup directory to remove, type:                 �
echo   �                                                                 �
echo   �    RMOLDMAX n                                                   �
echo   �                                                                 �
echo   �    Press any key to see the list of OLDMAX directories...       �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

     pause > nul
     cls
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   �    OLDMAX backup directories:                                   �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
     dir OLDMAX.* /p
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   �    Type RMOLDMAX n to remove OLDMAX directory number n.         �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

:done

