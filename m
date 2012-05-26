From: Josh Wu <josh.wu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
Subject: [PATCH v9 2/3] MTD: at91: add dt parameters for PMECC
Date: Sat, 26 May 2012 21:24:36 +0800
Message-Id: <1338038677-6752-3-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
References: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, ivan.djelic@parrot.com,
 plagnioj@jcrosoft.com, Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Hong Xu <hong.xu@atmel.com>
Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt         |    6 ++++++
 drivers/mtd/nand/atmel_nand.c                      |   22 ++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index a200695..e442236 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -16,6 +16,12 @@ Optional properties:
 - nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
   "soft_bch".
+- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
+  Only supported by at91sam9x5 or later sam9 product.
+- atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
+  Controller. Supported values are: 2, 4, 8, 12, 24.
+- atmel,pmecc-sector-size : sector size for ECC computation. Supported values
+  are: 512, 1024.
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
 
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index ba61153..9a9bfbf 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -88,6 +88,10 @@ struct atmel_nand_host {
 
 	struct completion	comp;
 	struct dma_chan		*dma_chan;
+
+	bool			has_pmecc;
+	u8			pmecc_corr_cap;
+	u16			pmecc_sector_size;
 };
 
 static int cpu_has_dma(void)
@@ -508,6 +512,24 @@ static int __devinit atmel_of_init_port(struct atmel_nand_host *host,
 	board->enable_pin = of_get_gpio(np, 1);
 	board->det_pin = of_get_gpio(np, 2);
 
+	host->has_pmecc = of_property_read_bool(np, "atmel,has-pmecc");
+
+	if (!(board->ecc_mode == NAND_ECC_HW) || !host->has_pmecc)
+		return 0;
+
+	/* Use PMECC */
+	if (of_property_read_u32(np, "atmel,pmecc-cap", &val) != 0) {
+		dev_err(host->dev, "Cannot decide PMECC Capability\n");
+		return -EINVAL;
+	}
+	host->pmecc_corr_cap = (u8)val;
+
+	if (of_property_read_u32(np, "atmel,pmecc-sector-size", &val) != 0) {
+		dev_err(host->dev, "Cannot decide PMECC Sector Size\n");
+		return -EINVAL;
+	}
+	host->pmecc_sector_size = (u16)val;
+
 	return 0;
 }
 #else
-- 
1.7.10
