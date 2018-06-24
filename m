Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXDlN-00052y-R3
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 22:45:52 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v6 2/6] mtd: rawnand: add manufacturer fixup for ONFI
 parameter page
Date: Mon, 25 Jun 2018 10:44:44 +1200
Message-Id: <20180624224448.21872-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180624224448.21872-1-chris.packham@alliedtelesis.co.nz>
References: <20180624224448.21872-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is called after the ONFI parameter page checksum is verified
and allows us to override the contents of the parameter page.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- New
Changes in v3:
- Add doc comment and review from Boris
Changes in v4:
- None
Changes in v5:
- None
Changes in v6:
- None

 drivers/mtd/nand/raw/nand_base.c | 4 ++++
 include/linux/mtd/rawnand.h      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 0cd3e216b95c..65250308c82d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5172,6 +5172,10 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
 		}
 	}
 
+	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
+	    chip->manufacturer.desc->ops->fixup_onfi_param_page)
+		chip->manufacturer.desc->ops->fixup_onfi_param_page(chip, p);
+
 	/* Check version */
 	val = le16_to_cpu(p->revision);
 	if (val & (1 << 5))
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 3e8ec3b8a39c..ef7e3b4e91ea 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -778,11 +778,14 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  *	  implementation) if any.
  * @cleanup: the ->init() function may have allocated resources, ->cleanup()
  *	     is here to let vendor specific code release those resources.
+ * @fixup_onfi_param_page: apply vendor specific fixups to the ONFI
+ *	parameter page. This is called after the checksum is verified.
  */
 struct nand_manufacturer_ops {
 	void (*detect)(struct nand_chip *chip);
 	int (*init)(struct nand_chip *chip);
 	void (*cleanup)(struct nand_chip *chip);
+	void (*fixup_onfi_param_page)(struct nand_chip *chip, struct nand_onfi_params *p);
 };
 
 /**
-- 
2.18.0
