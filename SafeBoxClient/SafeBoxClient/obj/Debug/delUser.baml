   M S B A M L   `   `   `  ����H  DSafeBoxClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:SafeBoxClientSafeBoxClient  5   	       SafeBoxClient.delUser   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:SafeBoxClient     5   	   -   5          � WindowState$  	Maximized=�5   )    � Title$ delUser��5   	   $
��1080��6   $
��1920��6'   ��5	      �� 5
   
    �� ImageSource$ images/2.jpg��6   .��5      � -   5         � RowDefinitions 5   
   �� 5      $
��187* �6   �� 5      $	��88* �6   �� 5      $
��104* �6   �� 5      $	��92* �6   �� 5      $	��38* �6   �� 5      $	��94* �6   �� 5      $
��446* �6    � ColumnDefinitions 5   
   �� 5      $
��205* �6   �� 5      $
��156* �6   �� 5      $	��29* �6   �� 5      $
��153* �6   �� 5      $	��33* �6   �� 5      $
��380* �6   .+�5   
   �� $
��Wrap=�6   $��	username:��6(   $��1��69   $��1��6I   $��40(�6V   $��Center=�6d   $��	51,0,28,0q�6�   $	��233��6�   �� 5   
   $
��Wrap=�6   $��	password:��6(   $��3��69   $��50(�6F   $��1��6T   $��Center=�6d   $��	51,0,28,0q�6�   $	��233��6�   �� 5    
   -   5         ��Name$ usernameBox��5        �� TextWrapping$
 Wrap=�6'   $�� ��6;   $��2��6C   $��1��6S   $��3��6`   G� 5!   
   -   5         G�Name$ passwordBox��5!      $��3��6+   $��2��68   $��3��6H   �� 5"   
   -   5         ��Name$ delBTn��5"      $��3��6    $��5��60   $��images/delete user.png��6=   5$      5%      