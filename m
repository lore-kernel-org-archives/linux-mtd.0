Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QRe7-0003Fe-CP
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 13:57:40 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5CD0uD06313
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 16:00:56 +0300 (EEST)
Received: from ifaistos.intranet.gr (ifaistos.intranet.GR [146.124.20.203])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5CD0rY06256
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 16:00:53 +0300 (EEST)
Received: from intracom.gr (pcrnd46 [146.124.20.92])
	by ifaistos.intranet.gr (8.9.1b+Sun/8.9.1) with ESMTP id PAA26687
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 15:54:35 +0300 (EET DST)
Message-ID: <3EE878A5.8040400@intracom.gr>
Date: Thu, 12 Jun 2003 15:57:09 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------020201000300020308090905"
Subject: [PATCH] Error free RO mtdblock device for NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020201000300020308090905
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi there

Following the discussion in the list the previous day
here is a patch that implements a very simple read-only
error free block device interface in order to allow
NAND chips to use filesystems like CRAMFS.

The theory of operation is very simple.

There is a mapping array for every block in the device
which provides the number of the physical NAND block
which it resides.

This is not the final driver. It's only a base for
discussion for the list.

I haven't done any serious tests really, but I was
able to mount a CRAMFS filesystem over it and
read files OK.

Comments and/or flames welcome.

Regards

Pantelis


--------------020201000300020308090905
Content-Type: text/plain;
 name="mtdblockn.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtdblockn.patch"

diff -ubBrN drivers/mtd/Config.in drivers-nand/mtd/Config.in
--- drivers/mtd/Config.in	Thu Jun 12 15:44:47 2003
+++ drivers-nand/mtd/Config.in	Thu Jun 12 15:43:57 2003
@@ -30,6 +30,7 @@
    if [ "$CONFIG_NFTL" = "y" -o "$CONFIG_NFTL" = "m" ]; then
       bool '    Write support for NFTL (BETA)' CONFIG_NFTL_RW
    fi
+   dep_tristate '  Read-only block device access to NAND MTD devices' CONFIG_MTD_BLOCKN $CONFIG_MTD
 
    source drivers/mtd/chips/Config.in
 
diff -ubBrN drivers/mtd/Makefile drivers-nand/mtd/Makefile
--- drivers/mtd/Makefile	Thu Jun 12 15:44:47 2003
+++ drivers-nand/mtd/Makefile	Thu Jun 12 15:43:57 2003
@@ -48,6 +48,7 @@
 obj-$(CONFIG_MTD_BLOCK_RO)	+= mtdblock_ro.o $(mtd_blkdevs)
 obj-$(CONFIG_FTL)		+= ftl.o $(mtd_blkdevs)
 obj-$(CONFIG_NFTL)		+= nftl.o $(mtd_blkdevs)
+obj-$(CONFIG_MTD_BLOCKN)	+= mtdblock_nro.o $(mtd_blkdevs)
 
 ifeq ($(BELOW25),y)
 obj-y           += chips/chipslink.o maps/mapslink.o \
diff -ubBrN drivers/mtd/mtdblock_nro.c drivers-nand/mtd/mtdblock_nro.c
--- drivers/mtd/mtdblock_nro.c	Thu Jan  1 02:00:00 1970
+++ drivers-nand/mtd/mtdblock_nro.c	Thu Jun 12 15:43:57 2003
@@ -0,0 +1,272 @@
+/*
+ * $Id:$
+ *
+ * Pantelis Antoniou <panto@intracom.gr>
+ * Intracom S.A.
+ *
+ * Read-only block device for NAND devices
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/blktrans.h>
+#include <linux/mtd/nand.h>
+
+/*********************************************************/
+
+/*
+ * XXX the following are copied from fs/jffs2/wbuf.c 
+ * XXX care must be taken to keep them in sync
+ */
+
+#define JFFS2_OOB_ECCPOS0		0
+#define JFFS2_OOB_ECCPOS1		1
+#define JFFS2_OOB_ECCPOS2		2
+#define JFFS2_OOB_ECCPOS3		3
+#define JFFS2_OOB_ECCPOS4		6
+#define JFFS2_OOB_ECCPOS5		7
+
+#define NAND_JFFS2_OOB8_FSDAPOS		6
+#define NAND_JFFS2_OOB16_FSDAPOS	8
+#define NAND_JFFS2_OOB8_FSDALEN		2
+#define NAND_JFFS2_OOB16_FSDALEN	8
+
+static struct nand_oobinfo jffs2_oobinfo = {
+	useecc: 1,
+	eccpos: {JFFS2_OOB_ECCPOS0, JFFS2_OOB_ECCPOS1, JFFS2_OOB_ECCPOS2, JFFS2_OOB_ECCPOS3, JFFS2_OOB_ECCPOS4, JFFS2_OOB_ECCPOS5}
+};
+
+/*********************************************************/
+
+static struct mtdblk_dev {
+	struct mtd_info *mtd;
+	int count;
+	int bad;
+	struct semaphore map_sem;
+	int *map;
+	int map_top;
+	int map_scantop;
+	int oob_per_block;
+	u_char *oobbuf;
+} *mtdblks[MAX_MTD_DEVICES];
+
+static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
+			      unsigned long block, char *buf)
+{
+	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtd_info *mtd = mtdblk->mtd;
+	size_t retlen;
+	int i, ret, pos;
+
+	/* for devices with no oob do it directly */
+	pos = block * 512;
+	if (!mtdblk->map) {
+		if (mtd->read(mtd, pos, 512, &retlen, buf))
+			return 1;
+		return 0;
+	}
+
+	down(&mtdblk->map_sem);
+
+	/* scan the chip as it appropriate */
+	while (mtdblk->map_scantop < 0 || block > mtdblk->map_scantop) {
+
+		if (mtdblk->map_scantop >= 0)
+			i = mtdblk->map[mtdblk->map_scantop] + 1;
+		else
+			i = 0;
+
+		for (; i < mtdblk->map_top; i++) {
+
+			ret = mtd->read_oob(mtd, i * 512, mtd->oobsize, &retlen, mtdblk->oobbuf);
+
+			if (ret >= 0 && mtdblk->oobbuf[5] == 0xff)
+				break;
+		} 
+
+		if (i >= mtdblk->map_top) {
+			up(&mtdblk->map_sem);
+			printk(KERN_WARNING "mtdblockn: too many bad blocks\n");
+			return 0;
+		}
+
+		if (mtdblk->map_scantop < 0)
+			mtdblk->map_scantop = 0;
+		else
+			mtdblk->map_scantop++;
+
+		mtdblk->map[mtdblk->map_scantop] = i;
+	}
+
+	up(&mtdblk->map_sem);
+
+	pos = mtdblk->map[block] * 512;
+
+	/* XXX we don't really expect this to fail! */
+	if (mtd->read_ecc(mtd, pos, 512, &retlen, buf, NULL, &jffs2_oobinfo))
+		return 1;
+	return 0;
+}
+
+static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
+			      unsigned long block, char *buf)
+{
+	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	size_t retlen;
+
+	/* for devices with no oob do it directly */
+	if (!mtdblk->map) {
+		if (dev->mtd->write(dev->mtd, (block * 512), 512, &retlen, buf))
+			return 1;
+		return 0;
+	}
+
+	/* We don't perform writes anyway */
+	return 0;
+}
+
+static int mtdblock_open(struct mtd_blktrans_dev *mbd, struct inode *inode, struct file *file)
+{
+	struct mtdblk_dev *mtdblk;
+	struct mtd_info *mtd = mbd->mtd;
+	int dev = mbd->devnum;
+	int err;
+	int i;
+
+	DEBUG(MTD_DEBUG_LEVEL1,"mtdblockn_open\n");
+	
+	if (mtdblks[dev]) {
+		mtdblks[dev]->count++;
+		return 0;
+	}
+	
+	err = 0;
+
+	/* OK, it's not open. Create cache info for it */
+	mtdblk = kmalloc(sizeof(struct mtdblk_dev), GFP_KERNEL);
+	if (!mtdblks) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	memset(mtdblk, 0, sizeof(*mtdblk));
+
+	mtdblk->count = 1;
+	mtdblk->mtd = mtd;
+
+	init_MUTEX(&mtdblk->map_sem);
+
+	if (mtd->oobblock) {
+		mtdblk->map_top = mtd->size / 512;
+		mtdblk->map = kmalloc(sizeof(int) * mtdblk->map_top + mtd->oobsize, GFP_KERNEL);
+		if (!mtdblk->map) {
+			err = -ENOMEM;
+			goto out_free;
+		}
+		mtdblk->map_scantop = -1;
+		for (i = 0; i < mtdblk->map_top; i++)
+			mtdblk->map[i] = -1;	/* mark not present */
+		mtdblk->oob_per_block = 512 / mtd->oobblock;
+
+		/* buff for oob data */
+		mtdblk->oobbuf = (u_char *)(mtdblk->map + mtdblk->map_top);
+	}
+
+	mtdblks[dev] = mtdblk;
+	
+	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
+
+	return 0;
+
+out_free:
+	kfree(mtdblk);
+out:
+	return err;
+}
+
+static int mtdblock_release(struct mtd_blktrans_dev *mbd,
+				  struct inode *inode, struct file *file)
+{
+	int dev;
+	struct mtdblk_dev *mtdblk;
+
+   	DEBUG(MTD_DEBUG_LEVEL1, "mtdblock_release\n");
+
+	dev = minor(inode->i_rdev);
+	mtdblk = mtdblks[dev];
+
+	if (!--mtdblk->count) {
+		/* It was the last usage. Free the device */
+		mtdblks[dev] = NULL;
+		if (mtdblk->mtd->sync)	/* XXX possibly redundant for a RO fs */
+			mtdblk->mtd->sync(mtdblk->mtd);
+
+		if (mtdblk->map)
+			kfree(mtdblk->map);
+
+		kfree(mtdblk);
+	}
+	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
+
+	return 0;
+}  
+
+
+static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
+{
+	struct mtd_blktrans_dev *dev = kmalloc(sizeof(*dev), GFP_KERNEL);
+
+	if (!dev)
+		return;
+
+	memset(dev, 0, sizeof(*dev));
+
+	dev->mtd = mtd;
+	dev->devnum = mtd->index;
+	dev->blksize = 512;
+	dev->size = mtd->size >> 9;
+	dev->tr = tr;
+
+	/* force read-only */
+	dev->readonly = 1;
+
+	add_mtd_blktrans_dev(dev);
+}
+
+static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
+{
+	del_mtd_blktrans_dev(dev);
+	kfree(dev);
+}
+
+struct mtd_blktrans_ops mtdblockn_tr = {
+	.name		= "mtdblockn",
+	.major		= 128,
+	.part_bits	= 0,
+	.open		= mtdblock_open,
+	.release	= mtdblock_release,
+	.readsect	= mtdblock_readsect,
+	.writesect	= mtdblock_writesect,
+	.add_mtd	= mtdblock_add_mtd,
+	.remove_dev	= mtdblock_remove_dev,
+	.owner		= THIS_MODULE,
+};
+
+static int __init mtdblock_init(void)
+{
+	return register_mtd_blktrans(&mtdblockn_tr);
+}
+
+static void __exit mtdblock_exit(void)
+{
+	deregister_mtd_blktrans(&mtdblockn_tr);
+}
+
+module_init(mtdblock_init);
+module_exit(mtdblock_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Pantelis Antoniou <panto@intracom.gr>");
+MODULE_DESCRIPTION("Read-only block device emulation access to MTD devices with bad blocks");

--------------020201000300020308090905--
