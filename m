Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtFgb-0006Kl-Iu
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 09:44:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] mtdoops: clean-up new MTD API usage
Date: Fri,  3 Feb 2012 11:44:05 +0200
Message-Id: <1328262247-11391-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328262247-11391-1-git-send-email-dedekind1@gmail.com>
References: <1328262247-11391-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Let's remove useless 'mtd_can_have_bb()' function invocations.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdoops.c |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 3ce99e0..ae36d7e 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -169,7 +169,7 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 			cxt->nextpage = 0;
 	}
 
-	while (mtd_can_have_bb(mtd)) {
+	while (1) {
 		ret = mtd_block_isbad(mtd, cxt->nextpage * record_size);
 		if (!ret)
 			break;
@@ -199,9 +199,9 @@ badblock:
 		return;
 	}
 
-	if (mtd_can_have_bb(mtd) && ret == -EIO) {
+	if (ret == -EIO) {
 		ret = mtd_block_markbad(mtd, cxt->nextpage * record_size);
-		if (ret < 0) {
+		if (ret < 0 && ret != -EOPNOTSUPP) {
 			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
 			return;
 		}
@@ -257,8 +257,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-		if (mtd_can_have_bb(mtd) &&
-		    mtd_block_isbad(mtd, page * record_size))
+		if (mtd_block_isbad(mtd, page * record_size))
 			continue;
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
-- 
1.7.9
