Received: from fk-out-0910.google.com ([209.85.128.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J3rxO-0008Uy-39
	for linux-mtd@lists.infradead.org; Sun, 16 Dec 2007 11:47:01 +0000
Received: by fk-out-0910.google.com with SMTP id 18so1466912fkq.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Dec 2007 03:46:52 -0800 (PST)
Message-ID: <47651028.5030506@gmail.com>
Date: Sun, 16 Dec 2007 12:46:48 +0100
From: Gregory CLEMENT <gclement00@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] ROMBLOCK: Readonly Block Device Layer Over MTD
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: Joern Engel <joern@logfs.org>,
	Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>,
	Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I send this mail again as my previous patch was mangled, I hope that now 
I fixed it.

Hi,
I generated this patch for linux 2.6.24.rc5 and tested it with cramfs
and squashfs file systems.
As Konstantin Baydarov submit this patch first maybe it would be better
than he sign this patch, but if he can't or don't want it, I don't mind
sign it...

>From 9a06e0c1818e4b27a04a8adac7eee551c8aac115 Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gclement00@gmail.com>
Date: Wed, 12 Dec 2007 17:41:23 +0100
Subject: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD

Description:
The following patch adds readonly block device layer over mtd
that allows to use any filesystem on this device in RO mode and thus
gain faster mount times and better throughput rates.
It allows to put one RO filesystem into NAND using a bad-block aware
program initially, and mount it.  But be aware, it doesn't handle run-
time bit flips or errors (even if this event seems pretty rare).

How it works:
Blocks translation routine was added to read sector function. Assuming
that bad block won't appear during MTD reading and BBT is correct, bad
block is skipped and requested block is lazily mapped to good one.
Block driver based on the mtd readonly device driver mtdblock_ro.c and
translation routine was taken from the patch of Pantelis Antoniou
(which can be found at
http://lists.infradead.org/pipermail/linux-mtd/2004-May/009672.html).
This patch was originally submit by Konstantin Baydarov, but never
included nor rejected ( see
http://lists.infradead.org/pipermail/linux-mtd/2006-November/016835.html).

Signed-off-by: Gregory CLEMENT <gclement00@gmail.com>
---
 drivers/mtd/Kconfig    |    7 ++
 drivers/mtd/Makefile   |    1 +
 drivers/mtd/romblock.c |  173 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+), 0 deletions(-)
 create mode 100644 drivers/mtd/romblock.c

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 8848e8a..dd6ae3a 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -200,6 +200,13 @@ config MTD_BLOCK_RO
 	  You do not need this option for use with the DiskOnChip devices. For
 	  those, enable NFTL support (CONFIG_NFTL) instead.
 
+config MTD_BLOCK_ROMBLOCK
+       tristate "Readonly Block Device Layer Over MTD"
+       depends on MTD
+       help
+         Same as readonly block driver, but this allow you to mount read-only file
+         systems from an MTD device, containing bad blocks.
+
 config FTL
 	tristate "FTL (Flash Translation Layer) support"
 	depends on BLOCK
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 7f0b04b..9cb4683 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
 obj-$(CONFIG_MTD_BLKDEVS)	+= mtd_blkdevs.o
 obj-$(CONFIG_MTD_BLOCK)		+= mtdblock.o
 obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o
+obj-$(CONFIG_MTD_BLOCK_ROMBLOCK)       += romblock.o mtd_blkdevs.o
 obj-$(CONFIG_FTL)		+= ftl.o
 obj-$(CONFIG_NFTL)		+= nftl.o
 obj-$(CONFIG_INFTL)		+= inftl.o
diff --git a/drivers/mtd/romblock.c b/drivers/mtd/romblock.c
new file mode 100644
index 0000000..b02efae
--- /dev/null
+++ b/drivers/mtd/romblock.c
@@ -0,0 +1,173 @@
+/*
+ *  Readonly Block Device Layer Over MTD
+ *
+ *  (C) 2006 Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>
+ *           Pantelis Antoniou <panto@intracom.gr>
+ *           David Woodhouse <dwmw2@infradead.org>
+ *
+ *  It allows to use any filesystem on this device in
+ *  RO mode and thus gain faster mount times and better
+ *  throughput rates.
+ *  It allows to put one RO filesystem into NAND using a
+ *  bad-block aware program initially, and mount it.  But be aware,
+ *  it doesn't handle run-time bit flips or errors (even if this event
+ *  seems pretty rare).
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/blktrans.h>
+
+struct romblock_map {
+	struct mtd_blktrans_dev dev;
+	/* block map for RO */
+	int32_t *block_map;
+	int32_t block_top;
+	int32_t block_scantop;
+};
+
+static loff_t map_over_bad_blocks(struct mtd_blktrans_dev *dev, loff_t from)
+{
+	int i, block;
+	struct mtd_info *mtd = dev->mtd;
+	struct romblock_map *dev_cont =
+	    container_of(dev, struct romblock_map, dev);
+	int32_t *block_map = dev_cont->block_map;
+	int32_t block_top = dev_cont->block_top;
+	int32_t block_scantop = dev_cont->block_scantop;
+
+	/* if no bad block checking is possible bail out */
+	if (mtd->block_isbad == NULL)
+		return from;
+
+	/* first time in */
+	if (block_map == NULL) {
+		block_top = mtd->size / mtd->erasesize;
+
+		block_map = kmalloc(sizeof(*block_map) * block_top, GFP_KERNEL);
+		if (block_map == NULL) {
+			printk(KERN_ERR
+			       "map_over_bad_blocks(): unable to allocate block map\n");
+			return -ENOMEM;
+		}
+		for (i = 0; i < block_top; i++)
+			block_map[i] = -1;
+
+		for (i = 0; i < block_top; i++)
+			if ((*mtd->block_isbad) (mtd, i * mtd->erasesize) == 0)
+				break;
+
+		if (i >= block_top) {
+			printk(KERN_WARNING
+			       "map_over_bad_blocks(): all blocks bad!\n");
+			return -EIO;
+		}
+		block_scantop = 0;
+		block_map[0] = i;
+
+		DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n", block_scantop,
+		      block_map[block_scantop]);
+	}
+
+	block = ((int)from / mtd->erasesize);
+	if (block >= block_top)
+		return (loff_t)-1;
+
+	/* scan for bad block up to where we want */
+	while (block >= block_scantop) {
+		/* find a non bad block */
+		for (i = block_map[block_scantop] + 1; i < block_top; i++)
+			if ((*mtd->block_isbad) (mtd, i * mtd->erasesize) == 0)
+				break;
+
+		/* exhausted ? */
+		if (i >= block_top) {
+			printk(KERN_WARNING
+			       "map_over_bad_blocks(): no more good blocks!\n");
+			return (loff_t)-1;
+		}
+
+		block_map[++block_scantop] = i;
+		DEBUG(MTD_DEBUG_LEVEL0, "mtd: map %d -> %d\n", block_scantop,
+		      block_map[block_scantop]);
+	}
+
+	block = block_map[(int)from / mtd->erasesize];
+	from = (block * mtd->erasesize) | ((int)from & (mtd->erasesize - 1));
+	return from;
+}
+
+static int romblock_readsect(struct mtd_blktrans_dev *dev,
+			     unsigned long block, char *buf)
+{
+	size_t retlen;
+	unsigned long from;
+	from = map_over_bad_blocks(dev, block << 9);
+
+	if (dev->mtd->read(dev->mtd, from, 512, &retlen, buf))
+		return 1;
+	return 0;
+}
+
+static int romblock_writesect(struct mtd_blktrans_dev *dev,
+			      unsigned long block, char *buf)
+{
+	size_t retlen;
+
+	if (dev->mtd->write(dev->mtd, (block * 512), 512, &retlen, buf))
+		return 1;
+	return 0;
+}
+
+static void romblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
+{
+	struct romblock_map *dev_cont = kzalloc(sizeof(*dev_cont), GFP_KERNEL);
+
+	if (!dev_cont)
+		return;
+
+	dev_cont->dev.mtd = mtd;
+	dev_cont->dev.devnum = mtd->index;
+	dev_cont->dev.size = mtd->size >> 9;
+	dev_cont->dev.tr = tr;
+	dev_cont->dev.readonly = 1;
+
+	add_mtd_blktrans_dev(&(dev_cont->dev));
+}
+
+static void romblock_remove_dev(struct mtd_blktrans_dev *dev)
+{
+	del_mtd_blktrans_dev(dev);
+	kfree(dev);
+}
+
+static struct mtd_blktrans_ops romblock_tr = {
+	.name = "romblock",
+	.major = 240, /*experimental number as 258 seems not to working */
+	.part_bits = 0,
+	.blksize = 512,
+	.readsect = romblock_readsect,
+	.writesect = romblock_writesect,
+	.add_mtd = romblock_add_mtd,
+	.remove_dev = romblock_remove_dev,
+	.owner = THIS_MODULE,
+};
+
+static int __init romblock_init(void)
+{
+	return register_mtd_blktrans(&romblock_tr);
+}
+
+static void __exit romblock_exit(void)
+{
+	deregister_mtd_blktrans(&romblock_tr);
+}
+
+module_init(romblock_init);
+module_exit(romblock_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>");
+MODULE_DESCRIPTION("Readonly Block Device Layer Over MTD");
-- 
1.5.3.7


--
Gregory CLEMENT
Adeneo
Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
Tél. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41

www.adetelgroup.com
