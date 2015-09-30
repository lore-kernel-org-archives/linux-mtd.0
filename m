Received: from li271-223.members.linode.com ([178.79.152.223]
 helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhQjR-0007bQ-KH
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 23:24:18 +0000
From: Vladimir Zapolskiy <vz@mleia.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/3] mtd: nand: lpc32xx_slc: improve SLCTAC_*() macro
 definitions
Date: Thu,  1 Oct 2015 02:23:35 +0300
Message-Id: <1443655417-14689-2-git-send-email-vz@mleia.com>
In-Reply-To: <1443655417-14689-1-git-send-email-vz@mleia.com>
References: <1443655417-14689-1-git-send-email-vz@mleia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No functional change, move bitfield calculations to macro
definitions with added clock rate argument, which are in turn defined
by new common SLCTAC_CLOCKS(c, n, s) macro definition.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
Changes from v1 to v2:
* none, new change

 drivers/mtd/nand/lpc32xx_slc.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index abfec13..9ac0f3b 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -94,22 +94,25 @@
 /**********************************************************************
 * slc_tac register definitions
 **********************************************************************/
+/* Computation of clock cycles on basis of controller and device clock rates */
+#define SLCTAC_CLOCKS(c, n, s)	(((1 + (c / n)) & 0xF) << s)
+
 /* Clock setting for RDY write sample wait time in 2*n clocks */
 #define SLCTAC_WDR(n)		(((n) & 0xF) << 28)
 /* Write pulse width in clock cycles, 1 to 16 clocks */
-#define SLCTAC_WWIDTH(n)	(((n) & 0xF) << 24)
+#define SLCTAC_WWIDTH(c, n)	(SLCTAC_CLOCKS(c, n, 24))
 /* Write hold time of control and data signals, 1 to 16 clocks */
-#define SLCTAC_WHOLD(n)		(((n) & 0xF) << 20)
+#define SLCTAC_WHOLD(c, n)	(SLCTAC_CLOCKS(c, n, 20))
 /* Write setup time of control and data signals, 1 to 16 clocks */
-#define SLCTAC_WSETUP(n)	(((n) & 0xF) << 16)
+#define SLCTAC_WSETUP(c, n)	(SLCTAC_CLOCKS(c, n, 16))
 /* Clock setting for RDY read sample wait time in 2*n clocks */
 #define SLCTAC_RDR(n)		(((n) & 0xF) << 12)
 /* Read pulse width in clock cycles, 1 to 16 clocks */
-#define SLCTAC_RWIDTH(n)	(((n) & 0xF) << 8)
+#define SLCTAC_RWIDTH(c, n)	(SLCTAC_CLOCKS(c, n, 8))
 /* Read hold time of control and data signals, 1 to 16 clocks */
-#define SLCTAC_RHOLD(n)		(((n) & 0xF) << 4)
+#define SLCTAC_RHOLD(c, n)	(SLCTAC_CLOCKS(c, n, 4))
 /* Read setup time of control and data signals, 1 to 16 clocks */
-#define SLCTAC_RSETUP(n)	(((n) & 0xF) << 0)
+#define SLCTAC_RSETUP(c, n)	(SLCTAC_CLOCKS(c, n, 0))
 
 /**********************************************************************
 * slc_ecc register definitions
@@ -240,13 +243,13 @@ static void lpc32xx_nand_setup(struct lpc32xx_nand_host *host)
 
 	/* Compute clock setup values */
 	tmp = SLCTAC_WDR(host->ncfg->wdr_clks) |
-		SLCTAC_WWIDTH(1 + (clkrate / host->ncfg->wwidth)) |
-		SLCTAC_WHOLD(1 + (clkrate / host->ncfg->whold)) |
-		SLCTAC_WSETUP(1 + (clkrate / host->ncfg->wsetup)) |
+		SLCTAC_WWIDTH(clkrate, host->ncfg->wwidth) |
+		SLCTAC_WHOLD(clkrate, host->ncfg->whold) |
+		SLCTAC_WSETUP(clkrate, host->ncfg->wsetup) |
 		SLCTAC_RDR(host->ncfg->rdr_clks) |
-		SLCTAC_RWIDTH(1 + (clkrate / host->ncfg->rwidth)) |
-		SLCTAC_RHOLD(1 + (clkrate / host->ncfg->rhold)) |
-		SLCTAC_RSETUP(1 + (clkrate / host->ncfg->rsetup));
+		SLCTAC_RWIDTH(clkrate, host->ncfg->rwidth) |
+		SLCTAC_RHOLD(clkrate, host->ncfg->rhold) |
+		SLCTAC_RSETUP(clkrate, host->ncfg->rsetup);
 	writel(tmp, SLC_TAC(host->io_base));
 }
 
-- 
2.1.4
