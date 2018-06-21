Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVwv7-0003n7-EH
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2018 10:34:37 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v4 4/6] mtd: rawnand: micron: add fixup for ONFI revision
Date: Thu, 21 Jun 2018 22:33:26 +1200
Message-Id: <20180621103328.28206-5-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180621103328.28206-1-chris.packham@alliedtelesis.co.nz>
References: <20180621103328.28206-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some Micron NAND chips (MT29F1G08ABAFAWP-ITE:F) report 00 00 for the
revision number field of the ONFI parameter page. Rather than rejecting
these outright assume ONFI version 1.0 if the revision number is 00 00.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
This is now qualified on vendor == MICRON. I haven't qualified this
based on specific chips the ABAFA (id=d1) and ABBFA (id=a1) variants are
documented to have this behaviour.

Changes in v2:
- use fixup_onfi_param_page
Changes in v3:
- add code comment next to workaround
Changes in v4:
- use define for ONFI_VERSION

 drivers/mtd/nand/raw/nand_micron.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 203faba0a9c1..d30bd4df9b12 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -290,6 +290,19 @@ static int micron_nand_init(struct nand_chip *chip)
 	return 0;
 }
 
+static void micron_fixup_onfi_param_page(struct nand_chip *chip,
+					 struct nand_onfi_params *p)
+{
+	/*
+	 * MT29F1G08ABAFAWP-ITE:F and possibly others report 00 00 for the
+	 * revision number field of the ONFI parameter page. Assume ONFI
+	 * version 1.0 if the revision number is 00 00.
+	 */
+	if (le16_to_cpu(p->revision) == 0)
+		p->revision = cpu_to_le16(ONFI_VERSION_1_0);
+}
+
 const struct nand_manufacturer_ops micron_nand_manuf_ops = {
 	.init = micron_nand_init,
+	.fixup_onfi_param_page = micron_fixup_onfi_param_page,
 };
-- 
2.17.1
