Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UZXX-0003rQ-00
	for mtd-list@infradead.org; Mon, 13 Mar 2000 18:26:03 +0000
Received: from out1.prserv.net ([32.97.166.31] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12UZXV-0003rK-00
	for mtd@infradead.org; Mon, 13 Mar 2000 18:26:01 +0000
From: "Dvir Oren" <dvir@lucidvon.com>
To: MTD <mtd@infradead.org>
Date: Mon, 13 Mar 2000 20:28:28 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: nftl_format destroys the file system
Message-Id: <E12UZXV-0003rK-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I tried nftl_format /dev/mtd0 49152 so that it won't destroy M-
Systems' firmware, and also tried formatting the flash entirely, and 
then putting the firmware on it using dd, but for some reason, after I 
boot the machine, the ext2 file system is destroyed.  If I check the 
file system before boot, everything is fine, and I can mount and 
umount and everything is there.  One thing I discovered is that 
when I run fdisk /dev/nftla, I get 1022 blocks, but when I format the 
flash with M-Systems' utilities, I get 999 blocks.

I will run somre more tests soon, but in the meantime, does 
anybody have any idea why this happens?

Of course, if the file system will work, and with the patched LILO I 
posted, and with a 2.3 kernel, I should be able to boot from the 
flash using MTD.

---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
