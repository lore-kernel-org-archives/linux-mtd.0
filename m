Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvFX5-0001AB-8f
 for linux-mtd@lists.infradead.org; Sat, 28 Jul 2012 22:30:50 +0000
Received: by yhjj52 with SMTP id j52so4206844yhj.36
 for <linux-mtd@lists.infradead.org>; Sat, 28 Jul 2012 15:30:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Artem.Bityutskiy@linux.intel.com
Subject: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
Date: Sat, 28 Jul 2012 19:30:16 -0300
Message-Id: <1343514616-9019-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1343514616-9019-1-git-send-email-festevam@gmail.com>
References: <1343514616-9019-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, marex.vasut@denx.de, kernel@pengutronix.de,
 shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

When building MTD_NAND_GPMI_NAND as module, the following error shows up:

ERROR: "nand_update_bbt" [drivers/mtd/nand/gpmi-nand/gpmi_nand.ko] undefined!

Export nand_update_bbt to fix it.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/nand_bbt.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2d1d2fa..f4b6417 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1403,3 +1403,4 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 
 EXPORT_SYMBOL(nand_scan_bbt);
 EXPORT_SYMBOL(nand_default_bbt);
+EXPORT_SYMBOL(nand_update_bbt);
-- 
1.7.1
