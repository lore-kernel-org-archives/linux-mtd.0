Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLdAD-0006yL-Ow
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 08:19:25 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i467Olc22068
	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2004 10:24:47 +0300 (EEST)
Message-ID: <4099E433.6050604@intracom.gr>
Date: Thu, 06 May 2004 10:07:31 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
   Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------060507070901030201080207"
Subject: [PATCH] Any RO filesystem on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060507070901030201080207
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

The following patch implements any RO filesystem on MTD devices like
NANDs with bad blocks.

It is a modification for the mtd-block device when the partition/device 
is read only.

Regards

Pantelis


--------------060507070901030201080207
Content-Type: text/x-patch;
 name="block_ro.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="block_ro.diff"

diff -ruN mtd-original/drivers/mtd/mtdblock.c mtd-work/drivers/mtd/mtdblock.c
--- mtd-original/drivers/mtd/mtdblock.c	2003-10-05 01:00:04.000000000 +0300
+++ mtd-work/drivers/mtd/mtdblock.c	2004-05-06 10:00:21.347152520 +0300
@@ -26,6 +26,11 @@
 	unsigned long cache_offset;
 	unsigned int cache_size;
 	enum { STATE_EMPTY, STATE_CLEAN, STATE_DIRTY } cache_state;
+
+	/* block map for RO */
+	int		*block_map;
+	int		 block_top;
+	int		 block_scantop;
 } *mtdblks[MAX_MTD_DEVICES];
 
 /*
@@ -190,6 +195,71 @@
 	return 0;
 }
 
+static unsigned long map_block(struct mtdblk_dev *mtdblk, unsigned long pos)
+{
+	struct mtd_info *mtd = mtdblk->mtd;
+	int i, block;
+
+	/* only for read-only devices with OOB info and bad block checking */
+	if ((mtd->flags & MTD_WRITEABLE) == MTD_WRITEABLE ||
+			(mtd->flags & MTD_OOB) == 0 || mtd->block_isbad == NULL ||
+			mtd->erasesize == 0)
+		return pos;
+
+	/* first time in */
+	if (mtdblk->block_map == NULL) {
+		mtdblk->block_top = mtd->size / mtd->erasesize;
+		mtdblk->block_map = kmalloc(sizeof(*mtdblk->block_map) * mtdblk->block_top, GFP_KERNEL);
+		if (mtdblk->block_map == NULL) {
+			printk (KERN_WARNING "mtd: block_map(): unable to allocate block map\n");
+			return (unsigned long)-1;
+		}
+		for (i = 0; i < mtdblk->block_top; i++)
+			mtdblk->block_map[i] = -1;
+
+		for (i = 0; i < mtdblk->block_top; i++)
+			if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
+				break;
+
+		if (i >= mtdblk->block_top) {
+			printk (KERN_WARNING "mtd: block_map(): all blocks bad?!\n");
+			return (unsigned long)-1;
+		}
+		mtdblk->block_scantop = 0;
+		mtdblk->block_map[0] = i;
+
+		DEBUG(0, "mtdblk: map %d -> %d\n", mtdblk->block_scantop, mtdblk->block_map[mtdblk->block_scantop]);
+	}
+
+	block = (int)(pos / mtd->erasesize);
+	if ((unsigned int)block >= (unsigned int)mtdblk->block_top) {
+		printk (KERN_WARNING "mtd: block_map(): requested block too large!\n");
+		return (unsigned long)-1;
+	}
+
+	/* scan for bad block up to where we want */
+	while (block >= mtdblk->block_scantop) {
+		/* find a non bad block */
+		for (i = mtdblk->block_map[mtdblk->block_scantop] + 1; i < mtdblk->block_top; i++)
+			if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
+				break;
+
+		/* exchausted ? */
+		if (i >= mtdblk->block_top) {
+			printk (KERN_WARNING "mtd: block_map(): no more good blocks\n");
+			return (unsigned long)-1;
+		}
+
+		mtdblk->block_map[++mtdblk->block_scantop] = i;
+		DEBUG(0, "mtdblk: map %d -> %d\n", mtdblk->block_scantop, mtdblk->block_map[mtdblk->block_scantop]);
+	}
+
+	/* get the mapped block */
+	block = mtdblk->block_map[block];
+
+	/* form actual position */
+	return ((unsigned long)block * mtd->erasesize) | (pos & (mtd->erasesize - 1));
+}
 
 static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos, 
 			   int len, char *buf)
@@ -222,11 +292,17 @@
 		    mtdblk->cache_offset == sect_start) {
 			memcpy (buf, mtdblk->cache_data + offset, size);
 		} else {
-			ret = MTD_READ (mtd, pos, size, &retlen, buf);
-			if (ret)
-				return ret;
-			if (retlen != size)
-				return -EIO;
+			pos = map_block(mtdblk, pos);
+			if (pos == (unsigned long)-1) {
+				memset(buf, 0xff, size);
+				retlen = size;
+			} else {
+				ret = MTD_READ (mtd, pos, size, &retlen, buf);
+				if (ret)
+					return ret;
+				if (retlen != size)
+					return -EIO;
+			}
 		}
 
 		buf += size;


--------------060507070901030201080207
Content-Type: text/plain;
 name="block_ro.diffstat"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="block_ro.diffstat"

 mtdblock.c |   86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 files changed, 81 insertions(+), 5 deletions(-)

--------------060507070901030201080207--
