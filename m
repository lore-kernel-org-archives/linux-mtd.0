Received: from www.tglx.de ([62.245.132.106])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3bBs-0002YI-9h
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2010 21:06:22 +0000
Date: Wed, 6 Oct 2010 23:06:14 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd/nand.h: little more cleanup
Message-ID: <20101006210614.GA18551@www.tglx.de>
References: <20101005104101.GA18714@www.tglx.de>
	<20101005182656.GA21067@pengutronix.de>
	<1286304506.1797.2.camel@brekeke>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1286304506.1797.2.camel@brekeke>
Cc: linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- remove tabs between type and name.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/mtd/nand.h |  315 +++++++++++++++++++++------------------------
 1 files changed, 147 insertions(+), 168 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index acd0b50..6473849 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -253,61 +253,62 @@ struct nand_chip;
 
 struct nand_onfi_params {
 	/* rev info and features block */
-	u8		sig[4]; /* 'O' 'N' 'F' 'I'  */
-	__le16		revision;
-	__le16		features;
-	__le16		opt_cmd;
-	u8		reserved[22];
+	/* 'O' 'N' 'F' 'I'  */
+	u8 sig[4];
+	__le16 revision;
+	__le16 features;
+	__le16 opt_cmd;
+	u8 reserved[22];
 
 	/* manufacturer information block */
-	char		manufacturer[12];
-	char		model[20];
-	u8		jedec_id;
-	__le16		date_code;
-	u8		reserved2[13];
+	char manufacturer[12];
+	char model[20];
+	u8 jedec_id;
+	__le16 date_code;
+	u8 reserved2[13];
 
 	/* memory organization block */
-	__le32		byte_per_page;
-	__le16		spare_bytes_per_page;
-	__le32		data_bytes_per_ppage;
-	__le16		spare_bytes_per_ppage;
-	__le32		pages_per_block;
-	__le32		blocks_per_lun;
-	u8		lun_count;
-	u8		addr_cycles;
-	u8		bits_per_cell;
-	__le16		bb_per_lun;
-	__le16		block_endurance;
-	u8		guaranteed_good_blocks;
-	__le16		guaranteed_block_endurance;
-	u8		programs_per_page;
-	u8		ppage_attr;
-	u8		ecc_bits;
-	u8		interleaved_bits;
-	u8		interleaved_ops;
-	u8		reserved3[13];
+	__le32 byte_per_page;
+	__le16 spare_bytes_per_page;
+	__le32 data_bytes_per_ppage;
+	__le16 spare_bytes_per_ppage;
+	__le32 pages_per_block;
+	__le32 blocks_per_lun;
+	u8 lun_count;
+	u8 addr_cycles;
+	u8 bits_per_cell;
+	__le16 bb_per_lun;
+	__le16 block_endurance;
+	u8 guaranteed_good_blocks;
+	__le16 guaranteed_block_endurance;
+	u8 programs_per_page;
+	u8 ppage_attr;
+	u8 ecc_bits;
+	u8 interleaved_bits;
+	u8 interleaved_ops;
+	u8 reserved3[13];
 
 	/* electrical parameter block */
-	u8		io_pin_capacitance_max;
-	__le16		async_timing_mode;
-	__le16		program_cache_timing_mode;
-	__le16		t_prog;
-	__le16		t_bers;
-	__le16		t_r;
-	__le16		t_ccs;
-	__le16		src_sync_timing_mode;
-	__le16		src_ssync_features;
-	__le16		clk_pin_capacitance_typ;
-	__le16		io_pin_capacitance_typ;
-	__le16		input_pin_capacitance_typ;
-	u8		input_pin_capacitance_max;
-	u8		driver_strenght_support;
-	__le16		t_int_r;
-	__le16		t_ald;
-	u8		reserved4[7];
+	u8 io_pin_capacitance_max;
+	__le16 async_timing_mode;
+	__le16 program_cache_timing_mode;
+	__le16 t_prog;
+	__le16 t_bers;
+	__le16 t_r;
+	__le16 t_ccs;
+	__le16 src_sync_timing_mode;
+	__le16 src_ssync_features;
+	__le16 clk_pin_capacitance_typ;
+	__le16 io_pin_capacitance_typ;
+	__le16 input_pin_capacitance_typ;
+	u8 input_pin_capacitance_max;
+	u8 driver_strenght_support;
+	__le16 t_int_r;
+	__le16 t_ald;
+	u8 reserved4[7];
 
 	/* vendor */
-	u8		reserved5[90];
+	u8 reserved5[90];
 
 	__le16 crc;
 } __attribute__((packed));
@@ -323,7 +324,7 @@ struct nand_onfi_params {
  *			when a hw controller is available.
  */
 struct nand_hw_control {
-	spinlock_t	 lock;
+	spinlock_t lock;
 	struct nand_chip *active;
 	wait_queue_head_t wq;
 };
@@ -353,44 +354,33 @@ struct nand_hw_control {
  * @write_oob:	function to write chip OOB data
  */
 struct nand_ecc_ctrl {
-	nand_ecc_modes_t	mode;
-	int			steps;
-	int			size;
-	int			bytes;
-	int			total;
-	int			prepad;
-	int			postpad;
+	nand_ecc_modes_t mode;
+	int steps;
+	int size;
+	int bytes;
+	int total;
+	int prepad;
+	int postpad;
 	struct nand_ecclayout	*layout;
-	void			(*hwctl)(struct mtd_info *mtd, int mode);
-	int			(*calculate)(struct mtd_info *mtd,
-					     const uint8_t *dat,
-					     uint8_t *ecc_code);
-	int			(*correct)(struct mtd_info *mtd, uint8_t *dat,
-					   uint8_t *read_ecc,
-					   uint8_t *calc_ecc);
-	int			(*read_page_raw)(struct mtd_info *mtd,
-						 struct nand_chip *chip,
-						 uint8_t *buf, int page);
-	void			(*write_page_raw)(struct mtd_info *mtd,
-						  struct nand_chip *chip,
-						  const uint8_t *buf);
-	int			(*read_page)(struct mtd_info *mtd,
-					     struct nand_chip *chip,
-					     uint8_t *buf, int page);
-	int			(*read_subpage)(struct mtd_info *mtd,
-					     struct nand_chip *chip,
-					     uint32_t offs, uint32_t len,
-					     uint8_t *buf);
-	void			(*write_page)(struct mtd_info *mtd,
-					      struct nand_chip *chip,
-					      const uint8_t *buf);
-	int			(*read_oob)(struct mtd_info *mtd,
-					    struct nand_chip *chip,
-					    int page,
-					    int sndcmd);
-	int			(*write_oob)(struct mtd_info *mtd,
-					     struct nand_chip *chip,
-					     int page);
+	void (*hwctl)(struct mtd_info *mtd, int mode);
+	int (*calculate)(struct mtd_info *mtd, const uint8_t *dat,
+			uint8_t *ecc_code);
+	int (*correct)(struct mtd_info *mtd, uint8_t *dat, uint8_t *read_ecc,
+			uint8_t *calc_ecc);
+	int (*read_page_raw)(struct mtd_info *mtd, struct nand_chip *chip,
+			uint8_t *buf, int page);
+	void (*write_page_raw)(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf);
+	int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip,
+			uint8_t *buf, int page);
+	int (*read_subpage)(struct mtd_info *mtd, struct nand_chip *chip,
+			uint32_t offs, uint32_t len, uint8_t *buf);
+	void (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf);
+	int (*read_oob)(struct mtd_info *mtd, struct nand_chip *chip, int page,
+			int sndcmd);
+	int (*write_oob)(struct mtd_info *mtd, struct nand_chip *chip,
+			int page);
 };
 
 /**
@@ -487,62 +477,55 @@ struct nand_buffers {
  */
 
 struct nand_chip {
-	void  __iomem	*IO_ADDR_R;
-	void  __iomem	*IO_ADDR_W;
-
-	uint8_t		(*read_byte)(struct mtd_info *mtd);
-	u16		(*read_word)(struct mtd_info *mtd);
-	void		(*write_buf)(struct mtd_info *mtd, const uint8_t *buf,
-			int len);
-	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf,
-			int len);
-	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf,
-			int len);
-	void		(*select_chip)(struct mtd_info *mtd, int chip);
-	int		(*block_bad)(struct mtd_info *mtd, loff_t ofs,
-			int getchip);
-	int		(*block_markbad)(struct mtd_info *mtd, loff_t ofs);
-	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
-				    unsigned int ctrl);
-	int		(*init_size)(struct mtd_info *mtd,
-					struct nand_chip *this, u8 *id_data);
-	int		(*dev_ready)(struct mtd_info *mtd);
-	void		(*cmdfunc)(struct mtd_info *mtd, unsigned command,
-			int column, int page_addr);
-	int		(*waitfunc)(struct mtd_info *mtd,
-			struct nand_chip *this);
-	void		(*erase_cmd)(struct mtd_info *mtd, int page);
-	int		(*scan_bbt)(struct mtd_info *mtd);
-	int		(*errstat)(struct mtd_info *mtd, struct nand_chip *this,
-			int state, int status, int page);
-	int		(*write_page)(struct mtd_info *mtd,
-			struct nand_chip *chip, const uint8_t *buf, int page,
-			int cached, int raw);
-
-	int		chip_delay;
-	unsigned int	options;
-
-	int		page_shift;
-	int		phys_erase_shift;
-	int		bbt_erase_shift;
-	int		chip_shift;
-	int		numchips;
-	uint64_t	chipsize;
-	int		pagemask;
-	int		pagebuf;
-	int		subpagesize;
-	uint8_t		cellinfo;
-	int		badblockpos;
-	int		badblockbits;
-
-	int		onfi_version;
+	void __iomem *IO_ADDR_R;
+	void __iomem *IO_ADDR_W;
+
+	uint8_t (*read_byte)(struct mtd_info *mtd);
+	u16 (*read_word)(struct mtd_info *mtd);
+	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
+	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
+	int (*verify_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
+	void (*select_chip)(struct mtd_info *mtd, int chip);
+	int (*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
+	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
+	void (*cmd_ctrl)(struct mtd_info *mtd, int dat, unsigned int ctrl);
+	int (*init_size)(struct mtd_info *mtd, struct nand_chip *this,
+			u8 *id_data);
+	int (*dev_ready)(struct mtd_info *mtd);
+	void (*cmdfunc)(struct mtd_info *mtd, unsigned command, int column,
+			int page_addr);
+	int(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
+	void (*erase_cmd)(struct mtd_info *mtd, int page);
+	int (*scan_bbt)(struct mtd_info *mtd);
+	int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state,
+			int status, int page);
+	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf, int page, int cached, int raw);
+
+	int chip_delay;
+	unsigned int options;
+
+	int page_shift;
+	int phys_erase_shift;
+	int bbt_erase_shift;
+	int chip_shift;
+	int numchips;
+	uint64_t hipsize;
+	int pagemask;
+	int pagebuf;
+	int subpagesize;
+	uint8_t cellinfo;
+	int badblockpos;
+	int badblockbits;
+
+	int onfi_version;
 	struct nand_onfi_params	onfi_params;
 
-	flstate_t	state;
+	flstate_t state;
 
-	uint8_t		*oob_poi;
-	struct nand_hw_control  *controller;
-	struct nand_ecclayout	*ecclayout;
+	uint8_t *oob_poi;
+	struct nand_hw_control *controller;
+	struct nand_ecclayout *ecclayout;
 
 	struct nand_ecc_ctrl ecc;
 	struct nand_buffers *buffers;
@@ -550,13 +533,13 @@ struct nand_chip {
 
 	struct mtd_oob_ops ops;
 
-	uint8_t		*bbt;
-	struct nand_bbt_descr	*bbt_td;
-	struct nand_bbt_descr	*bbt_md;
+	uint8_t *bbt;
+	struct nand_bbt_descr *bbt_td;
+	struct nand_bbt_descr *bbt_md;
 
-	struct nand_bbt_descr	*badblock_pattern;
+	struct nand_bbt_descr *badblock_pattern;
 
-	void		*priv;
+	void *priv;
 };
 
 /*
@@ -629,17 +612,16 @@ extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
  * @priv:		hardware controller specific settings
  */
 struct platform_nand_chip {
-	int			nr_chips;
-	int			chip_offset;
-	int			nr_partitions;
-	struct mtd_partition	*partitions;
-	struct nand_ecclayout	*ecclayout;
-	int			chip_delay;
-	unsigned int		options;
-	const char		**part_probe_types;
-	void			(*set_parts)(uint64_t size,
-					struct platform_nand_chip *chip);
-	void			*priv;
+	int nr_chips;
+	int chip_offset;
+	int nr_partitions;
+	struct mtd_partition *partitions;
+	struct nand_ecclayout *ecclayout;
+	int chip_delay;
+	unsigned int options;
+	const char **part_probe_types;
+	void (*set_parts)(uint64_t size, struct platform_nand_chip *chip);
+	void *priv;
 };
 
 /* Keep gcc happy */
@@ -661,18 +643,15 @@ struct platform_device;
  * All fields are optional and depend on the hardware driver requirements
  */
 struct platform_nand_ctrl {
-	int		(*probe)(struct platform_device *pdev);
-	void		(*remove)(struct platform_device *pdev);
-	void		(*hwcontrol)(struct mtd_info *mtd, int cmd);
-	int		(*dev_ready)(struct mtd_info *mtd);
-	void		(*select_chip)(struct mtd_info *mtd, int chip);
-	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
-				    unsigned int ctrl);
-	void		(*write_buf)(struct mtd_info *mtd,
-				    const uint8_t *buf, int len);
-	void		(*read_buf)(struct mtd_info *mtd,
-				    uint8_t *buf, int len);
-	void		*priv;
+	int (*probe)(struct platform_device *pdev);
+	void (*remove)(struct platform_device *pdev);
+	void (*hwcontrol)(struct mtd_info *mtd, int cmd);
+	int (*dev_ready)(struct mtd_info *mtd);
+	void (*select_chip)(struct mtd_info *mtd, int chip);
+	void (*cmd_ctrl)(struct mtd_info *mtd, int dat, unsigned int ctrl);
+	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
+	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
+	void *priv;
 };
 
 /**
@@ -681,8 +660,8 @@ struct platform_nand_ctrl {
  * @ctrl:		controller level device structure
  */
 struct platform_nand_data {
-	struct platform_nand_chip	chip;
-	struct platform_nand_ctrl	ctrl;
+	struct platform_nand_chip chip;
+	struct platform_nand_ctrl ctrl;
 };
 
 /* Some helpers to access the data structures */
-- 
1.7.2.3
