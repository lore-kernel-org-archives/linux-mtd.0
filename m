Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 158kk3-0001b0-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Jun 2001 16:33:36 +0100
Received: from [202.108.255.253] (helo=bjapp6.163.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 158Cje-0007Jn-00
	for linux-mtd@lists.infradead.org; Fri, 08 Jun 2001 04:14:54 +0100
MIME-Version: 1.0
Message-Id: <3B20432B.09679@bjapp6.163.net>
Date: Fri, 8 Jun 2001 11:14:51 +0800 (CST)
From: jyllyj@163.net
To: linux-mtd@lists.infradead.org
Subject: mount jffs so slowly!
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hi,all

I writed a NAND drivers (sumsung 8Mbyte) under MTd.
nandtest ok
eraseall ok
partition 8M ,erase_size 8k. 
insmod mtdcore.o
insmod mtdblock.o
insmod nanddrivers.o
insmod jffs.o 
mount the device
mount -t jffs /dev/mtdblock0 /mnt
it's so slowly (about 100s). (DEBUG_LEVEL 0 ,CPU Cyrix Media 233MHZ) 
no other problem currently :)
in DEBUG_LEVEL 3,I notices that flash_safe_read be invoked  frequently.

Any help would really be appreciated.

Regards
              jiang yue long 
                   beijin CHINA




===============================================
为你而建，为你而设，让你传递真心真意 

    ---- 163.net贺卡站（http://ecard.163.net）

163电子邮局全新奉献，精彩无限的电子贺卡站。
===============================================
