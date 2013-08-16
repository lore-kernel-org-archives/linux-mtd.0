Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VA9XR-00063C-DD
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 02:13:23 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 4/6] mtd: set ONFI nand's default hooks in
 nand_set_defaults()
Date: Fri, 16 Aug 2013 10:10:07 +0800
Message-ID: <1376619009-8622-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1376619009-8622-1-git-send-email-b32955@freescale.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, pekon@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We may do some ONFI get/set features operations before we call the
nand_scan_tail().

So move the default ONFI nand hooks into nand_set_defaults().

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index fa35699..61a7d14 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2794,6 +2794,12 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 	if (!chip->select_chip)
 		chip->select_chip = nand_select_chip;
 
+	/* set for ONFI nand */
+	if (!chip->onfi_set_features)
+		chip->onfi_set_features = nand_onfi_set_features;
+	if (!chip->onfi_get_features)
+		chip->onfi_get_features = nand_onfi_get_features;
+
 	/* If called twice, pointers that depend on busw may need to be reset */
 	if (!chip->read_byte || chip->read_byte == nand_read_byte)
 		chip->read_byte = busw ? nand_read_byte16 : nand_read_byte;
@@ -3560,12 +3566,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	if (!chip->write_page)
 		chip->write_page = nand_write_page;
 
-	/* set for ONFI nand */
-	if (!chip->onfi_set_features)
-		chip->onfi_set_features = nand_onfi_set_features;
-	if (!chip->onfi_get_features)
-		chip->onfi_get_features = nand_onfi_get_features;
-
 	/*
 	 * Check ECC mode, default to software if 3byte/512byte hardware ECC is
 	 * selected and we have 256 byte pagesize fallback to software ECC
-- 
1.7.1
