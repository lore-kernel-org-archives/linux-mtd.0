Received: from ioskeha.hittite.isp.9tel.net ([62.62.156.27])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19iHIH-0005kS-6K
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2003 18:32:49 +0100
Received: from jennifer (252.170.62.62.internet9t.9massy1-1-ro-bas-2.9tel.net
	[62.62.170.252])
	by ioskeha.hittite.isp.9tel.net (Postfix) with ESMTP id D161517BB91
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Jul 2003 19:32:14 +0200 (CEST)
From: "Philippe" <philippe@accuitee.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 31 Jul 2003 19:32:14 +0200
Message-ID: <000001c35789$aebf6220$6401a8c0@jennifer>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: DiskOnChip 2000 and CVS Drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm a newbie to the MTD world.

My hardware :

  VIAC3 MotherBoard + DiskOnChip support
  DiskOnChip 2000 32MiB MD2202-D32 (linux adress 0xD0000, 0xD000 for the
dformat utility)

I'm running Linux 2.4.20 patched with mtd drivers from CVS (2003-07-28)
The patch was applied using the tool patchin.sh :
sh patchin.sh -c -j /usr/src/linux-2.4.20

Everything went fine.
I patched grub and installed the firmware into the DOC.
My DOC is now able to boot (LanBoot)

Everything works great under GRUB/NFTL.


Now I want to use two partitions (there is a similar post but it's
pretty old and there were no real answer) :
 - 2Mb (NFTL/EXT2) kernel + initrd.gz (RO)
 - 30Mb (JFFS/JFFS2) config files, log files etc... (RW)

I read (the last two weeks) that setting up JFFS2 on DOC is tricky. 
I saw several posts (from 2001) with patches to build a
FAKE_PARTITION_SYSTEM. I wasn't able to set it up with my 2.4.20 kernel
and MTD stuff.

I looked into the MTD stuff and saw that there is a NAND-Driver for the
DiskOnChip (nand/diskonchip.c). 

- Is this piece of code usable ?
- Is there any documentation or any howto which explain how to configure
the kernel to use the DiskOnChip with it?

Thank you and sorry to disturb the mailing list if I missed the answer.

Philippe
