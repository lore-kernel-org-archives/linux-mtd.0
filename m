Received: from conuserg-11.nifty.com ([210.131.2.78])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhON-0006Ox-Mf
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:08:04 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 39/39] mtd: nand: denali_dt: add compatible strings for
 UniPhier SoC variants
Date: Sun, 27 Nov 2016 03:06:25 +0900
Message-Id: <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add two compatible strings for UniPhier SoCs.  The revision register
on both shows revision 5.0, but they are different hardware.

Features:
 - DMA engine with 64 bit physical address support
 - 1024 byte ECC step size
 - 8 / 16 / 24 bit ECC strength
 - The n_banks format depends on SoC

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../devicetree/bindings/mtd/denali-nand.txt        | 10 +++++--
 drivers/mtd/nand/denali_dt.c                       | 33 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 51fe195..cea46e2 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -1,13 +1,19 @@
 * Denali NAND controller
 
 Required properties:
-  - compatible : should be "denali,denali-nand-dt"
+  - compatible : should be one of the following:
+      "denali,denali-nand-dt"
+      "denali,denali-nand-uniphier-v5a"
+      "denali,denali-nand-uniphier-v5b"
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
 
 Optional properties:
-  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to 512.
+  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
+      512  for "denali,denali-nand-dt"
+      1024 for "denali,denali-nand-uniphier-v5a"
+      1024 for "denali,denali-nand-uniphier-v5b"
     see nand.txt for details.
   - nand-ecc-strength: see nand.txt for details
   - nand-ecc-maximize: see nand.txt for details
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index aa1e032..b411889 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -34,10 +34,37 @@ struct denali_dt_data {
 	unsigned int caps;
 };
 
+static const int denali_uniphier_ecc_strength[] = {
+	24, 16, 8, 0,
+};
+
+static const struct denali_dt_data denali_uniphier_v5a_data = {
+	.ecc_strength_avail = denali_uniphier_ecc_strength,
+	.caps = DENALI_CAPS_DMA_64BIT |
+		DENALI_CAPS_ECC_SIZE_1024,
+};
+
+static const struct denali_dt_data denali_uniphier_v5b_data = {
+	.ecc_strength_avail = denali_uniphier_ecc_strength,
+	.caps = DENALI_CAPS_DMA_64BIT |
+		DENALI_CAPS_NEW_N_BANKS_FORMAT |
+		DENALI_CAPS_ECC_SIZE_1024,
+};
+
 static const struct of_device_id denali_nand_dt_ids[] = {
-		{ .compatible = "denali,denali-nand-dt" },
-		{ /* sentinel */ }
-	};
+	{
+		.compatible = "denali,denali-nand-dt",
+	},
+	{
+		.compatible = "denali,denali-nand-uniphier-v5a",
+		.data = &denali_uniphier_v5a_data,
+	},
+	{
+		.compatible = "denali,denali-nand-uniphier-v5b",
+		.data = &denali_uniphier_v5b_data,
+	},
+	{ /* sentinel */ }
+};
 
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
-- 
2.7.4
