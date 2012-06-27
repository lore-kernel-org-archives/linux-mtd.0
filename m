From: Roland Stigge <stigge@antcom.de>
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org,
 kevin.wells@nxp.com, srinivas.bakki@nxp.com,
 linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com,
 lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com,
 linux@arm.linux.org.uk
Subject: [PATCH] MTD: LPC32xx SLC NAND driver: Add error handling to write
 function
Date: Wed, 27 Jun 2012 14:13:52 +0200
Message-Id: <1340799232-23092-1-git-send-email-stigge@antcom.de>
Cc: Roland Stigge <stigge@antcom.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds error handling to the lpc32xx_nand_write_page_syndrome()
function.

Signed-off-by: Roland Stigge <stigge@antcom.de>

---
 drivers/mtd/nand/lpc32xx_slc.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 7e2e78d..b27b3b3 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -679,9 +679,12 @@ static int lpc32xx_nand_write_page_syndrome(struct mtd_info *mtd,
 {
 	struct lpc32xx_nand_host *host = chip->priv;
 	u8 *pb = chip->oob_poi + chip->ecc.layout->eccpos[0];
+	int error;
 
 	/* Write data, calculate ECC on outbound data */
-	lpc32xx_xfer(mtd, (u8 *)buf, chip->ecc.steps, 0);
+	error = lpc32xx_xfer(mtd, (u8 *)buf, chip->ecc.steps, 0);
+	if (error)
+		return error;
 
 	/*
 	 * The calculated ECC needs some manual work done to it before
-- 
1.7.10.4
