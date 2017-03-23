Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqqT9-0004Zs-K7
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 00:19:17 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 thorsten.christiansson@idquantique.com, laurent.monat@idquantique.com,
 Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH v2 28/53] mtd: nand: denali: support
 "nand-ecc-strength" DT property
Date: Thu, 23 Mar 2017 09:17:37 +0900
Message-Id: <1490228282-10805-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490228282-10805-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Historically, this driver tried to choose as big ECC strength as
possible, but it would be reasonable to allow DT to set a particular
ECC strength with "nand-ecc-strength" property.

Going forward, DT platforms should specify "nand-ecc-strength" or
"nand-ecc-maximize" to show the ECC strength strategy explicitly.

If nothing is specified in DT, "nand-ecc-maximize" is implied since
this was the original behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v2:
  - Add available values in the binding document

 Documentation/devicetree/bindings/mtd/denali-nand.txt |  6 ++++++
 drivers/mtd/nand/denali.c                             | 18 ++++++++++++++++--
 drivers/mtd/nand/denali_pci.c                         |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index 25313c7..647618e 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -11,6 +11,12 @@ Optional properties:
   - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
       512   for "altr,socfpga-denali-nand"
     see nand.txt for details.
+  - nand-ecc-strength: see nand.txt for details.  Available values are:
+      8, 15      for "altr,socfpga-denali-nand"
+  - nand-ecc-maximize: see nand.txt for details
+
+Note:
+Either nand-ecc-strength or nand-ecc-maximize should be specified.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 96074b8..70e9f06 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1627,9 +1627,23 @@ int denali_init(struct denali_nand_info *denali)
 		goto failed_req_irq;
 	}
 
-	ret = denali_set_max_ecc_strength(denali);
-	if (ret)
+	if (!chip->ecc.strength && !(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
+		dev_info(denali->dev,
+			 "No ECC strength strategy is specified. Maximizing ECC strength\n");
+		chip->ecc.options |= NAND_ECC_MAXIMIZE;
+	}
+
+	if (chip->ecc.options & NAND_ECC_MAXIMIZE) {
+		ret = denali_set_max_ecc_strength(denali);
+		if (ret)
+			goto failed_req_irq;
+	} else if (!(denali->ecc_strength_avail & BIT(chip->ecc.strength))) {
+		dev_err(denali->dev,
+			"Specified ECC strength (%d) is not supported for this controller.\n",
+			chip->ecc.strength);
+		ret = -EINVAL;
 		goto failed_req_irq;
+	}
 
 	chip->ecc.bytes = denali_calc_ecc_bytes(chip->ecc.size,
 						chip->ecc.strength);
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index a1ee9f8..a39682a5 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -87,6 +87,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	denali->ecc_strength_avail = BIT(15) | BIT(8);
 	denali->caps |= DENALI_CAP_ECC_SIZE_512;
+	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
 
 	ret = denali_init(denali);
 	if (ret)
-- 
2.7.4
