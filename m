Received: from amalthea.dnx.de ([193.108.181.146])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBHF3-0000NF-Gg
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 18:53:37 +0100
Received: from metis.pengutronix.de ([213.252.143.165]:46852 helo=localhost)
	by amalthea.dnx.de with asmtp (Exim 4.30)
	id 1BBHEq-0001MO-DH
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 19:53:24 +0200
Received: from robert by localhost with local (Exim 3.36 #1 (Debian))
	id 1BBHEq-0004DN-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Apr 2004 19:53:24 +0200
Date: Wed, 7 Apr 2004 19:53:24 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20040407175324.GC15473@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: Robert Schwebel <robert@pengutronix.de>
Subject: JFFS2 does not work (CVS)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

I have just ported a kernel (based on 2.4.25-vrs2) to a board containing
a Motorola MX1 ARM920T processor. The mapping driver works, cramfs works
ontop of the MTD layer. But JFFS2 still has problems: 

----------8<----------8<----------8<----------8<----------
[...]
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
Flowscreen 2 parport: registering driver: ok.
[...]
fs2: probing flash at 0x10000000
Flowscreen 2 Flash: Found 1 x16 devices at 0x0 in 16-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
Flowscreen 2 Flash: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Using static partition definition
Creating 6 MTD partitions on "Flowscreen 2 Flash":
0x00000000-0x00020000 : "U-Boot"
0x00020000-0x00030000 : "U-Boot-Environment"
0x00030000-0x00060000 : "Start-Logo"
0x00060000-0x00200000 : "Kernel"
0x00200000-0x00700000 : "Root-FS"
0x00700000-0x00800000 : "User-FS"
[...]
cramfs: wrong magic
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing init memory: 68K
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0003000c: Read 0x2e14353 6, calculated 0x737ee770
jffs2_get_inode_nodes(): Data CRC failed on node at 0x0004a050: Read 0x46ebc4b 0, calculated 0x4d01d4dd
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00046d38: Read 0x2d31bfc 3, calculated 0x5a59cd0a
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00046328: Read 0x4b26f79 f, calculated 0xd9ae294d
Data CRC e3cddb80 != calculated CRC f82a02b0 for node at 0003ee7c
Data CRC 3324bd86 != calculated CRC 5660ff63 for node at 00040230
----------8<----------8<----------8<----------8<----------

The port contains CVS from today, the image was also created with mkfs.jffs2
from CVS. Any idea...?  
 
Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hornemannstraße 12,  31137 Hildesheim, Germany
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4
