Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGd9z-0000yd-Hg
 for linux-mtd@lists.infradead.org; Fri, 02 Jun 2017 03:22:01 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org, andrew@lunn.ch, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH v5 3/5] mtd: handle partitioning on devices with 0 erasesize
Date: Fri,  2 Jun 2017 15:21:17 +1200
Message-Id: <20170602032119.22282-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

erasesize is meaningful for flash devices but for SRAM there is no
concept of an erase block so erasesize is set to 0. When partitioning
these devices instead of ensuring partitions fall on erasesize
boundaries we ensure they fall on writesize boundaries.

Helped-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- new
Changes in v4:
- None
Changes in v5:
- None (yet). There is some active discussion on this so it may change.
  patch 4/5 is somewhat dependent on this but only if partitions are
  specified on the dt node.

 drivers/mtd/mtdpart.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ea5e5307f667..5cef1247806c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -393,8 +393,11 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
 {
+	int wr_alignment = master->erasesize ? : master->writesize;
 	struct mtd_part *slave;
+	u32 remainder;
 	char *name;
+	u64 tmp;
 
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
@@ -499,10 +502,11 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	if (slave->offset == MTDPART_OFS_APPEND)
 		slave->offset = cur_offset;
 	if (slave->offset == MTDPART_OFS_NXTBLK) {
+		tmp = cur_offset;
 		slave->offset = cur_offset;
-		if (mtd_mod_by_eb(cur_offset, master) != 0) {
-			/* Round up to next erasesize */
-			slave->offset = (mtd_div_by_eb(cur_offset, master) + 1) * master->erasesize;
+		remainder = do_div(tmp, wr_alignment);
+		if (remainder) {
+			slave->offset += wr_alignment - remainder;
 			printk(KERN_NOTICE "Moving partition %d: "
 			       "0x%012llx -> 0x%012llx\n", partno,
 			       (unsigned long long)cur_offset, (unsigned long long)slave->offset);
@@ -567,19 +571,22 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 		slave->mtd.erasesize = master->erasesize;
 	}
 
-	if ((slave->mtd.flags & MTD_WRITEABLE) &&
-	    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
+	tmp = slave->offset;
+	remainder = do_div(tmp, wr_alignment);
+	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
 		/* Doesn't start on a boundary of major erase size */
 		/* FIXME: Let it be writable if it is on a boundary of
 		 * _minor_ erase size though */
 		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
+		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase/write block boundary -- force read-only\n",
 			part->name);
 	}
-	if ((slave->mtd.flags & MTD_WRITEABLE) &&
-	    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
+
+	tmp = slave->mtd.size;
+	remainder = do_div(tmp, wr_alignment);
+	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
 		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
+		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase/write block -- force read-only\n",
 			part->name);
 	}
 
-- 
2.13.0
