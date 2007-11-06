Received: from vps.korsgaard.com ([64.79.194.204] helo=nanv.dk)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IpM6P-0007th-3t
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 05:56:19 -0500
From: Peter Korsgaard <jacmet@sunsite.dk>
To: rpurdie@openedhand.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtdoops cleanup
Date: Tue, 06 Nov 2007 11:56:02 +0100
Message-ID: <87wssvve0t.fsf@nanv.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use memcpy instead of open coding a copy loop.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 drivers/mtd/mtdoops.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index f8af627..20eaf29 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -286,7 +286,6 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 {
 	struct mtdoops_context *cxt = co->data;
 	struct mtd_info *mtd = cxt->mtd;
-	int i;
 
 	if (!oops_in_progress) {
 		mtdoops_console_sync();
@@ -305,10 +304,8 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 	if ((count + cxt->writecount) > OOPS_PAGE_SIZE)
 		count = OOPS_PAGE_SIZE - cxt->writecount;
 
-	for (i = 0; i < count; i++, s++)
-		*((char *)(cxt->oops_buf) + cxt->writecount + i) = *s;
-
-	cxt->writecount = cxt->writecount + count;
+	memcpy(cxt->oops_buf + cxt->writecount, s, count);
+	cxt->writecount += count;
 }
 
 static int __init mtdoops_console_setup(struct console *co, char *options)
-- 
1.5.3.4

-- 
Bye, Peter Korsgaard
