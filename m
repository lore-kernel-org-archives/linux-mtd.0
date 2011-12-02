Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RWSqb-0003dL-Tz
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2011 13:08:15 +0000
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdoops: skip reading initially bad blocks
Date: Fri,  2 Dec 2011 15:07:17 +0200
Message-Id: <1322831237-22044-1-git-send-email-roman.tereshonkov@nokia.com>
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

Use block_isbad to check and skip the bad blocks reading.
This will allow to get rid of the read errors if bad blocks
are present initially.

Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
---
 drivers/mtd/mtdoops.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 1e2fa62..cea9279 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -253,6 +253,9 @@ static void find_next_position(struct mtdoops_context *cxt)
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
+		if (mtd->block_isbad &&
+		    mtd->block_isbad(mtd, page * record_size))
+			continue;
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
 		ret = mtd->read(mtd, page * record_size, MTDOOPS_HEADER_SIZE,
-- 
1.7.0.4
