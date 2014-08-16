Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIkQj-0005au-SJ
 for linux-mtd@lists.infradead.org; Sat, 16 Aug 2014 20:18:26 +0000
Received: by mail-wg0-f50.google.com with SMTP id n12so3450635wgh.33
 for <linux-mtd@lists.infradead.org>; Sat, 16 Aug 2014 13:18:02 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: spi-nor: add Kconfig option to disable 4K sectors
Date: Sat, 16 Aug 2014 22:17:51 +0200
Message-Id: <1408220271-21455-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current situation with 4K sectors is quite messy. First of all, some
MTD "users" don't work with such small size. An example may be UBIFS
which requires 15 KiB erase blocks as a minimum. In theory spi-nor
should provide multiple erase regions and MTD "users" should use the
one they need. Unforunately that is not implemented.

In the result our flashes database in spi-nor is hackish. For some
flashes we pretend they don't support 4K sectors just because some
distribution users UBIFS on it. This ofc leads to conflicts, like
Samsung using w25q128 with 4K sectors vs. OpenWrt requiring it to
pretend it's 64 KiB blocks only.

My idea (plan?) for fixing this situation:
1) Use real hw info (this requires a way for disabling 4K for now)
2) Provide detailed info about erase regions
3) Make UBIFS work with devices that support 4K sectors

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/spi-nor/Kconfig   | 11 +++++++++++
 drivers/mtd/spi-nor/spi-nor.c |  5 ++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index f8acfa4..601879e 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -7,6 +7,17 @@ menuconfig MTD_SPI_NOR
 
 if MTD_SPI_NOR
 
+config MTD_SPI_NOR_USE_4K_SECTORS
+	bool "Use small 4096 B erase sectors"
+	default y
+	help
+	  Many flash memories support erasing small (4096 B) sectors. Depending
+	  on the usage this feature may provide performance gain in comparison
+	  to erasing whole blocks (32/64 KiB).
+
+	  Please note that some tools/drivers/filesystems may not work with
+	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
+
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
 	depends on ARCH_MXC
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ba3f61e..ae16aa2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -987,6 +987,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	    nor->wait_till_ready == spi_nor_wait_till_ready)
 		nor->wait_till_ready = spi_nor_wait_till_fsr_ready;
 
+#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
 	/* prefer "small sector" erase if possible */
 	if (info->flags & SECT_4K) {
 		nor->erase_opcode = SPINOR_OP_BE_4K;
@@ -994,7 +995,9 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	} else if (info->flags & SECT_4K_PMC) {
 		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
 		mtd->erasesize = 4096;
-	} else {
+	} else
+#endif
+	{
 		nor->erase_opcode = SPINOR_OP_SE;
 		mtd->erasesize = info->sector_size;
 	}
-- 
1.8.4.5
