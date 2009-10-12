Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxIkQ-00037l-W1
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 11:07:33 +0000
Date: Mon, 12 Oct 2009 13:07:19 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 1/4]: mtdoops: avoid erasing already empty areas
Message-ID: <20091012130719.372d0f5a@marrow.netinsight.se>
In-Reply-To: <20091012130635.45b76b34@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008172516.64b5c462@marrow.netinsight.se>
	<20091012130635.45b76b34@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After having scanned the entire mtdoops area, mtdoops will erase it if
there are no mtdoops headers in it. However, empty and already erased
areas (i.e., without mtdoops headers) will therefore also be erased at
each startup.

This patch counts the number of unclean pages (neither empty nor with
the mtdoops header) and only erases if no headers are found and the area
is still unclean.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/mtdoops.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 18c6c96..c785e1a 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -225,7 +225,7 @@ static void mtdoops_workfunc_write(struct work_struct *work)
 static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
-	int ret, page, maxpos = 0;
+	int ret, page, maxpos = 0, unclean_pages = 0;
 	u32 count[2], maxcount = 0xffffffff;
 	size_t retlen;
 
@@ -237,10 +237,13 @@ static void find_next_position(struct mtdoops_context *cxt)
 			continue;
 		}
 
-		if (count[1] != MTDOOPS_KERNMSG_MAGIC)
-			continue;
 		if (count[0] == 0xffffffff)
 			continue;
+		if (count[1] != MTDOOPS_KERNMSG_MAGIC) {
+			/* Page is neither clean nor empty */
+			unclean_pages++;
+			continue;
+		}
 		if (maxcount == 0xffffffff) {
 			maxcount = count[0];
 			maxpos = page;
@@ -259,7 +262,14 @@ static void find_next_position(struct mtdoops_context *cxt)
 	if (maxcount == 0xffffffff) {
 		cxt->nextpage = 0;
 		cxt->nextcount = 1;
-		schedule_work(&cxt->work_erase);
+		if (unclean_pages != 0) {
+			printk(KERN_INFO "mtdoops: cleaning area\n");
+			schedule_work(&cxt->work_erase);
+		} else {
+			printk(KERN_DEBUG "mtdoops: ready %d, %d (clean)\n",
+			       cxt->nextpage, cxt->nextcount);
+			cxt->ready = 1;
+		}
 		return;
 	}
 
-- 
1.6.0.4
