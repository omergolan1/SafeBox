   M S B A M L   `   `   `  ����H  DSafeBoxClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:SafeBoxClientSafeBoxClient  5   	       SafeBoxClient.login   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:SafeBoxClient     5   	   -   5          � WindowState$  	Maximized=�5   '    � Title$ login��5   	   $
��1080��6   $
��1920��6%   ��5	      �� 5
   
    �� ImageSource$ images/2.jpg��6   .��5      �  � RowDefinitions 5   
   �� 5      $
��251* �6   �� 5      $	��60* �6   �� 5      $
��138* �6   �� 5      $	��60* �6   �� 5      $	��80* �6   �� 5      $	��54* �6   �� 5      $
��406* �6    � ColumnDefinitions 5   
   �� 5      $
��206* �6   �� 5      $
��171* �6   �� 5      $	��34* �6   �� 5      $
��166* �6   �� 5      $
��379* �6   .+�5   
   �� -   5         ��Name$ usernameBox��5       �� TextWrapping$
 Wrap=�6'   $�� ��6;   $��3��6C   $��1��6S   $��40(�6`   G� 5   
   -   5         G�Name$ passBox��5      $��3��6'   $��3��67   $��50(�6D   �� 5    
   -   5        $��3��5       $��images/login.png��6    $��4��6:   $��2��6G   6X   �� 5!   
   $��1��6   $��1��6$   $
��Wrap=�61   $��	Username:��6E   $��50(�6V   $��Center=�6d   �� 5"   
   $��1��6   $��3��6$   $
��Wrap=�61   $��	Password:��6E   $��50(�6V   $��Center=�6d   5#      5$      