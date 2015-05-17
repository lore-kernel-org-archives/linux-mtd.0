Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu0hB-00015Y-9w
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 15:41:42 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Subject: [PATCH 1/7] mtd: brcmnand: remove double new line from print
Date: Sun, 17 May 2015 17:41:00 +0200
Message-Id: <1431877266-28566-2-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The caller already adds a new line and in the other cases there is no
new line added.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index a780768..bae30ab 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1765,7 +1765,7 @@ static void brcmnand_print_cfg(char *buf, struct brcmnand_cfg *cfg)
 	else if (cfg->sector_size_1k)
 		sprintf(buf, ", BCH-%u (1KiB sector)", cfg->ecc_level << 1);
 	else
-		sprintf(buf, ", BCH-%u\n", cfg->ecc_level);
+		sprintf(buf, ", BCH-%u", cfg->ecc_level);
 }
 
 /*
-- 
2.1.4
