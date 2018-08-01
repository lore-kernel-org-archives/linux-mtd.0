Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkoJz-0005wy-HQ
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 10:25:37 +0000
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Ofer Heifetz <oferh@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH] mtd: nand: use regmap_update_bits() in marvell_nand for
 syscon access
Date: Wed,  1 Aug 2018 12:25:05 +0200
Message-Id: <20180801102505.18383-1-thomas.petazzoni@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The marvell_nfc_init() function fiddles with some bits of a system
controller on Armada 7K/8K. However:

 - It does a regmap_write() on GENCONF_SOC_DEVICE_MUX, potentially
   losing other bits that might have been set by other drivers.

 - It does a read/modify/write sequence on GENCONF_CLK_GATING_CTRL and
   GENCONF_ND_CLK_CTRL, which isn't safe from a concurrency point of
   view, as the regmap lock isn't taken accross the read/modify/write
   sequence.

To solve both issues, use regmap_update_bits().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
NOTE: This was only compile tested, and not runtime tested.
---
 drivers/mtd/nand/raw/marvell_nand.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index ebb1d141b900..742f2765b424 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2691,24 +2691,24 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 		struct regmap *sysctrl_base =
 			syscon_regmap_lookup_by_phandle(np,
 							"marvell,system-controller");
-		u32 reg;
+		u32 mask;
 
 		if (IS_ERR(sysctrl_base))
 			return PTR_ERR(sysctrl_base);
 
-		reg = GENCONF_SOC_DEVICE_MUX_NFC_EN |
-		      GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
-		      GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
-		      GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;
-		regmap_write(sysctrl_base, GENCONF_SOC_DEVICE_MUX, reg);
-
-		regmap_read(sysctrl_base, GENCONF_CLK_GATING_CTRL, &reg);
-		reg |= GENCONF_CLK_GATING_CTRL_ND_GATE;
-		regmap_write(sysctrl_base, GENCONF_CLK_GATING_CTRL, reg);
-
-		regmap_read(sysctrl_base, GENCONF_ND_CLK_CTRL, &reg);
-		reg |= GENCONF_ND_CLK_CTRL_EN;
-		regmap_write(sysctrl_base, GENCONF_ND_CLK_CTRL, reg);
+		mask = GENCONF_SOC_DEVICE_MUX_NFC_EN |
+			GENCONF_SOC_DEVICE_MUX_ECC_CLK_RST |
+			GENCONF_SOC_DEVICE_MUX_ECC_CORE_RST |
+			GENCONF_SOC_DEVICE_MUX_NFC_INT_EN;
+		regmap_update_bits(sysctrl_base, GENCONF_SOC_DEVICE_MUX,
+				   mask, mask);
+
+		regmap_update_bits(sysctrl_base, GENCONF_CLK_GATING_CTRL,
+				   GENCONF_CLK_GATING_CTRL_ND_GATE,
+				   GENCONF_CLK_GATING_CTRL_ND_GATE);
+		regmap_update_bits(sysctrl_base, GENCONF_ND_CLK_CTRL,
+				   GENCONF_ND_CLK_CTRL_EN,
+				   GENCONF_ND_CLK_CTRL_EN);
 	}
 
 	/* Configure the DMA if appropriate */
-- 
2.14.4
