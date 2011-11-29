Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVLG0-0000W3-0p
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 10:49:49 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdoops: fix the oops_page_used array size
Date: Tue, 29 Nov 2011 12:49:18 +0200
Message-Id: <1322563758-26317-1-git-send-email-roman.tereshonkov@nokia.com>
Cc: rpurdie@openedhand.com, dwmw2@infradead.org,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The array of unsigned long pointed by oops_page_used is allocated
by vmalloc which requires the size to be in bytes.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/mtdoops.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1e2fa62..0782b31 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -369,7 +369,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 
 	/* oops_page_used is a bit field */
 	cxt->oops_page_used = vmalloc(DIV_ROUND_UP(mtdoops_pages,
-			BITS_PER_LONG));
+			BITS_PER_LONG) * sizeof(unsigned long));
 	if (!cxt->oops_page_used) {
 		printk(KERN_ERR "mtdoops: could not allocate page array\n");
 		return;
-- 
1.7.0.4
