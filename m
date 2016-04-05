Received: from mail-bl2on0132.outbound.protection.outlook.com ([65.55.169.132]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anIvw-0005vH-ES
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2016 04:49:45 +0000
From: Fugang Duan <b38611@freescale.com>
To: <computersforpeace@gmail.com>, <han.xu@nxp.com>, <richard@nod.at>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <fugang.duan@nxp.com>
Subject: [PATCH] mtd: nand: gpmi: remove duplicate 'nand-on-flash-bbt'
 property parse
Date: Tue, 5 Apr 2016 12:48:42 +0800
Message-ID: <1459831722-2623-1-git-send-email-b38611@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove duplicate 'nand-on-flash-bbt' property parse in driver. In fact,
nand base driver has the common dts node parse in .nand_dt_init() like
nand_scan_ident()->nand_dt_init()->of_get_nand_on_flash_bbt().

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8122c69..0486bf2 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1914,16 +1914,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	/* Set up swap_block_mark, must be set before the gpmi_set_geometry() */
 	this->swap_block_mark = !GPMI_IS_MX23(this);
 
-	if (of_get_nand_on_flash_bbt(this->dev->of_node)) {
-		chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
-
-		if (of_property_read_bool(this->dev->of_node,
-						"fsl,no-blockmark-swap"))
-			this->swap_block_mark = false;
-	}
-	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
-		this->swap_block_mark ? "en" : "dis");
-
 	/*
 	 * Allocate a temporary DMA buffer for reading ID in the
 	 * nand_scan_ident().
@@ -1938,6 +1928,16 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
+	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+
+		if (of_property_read_bool(this->dev->of_node,
+						"fsl,no-blockmark-swap"))
+			this->swap_block_mark = false;
+	}
+	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
+		this->swap_block_mark ? "en" : "dis");
+
 	ret = gpmi_init_last(this);
 	if (ret)
 		goto err_out;
-- 
1.9.1
