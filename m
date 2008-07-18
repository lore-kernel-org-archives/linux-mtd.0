Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJsNA-0002bn-83
	for linux-mtd@lists.infradead.org; Fri, 18 Jul 2008 15:59:57 +0000
Date: Sat, 19 Jul 2008 01:01:45 +0900 (JST)
Message-Id: <20080719.010145.85416123.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: [PATCH 5/5] [MTD][MTDPART] Handle remaining checkpatch findings
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Handle wargnings about long lines and braces.  Now mtdpart.c is
checkpatch-clean.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
This is a patch against mtd-2.6 tree.

 drivers/mtd/mtdpart.c |   38 +++++++++++++++++++++++++-------------
 1 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index edb90b5..020315a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -324,7 +324,9 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 	/* allocate the partition structure */
 	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
 	if (!slave) {
-		printk(KERN_ERR"memory allocation error while creating partitions for \"%s\"\n",
+		printk(KERN_ERR
+			"memory allocation error while creating partitions for"
+			" \"%s\"\n",
 			master->name);
 		del_mtd_partitions(master);
 		return NULL;
@@ -397,7 +399,9 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		slave->offset = cur_offset;
 		if ((cur_offset % master->erasesize) != 0) {
 			/* Round up to next erasesize */
-			slave->offset = ((cur_offset / master->erasesize) + 1) * master->erasesize;
+			slave->offset =
+				((cur_offset / master->erasesize) + 1) *
+				master->erasesize;
 			printk(KERN_NOTICE "Moving partition %d: "
 			       "0x%08x -> 0x%08x\n", partno,
 			       cur_offset, slave->offset);
@@ -414,13 +418,16 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		/* let's register it anyway to preserve ordering */
 		slave->offset = 0;
 		slave->mtd.size = 0;
-		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
+		printk(KERN_ERR
+			"mtd: partition \"%s\" is out of reach -- disabled\n",
 			part->name);
 		goto out_register;
 	}
 	if (slave->offset + slave->mtd.size > master->size) {
 		slave->mtd.size = master->size - slave->offset;
-		printk(KERN_WARNING"mtd: partition \"%s\" extends beyond the end of device \"%s\" -- size truncated to %#x\n",
+		printk(KERN_WARNING "mtd: partition \"%s\" "
+			"extends beyond the end of device \"%s\""
+			" -- size truncated to %#x\n",
 			part->name, master->name, slave->mtd.size);
 	}
 	if (master->numeraseregions > 1) {
@@ -438,9 +445,8 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 
 		/* Pick biggest erasesize */
 		for (; i < max && regions[i].offset < end; i++) {
-			if (slave->mtd.erasesize < regions[i].erasesize) {
+			if (slave->mtd.erasesize < regions[i].erasesize)
 				slave->mtd.erasesize = regions[i].erasesize;
-			}
 		}
 		BUG_ON(slave->mtd.erasesize == 0);
 	} else {
@@ -454,13 +460,16 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		/* FIXME: Let it be writable if it is on a boundary of
 		 * _minor_ erase size though */
 		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase block boundary -- force read-only\n",
+		printk(KERN_WARNING "mtd: partition \"%s\""
+			" doesn't start on an erase block boundary"
+			" -- force read-only\n",
 			part->name);
 	}
 	if ((slave->mtd.flags & MTD_WRITEABLE) &&
 	    (slave->mtd.size % slave->mtd.erasesize)) {
 		slave->mtd.flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase block -- force read-only\n",
+		printk(KERN_WARNING "mtd: partition \"%s\""
+			" doesn't end on an erase block -- force read-only\n",
 			part->name);
 	}
 
@@ -504,7 +513,8 @@ int add_mtd_partitions(struct mtd_info *master,
 	u_int32_t cur_offset = 0;
 	int i;
 
-	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n", nbparts, master->name);
+	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n",
+		nbparts, master->name);
 
 	for (i = 0; i < nbparts; i++) {
 		slave = add_one_partition(master, parts + i, i, cur_offset);
@@ -569,14 +579,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 				parser = get_partition_parser(*types);
 #endif
 		if (!parser) {
-			printk(KERN_NOTICE "%s partition parsing not available\n",
-			       *types);
+			printk(KERN_NOTICE
+				"%s partition parsing not available\n",
+				*types);
 			continue;
 		}
 		ret = (*parser->parse_fn)(master, pparts, origin);
 		if (ret > 0) {
-			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
-			       ret, parser->name, master->name);
+			printk(KERN_NOTICE
+				"%d %s partitions found on MTD device %s\n",
+				ret, parser->name, master->name);
 		}
 		put_partition_parser(parser);
 	}
