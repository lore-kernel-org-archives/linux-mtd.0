Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOHS4-0000oT-28
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 19:35:12 +0000
Message-Id: <200807301935.m6UJZ1e3012291@imap1.linux-foundation.org>
Subject: [patch 07/13] Blackfin NFC Driver: add support for the ECC layout the
	Blackfin bootrom uses
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:35:01 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/Kconfig      |   12 +++++++++
 drivers/mtd/nand/bf5xx_nand.c |   40 ++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff -puN drivers/mtd/nand/Kconfig~blackfin-nfc-driver-add-support-for-the-ecc-layout-the-blackfin-bootrom-uses drivers/mtd/nand/Kconfig
--- a/drivers/mtd/nand/Kconfig~blackfin-nfc-driver-add-support-for-the-ecc-layout-the-blackfin-bootrom-uses
+++ a/drivers/mtd/nand/Kconfig
@@ -109,6 +109,18 @@ config MTD_NAND_BF5XX_HWECC
 	  Enable the use of the BF5XX's internal ECC generator when
 	  using NAND.
 
+config MTD_NAND_BF5XX_BOOTROM_ECC
+	bool "Use Blackfin BootROM ECC Layout"
+	default n
+	depends on MTD_NAND_BF5XX_HWECC
+	help
+	  If you wish to modify NAND pages and allow the Blackfin on-chip
+	  BootROM to boot from them, say Y here.  This is only necessary
+	  if you are booting U-Boot out of NAND and you wish to update
+	  U-Boot from Linux' userspace.  Otherwise, you should say N here.
+
+	  If unsure, say N.
+
 config MTD_NAND_RTC_FROM4
 	tristate "Renesas Flash ROM 4-slot interface board (FROM_BOARD4)"
 	depends on SH_SOLUTION_ENGINE
diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-add-support-for-the-ecc-layout-the-blackfin-bootrom-uses drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-add-support-for-the-ecc-layout-the-blackfin-bootrom-uses
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -91,6 +91,41 @@ static const unsigned short bfin_nfc_pin
 	 P_NAND_ALE,
 	 0};
 
+#ifdef CONFIG_MTD_NAND_BF5XX_BOOTROM_ECC
+static uint8_t bbt_pattern[] = { 0xff };
+
+static struct nand_bbt_descr bootrom_bbt = {
+	.options = 0,
+	.offs = 63,
+	.len = 1,
+	.pattern = bbt_pattern,
+};
+
+static struct nand_ecclayout bootrom_ecclayout = {
+	.eccbytes = 24,
+	.eccpos = {
+		0x8 * 0, 0x8 * 0 + 1, 0x8 * 0 + 2,
+		0x8 * 1, 0x8 * 1 + 1, 0x8 * 1 + 2,
+		0x8 * 2, 0x8 * 2 + 1, 0x8 * 2 + 2,
+		0x8 * 3, 0x8 * 3 + 1, 0x8 * 3 + 2,
+		0x8 * 4, 0x8 * 4 + 1, 0x8 * 4 + 2,
+		0x8 * 5, 0x8 * 5 + 1, 0x8 * 5 + 2,
+		0x8 * 6, 0x8 * 6 + 1, 0x8 * 6 + 2,
+		0x8 * 7, 0x8 * 7 + 1, 0x8 * 7 + 2
+	},
+	.oobfree = {
+		{ 0x8 * 0 + 3, 5 },
+		{ 0x8 * 1 + 3, 5 },
+		{ 0x8 * 2 + 3, 5 },
+		{ 0x8 * 3 + 3, 5 },
+		{ 0x8 * 4 + 3, 5 },
+		{ 0x8 * 5 + 3, 5 },
+		{ 0x8 * 6 + 3, 5 },
+		{ 0x8 * 7 + 3, 5 },
+	}
+};
+#endif
+
 /*
  * Data structures for bf5xx nand flash controller driver
  */
@@ -712,6 +747,11 @@ static int bf5xx_nand_probe(struct platf
 
 	/* setup hardware ECC data struct */
 	if (hardware_ecc) {
+#ifdef CONFIG_MTD_NAND_BF5XX_BOOTROM_ECC
+		chip->badblock_pattern = &bootrom_bbt;
+		chip->ecc.layout = &bootrom_ecclayout;
+#endif
+
 		if (plat->page_size == NFC_PG_SIZE_256) {
 			chip->ecc.bytes = 3;
 			chip->ecc.size = 256;
_
