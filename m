Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WC1fF-0008F9-RU
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2014 06:45:25 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 5/5] mtd: nand: print out the right information for JEDEC
 compliant nand
Date: Sat, 8 Feb 2014 14:04:01 +0800
Message-ID: <1391839441-21006-6-git-send-email-b32955@freescale.com>
In-Reply-To: <1391839441-21006-1-git-send-email-b32955@freescale.com>
References: <1391839441-21006-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check the chip->jedec_version, and print out the right information
for JEDEC compliant nand.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index eb9fb49..57443db 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3692,8 +3692,17 @@ ident_done:
 
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		*maf_id, *dev_id);
-	pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
-		chip->onfi_version ? chip->onfi_params.model : type->name);
+
+	if (chip->onfi_version)
+		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
+				chip->onfi_params.model);
+	else if (chip->jedec_version)
+		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
+				chip->jedec_params.model);
+	else
+		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
+				type->name);
+
 	pr_info("%dMiB, %s, page size: %d, OOB size: %d\n",
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->writesize, mtd->oobsize);
-- 
1.7.2.rc3
