From: adrian.hunter@nokia.com (Adrian Hunter)
Date: Mon, 23 Mar 2009 14:57:38 +0200
Subject: [PATCH] OMAP: OneNAND: panic_write may be in an interrupt context
Message-ID: <mailman.1.1237813626.2876.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

panic_write may read in an interrupt context.

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 77a4f14..2c199b3 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -294,6 +294,10 @@ static int omap3_onenand_read_bufferram(struct mtd_info *mtd, int area,
 	if (bram_offset & 3 || (size_t)buf & 3 || count < 384)
 		goto out_copy;
 
+	/* panic_write() may be in an interrupt context */
+	if (in_interrupt())
+		goto out_copy;
+
 	if (buf >= high_memory) {
 		struct page *p1;
 
-- 
1.5.6.3
