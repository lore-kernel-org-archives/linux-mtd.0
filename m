Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZo-0002C2-Jz
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:09:50 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [RESEND PATCH v2 13/53] mtd: nand: denali_dt: enable HW_ECC_FIXUP for
 Altera SOCFPGA variant
Date: Thu, 23 Mar 2017 05:07:12 +0900
Message-Id: <1490213273-8571-14-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are various customizable parameters, so several variants for
this IP.  A generic compatible like "denali,denali-nand-dt" is
useless.  Moreover, there are multiple things wrong with this string.
(Refer to Rob's comment [1])

The denali_dt.c was split out and this compatible was added by Altera
for the SOCFPGA port.  So, replace it with a more specific string.

The Denali IP on SOCFPGA incorporates the hardware ECC fixup feature.
So, this capability should be associated with the compatible string.

[1] https://lkml.org/lkml/2016/12/1/450

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Add caps flag to of_device_id data, not hard-code in driver code
  - Add Altera-specific compatible.

 Documentation/devicetree/bindings/mtd/denali-nand.txt |  5 +++--
 drivers/mtd/nand/denali_dt.c                          | 14 ++++++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b04d03a..6f4ab4c 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -1,7 +1,8 @@
 * Denali NAND controller
 
 Required properties:
-  - compatible : should be "denali,denali-nand-dt"
+  - compatible : should be one of the following:
+      "altr,socfpga-denali-nand"            - for Altera SOCFPGA
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
@@ -15,7 +16,7 @@ Examples:
 nand: nand@ff900000 {
 	#address-cells = <1>;
 	#size-cells = <1>;
-	compatible = "denali,denali-nand-dt";
+	compatible = "altr,socfpga-denali-nand";
 	reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
 	reg-names = "nand_data", "denali_reg";
 	interrupts = <0 144 4>;
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 293ddb8..9577bfd 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -33,11 +33,17 @@ struct denali_dt_data {
 	unsigned int caps;
 };
 
-static const struct of_device_id denali_nand_dt_ids[] = {
-		{ .compatible = "denali,denali-nand-dt" },
-		{ /* sentinel */ }
-	};
+static const struct denali_dt_data denali_socfpga_data = {
+	.caps = DENALI_CAP_HW_ECC_FIXUP,
+};
 
+static const struct of_device_id denali_nand_dt_ids[] = {
+	{
+		.compatible = "altr,socfpga-denali-nand",
+		.data = &denali_socfpga_data,
+	},
+	{ /* sentinel */ }
+};
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
 static u64 denali_dma_mask;
-- 
2.7.4
