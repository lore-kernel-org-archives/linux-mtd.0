Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqm-0003RB-60
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:48 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/17] mtd: mtdoops: do not use mtd->panic_write directly
Date: Mon,  2 Jan 2012 14:20:35 +0200
Message-Id: <1325506847-23470-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Instead of checking if 'mtd->panic_write' is defined, call 'mtd_panic_write()'
and check the error code - '-EOPNOTSUPP' will be returned if the function is
not defined.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdoops.c   |   17 ++++++++---------
 include/linux/mtd/mtd.h |    2 ++
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 69532a3..c8540b8 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -221,10 +221,14 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	hdr[0] = cxt->nextcount;
 	hdr[1] = MTDOOPS_KERNMSG_MAGIC;
 
-	if (panic)
+	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
 				      record_size, &retlen, cxt->oops_buf);
-	else
+		if (ret == -EOPNOTSUPP) {
+			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
+			return;
+		}
+	} else
 		ret = mtd_write(mtd, cxt->nextpage * record_size,
 				record_size, &retlen, cxt->oops_buf);
 
@@ -330,13 +334,8 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 	memcpy(dst + l1_cpy, s2 + s2_start, l2_cpy);
 
 	/* Panics must be written immediately */
-	if (reason != KMSG_DUMP_OOPS) {
-		if (!cxt->mtd->panic_write)
-			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
-		else
-			mtdoops_write(cxt, 1);
-		return;
-	}
+	if (reason != KMSG_DUMP_OOPS)
+		mtdoops_write(cxt, 1);
 
 	/* For other cases, schedule work to write it "nicely" */
 	schedule_work(&cxt->work_write);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 2c2a922..b729640 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -311,6 +311,8 @@ static inline int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 				  size_t *retlen, const u_char *buf)
 {
 	*retlen = 0;
+	if (!mtd->panic_write)
+		return -EOPNOTSUPP;
 	return mtd->panic_write(mtd, to, len, retlen, buf);
 }
 
-- 
1.7.7.3
