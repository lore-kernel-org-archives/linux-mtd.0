Received: from mail-out.m-online.net ([2001:a60:0:70:0:1:25:1])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RX8Vw-0003lp-KH
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 09:37:41 +0000
From: Heiko Schocher <hs@denx.de>
To: 
Subject: [PATCH] nand, davinci: if no amif timing is passed, don;
 t setup cscfg register
Date: Sun,  4 Dec 2011 10:37:36 +0100
Message-Id: <1322991456-20690-1-git-send-email-hs@denx.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 David Brownell <dbrownell@users.sourceforge.net>,
 David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org,
 Heiko Schocher <hs@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>
Cc: Wolfgang Denk <wd@denx.de>
---
 drivers/mtd/nand/davinci_nand.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index c153e1f..6e56615 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -675,7 +675,9 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 
 	davinci_nand_writel(info, A1CR_OFFSET + info->core_chipsel * 4, val);
 
-	ret = davinci_aemif_setup_timing(info->timing, info->base,
+	ret = 0;
+	if (info->timing)
+		ret = davinci_aemif_setup_timing(info->timing, info->base,
 							info->core_chipsel);
 	if (ret < 0) {
 		dev_dbg(&pdev->dev, "NAND timing values setup fail\n");
-- 
1.7.6.4
