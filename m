From: guo_zl9@hotmail.com (guo_zhenglin)
Date: Mon, 17 Mar 2003 10:50:09 +0800
Subject: How use FTP on serial port(COM1)?
Message-ID: <OE32DCOTSt39LktrLEz00001e01@hotmail.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I have a question,I need your help.

1)my target board has not ethernet card, only has a 
serial port (COM1) .

2)in order to update or maintenance targetboard's linux system 
and application system,I want to use FTP or TFTP via COM1.

3)I had config linux kernel :
    CONFIG_PPP=y
    CONFIG_PPP_ASYNC=y
    CONFIG_PPPOE=y

4) I place "tftp" file in "/bin" directory and "services" file in "/etc"
    directory.
    have "tftp            69/udp"  in  "services" file.

5) when I run "tftp" on target board, show
   "tftp: udp/tftp: unknow service"
6) what are  I still need to config or add ?
    need  "pppd"?

thanks in advance.


 ------------------------------
 guo zhenglin 
 E-mail: guo_zl9 at hotmail.com
 ------------------------------
