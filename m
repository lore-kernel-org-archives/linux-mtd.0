Subject: [PATCH 1/3] [MTD] mtdoops: Fix an off by one error
From: Richard Purdie <rpurdie@rpsys.net>
To: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sat, 26 Jul 2008 10:08:35 +0100
Message-Id: <1217063316.5463.16.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix an off by one error in the mtdoops driver

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/mtd/mtdoops.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 5a680e1..f40e457 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -99,7 +99,7 @@ static void mtdoops_inc_counter(struct mtdoops_context *cxt)
 	int ret;
 
 	cxt->nextpage++;
-	if (cxt->nextpage > cxt->oops_pages)
+	if (cxt->nextpage >= cxt->oops_pages)
 		cxt->nextpage = 0;
 	cxt->nextcount++;
 	if (cxt->nextcount == 0xffffffff)
@@ -141,7 +141,7 @@ static void mtdoops_workfunc_erase(struct work_struct *work)
 	mod = (cxt->nextpage * OOPS_PAGE_SIZE) % mtd->erasesize;
 	if (mod != 0) {
 		cxt->nextpage = cxt->nextpage + ((mtd->erasesize - mod) / OOPS_PAGE_SIZE);
-		if (cxt->nextpage > cxt->oops_pages)
+		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
 	}
 
@@ -158,7 +158,7 @@ badblock:
 				cxt->nextpage * OOPS_PAGE_SIZE);
 		i++;
 		cxt->nextpage = cxt->nextpage + (mtd->erasesize / OOPS_PAGE_SIZE);
-		if (cxt->nextpage > cxt->oops_pages)
+		if (cxt->nextpage >= cxt->oops_pages)
 			cxt->nextpage = 0;
 		if (i == (cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE))) {
 			printk(KERN_ERR "mtdoops: All blocks bad!\n");
