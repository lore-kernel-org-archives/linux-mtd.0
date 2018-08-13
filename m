Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fp78l-0005cs-CC
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2018 07:19:49 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>, Jane Wan <Jane.Wan@nokia.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: rawnand: fsl_ifc: fixup SRAM init for newer ctrl
 versions
Date: Mon, 13 Aug 2018 09:18:46 +0200
Message-Id: <20180813071846.9433-3-kurt@linutronix.de>
In-Reply-To: <20180813071846.9433-1-kurt@linutronix.de>
References: <20180813071846.9433-1-kurt@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Newer versions of the IFC controller use a different method of initializing the
internal SRAM: Instead of reading from flash, a bit in the NAND configuration
register has to be set in order to trigger the self-initializing process.

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
Changes since v1:
  - Subject
  - Coding style
  - Using timeout constant
  - Move version check completely into fsl_ifc_sram_init()

 drivers/mtd/nand/raw/fsl_ifc_nand.c | 33 ++++++++++++++++++++++++++-------
 include/linux/fsl_ifc.h             |  2 ++
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index e4f5792dc589..7e7729df7827 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -30,6 +30,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/fsl_ifc.h>
+#include <linux/iopoll.h>
 
 #define ERR_BYTE		0xFF /* Value returned for read
 					bytes when read failed	*/
@@ -769,6 +770,27 @@ static int fsl_ifc_sram_init(struct fsl_ifc_mtd *priv)
 	uint32_t csor = 0, csor_8k = 0, csor_ext = 0;
 	uint32_t cs = priv->bank;
 
+	if (ctrl->version < FSL_IFC_VERSION_1_1_0)
+		return 0;
+
+	if (ctrl->version > FSL_IFC_VERSION_1_1_0) {
+		u32 ncfgr, status;
+		int ret;
+
+		/* Trigger auto initialization */
+		ncfgr = ifc_in32(&ifc_runtime->ifc_nand.ncfgr);
+		ifc_out32(ncfgr | IFC_NAND_NCFGR_SRAM_INIT_EN, &ifc_runtime->ifc_nand.ncfgr);
+
+		/* Wait until done */
+		ret = readx_poll_timeout(ifc_in32, &ifc_runtime->ifc_nand.ncfgr,
+					 status, !(status & IFC_NAND_NCFGR_SRAM_INIT_EN),
+					 10, IFC_TIMEOUT_MSECS * 1000);
+		if (ret)
+			dev_err(priv->dev, "Failed to initialize SRAM!\n");
+
+		return ret;
+	}
+
 	/* Save CSOR and CSOR_ext */
 	csor = ifc_in32(&ifc_global->csor_cs[cs].csor);
 	csor_ext = ifc_in32(&ifc_global->csor_cs[cs].csor_ext);
@@ -825,6 +847,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	struct nand_chip *chip = &priv->chip;
 	struct mtd_info *mtd = nand_to_mtd(&priv->chip);
 	u32 csor;
+	int ret;
 
 	/* Fill in fsl_ifc_mtd structure */
 	mtd->dev.parent = priv->dev;
@@ -918,13 +941,9 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 		chip->ecc.algo = NAND_ECC_HAMMING;
 	}
 
-	if (ctrl->version >= FSL_IFC_VERSION_1_1_0) {
-		int ret;
-
-		ret = fsl_ifc_sram_init(priv);
-		if (ret)
-			return ret;
-	}
+	ret = fsl_ifc_sram_init(priv);
+	if (ret)
+		return ret;
 
 	/*
 	 * As IFC version 2.0.0 has 16KB of internal SRAM as compared to older
diff --git a/include/linux/fsl_ifc.h b/include/linux/fsl_ifc.h
index 3fdfede2f0f3..5f343b796ad9 100644
--- a/include/linux/fsl_ifc.h
+++ b/include/linux/fsl_ifc.h
@@ -274,6 +274,8 @@
  */
 /* Auto Boot Mode */
 #define IFC_NAND_NCFGR_BOOT		0x80000000
+/* SRAM Initialization */
+#define IFC_NAND_NCFGR_SRAM_INIT_EN	0x20000000
 /* Addressing Mode-ROW0+n/COL0 */
 #define IFC_NAND_NCFGR_ADDR_MODE_RC0	0x00000000
 /* Addressing Mode-ROW0+n/COL0+n */
-- 
2.11.0
