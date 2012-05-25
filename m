Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SY3jF-0006yR-Pu
 for linux-mtd@lists.infradead.org; Fri, 25 May 2012 23:15:30 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so1234373vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2012 16:15:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: kernel@pengutronix.de
Subject: [PATCH 09/15] nand: mxc_nand: Use
 clk_prepare_enable/clk_disable_unprepare
Date: Fri, 25 May 2012 20:14:50 -0300
Message-Id: <1337987696-31728-9-git-send-email-festevam@gmail.com>
In-Reply-To: <1337987696-31728-1-git-send-email-festevam@gmail.com>
References: <1337987696-31728-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, shawn.guo@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Prepare the clock before enabling it.

Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: <linux-mtd@lists.infradead.org>
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/mxc_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index fd14966..d6efa17 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -764,7 +764,7 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
 	if (chip == -1) {
 		/* Disable the NFC clock */
 		if (host->clk_act) {
-			clk_disable(host->clk);
+			clk_disable_unprepare(host->clk);
 			host->clk_act = 0;
 		}
 		return;
@@ -772,7 +772,7 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
 
 	if (!host->clk_act) {
 		/* Enable the NFC clock */
-		clk_enable(host->clk);
+		clk_prepare_enable(host->clk);
 		host->clk_act = 1;
 	}
 
-- 
1.7.1
