Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OfrHO-0008AH-Fk
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 09:25:56 +0000
Message-ID: <4C568F1D.4020007@parrot.com>
Date: Mon, 2 Aug 2010 11:25:49 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Florian Fainelli <ffainelli@freebox.fr>
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from NAND
	device
References: <201007290047.06394.ffainelli@freebox.fr>
	<4C5133AC.5010009@parrot.com>
	<201007291051.38278.ffainelli@freebox.fr>
In-Reply-To: <201007291051.38278.ffainelli@freebox.fr>
Content-Type: multipart/mixed; boundary="------------040501080601060503080405"
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------040501080601060503080405
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Florian Fainelli a écrit :
> Hi Matthieu,
> 
> On Thursday 29 July 2010 09:54:20 Matthieu CASTET wrote:
>> Hi,
>>
>>
>> Also you don't handle endianness (integer are little endian) for value
>> in nand_onfi_params.
> 
> Yes, so far the drivers using those values were doing the correct endian 
> conversion when they need to use them.
In that case use le16, le32, ... type. Also prefer kernel type over 
uintx_t type.


>> This won't work this unknown nand, and not work with some LP nand that
>> doesn't provide additional id bytes.
> 
> So how do you see things regarding the provisioning of the relevant ONFI 
> parameters?
I will see something like in the patch attached in
http://article.gmane.org/gmane.linux.drivers.mtd/30935.

ONFI parsing is done early in nand_get_flash_type (unknow chip or LP nand).
If the ONFI parsing is ok we bypass the old identification method
(additional id bytes).

As an example I attach a patch that mix your patch and mine.


Matthieu

PS : the NAND_ONFI flags seems useless, we can use onfi_version (0 means 
no onfi).


--------------040501080601060503080405
Content-Type: text/x-diff; name="onfi.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="onfi.diff"

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..25a44fa 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2772,15 +2772,50 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 
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
+						  int busw, int *maf_id, int *dev_id
 						  struct nand_flash_dev *type)
 {
-	int i, dev_id, maf_idx;
+	int i, maf_idx;
 	u8 id_data[8];
 
 	/* Select the device */
@@ -2797,7 +2832,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	/* Read manufacturer and device IDs */
 	*maf_id = chip->read_byte(mtd);
-	dev_id = chip->read_byte(mtd);
+	*dev_id = chip->read_byte(mtd);
 
 	/* Try again to make sure, as some systems the bus-hold or other
 	 * interface concerns can cause random data which looks like a
@@ -2807,15 +2842,13 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
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
 
@@ -2823,8 +2856,79 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		type = nand_flash_ids;
 
 	for (; type->name != NULL; type++)
-		if (dev_id == type->id)
+		if (*dev_id == type->id)
                         break;
+#if 1
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
+				/* XXX this that ok to use read_buf at this stage ? */
+				chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
+				if (onfi_crc(0x4F4E, (uint8_t *)p, 254) == le16_to_cpu(p->crc))
+				{
+					 printk(KERN_INFO "ONFI param page %d valid\n", i);
+					 break;
+				}
+			}
+			if (i < 3) {
+				/* check version */
+				int val = le16_to_cpu(p->revision);
+				if (!is_power_of_2(val) || val == 1 || val > (1 << 4)) {
+					printk(KERN_INFO "%s: unsupported ONFI version\n", __func__);
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
+				chip->options |= (NAND_NO_READRDY | NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
+
+				/* emulate cellinfo ??? */
+				//chip->cellinfo = 0x8;
+				goto ident_done;
+
+			}
+		}
+	}
+#endif
+	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+
+	/* Read entire ID string */
+
+	for (i = 0; i < 8; i++)
+		id_data[i] = chip->read_byte(mtd);
 
 	if (!type->name)
 		return ERR_PTR(-ENODEV);
@@ -2886,6 +2990,21 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
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
@@ -2900,7 +3019,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
 		printk(KERN_INFO "NAND device: Manufacturer ID:"
 		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
-		       dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
+		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
 		printk(KERN_WARNING "NAND bus width %d instead %d bit\n",
 		       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
 		       busw ? 16 : 8);
@@ -2924,21 +3043,6 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;
 	chip->badblockbits = 8;
 
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
 	 * on Samsung and Hynix MLC devices
@@ -2958,9 +3062,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	/* TODO onfi flash name */
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
-	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
-	       nand_manuf_ids[maf_idx].name, type->name);
+	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
+	       nand_manuf_ids[maf_idx].name, chip->onfi_version?type->name:chip->onfi_params.model);
 
 	return type;
 }
@@ -2979,7 +3084,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		    struct nand_flash_dev *table)
 {
-	int i, busw, nand_maf_id;
+	int i, busw, nand_maf_id, nand_dev_id;
 	struct nand_chip *chip = mtd->priv;
 	struct nand_flash_dev *type;
 
@@ -2989,7 +3094,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, busw);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id, table);
+	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id, &nand_dev_id, table);
 
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
@@ -3007,7 +3112,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != chip->read_byte(mtd) ||
-		    type->id != chip->read_byte(mtd))
+		    nand_dev_id != chip->read_byte(mtd))
 			break;
 	}
 	if (i > 1)
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index a81b185..c358100 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -88,6 +88,7 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_CMD_RNDIN		0x85
 #define NAND_CMD_READID		0x90
 #define NAND_CMD_ERASE2		0xd0
+#define NAND_CMD_PARAM		0xec
 #define NAND_CMD_RESET		0xff
 
 #define NAND_CMD_LOCK		0x2a
@@ -229,6 +230,68 @@ typedef enum {
 /* Keep gcc happy */
 struct nand_chip;
 
+/* XXX use le16, le32 type */
+struct nand_onfi_params {
+	/* rev info and features block */
+	uint8_t		sig[4]; /* 'O' 'N' 'F' 'I'  */
+	uint16_t	revision;
+	uint16_t	features;
+	uint16_t	opt_cmd;
+	uint8_t		reserved[22];
+
+	/* manufacturer information block */
+	char		manufacturer[12];
+	char		model[20];
+	uint8_t		jedec_id;
+	uint16_t	date_code;
+	uint8_t		reserved2[13];
+
+	/* memory organization block */
+	uint32_t	byte_per_page;
+	uint16_t	spare_bytes_per_page;
+	uint32_t	data_bytes_per_ppage;
+	uint16_t	sparre_bytes_per_ppage;
+	uint32_t	pages_per_block;
+	uint32_t	blocks_per_lun;
+	uint8_t		lun_count;
+	uint8_t		addr_cycles;
+	uint8_t		bits_per_cell;
+	uint16_t	bb_per_lun;
+	uint16_t	block_endurance;
+	uint8_t		guaranteed_good_blocks;
+	uint16_t	guaranteed_block_endurance;
+	uint8_t		programs_per_page;
+	uint8_t		ppage_attr;
+	uint8_t		ecc_bits;
+	uint8_t		interleaved_bits;
+	uint8_t		interleaved_ops;
+	uint8_t		reserved3[13];
+
+	/* electrical parameter block */
+	uint8_t		io_pin_capacitance_max;
+	uint16_t	async_timing_mode;
+	uint16_t	program_cache_timing_mode;
+	uint16_t	t_prog;
+	uint16_t	t_bers;
+	uint16_t	t_r;
+	uint16_t	t_ccs;
+	uint16_t	src_sync_timing_mode;
+	uint16_t	src_ssync_features;
+	uint16_t	clk_pin_capacitance_typ;
+	uint16_t	io_pin_capacitance_typ;
+	uint16_t	input_pin_capacitance_typ;
+	uint8_t		input_pin_capacitance_max;
+	uint8_t		driver_strenght_support;
+	uint16_t	t_int_r;
+	uint16_t	t_ald;
+	uint8_t		reserved4[7];
+
+	/* vendor */
+	uint8_t		reserved5[90];
+
+	__le16 crc;
+} __attribute__((packed));
+
 /**
  * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
  * @lock:               protection lock
@@ -413,6 +476,9 @@ struct nand_chip {
 	int		badblockpos;
 	int		badblockbits;
 
+	int		onfi_version;
+	struct nand_onfi_params	onfi_params;
+
 	flstate_t	state;
 
 	uint8_t		*oob_poi;

--------------040501080601060503080405--
