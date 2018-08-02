Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fl9Pr-0007lk-JK
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2018 08:57:05 +0000
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Ofer Heifetz <oferh@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2] mtd: nand: use regmap_update_bits() in marvell_nand for
 syscon access
Date: Thu,  2 Aug 2018 10:56:25 +0200
Message-Id: <20180802085625.29635-1-thomas.petazzoni@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The marvell_nfc_init() function fiddles with some bits of a system
controller on Armada 7K/8K. However, it does a read/modify/write
sequence on GENCONF_CLK_GATING_CTRL and GENCONF_ND_CLK_CTRL, which
isn't safe from a concurrency point of view, as the regmap lock isn't
taken accross the read/modify/write sequence. To solve this issue, use
regmap_update_bits().

While at it, since the "reg" variable is no longer needed for the
read/modify/write sequences, get rid of it for the regmap_write() to
GENCONF_SOC_DEVICE_MUX, and directly pass the value to be written as
argument.

Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller driver")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
 - Add Fixes: tag
 - Drop the regmap_update_bits() for GENCONF_SOC_DEVICE_MUX, and keep
   regmap_write().

This patch is not Cc'ed to stable, because it doesn't qualify
according to the rule "It must fix a real bug that bothers people (not
a, "This could be a problem..." type thing)" mentioned in
Documentation/process/stable-kernel-rules.rst.
---
 drivers/mtd/nand/raw/marvell_nand.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ebb1d141b900..65aadbfa1fe8 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2691,24 +2691,23 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 		struct regmap *sysctrl_base =
 			syscon_regmap_lookup_by_phandle(np,
 							"marvell,system-controller");
-		u32 reg;
 
 		if (IS_ERR(sysctrl_base))
 			return PTR_ERR(sysctrl_base);
 
-		reg = GENCONF_SOC_DEVICE_MUX_NFC_EN |
-		      GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
-		      GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
-		      GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;
-		regmap_write(sysctrl_base, GENCONF_SOC_DEVICE_MUX, reg);
+		regmap_write(sysctrl_base, GENCONF_SOC_DEVICE_MUX,
+			     GENCONF_SOC_DEVICE_MUX_NFC_EN |
+			     GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
+			     GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
+			     GENCONF_SOC_DEVICE_MUX_NFC_INT_EN);
 
-		regmap_read(sysctrl_base, GENCONF_CLK_GATING_CTRL, &reg);
-		reg |= GENCONF_CLK_GATING_CTRL_ND_GATE;
-		regmap_write(sysctrl_base, GENCONF_CLK_GATING_CTRL, reg);
+		regmap_update_bits(sysctrl_base, GENCONF_CLK_GATING_CTRL,
+				   GENCONF_CLK_GATING_CTRL_ND_GATE,
+				   GENCONF_CLK_GATING_CTRL_ND_GATE);
 
-		regmap_read(sysctrl_base, GENCONF_ND_CLK_CTRL, &reg);
-		reg |= GENCONF_ND_CLK_CTRL_EN;
-		regmap_write(sysctrl_base, GENCONF_ND_CLK_CTRL, reg);
+		regmap_update_bits(sysctrl_base, GENCONF_ND_CLK_CTRL,
+				   GENCONF_ND_CLK_CTRL_EN,
+				   GENCONF_ND_CLK_CTRL_EN);
 	}
 
 	/* Configure the DMA if appropriate */
-- 
2.14.4
