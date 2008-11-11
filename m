Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KzljG-0002Tp-7Z
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 05:23:54 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KA500F9ELNKH6@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 14:23:44 +0900 (KST)
Received: from localhost.localdomain ([107.108.214.120])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KA500I24LNKCB@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 14:23:45 +0900 (KST)
Date: Tue, 11 Nov 2008 11:01:24 +0530
From: Rohit <h.rohit@samsung.com>
Subject: [RFC] [PATCH 1/2] [MTDPARTS] Support erase regions with odd numbered
	blocks
To: linux-mtd@lists.infradead.org
Message-id: <491918AC.4090502@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Cc: 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Currently add_one_partition in mtdpart.c does not handle erase regions
with odd number of blocks well. Some scenarios are :

     1. Region 0 has 3 blocks of 256KB. Region 1 has 512KB blocks.
	Partiton starting at offset 256KB and size 1MB turns read only.

     2. Region 0 has 3 blocks of 256KB. Region 1 has 512KB blocks.
	All partitions created on region 2 turn read only.

Every partition start offset should be multiple of partition erase size.
It is this condition which causes valid partitions to turn read-only.

The following patch is an attempt to allow such regions.
Is such a change to MTD core correct / acceptable?
Any suggestions are much appreciated.

Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
---
 mtdpart.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3728913..5cdc345 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -320,6 +320,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		u_int32_t cur_offset)
 {
 	struct mtd_part *slave;
+	unsigned offset_checked = 0;
 
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
@@ -436,6 +437,20 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		/* The loop searched for the region _behind_ the first one */
 		i--;
 
+		if (slave->mtd.flags & MTD_WRITEABLE) {
+			/* A region starts on boundary of it's erase size.
+			 * Partition offset within region must align
+			 * on region's erase size
+			 */
+			if ((slave->offset - regions[i].offset) % regions[i].erasesize) {
+				slave->mtd.flags &= ~MTD_WRITEABLE;
+				printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an "
+					 "erase block boundary -- force read-only\n", part->name);
+			} else
+				/* Skip offset check below */
+				offset_checked = 1;
+		}
+
 		/* Pick biggest erasesize */
 		for (; i < max && regions[i].offset < end; i++) {
 			if (slave->mtd.erasesize < regions[i].erasesize) {
@@ -448,7 +463,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		slave->mtd.erasesize = master->erasesize;
 	}
 
-	if ((slave->mtd.flags & MTD_WRITEABLE) &&
+	if (!offset_checked && (slave->mtd.flags & MTD_WRITEABLE) &&
 	    (slave->offset % slave->mtd.erasesize)) {
 		/* Doesn't start on a boundary of major erase size */
 		/* FIXME: Let it be writable if it is on a boundary of
---
