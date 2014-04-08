Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXViw-0006yt-SB
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 13:05:59 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH] nand: omap2: Fix warning when CONFIG_MTD_NAND_OMAP_BCH=n
Date: Tue, 8 Apr 2014 10:05:00 -0300
Message-ID: <1396962300-4956-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When CONFIG_MTD_NAND_OMAP_BCH is not defined the following build warning 
happens:

drivers/mtd/nand/omap2.c:1250:12: warning: 'erased_sector_bitflips' defined but not used [-Wunused-function]

Protect the definition of erased_sector_bitflips() with 
'ifdef CONFIG_MTD_NAND_OMAP_BCH' to fix the warning.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 1ff49b8..4c4c700 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1247,6 +1247,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
  * If falls below, report the page as erased with correctable bit
  * flip, else report as uncorrectable page.
  */
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
 static int erased_sector_bitflips(u_char *data, u_char *oob,
 		struct omap_nand_info *info)
 {
@@ -1276,7 +1277,6 @@ static int erased_sector_bitflips(u_char *data, u_char *oob,
 	return flip_bits;
 }
 
-#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * omap_elm_correct_data - corrects page data area in case error reported
  * @mtd:	MTD device structure
-- 
1.8.3.2
