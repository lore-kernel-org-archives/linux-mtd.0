Received: from bay19-f21.bay19.hotmail.com ([64.4.53.71] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTGvv-00015R-MD
	for linux-mtd@lists.infradead.org; Thu, 27 May 2004 05:12:24 -0400
From: "w h" <wh3cq@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 27 May 2004 09:11:00 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY19-F21ZFkTEPcOhN0005664a@hotmail.com>
Subject: about syncflash lock and jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,everyone:

I've worked on Moto Dragonball MX9328MXL for more than 4 months and on 
jffs2 for about two months. But Now some problems in mtd and jffs2 trouble 
me so much that I almost tear my hair and can do nothing. I do need some 
help.

I try to use jffs2 as root filesystem on SyncFlash(micron mt28s4m16lc_6, 
two chips, total 16M) in my board. Linux OS and jffs2 root fs can start up 
but with some infomation like this:
...
Erase at ****(some address) failed immediately:-EROFS.Is the sector locked?
Erase at ****(some address) failed immediately:-EROFS.Is the sector locked?
Erase at ****(some address) failed immediately:-EROFS.Is the sector locked?
Erase at ****(some address) failed immediately:-EROFS.Is the sector locked?
Erase at ****(some address) failed immediately:-EROFS.Is the sector locked?
Erase at ****(some address) failed immediately:-EROFS.Is the sector locked?
...

after it starts up, I run 
#cat /proc/mtd
dev:         size       erasesize    name
mtd0:     00100000       20000    bootloader
mtd0:     00200000       20000    kernel
mtd2:     00B00000       20000    filesystem
mtd3:     00200000       20000    fdisk

but if I try to "mkdir" or save file in some directory,it gives "Permission 
denied"

if running "cat /proc/mounts", I can see: 
/dev/mtdblock/2 / jffs2 rw 0 0 
……………………………… 
……………………………… 
#df 
filesystem           1k -block    used    available use% mounted on 
/dev/mtdblock/2    13312       13312        0       100%     / 
……………………………………………………………………………… 
……………………………………………………………………………… 
the size of filesystem partition is 11M , the jffs2.img which I download 
only takes up 6M, how dose "use%=100%" come from? 

What I use is SyncFlash(micron mt28s4m16lc_6, two chips, total 16M), is it 
posssible that the SyncFlash is locked(refer to the startup information) so 
I can't "mkdir" or save file?
Does anyone know the specific parameters when using command "unlock"?

Thanks.

Best Reguard to everyone who see this mail,
susan

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  
