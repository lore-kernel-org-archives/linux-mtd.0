Received: from 16.mo3.mail-out.ovh.net ([188.165.56.217]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rr0bs-00026P-L4
 for linux-mtd@lists.infradead.org; Sat, 28 Jan 2012 05:13:58 +0000
Received: from mail617.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 7DA441000609
 for <linux-mtd@lists.infradead.org>; Sat, 28 Jan 2012 06:15:45 +0100 (CET)
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [FOR 3.3 PATCH 2/6] mtd/atmel_nand: add on_flash_bbt to enable the
 use of On Flash BBT
Date: Sat, 28 Jan 2012 06:10:40 +0100
Message-Id: <1327727444-23908-2-git-send-email-plagnioj@jcrosoft.com>
In-Reply-To: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

from the board

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/atmel_nand.c       |    2 +-
 include/linux/platform_data/atmel.h |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 0d955e1..d3bde9b 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -525,7 +525,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (on_flash_bbt) {
+	if (host->board->on_flash_bbt || on_flash_bbt) {
 		printk(KERN_INFO "atmel_nand: Use On Flash BBT\n");
 		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
 	}
diff --git a/include/linux/platform_data/atmel.h b/include/linux/platform_data/atmel.h
index 7b8a445..d056263 100644
--- a/include/linux/platform_data/atmel.h
+++ b/include/linux/platform_data/atmel.h
@@ -19,6 +19,7 @@ struct atmel_nand_data {
 	u8		cle;			/* address line number connected to CLE */
 	u8		bus_width_16;		/* buswidth is 16 bit */
 	u8		ecc_mode;		/* ecc mode */
+	u8		on_flash_bbt;		/* bbt on flash */
 	struct mtd_partition *parts;
 	unsigned int	num_parts;
 };
-- 
1.7.7
