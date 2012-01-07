Received: from 15.mo3.mail-out.ovh.net ([87.98.150.177]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RjTwN-0005uO-Im
 for linux-mtd@lists.infradead.org; Sat, 07 Jan 2012 10:56:00 +0000
Received: from mail412.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id DE9C61008719
 for <linux-mtd@lists.infradead.org>; Sat,  7 Jan 2012 11:57:10 +0100 (CET)
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] mtd/atmel_nand: add on_flash_bbt to enable the use of On
 Flash BBT
Date: Sat,  7 Jan 2012 11:49:29 +0100
Message-Id: <1325933370-17475-2-git-send-email-plagnioj@jcrosoft.com>
In-Reply-To: <1325933370-17475-1-git-send-email-plagnioj@jcrosoft.com>
References: <1325933370-17475-1-git-send-email-plagnioj@jcrosoft.com>
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
 drivers/mtd/nand/atmel_nand.c |    2 +-
 include/linux/atmel_nand.h    |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index c267113..d7ff628 100644
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
diff --git a/include/linux/atmel_nand.h b/include/linux/atmel_nand.h
index f6d4193..57b651b 100644
--- a/include/linux/atmel_nand.h
+++ b/include/linux/atmel_nand.h
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
