   M S B A M L   `   `   `  ����H  DSafeBoxClient, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:SafeBoxClientSafeBoxClient  5   	       SafeBoxClient.register   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:SafeBoxClient     5   	   -   5          � WindowState$  	Maximized=�5   *    � Title$ register��5   	   $
��1080��6   $
��1920��6(   ��5	      �� 5
   
    �� ImageSource$ images/2.jpg��6   .��5      �  � RowDefinitions 5   
   �� 5      $
��268* �6   �� 5      $	��85* �6   �� 5      $
��105* �6   �� 5      $	��78* �6   �� 5      $	��33* �6   �� 5      $	��98* �6   �� 5      $
��382* �6    � ColumnDefinitions 5   
   �� 5      $
��182* �6   �� 5      $
��122* �6   �� 5      $
��149* �6   �� 5      $
��339* �6   .+�5   
   �� -   5         ��Name$ nameBox��5       �� TextWrapping$
 Wrap=�6#   $�� ��67   $��2��6?   $��1��6O   $��40(�6\   �� 5   
   $
��Wrap=�6   $��
Username: ��6(   $��1��6:   $��1��6G   $��50(�6W   �� 5   
   $
��Wrap=�6   $��	Password:��6(   $��3��69   $��1��6F    J� RenderTransformOrigin$ 0.269,-0.07&�6V   $��50(�6z   G� 5   
   -   5         G�Name$ passBox��5      $��2��6'   $��3��67   $��50(�6D   �� 5    
   -   5        	 ��Name$	 registerBtn��5       $��2��6%   $��4��65   $��2��6B   $��images/register.png��6S   6p   5!      5"      