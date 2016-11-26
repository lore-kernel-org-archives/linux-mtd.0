Received: from conuserg-11.nifty.com ([210.131.2.78])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOX-0006R0-MY
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:08:14 +0000
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
Subject: [PATCH 37/39] mtd: nand: denali: support "nand-ecc-strength" DT
 property
Date: Sun, 27 Nov 2016 03:06:23 +0900
Message-Id: <1480183585-592-38-git-send-email-yamada.masahiro@socionext.com>
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

Historically, this driver tried to choose as big ECC strength as
possible, but it would be reasonable to allow DT to set a particular
ECC strength with "nand-ecc-strength" property.

Going forward, DT platforms should specify "nand-ecc-strength" or
"nand-ecc-maximize" to show the ECC strength strategy explicitly.

If nothing is specified in DT, "nand-ecc-maximize" is implied since
this was the original behavior.  It applies to PCI platforms too.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++++
 drivers/mtd/nand/denali.c                          | 27 +++++++++++++++++++++-
 drivers/mtd/nand/denali_pci.c                      |  2 ++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index e9d5818..51fe195 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -9,6 +9,11 @@ Required properties:
 Optional properties:
   - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to 512.
     see nand.txt for details.
+  - nand-ecc-strength: see nand.txt for details
+  - nand-ecc-maximize: see nand.txt for details
+
+Note:
+Either nand-ecc-strength or nand-ecc-maximize should be specified.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 54c9e0c..df174ca 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1393,6 +1393,21 @@ static int denali_set_max_ecc_strength(struct denali_nand_info *denali)
 	return -EINVAL;
 }
 
+static int denali_check_ecc_strength(struct denali_nand_info *denali)
+{
+	const int *ecc_strength = denali->ecc_strength_avail;
+
+	for (; *ecc_strength; ecc_strength++) {
+		if (*ecc_strength == denali->nand.ecc.strength)
+			return 0;
+	}
+
+	dev_err(denali->dev,
+		"Specified ECC strength is not supported for this controller.\n");
+
+	return -EINVAL;
+}
+
 static int denali_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *oobregion)
 {
@@ -1628,7 +1643,17 @@ int denali_init(struct denali_nand_info *denali)
 	if (!denali->ecc_strength_avail)
 		denali->ecc_strength_avail = denali_default_ecc_strength;
 
-	ret = denali_set_max_ecc_strength(denali);
+	if (!chip->ecc.strength && !(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
+		dev_info(denali->dev,
+			"No ECC strength is specified.  Trying max ECC strength strategy\n");
+		chip->ecc.options |= NAND_ECC_MAXIMIZE;
+	}
+
+	if (chip->ecc.options & NAND_ECC_MAXIMIZE)
+		ret = denali_set_max_ecc_strength(denali);
+	else
+		ret = denali_check_ecc_strength(denali);
+
 	if (ret)
 		goto failed_req_irq;
 
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index ac84323..0064f3e 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -85,6 +85,8 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto failed_remap_reg;
 	}
 
+	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
+
 	ret = denali_init(denali);
 	if (ret)
 		goto failed_remap_mem;
-- 
2.7.4
