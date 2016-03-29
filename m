Received: from conuserg009.nifty.com ([202.248.44.35]
 helo=conuserg009-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akjSf-0003oM-R7
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2016 02:32:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Graham Moore <grmoore@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2] mtd: nand: denali: allow to override max_banks from DT
 property
Date: Tue, 29 Mar 2016 11:33:07 +0900
Message-Id: <1459218787-15197-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
changed in revision 5.1") supported the new encoding of the "n_banks"
bits of the "features" register, but there is an unfortunate case
not covered by that commit.

Panasonic (its System LSI Business Division is now Socionext) bought
a couple of versions of this IP.  The IP released for Panasonic
around Feb. 2012 is revision 5 and uses the old encoding for n_banks
(2 << n_banks).  While the one released around Nov. 2012 is also
revision 5, but it uses the new encoding (1 << n_banks).

The revision register cannot distinguish these two incompatible
hardware.  I guess this IP series is not well-organized.  I could not
find any solution but giving max_banks from DT property.

This commit works around the problem by allowing DT to set the
max_banks forcibly.  Of course, this DT property can be optional if
the auto detection based on the hardware registers works well.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v2:
  - rebase on v4.6-rc1
  - add Rob's Acked-by
  - Rephrase git-log slightly

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++
 drivers/mtd/nand/denali.c                             | 3 ++-
 drivers/mtd/nand/denali_dt.c                          | 3 +++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b04d03a..6154c77 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -7,6 +7,10 @@ Required properties:
   - interrupts : The interrupt number.
   - dm-mask : DMA bit mask
 
+Optional properties:
+  - max-banks : Maximum number of banks supported by hardware.  If not
+    specified, it is determined based on the "features" register of hardware.
+
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
 
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 30bf5f6..e18b569 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1353,7 +1353,8 @@ static void denali_hw_init(struct denali_nand_info *denali)
 	 */
 	denali->bbtskipbytes = ioread32(denali->flash_reg +
 						SPARE_AREA_SKIP_BYTES);
-	detect_max_banks(denali);
+	if (!denali->max_banks)
+		detect_max_banks(denali);
 	denali_nand_reset(denali);
 	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
 	iowrite32(CHIP_EN_DONT_CARE__FLAG,
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 0cb1e8d..be55db8 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -85,6 +85,9 @@ static int denali_dt_probe(struct platform_device *ofdev)
 		denali->dev->dma_mask = NULL;
 	}
 
+	of_property_read_u32(ofdev->dev.of_node, "max-banks",
+			     &denali->max_banks);
+
 	dt->clk = devm_clk_get(&ofdev->dev, NULL);
 	if (IS_ERR(dt->clk)) {
 		dev_err(&ofdev->dev, "no clk available\n");
-- 
1.9.1
