Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWpB-0000DG-0F
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2017 10:05:23 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/17] mtd: nand: Add manufacturer specific
 initialization/detection steps
Date: Mon,  9 Jan 2017 11:04:15 +0100
Message-Id: <1483956264-3335-9-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483956264-3335-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A lot of NANDs are implementing generic features in a non-generic way,
or are providing advanced auto-detection logic where the NAND ID bytes
meaning changes with the NAND generation.

Providing this vendor specific initialization step will allow us to get
rid of the full ids in the nand_ids table or all the vendor specific
cases added over the time in the generic NAND ID decoding logic.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 75 ++++++++++++++++++++++++++++++++++++++------
 include/linux/mtd/nand.h     | 35 +++++++++++++++++++++
 2 files changed, 100 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e21fd3f3e08f..07f075afce49 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3779,7 +3779,7 @@ static int nand_get_bits_per_cell(u8 cellinfo)
  * chip. The rest of the parameters must be decoded according to generic or
  * manufacturer-specific "extended ID" decoding patterns.
  */
-static void nand_decode_ext_id(struct nand_chip *chip)
+void nand_decode_ext_id(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int extid, id_len = chip->id.len;
@@ -3904,6 +3904,7 @@ static void nand_decode_ext_id(struct nand_chip *chip)
 
 	}
 }
+EXPORT_SYMBOL_GPL(nand_decode_ext_id);
 
 /*
  * Old devices have chip data hardcoded in the device ID table. nand_decode_id
@@ -4008,6 +4009,53 @@ static bool find_full_id_nand(struct nand_chip *chip,
 }
 
 /*
+ * Manufacturer detection. Only used when the NAND is not ONFI or JEDEC
+ * compliant and does not have a full-id or legacy-id entry in the nand_ids
+ * table.
+ */
+static void nand_manufacturer_detect(struct nand_chip *chip)
+{
+	/*
+	 * Try manufacturer detection if available and use
+	 * nand_decode_ext_id() otherwise.
+	 */
+	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
+	    chip->manufacturer.desc->ops->detect)
+		chip->manufacturer.desc->ops->detect(chip);
+	else
+		nand_decode_ext_id(chip);
+}
+
+/*
+ * Manufacturer initialization. This function is called for all NANDs including
+ * ONFI and JEDEC compliant ones.
+ * Manufacturer drivers should put all their specific initialization code in
+ * their ->init() hook.
+ */
+static int nand_manufacturer_init(struct nand_chip *chip)
+{
+	if (!chip->manufacturer.desc || !chip->manufacturer.desc->ops ||
+	    !chip->manufacturer.desc->ops->init)
+		return 0;
+
+	return chip->manufacturer.desc->ops->init(chip);
+}
+
+/*
+ * Manufacturer cleanup. This function is called for all NANDs including
+ * ONFI and JEDEC compliant ones.
+ * Manufacturer drivers should put all their specific cleanup code in their
+ * ->cleanup() hook.
+ */
+static void nand_manufacturer_cleanup(struct nand_chip *chip)
+{
+	/* Release manufacturer private data */
+	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
+	    chip->manufacturer.desc->ops->cleanup)
+		chip->manufacturer.desc->ops->cleanup(chip);
+}
+
+/*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
 static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
@@ -4015,7 +4063,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	const struct nand_manufacturer *manufacturer;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int busw;
-	int i;
+	int i, ret;
 	u8 *id_data = chip->id.data;
 	u8 maf_id, dev_id;
 
@@ -4056,6 +4104,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	chip->id.len = nand_id_len(id_data, 8);
 
+	/* Try to identify manufacturer */
+	manufacturer = nand_get_manufacturer(maf_id);
+	chip->manufacturer.desc = manufacturer;
+
 	if (!type)
 		type = nand_flash_ids;
 
@@ -4102,12 +4154,11 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 
 	chip->chipsize = (uint64_t)type->chipsize << 20;
 
-	if (!type->pagesize) {
-		/* Decode parameters from extended ID */
-		nand_decode_ext_id(chip);
-	} else {
+	if (!type->pagesize)
+		nand_manufacturer_detect(chip);
+	else
 		nand_decode_id(chip, type);
-	}
+
 	/* Get chip options */
 	chip->options |= type->options;
 
@@ -4119,9 +4170,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
 ident_done:
 
-	/* Try to identify manufacturer */
-	manufacturer = nand_get_manufacturer(maf_id);
-
 	if (chip->options & NAND_BUSWIDTH_AUTO) {
 		WARN_ON(busw & NAND_BUSWIDTH_16);
 		nand_set_defaults(chip);
@@ -4162,6 +4210,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	ret = nand_manufacturer_init(chip);
+	if (ret)
+		return ret;
+
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		maf_id, dev_id);
 
@@ -4906,6 +4958,9 @@ void nand_cleanup(struct nand_chip *chip)
 	if (chip->badblock_pattern && chip->badblock_pattern->options
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
+
+	/* Free manufacturer priv data. */
+	nand_manufacturer_cleanup(chip);
 }
 EXPORT_SYMBOL_GPL(nand_cleanup);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6d13c5917b71..703907bd1ade 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -732,6 +732,20 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
 }
 
 /**
+ * struct nand_manufacturer_ops - NAND Manufacturer operations
+ * @detect: detect the NAND memory organization and capabilities
+ * @init: initialize all vendor specific fields (like the ->read_retry()
+ *	  implementation) if any.
+ * @cleanup: the ->init() function may have allocated resources, ->cleanup()
+ *	     is here to let vendor specific code release those resources.
+ */
+struct nand_manufacturer_ops {
+	void (*detect)(struct nand_chip *chip);
+	int (*init)(struct nand_chip *chip);
+	void (*cleanup)(struct nand_chip *chip);
+};
+
+/**
  * struct nand_chip - NAND Private Flash Chip Data
  * @mtd:		MTD device registered to the MTD framework
  * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
@@ -831,6 +845,7 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
  *			additional error status checks (determine if errors are
  *			correctable).
  * @write_page:		[REPLACEABLE] High-level page write function
+ * @manufacturer:	[INTERN] Contains manufacturer information
  */
 
 struct nand_chip {
@@ -917,6 +932,11 @@ struct nand_chip {
 	struct nand_bbt_descr *badblock_pattern;
 
 	void *priv;
+
+	struct {
+		const struct nand_manufacturer *desc;
+		void *priv;
+	} manufacturer;
 };
 
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
@@ -953,6 +973,17 @@ static inline void nand_set_controller_data(struct nand_chip *chip, void *priv)
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
@@ -1058,10 +1089,12 @@ struct nand_flash_dev {
  * struct nand_manufacturer - NAND Flash Manufacturer structure
  * @name:	Manufacturer name
  * @id:		manufacturer ID code of device.
+ * @ops:	manufacturer operations
 */
 struct nand_manufacturer {
 	int id;
 	char *name;
+	const struct nand_manufacturer_ops *ops;
 };
 
 const struct nand_manufacturer *nand_get_manufacturer(u8 id);
@@ -1239,4 +1272,6 @@ int nand_reset(struct nand_chip *chip, int chipnr);
 /* Free resources held by the NAND device */
 void nand_cleanup(struct nand_chip *chip);
 
+/* Default extended ID decoding function */
+void nand_decode_ext_id(struct nand_chip *chip);
 #endif /* __LINUX_MTD_NAND_H */
-- 
2.7.4
