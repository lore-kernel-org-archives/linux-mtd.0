Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MtNP1-0005z8-Ad
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 15:17:11 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n91FH2pP028406
	for <linux-mtd@lists.infradead.org>; Thu, 1 Oct 2009 18:17:04 +0300
From: Aaro Koskinen <aaro.koskinen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] OneNAND: OMAP: do not use DMA if oops in progress
Date: Thu,  1 Oct 2009 18:16:56 +0300
Message-Id: <1254410216-24444-2-git-send-email-aaro.koskinen@nokia.com>
In-Reply-To: <1254410216-24444-1-git-send-email-aaro.koskinen@nokia.com>
References: <>
 <1254410216-24444-1-git-send-email-aaro.koskinen@nokia.com>
Cc: Artem.Bityutskiy@nokia.com, aaro.koskinen@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Otherwise we may hang if we are called from panic() through mtdoops.

Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 0108ed4..b1e04ff 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -294,7 +294,7 @@ static int omap3_onenand_read_bufferram(struct mtd_info *mtd, int area,
 		goto out_copy;
 
 	/* panic_write() may be in an interrupt context */
-	if (in_interrupt())
+	if (in_interrupt() || oops_in_progress)
 		goto out_copy;
 
 	if (buf >= high_memory) {
@@ -371,7 +371,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
 		goto out_copy;
 
 	/* panic_write() may be in an interrupt context */
-	if (in_interrupt())
+	if (in_interrupt() || oops_in_progress)
 		goto out_copy;
 
 	if (buf >= high_memory) {
-- 
1.5.4.3
