Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NfFyn-0002OY-BL
	for linux-mtd@lists.infradead.org; Wed, 10 Feb 2010 17:04:02 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o1AH1pIK023853
	for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2010 19:01:56 +0200
From: Aaro.Koskinen@nokia.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] OneNAND: OMAP: do not use DMA if oops in progress
Date: Wed, 10 Feb 2010 19:03:19 +0200
Message-Id: <1265821399-29940-1-git-send-email-Aaro.Koskinen@nokia.com>
Cc: Artem.Bityutskiy@nokia.com, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Aaro Koskinen <aaro.koskinen@nokia.com>

Otherwise we may hang if we are called from panic() through mtdoops.

Signed-off-by: Aaro Koskinen <aaro.koskinen@nokia.com>
---
 drivers/mtd/onenand/omap2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 75f38b9..dfbab6c 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -308,7 +308,7 @@ static int omap3_onenand_read_bufferram(struct mtd_info *mtd, int area,
 		goto out_copy;
 
 	/* panic_write() may be in an interrupt context */
-	if (in_interrupt())
+	if (in_interrupt() || oops_in_progress)
 		goto out_copy;
 
 	if (buf >= high_memory) {
@@ -385,7 +385,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
 		goto out_copy;
 
 	/* panic_write() may be in an interrupt context */
-	if (in_interrupt())
+	if (in_interrupt() || oops_in_progress)
 		goto out_copy;
 
 	if (buf >= high_memory) {
-- 
1.5.6.5
