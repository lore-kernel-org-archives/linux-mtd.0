Received: from 210-54-242-124.adsl.xtra.co.nz ([210.54.242.124]
	helo=openmail.open.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195tlE-0006Rm-J4
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 21:44:05 +0100
Message-ID: <DEA23DB61B62D4118B5900508B323B8401055535@OPENMAIL>
From: Jeremy Bowen <Jeremy.Bowen@opennw.com>
To: "'dwmw2@infradead.org'" <dwmw2@infradead.org>
Date: Thu, 17 Apr 2003 08:40:17 +1200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Unable to write to some JFS partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 1. Don't use JFFS, use JFFS2.

OK. But I think there is an underlying problem with what I've currently got
that I'd quite like to understand. Why does one JFFS partition work fine
while the 2 others I try, don't ?

> 2. Don't attempt to use partitions which have fewer free 
> blocks than are required to make progress --

How many free blocks are required to make progress ?

> combine all 
> your file system space into one JFFS2 partition. 

Is this the "mtdconcat" functionality ?

Actually I'm developing on a board with 8Mb Flash but the production units
will only have 4Mb so the partitions I've defined are somewhat artificial.

Do I need 2 free flash sectors in order to us JFFS ?

> Note that there exist bootloaders which can boot
> from JFFS2 so you can put the kernel in there too.

I'm using Das U-Boot.

> 3. eraseall works on the /dev/mtd character devices, not the block 
>    devices.

bash-2.05# eraseall /dev/mtdblock/7
eraseall: /dev/mtdblock/7: unable to get MTD device info
bash-2.05# eraseall /dev/mtd/7
eraseall: /dev/mtd/7: unable to get MTD device info

Eraseall doesn't seem to work for me whatsoever.


Jeremy
