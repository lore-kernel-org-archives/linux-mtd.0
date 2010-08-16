Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OkvMh-0005Pp-1U
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 08:48:24 +0000
Received: by pzk3 with SMTP id 3so2059618pzk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 01:48:17 -0700 (PDT)
Subject: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for samsung2GbX8
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain
Date: Mon, 16 Aug 2010 16:50:41 +0800
Message-Id: <1281948641.29696.1.camel@mola>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds timing settings for samsung2GbX8 and
fixes the cmdset settings. samsung2GbX8 is large page.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 4d89f37..47c0442 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -227,9 +227,21 @@ static struct pxa3xx_nand_flash samsung512MbX16 = {
 	.chip_id	= 0x46ec,
 };
 
+static struct pxa3xx_nand_timing samsung2GbX8_timing = {
+	.tCH	= 5,
+	.tCS	= 20,
+	.tWH	= 10,
+	.tWP	= 12,
+	.tRH	= 10,
+	.tRP	= 12,
+	.tR	= 25000,
+	.tWHR	= 60,
+	.tAR	= 10,
+};
+
 static struct pxa3xx_nand_flash samsung2GbX8 = {
-	.timing		= &samsung512MbX16_timing,
-	.cmdset		= &smallpage_cmdset,
+	.timing		= &samsung2GbX8_timing,
+	.cmdset		= &largepage_cmdset,
 	.page_per_block	= 64,
 	.page_size	= 2048,
 	.flash_width	= 8,
-- 
1.7.2
