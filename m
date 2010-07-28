Received: from zmc.proxad.net ([212.27.53.206])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeFOX-0002lI-Cr
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 22:46:38 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
Date: Thu, 29 Jul 2010 00:47:05 +0200
Subject: [PATCH] NAND: add support for reading ONFI parameters from NAND device
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Maxime Bizon <mbizon@freebox.fr>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201007290047.06394.ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A nand_chip which has valid ONFI parameters gets its options field updated
with the NAND_ONFI flag. In that case both the ONFI version (in BCD format)
as well as the complete page parameters is available in the struct nand_chip.
This allows for better detection of some new devices, as well as fine tuning of
NAND driver timings. This patch only adds support for ONFI 1.0 parameters.

Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..c255cec 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2773,6 +2773,83 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 }
 
 /*
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
+/*
+ * Check whether flash support ONFI and read ONFI parameters in that
+ * case
+ */
+static void nand_read_onfi(struct mtd_info *mtd, struct nand_chip *chip)
+{
+	struct nand_onfi_params *p;
+	uint8_t sig[4];
+	uint16_t val;
+
+	if (!chip->cmdfunc || !chip->read_buf)
+		return;
+
+	/* read ONFI signature */
+	chip->cmdfunc(mtd, NAND_CMD_READID, NAND_ADDR_ONFI_ID, -1);
+	chip->read_buf(mtd, sig, sizeof(sig));
+
+	if (memcmp(sig, "ONFI", sizeof(sig)))
+		return;
+
+	/* ONFI seems supported */
+	chip->cmdfunc(mtd, NAND_CMD_READ_ONFI_PARAMS, 0, -1);
+	p = &chip->onfi_params;
+	chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
+
+	/* recheck signature */
+	if (memcmp(p->sig, "ONFI", sizeof(p->sig))) {
+		printk(KERN_INFO "%s: bad ONFI params signature\n", __func__);
+		return;
+	}
+
+	/* check version */
+	val = le16_to_cpu(p->revision);
+	if (!is_power_of_2(val) || val == 1 || val > (1 << 4)) {
+		printk(KERN_INFO "%s: unsupported ONFI version\n", __func__);
+		return;
+	}
+
+	if (val & (1 << 1))
+		chip->onfi_version = 10;
+	else if (val & (1 << 2))
+		chip->onfi_version = 20;
+	else if (val & (1 << 3))
+		chip->onfi_version = 21;
+	else
+		chip->onfi_version = 22;
+
+	chip->options |= NAND_ONFI;
+
+	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
+	sanitize_string(p->model, sizeof(p->model));
+}
+
+/*
  * Get the flash and manufacturer id and lookup if the type is supported
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
@@ -2958,10 +3035,19 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	nand_read_onfi(mtd, chip);
+
 	printk(KERN_INFO "NAND device: Manufacturer ID:"
 	       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
 	       nand_manuf_ids[maf_idx].name, type->name);
 
+	if (chip->options & NAND_ONFI)
+		printk(KERN_INFO "NAND is ONFI %d.%d compliant "
+		       "(man:%s model:%s)\n",
+		       chip->onfi_version / 10, chip->onfi_version % 10,
+		       chip->onfi_params.manufacturer,
+		       chip->onfi_params.model);
+
 	return type;
 }
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index a81b185..ad7f58f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -118,6 +118,10 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 #define NAND_CMD_STATUS_RESET	0x7f
 #define NAND_CMD_STATUS_CLEAR	0xff
 
+/* Extended commands for ONFI devices */
+#define NAND_CMD_READ_ONFI_PARAMS	0xEC
+#define NAND_ADDR_ONFI_ID	0x20
+
 #define NAND_CMD_NONE		-1
 
 /* Status bits */
@@ -190,6 +194,9 @@ typedef enum {
 /* Device behaves just like nand, but is readonly */
 #define NAND_ROM		0x00000800
 
+/* Chip supports ONFI */
+#define NAND_ONFI		0x00001000
+
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \
 	(NAND_NO_PADDING | NAND_CACHEPRG | NAND_COPYBACK)
@@ -229,6 +236,61 @@ typedef enum {
 /* Keep gcc happy */
 struct nand_chip;
 
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
+	uint8_t		io_pin_capacitance_max;
+
+	/* electrical parameter block */
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
+} __attribute__((packed));
+
 /**
  * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
  * @lock:               protection lock
@@ -354,6 +416,8 @@ struct nand_buffers {
  * @chip_shift:		[INTERN] number of address bits in one chip
  * @options:		[BOARDSPECIFIC] various chip options. They can partly be set to inform nand_scan about
  *			special functionality. See the defines for further explanation
+ * @onfi_version:	Supported ONFI version (10 => ONFI 1.0)
+ * @onfi_params:	ONFI parameters
  * @badblockpos:	[INTERN] position of the bad block marker in the oob area
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
  * @numchips:		[INTERN] number of physical chips
@@ -413,6 +477,9 @@ struct nand_chip {
 	int		badblockpos;
 	int		badblockbits;
 
+	int		onfi_version;
+	struct nand_onfi_params	onfi_params;
+
 	flstate_t	state;
 
 	uint8_t		*oob_poi;
