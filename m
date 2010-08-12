Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjXIB-0003XH-Q8
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 12:53:57 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
Date: Thu, 12 Aug 2010 14:53:50 +0200
Subject: [PATCH 3/3] NAND: add support for reading ONFI parameters from NAND
	device
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008121453.50207.ffainelli@freebox.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for reading NAND device ONFI parameters and use
the ONFI informations to define its geometry. In case the device supports
ONFI, the onfi_version field in struct nand_chip contains the version (BCD)
and the onfi_params structure can be used by drivers to set up timings and
such. We currently only support ONFI 1.0 parameters.

Signed-off-by: Matthieu Castet <matthieu.castet@parrot.com>
Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a3c7473..d0c8a5e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2786,15 +2786,50 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 
 }
 
+static u16 onfi_crc(u16 crc, unsigned char const *p, size_t len)
+{
+	int i;
+	while (len--) {
+		crc ^= *p++ << 8;
+		for (i = 0; i < 8; i++)
+			crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
+	}
+	return crc;
+}
+
+/*
+ * sanitize ONFI strings so we can safely print them
+ */
+static void sanitize_string(uint8_t *s, size_t len)
+{
+	ssize_t i;
+
+	/* null terminate */
+	s[len - 1] = 0;
+
+	/* remove non printable chars */
+	for (i = 0; i < len - 1; i++) {
+		if (s[i] < ' ' || s[i] > 127)
+			s[i] = '?';
+	}
+
+	/* remove trailing spaces */
+	for (i = len - 1; i >= 0; i--) {
+		if (s[i] && s[i] != ' ')
+			break;
+		s[i] = 0;
+	}
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 						  struct nand_chip *chip,
-						  int busw, int *maf_id,
+						  int busw, int *maf_id, int *dev_id,
 						  struct nand_flash_dev *type)
 {
-	int i, dev_id, maf_idx;
+	int i, maf_idx;
 	u8 id_data[8];
 
 	/* Select the device */
@@ -2811,7 +2846,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	/* Read manufacturer and device IDs */
 	*maf_id = chip->read_byte(mtd);
-	dev_id = chip->read_byte(mtd);
+	*dev_id = chip->read_byte(mtd);
 
 	/* Try again to make sure, as some systems the bus-hold or other
 	 * interface concerns can cause random data which looks like a
@@ -2821,15 +2856,13 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 
-	/* Read entire ID string */
-
-	for (i = 0; i < 8; i++)
+	for (i = 0; i < 2; i++)
 		id_data[i] = chip->read_byte(mtd);
 
-	if (id_data[0] != *maf_id || id_data[1] != dev_id) {
+	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
 		printk(KERN_INFO "%s: second ID read did not match "
 		       "%02x,%02x against %02x,%02x\n", __func__,
-		       *maf_id, dev_id, id_data[0], id_data[1]);
+		       *maf_id, *dev_id, id_data[0], id_data[1]);
 		return ERR_PTR(-ENODEV);
 	}
 
@@ -2837,9 +2870,81 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		type = nand_flash_ids;
 
 	for (; type->name != NULL; type++)
-		if (dev_id == type->id)
+		if (*dev_id == type->id)
                         break;
 
+	chip->onfi_version = 0;
+	if (!type->name || !type->pagesize) {
+		/* try ONFI for unknow chip or LP */
+		chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
+		if (chip->read_byte(mtd) == 'O' &&
+			chip->read_byte(mtd) == 'N' &&
+			chip->read_byte(mtd) == 'F' &&
+			chip->read_byte(mtd) == 'I') {
+
+			struct nand_onfi_params *p = &chip->onfi_params;
+			int i;
+
+			printk(KERN_INFO "ONFI flash detected\n");
+			chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
+			for (i = 0; i < 3; i++) {
+				chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
+				if (onfi_crc(0x4F4E, (uint8_t *)p, 254) == le16_to_cpu(p->crc))
+				{
+					 printk(KERN_INFO "ONFI param page %d valid\n", i);
+					 break;
+				}
+			}
+
+			if (i < 3) {
+				/* check version */
+				int val = le16_to_cpu(p->revision);
+				if (is_power_of_2(val) || val == 1 || val > (1 << 4)) {
+					printk(KERN_INFO "%s: unsupported ONFI version: %d\n",
+						__func__, val);
+				}
+				else {
+					if (val & (1 << 1))
+						chip->onfi_version = 10;
+					else if (val & (1 << 2))
+						chip->onfi_version = 20;
+					else if (val & (1 << 3))
+						chip->onfi_version = 21;
+					else
+						chip->onfi_version = 22;
+				}
+			}
+
+			if (chip->onfi_version) {
+				sanitize_string(p->manufacturer, sizeof(p->manufacturer));
+				sanitize_string(p->model, sizeof(p->model));
+				if (!mtd->name)
+					mtd->name = p->model;
+				mtd->writesize = le32_to_cpu(p->byte_per_page);
+				mtd->erasesize = le32_to_cpu(p->pages_per_block)*mtd->writesize;
+				mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
+				chip->chipsize = le32_to_cpu(p->blocks_per_lun) * mtd->erasesize;
+				busw = 0;
+				if (le16_to_cpu(p->features) & 1)
+					busw = NAND_BUSWIDTH_16;
+
+				chip->options &= ~NAND_CHIPOPTIONS_MSK;
+				chip->options |= (NAND_NO_READRDY |
+						NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
+
+				goto ident_done;
+
+			}
+		}
+	}
+
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+
+	/* Read entire ID string */
+
+	for (i = 0; i < 8; i++)
+		id_data[i] = chip->read_byte(mtd);
+
 	if (!type->name)
 		return ERR_PTR(-ENODEV);
 
@@ -2900,6 +3005,21 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		mtd->oobsize = mtd->writesize / 32;
 		busw = type->options & NAND_BUSWIDTH_16;
 	}
+	/* Get chip options, preserve non chip based options */
+	chip->options &= ~NAND_CHIPOPTIONS_MSK;
+	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
+
+	/* Check if chip is a not a samsung device. Do not clear the
+	 * options for chips which are not having an extended id.
+	 */
+	if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
+		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
+ident_done:
+
+	/*
+	 * Set chip as a default. Board drivers can override it, if necessary
+	 */
+	chip->options |= NAND_NO_AUTOINCR;
 
 	/* Try to identify manufacturer */
 	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
@@ -2914,7 +3034,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
 		printk(KERN_INFO "NAND device: Manufacturer ID:"
 		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
-		       dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
+		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
 		printk(KERN_WARNING "NAND bus width %d instead %d bit\n",
 		       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
 		       busw ? 16 : 8);
@@ -2943,21 +3063,6 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
 
 
-	/* Get chip options, preserve non chip based options */
-	chip->options &= ~NAND_CHIPOPTIONS_MSK;
-	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
-
-	/*
-	 * Set chip as a default. Board drivers can override it, if necessary
-	 */
-	chip->options |= NAND_NO_AUTOINCR;
-
-	/* Check if chip is a not a samsung device. Do not clear the
-	 * options for chips which are not having an extended id.
-	 */
-	if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
-		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
-
 	/*
 	 * Bad block marker is stored in the last page of each block
 	 * on Samsung and Hynix MLC devices; stored in first two pages
@@ -2997,9 +3102,11 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	/* TODO onfi flash name */
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
-	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
-	       nand_manuf_ids[maf_idx].name, type->name);
+		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
+		nand_manuf_ids[maf_idx].name,
+		chip->onfi_version ? type->name:chip->onfi_params.model);
 
 	return type;
 }
@@ -3018,7 +3125,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		    struct nand_flash_dev *table)
 {
-	int i, busw, nand_maf_id;
+	int i, busw, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
 
@@ -3028,7 +3135,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, busw);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id, table);
+	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id, &nand_dev_id, table);
 
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
@@ -3046,7 +3153,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != chip->read_byte(mtd) ||
-		    type->id != chip->read_byte(mtd))
+		    nand_dev_id != chip->read_byte(mtd))
 			break;
 	}
 	if (i > 1)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8b288b6..135576f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -228,6 +228,67 @@ typedef enum {
 /* Keep gcc happy */
 struct nand_chip;
 
+struct nand_onfi_params {
+	/* rev info and features block */
+	u8		sig[4]; /* 'O' 'N' 'F' 'I'  */
+	__le16		revision;
+	__le16		features;
+	__le16		opt_cmd;
+	u8		reserved[22];
+
+	/* manufacturer information block */
+	char		manufacturer[12];
+	char		model[20];
+	u8		jedec_id;
+	__le16		date_code;
+	u8		reserved2[13];
+
+	/* memory organization block */
+	__le32		byte_per_page;
+	__le16		spare_bytes_per_page;
+	__le32		data_bytes_per_ppage;
+	__le16		sparre_bytes_per_ppage;
+	__le32		pages_per_block;
+	__le32		blocks_per_lun;
+	u8		lun_count;
+	u8		addr_cycles;
+	u8		bits_per_cell;
+	__le16		bb_per_lun;
+	__le16		block_endurance;
+	u8		guaranteed_good_blocks;
+	__le16		guaranteed_block_endurance;
+	u8		programs_per_page;
+	u8		ppage_attr;
+	u8		ecc_bits;
+	u8		interleaved_bits;
+	u8		interleaved_ops;
+	u8		reserved3[13];
+
+	/* electrical parameter block */
+	u8		io_pin_capacitance_max;
+	__le16		async_timing_mode;
+	__le16		program_cache_timing_mode;
+	__le16		t_prog;
+	__le16		t_bers;
+	__le16		t_r;
+	__le16		t_ccs;
+	__le16		src_sync_timing_mode;
+	__le16		src_ssync_features;
+	__le16		clk_pin_capacitance_typ;
+	__le16		io_pin_capacitance_typ;
+	__le16		input_pin_capacitance_typ;
+	u8		input_pin_capacitance_max;
+	u8		driver_strenght_support;
+	__le16		t_int_r;
+	__le16		t_ald;
+	u8		reserved4[7];
+
+	/* vendor */
+	u8		reserved5[90];
+
+	__le16 crc;
+} __attribute__((packed));
+
 /**
  * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
  * @lock:               protection lock
@@ -360,6 +421,8 @@ struct nand_buffers {
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
  * @pagebuf:		[INTERN] holds the pagenumber which is currently in data_buf
  * @subpagesize:	[INTERN] holds the subpagesize
+ * @onfi_version:	[INTERN] holds the chip ONFI version (BCD encoded), non 0 if ONFI supported
+ * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is supported, 0 otherwise
  * @ecclayout:		[REPLACEABLE] the default ecc placement scheme
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash lookup
@@ -412,6 +475,9 @@ struct nand_chip {
 	int		badblockpos;
 	int		badblockbits;
 
+	int		onfi_version;
+	struct nand_onfi_params	onfi_params;
+
 	flstate_t	state;
 
 	uint8_t		*oob_poi;
