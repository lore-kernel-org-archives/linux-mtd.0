Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LlexA-0006ra-Tl
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 07:52:20 +0000
Received: from themisto.ext.pengutronix.de ([92.198.50.58]
	helo=jupiter.intranet.kreuzholzen.de)
	by metis.ext.pengutronix.de with esmtp (Exim 4.63)
	(envelope-from <jbe@pengutronix.de>) id 1Llex2-0005Ce-53
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 08:52:08 +0100
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 23 Mar 2009 08:52:01 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200903230852.02597.jbe@pengutronix.de>
Subject: DOC2000 flash: Do I miss something?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to use a DiskOnChip device (MD2202-D16) on my x86 based board.
I activated all available DOC drivers in the current 2.6.28.8 kernel, but only
the DOC2000 driver will work with this device: 

[...]
DiskOnChip 2000 found at address 0xD8000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba:NAND 16MiB 3,3V 8-bit)
1 flash chips found. Total DiskOnChip size: 16 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Ignoring DiskOnChip 2000 at 0xDA000 - already configured
DiskOnChip failed TOGGLE test, dropping.
[...]

$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00004000 "DiskOnChip 2000"

$ ls /dev/mtd*
/dev/mtd0       /dev/mtd0ro     /dev/mtdblock0

But I can't work with it:

$ flash_eraseall /dev/mtd0
/dev/mtd0: Bad block check not available

$ nandwrite -j /dev/mtd0 root.jffs2
MEMGETINFO: Inappropriate ioctl for device

Is it due to this driver is marked as "depricated"? What can I use an an
alternative to make the device work again?

Regards,
Juergen
