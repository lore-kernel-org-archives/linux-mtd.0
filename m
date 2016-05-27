Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6HJ0-0002XJ-7w
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 12:56:01 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/15] mtd: nand: add vendor specific initialization step
Date: Fri, 27 May 2016 14:54:51 +0200
Message-Id: <1464353701-23233-6-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A lot of NANDs are implementing generic features in a non-generic way, or
are providing advanced auto-detection logic where the NAND ID bytes meaning
changes with the NAND generation.

Providing this vendor specific initialization step will allow us to get rid
of the full ids in the nand_ids table or all the vendor specific cases
added over the time in the generic NAND ID decoding logic.

Note that nand_decode_bbm_options() call is moved before manuf->ops->init()
because vendor ->init() hook might tweak the BBM flags.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 30 ++++++++++++++++++++++++++----
 include/linux/mtd/nand.h     | 31 +++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 95e9a8e..b979e45 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3815,7 +3815,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
-	int i, maf_idx;
+	int i, maf_idx, ret;
 	u8 *id_data = chip->id.data;
 	u8 maf_id, dev_id;
 
@@ -3925,6 +3925,19 @@ ident_done:
 			break;
 	}
 
+	nand_decode_bbm_options(chip);
+
+	/*
+	 * Vendor specific initialization. This function can ajust the setting
+	 * extracted from generic auto-detection.
+	 */
+	chip->manufacturer.ops = nand_manuf_ids[maf_idx].ops;
+	if (chip->manufacturer.ops && chip->manufacturer.ops->init) {
+		ret = chip->manufacturer.ops->init(chip);
+		if (ret)
+			return ret;
+	}
+
 	if (chip->options & NAND_BUSWIDTH_AUTO) {
 		WARN_ON(busw & NAND_BUSWIDTH_16);
 		nand_set_defaults(chip);
@@ -3938,11 +3951,10 @@ ident_done:
 		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name, mtd->name);
 		pr_warn("bus width %d instead %d bit\n", busw ? 16 : 8,
 			(chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_cleanup;
 	}
 
-	nand_decode_bbm_options(chip);
-
 	/* Calculate the address shift from the page size */
 	chip->page_shift = ffs(mtd->writesize) - 1;
 	/* Convert chipsize to number of pages per chip -1 */
@@ -3981,6 +3993,12 @@ ident_done:
 		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
 		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
 	return 0;
+
+err_cleanup:
+	if (chip->manufacturer.ops && chip->manufacturer.ops->cleanup)
+		chip->manufacturer.ops->cleanup(chip);
+
+	return ret;
 }
 
 static const char * const nand_ecc_modes[] = {
@@ -4623,6 +4641,10 @@ void nand_release(struct mtd_info *mtd)
 	if (chip->badblock_pattern && chip->badblock_pattern->options
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
+
+	/* Release manufacturer private data */
+	if (chip->manufacturer.ops && chip->manufacturer.ops->cleanup)
+		chip->manufacturer.ops->cleanup(chip);
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3072f5e..d8de579 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -577,6 +577,18 @@ struct nand_buffers {
 };
 
 /**
+ * struct nand_manufacturer_ops - NAND Manufacturer operations
+ * @init: initialize all vendor specific fields (like the ->read_retry()
+ *	  implementation) if any.
+ * @cleanup: the ->init() function may have allocated resources, ->cleanup()
+ *	     is here to let vendor specific code release those resources.
+ */
+struct nand_manufacturer_ops {
+	int (*init)(struct nand_chip *chip);
+	void (*cleanup)(struct nand_chip *chip);
+};
+
+/**
  * struct nand_chip - NAND Private Flash Chip Data
  * @mtd:		MTD device registered to the MTD framework
  * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
@@ -676,6 +688,7 @@ struct nand_buffers {
  *			additional error status checks (determine if errors are
  *			correctable).
  * @write_page:		[REPLACEABLE] High-level page write function
+ * @manufacturer:	[INTERN] Contains manufacturer data
  */
 
 struct nand_chip {
@@ -756,6 +769,11 @@ struct nand_chip {
 	struct nand_bbt_descr *badblock_pattern;
 
 	void *priv;
+
+	struct {
+		const struct nand_manufacturer_ops *ops;
+		void *priv;
+	} manufacturer;
 };
 
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
@@ -792,6 +810,17 @@ static inline void nand_set_controller_data(struct nand_chip *chip, void *priv)
 	chip->priv = priv;
 }
 
+static inline void nand_set_manufacturer_data(struct nand_chip *chip,
+					      void *priv)
+{
+	chip->manufacturer.priv = priv;
+}
+
+static inline void *nand_get_manufacturer_data(struct nand_chip *chip)
+{
+	return chip->manufacturer.priv;
+}
+
 /*
  * NAND Flash Manufacturer ID Codes
  */
@@ -896,10 +925,12 @@ struct nand_flash_dev {
  * struct nand_manufacturers - NAND Flash Manufacturer ID Structure
  * @name:	Manufacturer name
  * @id:		manufacturer ID code of device.
+ * @ops:	manufacturer operations
 */
 struct nand_manufacturers {
 	int id;
 	char *name;
+	const struct nand_manufacturer_ops *ops;
 };
 
 extern struct nand_flash_dev nand_flash_ids[];
-- 
2.7.4
