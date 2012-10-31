Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TTSfN-0007fw-Q8
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 07:24:46 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: <dwmw2@infradead.org>, <artem.bityutskiy@linux.intel.com>, <afzal@ti.com>,
 <tony@atomide.com>, <broonie@opensource.wolfsonmicro.com>,
 <rmk+kernel@arm.linux.org.uk>, <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/3] mtd: nand: omap2: Update nerrors using ecc.strength
Date: Wed, 31 Oct 2012 12:38:25 +0530
Message-ID: <1351667307-447-2-git-send-email-avinashphilip@ti.com>
In-Reply-To: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, gururaja.hebbar@ti.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update number of errors using nand ecc strength.
Also add macro definitions BCH8_ERROR_MAX & BCH4_ERROR_MAX

Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
---
:100644 100644 5c8978e... a02be29... M	drivers/mtd/nand/omap2.c
 drivers/mtd/nand/omap2.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 5c8978e..a02be29 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -118,6 +118,9 @@
 
 #define OMAP24XX_DMA_GPMC		4
 
+#define BCH8_MAX_ERROR		8	/* upto 8 bit correctable */
+#define BCH4_MAX_ERROR		4	/* upto 4 bit correctable */
+
 /* oob info generated runtime depending on ecc algorithm and layout selected */
 static struct nand_ecclayout omap_oobinfo;
 /* Define some generic bad / good block scan pattern which are used
@@ -1042,7 +1045,7 @@ static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 	struct nand_chip *chip = mtd->priv;
 	u32 val;
 
-	nerrors = (info->nand.ecc.bytes == 13) ? 8 : 4;
+	nerrors = info->nand.ecc.strength;
 	dev_width = (chip->options & NAND_BUSWIDTH_16) ? 1 : 0;
 	nsectors = 1;
 	/*
@@ -1219,13 +1222,14 @@ static int omap3_init_bch(struct mtd_info *mtd, int ecc_opt)
 	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
 						   mtd);
 #ifdef CONFIG_MTD_NAND_OMAP_BCH8
-	const int hw_errors = 8;
+	const int hw_errors = BCH8_MAX_ERROR;
 #else
-	const int hw_errors = 4;
+	const int hw_errors = BCH4_MAX_ERROR;
 #endif
 	info->bch = NULL;
 
-	max_errors = (ecc_opt == OMAP_ECC_BCH8_CODE_HW) ? 8 : 4;
+	max_errors = (ecc_opt == OMAP_ECC_BCH8_CODE_HW) ?
+		BCH8_MAX_ERROR : BCH4_MAX_ERROR;
 	if (max_errors != hw_errors) {
 		pr_err("cannot configure %d-bit BCH ecc, only %d-bit supported",
 		       max_errors, hw_errors);
-- 
1.7.0.4
