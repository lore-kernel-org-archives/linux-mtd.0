Message-ID: <49C78990.8020100@nokia.com>
Date: Mon, 23 Mar 2009 15:07:28 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] OMAP: OneNAND: panic_write may be in an interrupt context
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 92a79a1a210845d64077e7ac100ddde8f251018b Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Mon, 23 Mar 2009 14:57:38 +0200
Subject: [PATCH] OMAP: OneNAND: panic_write may be in an interrupt context

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
