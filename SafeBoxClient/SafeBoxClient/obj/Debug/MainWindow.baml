   M S B A M L   `   `   `  ����H  DSafeBoxClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:SafeBoxClientSafeBoxClient  5   	       SafeBoxClient.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:SafeBoxClient     5   	   -   5          �Name$  Mwindow��5   	    � WindowState$ 	Maximized=�6=    � Title$ 
MainWindow��5   	   $
��1080��6   $
��1920��6*   ��5	      �� 5
   
    �� ImageSource$ images/backGround1.jpg��6   .��5      �  � RowDefinitions 5   
   �� 5      $
��238* �6   �� 5      $
��131* �6   �� 5      $	��64* �6   �� 5      $	��54* �6   �� 5      $	��58* �6   �� 5      $
��108* �6   �� 5      $
��158* �6   �� 5      $��0* �6   �� 5      $
��238* �6    � ColumnDefinitions 5   
   �� 5      $
��380* �6   �� 5      $
��286* �6   �� 5      $
��158* �6   �� 5      $	��42* �6   �� 5      $
��223* �6   �� 5      $	��97* �6   �� 5      $
��140* �6   �� 5       $
��586* �6   .+�5"   
   �� -   5         ��Name$ loginIMGBTN��5"      $��6��6%   $��images/login.png��62    J� RenderTransformOrigin$ 0.5,0.5&�6L   $��3��6l   $��2��6|   6�   �� 5#   
   -   5        $ registerIMGBTN��5#      $��6��6(   $��images/register.png��65   $��1��6R   6b   �� 5$   
   -   5        $ deleteUserBTN��5$      $��2��6'   $��images/delete user.png��64   $��2��6T   $��4��6h   $��2��6x   6�   5%      5'      