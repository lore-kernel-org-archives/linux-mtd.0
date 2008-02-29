Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JUt9I-0003ke-7m
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 00:30:52 +0000
Date: Thu, 28 Feb 2008 16:30:38 -0800
Subject: Writing JFFS2 to Samsung K9F1208U0B NAND on AMCC PPC405EX/r
	Kilauea/Haleakala
From: Grant Erickson <gerickson@nuovations.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <C3EC922E.DAF1%gerickson@nuovations.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am attempting to create and write a JFFS2 file system to the Samsung
K9F1208U0B NAND part on an AMCC PPC405EXr "Haleakala" board and seem to be
running into a hurdle or two.

Given the Samsung K9F1208U0B's 16 KiB erase block and 512 B page sizes, I
invoked mkfs.jffs2 with:

% mkfs.jffs2 -n -b -s 512 -e 16 KiB -d /export/haleakala -o haleakala.img

I then erase the device with 'flash_eraseall' using the '-j' option:

# flash_eraseall -j /dev/mtd9
Erasing 16 Kibyte @ 3f94000 -- 99 % complete. Cleanmarker written at
3f94000.

However, when I attempt to lay down the file system image with nandwrite
(again, using the '-j' option), I get a driver error:

# nandwrite -j /dev/mtd9 haleakala.img
MEMSETOOBSEL: Inappropriate ioctl for device

Eliding the '-j' option, I get errors about page alignment:

# nandwrite /dev/mtd9 haleakala.img
Input file is not page aligned
Data was only partially written due to error: Success

The output from 'mtd_debug':

# mtd_debug info /dev/mtd9
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 66682880 (63M)
mtd.erasesize = 16384 (16K)
mtd.writesize = 512
mtd.oobsize = 16 
regions = 0

The version of mtd-utils is 1.1.0 from the MTD FTP site.

This occurs with either hand-built kernels using the GIT repo or
'git://www.denx.de/git/linux-2.6-denx.git' the latest pre-built kernel
posted to the AMCC-partner (DENX) site:

    ftp://ftp.denx.de/pub/linux/images/amcc/kilauea/uImage-g8adfc2c

# uname -a
Linux haleakala 2.6.25-rc2-00492-g8adfc2c #1 Sat Feb 23 23:10:15 CET 2008
ppc unknown

Anyone have success with writing a JFFS2 file system on these boards or have
any insight into the errors above?

Regards,

Grant Erickson
