Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GmvKC-0002VH-Sf
	for linux-mtd@lists.infradead.org; Wed, 22 Nov 2006 11:52:21 -0500
Date: Wed, 22 Nov 2006 19:56:33 +0300
From: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
To: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
Message-ID: <20061122195633.0719c264@localhost.localdomain>
In-Reply-To: <4562D537.5080908@ru.mvista.com>
References: <20061117184055.569da7ad@localhost.localdomain>
	<1164034364.3574.6.camel@zod.rchland.ibm.com>
	<4562D537.5080908@ru.mvista.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_OlhidWy=_lrQpidCOO4/0B="
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--MP_OlhidWy=_lrQpidCOO4/0B=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, 21 Nov 2006 13:30:15 +0300
Vitaly Wool <vwool@ru.mvista.com> wrote:

> Josh Boyer wrote:
> 
> <snip>
> >> +static struct mtd_blktrans_ops mtdblock_tr = {
> >> +	.name		= "mtdblock",
> >> +	.major		= 258,
> >> +	.part_bits	= 0,
> >> +	.readsect	= mtdblock_readsect,
> >> +	.writesect	= mtdblock_writesect,
> >> +	.add_mtd	= mtdblock_add_mtd,
> >> +	.remove_dev	= mtdblock_remove_dev,
> >> +	.owner		= THIS_MODULE,
> >> +};
> >>     
> >
> > You went to the trouble of getting a new major number assigned...
> > why not call it something other than mtdblock?
> >   
> Agree.
> >   
> >> Index: mips-kernel-2.6/drivers/mtd/Kconfig
> >> ===================================================================
> >> --- mips-kernel-2.6.orig/drivers/mtd/Kconfig
> >> +++ mips-kernel-2.6/drivers/mtd/Kconfig
> >> @@ -197,6 +197,13 @@ config MTD_BLOCK_RO
> >>  	  You do not need this option for use with the DiskOnChip
> >> devices. For those, enable NFTL support (CONFIG_NFTL) instead.
> >>
> >> +config MTD_BLOCK_RO_BBFREE
> >> +	tristate "Readonly bad block free block device access to
> >> MTD devices"
> >> +	depends on MTD_BLOCK!=y && MTD && MTD_BLOCK_RO!=y
> >> +	help
> >> +	  Same as readonly block driver, but this allow you to
> >> mount read-only file
> >> +	  systems from an MTD device, containing bad blocks.
> >> +
> >>     
> >
> > This part seems hacky to me...  why can't use use mtdblock or
> > mtdblock_ro when this is enabled?  And what happens in the module
> > case? 
> I guess this line is borrowed from MTD_BLOCK_RO:
> 
> config MTD_BLOCK_RO
>         tristate "Readonly block device access to MTD devices"
>         depends on MTD_BLOCK!=y && MTD && BLOCK
> 
> I think though that these limitations are redundant at least for 
> MTD_BLOCK_RO_BBFREE b/c there might be the cases where there're both 
> NAND and NOR chips in the system so MTD_BLOCK_RO and
> MTD_BLOCK_RO_BBFREE might be needed to be present in the system at
> the same time.
> 
> Vitaly
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Corrected typo, renamed driver, got rid from redundant dependency.
Also I've tested mtdblock_ro_bbfree as module - ok.

Interdiff:
diff -u mtd-2.6/drivers/mtd/mtdblock_ro_bbfree.c
mtd-2.6/drivers/mtd/mtdblock_ro_bbfree.c ---
mtd-2.6/drivers/mtd/mtdblock_ro_bbfree.c +++
mtd-2.6/drivers/mtd/mtdblock_ro_bbfree.c @@ -73,7 +73,7 @@
 			if ((*mtd->block_isbad)(mtd, i *
mtd->erasesize) == 0) break;
 
-		/* exchausted ? */
+		/* exhausted ? */
 		if (i >= block_top) {
 			printk (KERN_WARNING "map_over_bad_blocks():
no more good blocks!\n"); return (loff_t)-1;
@@ -137,7 +137,7 @@
 }
 
 static struct mtd_blktrans_ops mtdblock_tr = {
-	.name		= "mtdblock",
+	.name		= "mtdblock_bbfree",
 	.major		= 258,
 	.part_bits	= 0,
 	.readsect	= mtdblock_readsect,
diff -u mtd-2.6/drivers/mtd/Kconfig mtd-2.6/drivers/mtd/Kconfig
--- mtd-2.6/drivers/mtd/Kconfig
+++ mtd-2.6/drivers/mtd/Kconfig
@@ -199,7 +199,7 @@
 
 config MTD_BLOCK_RO_BBFREE
 	tristate "Readonly bad block free block device access to MTD
devices"
-	depends on MTD_BLOCK!=y && MTD && MTD_BLOCK_RO!=y
+	depends on MTD_BLOCK!=y && MTD
 	help
 	  Same as readonly block driver, but this allow you to mount
read-only file systems from an MTD device, containing bad blocks.

Whole patch is attached.

--MP_OlhidWy=_lrQpidCOO4/0B=
Content-Type: text/x-patch; name=bbfree_mtd_ro.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=bbfree_mtd_ro.patch

 drivers/mtd/Kconfig              |    7 +
 drivers/mtd/Makefile             |    1 
 drivers/mtd/mtdblock_ro_bbfree.c |  165 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)

Index: mtd-2.6/drivers/mtd/mtdblock_ro_bbfree.c
===================================================================
--- /dev/null
+++ mtd-2.6/drivers/mtd/mtdblock_ro_bbfree.c
@@ -0,0 +1,165 @@
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
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/blktrans.h>
+
+struct mtd_block_map {
+	struct mtd_blktrans_dev dev;
+	/* block map for RO */
+	int32_t *block_map;
+	int32_t block_top;
+	int32_t block_scantop;
+};
+
+static loff_t map_over_bad_blocks(struct mtd_blktrans_dev* dev, loff_t from)
+{
+	int i, block;
+	struct mtd_info *mtd = dev->mtd;
+	struct mtd_block_map* dev_cont = container_of(dev, struct mtd_block_map, dev);
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
+		block_map = kmalloc(sizeof(*block_map) * block_top, GFP_KERNEL);
+		if (block_map == NULL) {
+			printk (KERN_WARNING "map_over_bad_blocks(): unable to allocate block map\n");
+			return -ENOMEM;
+		}
+		for (i = 0; i < block_top; i++)
+			block_map[i] = -1;
+
+		for (i = 0; i < block_top; i++)
+			if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
+				break;
+
+		if (i >= block_top) {
+			printk (KERN_WARNING "map_over_bad_blocks(): all blocks bad!\n");
+			return -EIO;
+		}
+		block_scantop = 0;
+		block_map[0] = i;
+
+		DEBUG(0, "mtd: map %d -> %d\n", block_scantop, block_map[block_scantop]);
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
+			if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
+				break;
+
+		/* exhausted ? */
+		if (i >= block_top) {
+			printk (KERN_WARNING "map_over_bad_blocks(): no more good blocks!\n");
+			return (loff_t)-1;
+		}
+
+		block_map[++block_scantop] = i;
+		DEBUG(0, "mtd: map %d -> %d\n", block_scantop, block_map[block_scantop]);
+	}
+
+	block = block_map[(int)from / mtd->erasesize];
+	from = (block * mtd->erasesize) | ((int)from & (mtd->erasesize - 1));
+	return from;
+}
+
+static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
+			      unsigned long block, char *buf)
+{
+	size_t retlen;
+	unsigned long from;
+
+	from = map_over_bad_blocks(dev, block<<9);
+
+	if (dev->mtd->read(dev->mtd, from, 512, &retlen, buf))
+		return 1;
+	return 0;
+}
+
+static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
+			      unsigned long block, char *buf)
+{
+	size_t retlen;
+
+	if (dev->mtd->write(dev->mtd, (block * 512), 512, &retlen, buf))
+		return 1;
+	return 0;
+}
+
+static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
+{
+	struct mtd_block_map *dev_cont = kmalloc(sizeof(*dev_cont), GFP_KERNEL);
+
+	if (!dev_cont)
+		return;
+
+	memset(dev_cont, 0, sizeof(*dev_cont));
+
+	dev_cont->dev.mtd = mtd;
+	dev_cont->dev.devnum = mtd->index;
+	dev_cont->dev.blksize = 512;
+	dev_cont->dev.size = mtd->size >> 9;
+	dev_cont->dev.tr = tr;
+	dev_cont->dev.readonly = 1;
+
+	add_mtd_blktrans_dev(&(dev_cont->dev));
+}
+
+static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
+{
+	del_mtd_blktrans_dev(dev);
+	kfree(dev);
+}
+
+static struct mtd_blktrans_ops mtdblock_tr = {
+	.name		= "mtdblock_bbfree",
+	.major		= 258,
+	.part_bits	= 0,
+	.readsect	= mtdblock_readsect,
+	.writesect	= mtdblock_writesect,
+	.add_mtd	= mtdblock_add_mtd,
+	.remove_dev	= mtdblock_remove_dev,
+	.owner		= THIS_MODULE,
+};
+
+static int __init mtdblock_init(void)
+{
+	return register_mtd_blktrans(&mtdblock_tr);
+}
+
+static void __exit mtdblock_exit(void)
+{
+	deregister_mtd_blktrans(&mtdblock_tr);
+}
+
+module_init(mtdblock_init);
+module_exit(mtdblock_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Baydarov Konstantin <kbaidarov@dev.rtsoft.ru>");
+MODULE_DESCRIPTION("Readonly Block Device Layer Over MTD");
Index: mtd-2.6/drivers/mtd/Makefile
===================================================================
--- mtd-2.6.orig/drivers/mtd/Makefile
+++ mtd-2.6/drivers/mtd/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
 obj-$(CONFIG_MTD_CHAR)		+= mtdchar.o
 obj-$(CONFIG_MTD_BLOCK)		+= mtdblock.o mtd_blkdevs.o
 obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o mtd_blkdevs.o
+obj-$(CONFIG_MTD_BLOCK_RO_BBFREE)	+= mtdblock_ro_bbfree.o mtd_blkdevs.o
 obj-$(CONFIG_FTL)		+= ftl.o mtd_blkdevs.o
 obj-$(CONFIG_NFTL)		+= nftl.o mtd_blkdevs.o
 obj-$(CONFIG_INFTL)		+= inftl.o mtd_blkdevs.o
Index: mtd-2.6/drivers/mtd/Kconfig
===================================================================
--- mtd-2.6.orig/drivers/mtd/Kconfig
+++ mtd-2.6/drivers/mtd/Kconfig
@@ -197,6 +197,13 @@ config MTD_BLOCK_RO
 	  You do not need this option for use with the DiskOnChip devices. For
 	  those, enable NFTL support (CONFIG_NFTL) instead.
 
+config MTD_BLOCK_RO_BBFREE
+	tristate "Readonly bad block free block device access to MTD devices"
+	depends on MTD_BLOCK!=y && MTD
+	help
+	  Same as readonly block driver, but this allow you to mount read-only file
+	  systems from an MTD device, containing bad blocks.
+
 config FTL
 	tristate "FTL (Flash Translation Layer) support"
 	depends on MTD && BLOCK

--MP_OlhidWy=_lrQpidCOO4/0B=--
