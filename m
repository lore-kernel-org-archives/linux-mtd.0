Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hk6iP-0006wU-Nt
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 18:57:31 -0400
Date: Fri, 4 May 2007 23:22:54 +0100 (BST)
From: John Smith <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: UBI: Cannot create static volumes when FTL is enabled
Message-ID: <Pine.LNX.4.33.0705042249130.30496-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Probably not a major bug, but here it is....

I have a slightly muddled kernel using MTD and UBI from a recent snapshot
from kernel.org, and the rest of the kernel from a derivative of 2.6.18.

I accidentally enabled the CONFIG_FTL as well as MTD and UBI.

When trying to create a static UBI volume with the command

  # ubimkvol -d 0 -n 1 -N ubi-volume --type=static -s 123000

I trigger a kernel stack dump. It arises from the ubi_assert

   ubi_assert(vol->vol_type != UBI_STATIC_VOLUME);

in function ubi_eba_read_leb() of file  drivers/mtd/ubi/eba.c

The rest of the call trace reads:
Call Trace:
 [<801d2e04>] gluebi_read+0x144/0x1bc        drivers/mtd/ubi/gluebi.c:132
 [<801aa2b4>] scan_header+0x84/0x248         drivers/mtd/ftl.c:178
 [<801aba18>] ftl_add_mtd+0x2c/0xcc          drivers/mtd/ftl.c:1045
 [<801a961c>] blktrans_notify_add+0x50/0x7c  drivers/mtd/mtd_blkdevs.c:336
 [<801a5d74>] add_mtd_device+0xd4/0x148      drivers/mtd/mtdcore.c:75
 [<801d32f0>] ubi_create_gluebi+0xd8/0x170   drivers/mtd/ubi/gluebi.c:297
 [<801c459c>] ubi_create_volume+0x43c/0x854  drivers/mtd/ubi/vmt.c:316
 [<801c7f60>] ubi_cdev_ioctl+0x1d0/0x2f0     drivers/mtd/ubi/cdev.c:630
 [<8008b6d4>] do_ioctl+0x54/0x7c             fs/ioctl.c:34
 [<8008b8e0>] vfs_ioctl+0x78/0x220           fs/ioctl.c:153
 [<8008bad8>] sys_ioctl+0x50/0x98            fs/ioctl.c:173

Regards
John

John Smith
Blackburn,
England.
