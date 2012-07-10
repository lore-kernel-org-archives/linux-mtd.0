Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SodED-00083w-Tt
 for linux-mtd@lists.infradead.org; Tue, 10 Jul 2012 16:24:00 +0000
Received: by wgbds1 with SMTP id ds1so109915wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 09:23:54 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/4] UBI: Use the whole NAND device to calculate max bad block
 number
Date: Tue, 10 Jul 2012 18:23:38 +0200
Message-Id: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch serie applies on top of Shmulik Ladkani's patch serie:
"[PATCH 0/5] ubi: Fix bad PEBs reserve caclulation"
(and on mtd-artem git tree)

The goal here is to make UBI reserve a number of PEB for bad block dependant
of the whole NAND chipset size, and not of the MTD partition size.

As explained in patch 3/4, the NAND manufacturers only tell how many bad blocks
there will be in the worst case on a NAND device, but not that these blocks
will be equally disposed on the flash.
I.E. if a NAND flash admits at max 40 bad blocks, and is cutted in two equal
MTD partitions, it doesn't mean that there will be at max only 20 bad blocks
per partition.
The 40 BEBs could be all on the first partition.

So, for each MTD partition, UBI should reserved the maximum expected number of
bad erase blocks.

Patches 1/2/3 are making that happend with a kernel option MTD_UBI_BEB_LIMIT
Then, patch 4 replace this option with user-space parameters (kernel parameter
and a UBI_IOCATT ioctl)

The patch on mtd-utils follows the serie.

Richard Genoud (4):
  mtd_is_partition: struct mtd_info should be const
  MTD parts: introduce mtd_get_device_size()
  UBI: use the whole MTD device size to get bad_peb_limit
  UBI: replace MTD_UBI_BEB_LIMIT with user-space parameter

 drivers/mtd/mtdpart.c          |   16 ++++++++-
 drivers/mtd/ubi/Kconfig        |   19 ----------
 drivers/mtd/ubi/build.c        |   73 ++++++++++++++++++++++++++++++---------
 drivers/mtd/ubi/cdev.c         |    9 ++++-
 drivers/mtd/ubi/ubi.h          |    6 +++-
 include/linux/mtd/partitions.h |    3 +-
 include/mtd/ubi-user.h         |   19 ++++++++++-
 7 files changed, 104 insertions(+), 41 deletions(-)

-- 
1.7.2.5
