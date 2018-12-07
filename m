Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-0000zg-Bt
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:30 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 07/34] mtd: spi-nor: Add a new flag to clear SW protection
 bits during init
Date: Fri,  7 Dec 2018 10:26:10 +0100
Message-Id: <20181207092637.18687-8-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Get rid of the last piece of code doing checks on SNOR_MFR to decide
what to do. We add a new SNOR_F flag to explicitly ask for a SR clear
at init time and this flag is set in spi_nor_scan() when the NOR
supports the locking feature or directly from the SST, Intel and Atmel
post-SFDP fixups hooks since NORs from those manufacturers always
require clearing the protection bits.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 33 +++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 049b67b8f986..ffea0085b4fe 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3567,10 +3567,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
 	 * with the software protection bits set
 	 */
-	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
-	    nor->info->flags & SPI_NOR_HAS_LOCK) {
+	if (nor->flags & SNOR_F_CLR_SW_PROT_BITS) {
 		write_enable(nor);
 		write_sr(nor, 0);
 		spi_nor_wait_till_ready(nor);
@@ -3691,11 +3688,34 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 	}
 }
 
+static void intel_post_sfdp_fixups(struct spi_nor *nor)
+{
+	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
+}
+
+static void atmel_post_sfdp_fixups(struct spi_nor *nor)
+{
+	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
+}
+
+static void sst_post_sfdp_fixups(struct spi_nor *nor)
+{
+	nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
+}
+
 static int
 spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 				      struct spi_nor_flash_parameter *params)
 {
 	switch (JEDEC_MFR(nor->info)) {
+	case SNOR_MFR_ATMEL:
+		atmel_post_sfdp_fixups(nor);
+		break;
+
+	case SNOR_MFR_INTEL:
+		intel_post_sfdp_fixups(nor);
+		break;
+
 	case SNOR_MFR_ST:
 	case SNOR_MFR_MICRON:
 		st_micron_post_sfdp_fixups(nor);
@@ -3709,6 +3729,10 @@ spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
 		spansion_post_sfdp_fixups(nor);
 		break;
 
+	case SNOR_MFR_SST:
+		sst_post_sfdp_fixups(nor);
+		break;
+
 	case SNOR_MFR_WINBOND:
 		winbond_post_sfdp_fixups(nor);
 		break;
@@ -3896,6 +3920,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
 		mtd->_is_locked = spi_nor_is_locked;
+		nor->flags |= SNOR_F_CLR_SW_PROT_BITS;
 	}
 
 	/*
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 56e6bf4ee823..73dad2a77455 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -235,6 +235,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
 	SNOR_F_HAS_LOCK		= BIT(8),
+	SNOR_F_CLR_SW_PROT_BITS	= BIT(9),
 };
 
 /**
-- 
2.17.1
