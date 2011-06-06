Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTaPj-0005nz-4O
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 14:04:19 +0000
Received: by wwb39 with SMTP id 39so3003894wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 07:04:17 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: add a flags for partitions which should just leave
	smth. after them
Date: Mon,  6 Jun 2011 18:04:14 +0400
Message-Id: <1307369056-29319-2-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
References: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for MTDPART_OFS_RETAIN: such partitions start at the current
offset, take as much space as possible, but rain part->size bytes after
the end of the partitions for other parts. Primarily this is intended
for ts72xx arm platforms cleanup.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/mtdpart.c          |   13 +++++++++++++
 include/linux/mtd/partitions.h |    5 ++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 3477e16..63c19f9 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -479,6 +479,19 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 			       (unsigned long long)cur_offset, (unsigned long long)slave->offset);
 		}
 	}
+	if (slave->offset == MTDPART_OFS_RETAIN) {
+		slave->offset = cur_offset;
+		if (master->size - slave->offset >= slave->mtd.size) {
+			slave->mtd.size =
+				master->size - slave->offset - slave->mtd.size;
+		} else {
+			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
+				part->name,
+				master->size - slave->offset, slave->mtd.size);
+			/* register to preserve ordering */
+			goto out_register;
+		}
+	}
 	if (slave->mtd.size == MTDPART_SIZ_FULL)
 		slave->mtd.size = master->size - slave->offset;
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 08c9c7b..1431cf2 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -24,7 +24,9 @@
  * 	will extend to the end of the master MTD device.
  * offset: absolute starting position within the master MTD device; if
  * 	defined as MTDPART_OFS_APPEND, the partition will start where the
- * 	previous one ended; if MTDPART_OFS_NXTBLK, at the next erase block.
+ *	previous one ended; if MTDPART_OFS_NXTBLK, at the next erase block;
+ *	if MTDPART_OFS_RETAIN, consume as much as possible, leaving size
+ *	after the end of partition.
  * mask_flags: contains flags that have to be masked (removed) from the
  * 	master MTD flag set for the corresponding MTD partition.
  * 	For example, to force a read-only partition, simply adding
@@ -42,6 +44,7 @@ struct mtd_partition {
 	struct nand_ecclayout *ecclayout;	/* out of band layout for this partition (NAND only) */
 };
 
+#define MTDPART_OFS_RETAIN	(-3)
 #define MTDPART_OFS_NXTBLK	(-2)
 #define MTDPART_OFS_APPEND	(-1)
 #define MTDPART_SIZ_FULL	(0)
-- 
1.7.4.4
