Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HbnJp-0002kv-9X
	for linux-mtd@lists.infradead.org; Wed, 11 Apr 2007 20:37:46 -0400
Message-ID: <37587.69.30.123.186.1176338248.squirrel@architechnical.net>
Date: Wed, 11 Apr 2007 17:37:28 -0700 (PDT)
Subject: Problem booting from MTD partition of NAND device
From: "Pete MacKay" <linux@architechnical.net>
To: torsten.demke@motorola.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not sure if you've done this, but make sure you specify "rootfstype=jffs2"
in the kernel parameters.

Additionally, make sure the NOR driver doesn't specify the root file
system using code.  Look for "ROOT_DEV = MKDEV(MTD_BLOCK_MAJOR, 0);", or
the inclusion of "<linux/root_dev.h>".

Torsten Demke writes:

Hi all,

I have a PPC system that consists of several MTD partitions on a mix of
NOR and NAND flashes.
MTD partition layout in my system:
dev:    size   erasesize  name
mtd0: 00020000 00020000 "enviroment-flash1"
mtd1: 00500000 00020000 "kernel-flash1"
mtd2: 01a60000 00020000 "empty-flash1"
mtd3: 00080000 00020000 "uboot-flash1"
mtd4: 02000000 00020000 "boot-flash1"
mtd5: 00020000 00020000 "enviroment-flash2"
mtd6: 00500000 00020000 "kernel-flash2"
mtd7: 01a60000 00020000 "empty-flash2"
mtd8: 00080000 00020000 "uboot-flash2"
mtd9: 02000000 00020000 "boot-flash2"
mtd10: 80000000 00020000 "NAND Flash"

Partition 4 is the merge of partitions 0..3
Partition 9 is the merge of partition 5..8
0..4 and 5..9 are independent NOR flash devices (Intel Strataflash)
Partition 10 is located on a NAND flash device and is formated with
jffs2.

Whenever I try to boot from the NAND flash (root=/dev/mtdblock10)  I get
following error:
  VFS: Mount ROOT_DEV 0 - mtdblock10		<< some additional debug
output
  Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

When I disable all NOR flashes in the kernel (2.6.14) I can boot
(root=/dev/mtdblock0)
my board without a problem.
Any hints or comments?

Thanks for your help.
Regards,
Torsten
