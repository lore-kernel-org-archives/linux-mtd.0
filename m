Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu0hX-00018A-QJ
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 15:42:04 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Subject: [PATCH 6/7] mtd: brcmnand: run bcm47xxpart part parser in addition
Date: Sun, 17 May 2015 17:41:05 +0200
Message-Id: <1431877266-28566-7-git-send-email-hauke@hauke-m.de>
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

On the bcm53xx and bcm47xx SoC the bcm47xxpart partition parser is able
to parse the partitions automatically by reading some special header
used on these SoCs flash partition and some guessing. Without this
patch the default list is used, with this patch this partition parser
is used if the others haven't found a partition.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 468a212..cc5dc1e 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1879,6 +1879,9 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 	return 0;
 }
 
+static const char * const probes[] = {"cmdlinepart", "ofpart", "bcm47xxpart",
+				      NULL};
+
 static int brcmnand_init_cs(struct brcmnand_host *host)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -1956,7 +1959,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 	if (nand_scan_tail(mtd))
 		return -ENXIO;
 
-	return mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
+	return mtd_device_parse_register(mtd, probes, &ppdata, NULL, 0);
 }
 
 static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
-- 
2.1.4
