Received: from 216.184.14.34.unused.swcp.com ([216.184.14.34]
	helo=scone.biscuit.swcp.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ao7v1-0004zJ-NL
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2004 21:17:15 +0000
Received: from scone.biscuit.swcp.com (localhost [127.0.0.1])
	id i13LJP36000315
	for <linux-mtd@lists.infradead.org>; Tue, 3 Feb 2004 14:19:25 -0700
Received: from localhost (bill@localhost)i13LJPqO000312
	for <linux-mtd@lists.infradead.org>; Tue, 3 Feb 2004 14:19:25 -0700
Date: Tue, 3 Feb 2004 14:19:25 -0700 (MST)
From: Bill Mann <bill@biscuit.swcp.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.58.0402031331450.2191@scone.biscuit.swcp.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: mtd, nand, lilo
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've got a SH4 system with a SmartMedia device that I'm able to read, 
write, erase and mount as a JFFS2 filesystem.  

After applying the lilo-mtd patch, building and running lilo, I'm getting 
the following errors:

	Reading data from NAND FLASH without ECC is not recommended
		-
		-
	Reading data from NAND FLASH without ECC is not recommended
	geo_query_dev HDIO_GETGEO (dev 0x1f01): Inappropriate ioctl for device

lilo.conf file:
	linear
	boot=/dev/mtdblock/0
	image=/boot/zImage
	root=/dev/mtdblock/1
	label=linux

Should I be using lilo or is there another relevant patch?

- Bill
