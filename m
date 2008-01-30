Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JK9Hf-000816-1t
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 09:31:14 +0000
From: Bryan Wu <bryan.wu@analog.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] [MTD/NAND] Blackfin NFC driver: Add Blackfin BF52x
	on-chip NAND Flash controller driver support in bf5xx_nand driver
Date: Wed, 30 Jan 2008 17:18:16 +0800
Message-Id: <1201684698-26936-2-git-send-email-bryan.wu@analog.com>
In-Reply-To: <1201684698-26936-1-git-send-email-bryan.wu@analog.com>
References: <1201684698-26936-1-git-send-email-bryan.wu@analog.com>
Cc: Bryan Wu <bryan.wu@analog.com>, linux-kernel@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michael Hennerich <michael.hennerich@analog.com>

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Bryan Wu <bryan.wu@analog.com>
---
 drivers/mtd/nand/Kconfig      |    2 +-
 drivers/mtd/nand/bf5xx_nand.c |   20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 246d451..bf0e9b0 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -93,7 +93,7 @@ config MTD_NAND_AU1550
 
 config MTD_NAND_BF5XX
 	tristate "Blackfin on-chip NAND Flash Controller driver"
-	depends on BF54x && MTD_NAND
+	depends on (BF54x || BF52x) && MTD_NAND
 	help
 	  This enables the Blackfin on-chip NAND flash controller
 
diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 1657ecd..542850c 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -74,7 +74,22 @@ static int hardware_ecc = 1;
 static int hardware_ecc;
 #endif
 
-static unsigned short bfin_nfc_pin_req[] = {P_NAND_CE, P_NAND_RB, 0};
+static unsigned short bfin_nfc_pin_req[] =
+	{P_NAND_CE,
+	 P_NAND_RB,
+	 P_NAND_D0,
+	 P_NAND_D1,
+	 P_NAND_D2,
+	 P_NAND_D3,
+	 P_NAND_D4,
+	 P_NAND_D5,
+	 P_NAND_D6,
+	 P_NAND_D7,
+	 P_NAND_WE,
+	 P_NAND_RE,
+	 P_NAND_CLE,
+	 P_NAND_ALE,
+	 0};
 
 /*
  * Data structures for bf5xx nand flash controller driver
@@ -507,12 +522,13 @@ static int bf5xx_nand_dma_init(struct bf5xx_nand_info *info)
 
 	init_completion(&info->dma_completion);
 
+#ifdef CONFIG_BF54x
 	/* Setup DMAC1 channel mux for NFC which shared with SDH */
 	val = bfin_read_DMAC1_PERIMUX();
 	val &= 0xFFFE;
 	bfin_write_DMAC1_PERIMUX(val);
 	SSYNC();
-
+#endif
 	/* Request NFC DMA channel */
 	ret = request_dma(CH_NFC, "BF5XX NFC driver");
 	if (ret < 0) {
-- 
1.5.3.4
