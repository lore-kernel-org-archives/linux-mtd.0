Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJRQo-0007Cv-WF
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 18:45:41 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so11760822pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 10:45:18 -0800 (PST)
From: Jim Kuo <jimtingkuo@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 Huang Shijie <b32955@freescale.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] spi-nor: Add SFDP detect method
Date: Fri,  6 Feb 2015 02:44:05 +0800
Message-Id: <1423161845-24282-3-git-send-email-jimtingkuo@gmail.com>
In-Reply-To: <1423161845-24282-1-git-send-email-jimtingkuo@gmail.com>
References: <1423161845-24282-1-git-send-email-jimtingkuo@gmail.com>
Cc: Jim Kuo <jimtingkuo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following are the details of patch:
- Add read/write scurity register functions to support some commands.
- Add suspend/resume commands.
- Add sfdp option to Kconfig and *_detect_sfdp function to support
  some specific commands. I also rearranged the setting steps in
  func spi_nor_scan to fit the sfdp method.
- The sfdp related functions have tested with Macronix chips, so I
  also add some commands for Macronix. Such as protection region
  (security OTP) and three types of islocked/lock/unlcok functions.
- Add some definitions and data structures to spi-nor.h to support
  above modifications.
Thanks!

Signed-off-by: Jim Kuo <jimtingkuo@gmail.com>
---
 drivers/mtd/spi-nor/Kconfig   |  11 +
 drivers/mtd/spi-nor/spi-nor.c | 730 +++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h   | 201 ++++++++++++
 3 files changed, 899 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 64a4f0e..f40548b 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -21,6 +21,17 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 	  Please note that some tools/drivers/filesystems may not work with
 	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
 
+config MTD_SPI_NOR_SFDP
+	bool "Serial Flash Discoverable Parameters (SFDP) Probe"
+	default n
+	help
+	  SFDP includes the most detailed information of SPI NOR flash memory.
+	  It can be used to detect flash and get devices' parameters.
+
+	  Attention that there are many flash flags can not covered by SFDP such
+	  as SST_WRITE, USE_FSR, SPI_NOR_NO_FR and SECT_4K_PMC. Please do not
+	  enable this option if your device is highly related with these flags.
+
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
 	depends on ARCH_MXC
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a6c7337..2340ead 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -119,6 +119,25 @@ static int read_cr(struct spi_nor *nor)
 }
 
 /*
+ * Read the security register, returning its value in the location
+ * Return the security register value.
+ * Returns negative if error occurred.
+ */
+static int read_scur(struct spi_nor *nor)
+{
+	int ret;
+	u8 val;
+
+	ret = nor->read_reg(nor, SPINOR_OP_RDSCUR, &val, 1);
+	if (ret < 0) {
+		pr_err("error %d reading SCUR\n", (int) ret);
+		return ret;
+	}
+
+	return val;
+}
+
+/*
  * Dummy Cycle calculation for different type of read.
  * It can be used to support more commands with
  * different dummy cycle requirements.
@@ -147,6 +166,15 @@ static inline int write_sr(struct spi_nor *nor, u8 val)
 }
 
 /*
+ * Set LDSO bit with Write Security Register command.
+ * Returns negative if error occurred.
+ */
+static inline int write_scur(struct spi_nor *nor)
+{
+	return nor->write_reg(nor, SPINOR_OP_WRSCUR, NULL, 0, 0);
+}
+
+/*
  * Set write enable latch with Write Enable command.
  * Returns negative if error occurred.
  */
@@ -802,19 +830,12 @@ time_out:
  * FLASH_PAGESIZE chunks.  The address range may be any size provided
  * it is within the physical boundaries.
  */
-static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
-	size_t *retlen, const u_char *buf)
+static int spi_nor_do_write(struct spi_nor *nor, loff_t to, size_t len,
+			size_t *retlen, const u_char *buf)
 {
-	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	u32 page_offset, page_size, i;
 	int ret;
 
-	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
-
-	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_WRITE);
-	if (ret)
-		return ret;
-
 	write_enable(nor);
 
 	page_offset = to & (nor->page_size - 1);
@@ -835,7 +856,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			ret = spi_nor_wait_till_ready(nor);
 			if (ret)
-				goto write_err;
+				return ret;
 
 			write_enable(nor);
 
@@ -843,12 +864,416 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		}
 	}
 
-	ret = spi_nor_wait_till_ready(nor);
-write_err:
+	return 0;
+}
+
+static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
+			size_t *retlen, const u_char *buf)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_WRITE);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_do_write(nor, to, len, retlen, buf);
+	if (!ret)
+		ret = spi_nor_wait_till_ready(nor);
+
 	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
 	return ret;
 }
 
+/*
+ * Power suspend and resume.
+ */
+static int spi_nor_suspend(struct mtd_info *mtd)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	return nor->write_reg(nor, SPINOR_OP_DP, NULL, 0, 0);
+}
+
+static void spi_nor_resume(struct mtd_info *mtd)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	nor->write_reg(nor, SPINOR_OP_RDP, NULL, 0, 0);
+}
+
+/*
+ * Read/Write manufacture or user protection area (One Time Program).
+ * Enter security OTP mode before access, and exit after access.
+ * The OTP area can be locked to prevent any modification, and there
+ * is no way to unlock it.
+ */
+static int macronix_otp(struct mtd_info *mtd, loff_t addr, size_t len,
+		size_t *retlen, u_char *buf, enum spi_nor_ops ops)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	ret = spi_nor_lock_and_prep(nor, ops);
+	if (ret)
+		return ret;
+
+	/* enter security OTP */
+	ret = nor->write_reg(nor, SPINOR_OP_ENSO, NULL, 0, 0);
+	if (ret) {
+		spi_nor_unlock_and_unprep(nor, ops);
+		return ret;
+	}
+
+	if (ops == SPI_NOR_OPS_READ)
+		nor->read(nor, addr, len, retlen, buf);
+
+	else { /* ops == SPI_NOR_OPS_WRITE */
+
+		/* exit if OTP has been locked */
+		if (read_scur(nor) & 0x03) {
+			spi_nor_unlock_and_unprep(nor, ops);
+			return 0;
+		}
+		spi_nor_do_write(nor, addr, len, retlen, buf);
+	}
+
+	/* eixt security OTP */
+	nor->write_reg(nor, SPINOR_OP_EXSO, NULL, 0, 0);
+
+	spi_nor_unlock_and_unprep(nor, ops);
+	return 0;
+}
+
+static int macronix_get_fact_prot_info(struct mtd_info *mtd,
+	size_t len, size_t *retlen, struct otp_info *buf)
+{
+	/*
+	 * Factor area stores electronical serial number (ESN).
+	 * And the area can not be modified.
+	 */
+	buf->start  = 0;
+	buf->length = 0x10;
+	buf->locked = 1;
+	return 0;
+}
+
+static int macronix_read_fact_prot_reg(struct mtd_info *mtd,
+	loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	if (from < 0 || from + len > 0x10)
+		return -EINVAL;
+	return macronix_otp(mtd, from, len, retlen, buf,
+				SPI_NOR_OPS_READ);
+}
+
+static int macronix_get_user_prot_info(struct mtd_info *mtd,
+	size_t len, size_t *retlen, struct otp_info *buf)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	buf->start  = 0x10;
+	if (mtd->size > 0x800000) {
+		/* The OTP size are 0x200 if the device exceeds 8MiB. */
+		buf->length = 0x1f0;
+	} else {
+		buf->length = 0x30;
+	}
+	buf->locked = (read_scur(nor) & 0x03) ? 1 : 0;
+	return 0;
+}
+
+static int macronix_read_user_prot_reg(struct mtd_info *mtd,
+	loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+	/*
+	 * Macronix user and factor security area are the same.
+	 * If the device is larger than 8 Mbyte, it only support
+	 * factor area.
+	 */
+	if (from < 0x10 || from + len > 0x40 ||
+		(mtd->size > 0x800000 && from + len > 0x200)) {
+		return -EINVAL;
+	}
+	return macronix_otp(mtd, from, len, retlen, buf,
+				SPI_NOR_OPS_READ);
+}
+
+static int macronix_write_user_prot_reg(struct mtd_info *mtd,
+	loff_t to, size_t len, size_t *retlen, u_char *buf)
+{
+	if (to < 0x10 || to + len > 0x40 ||
+		(mtd->size > 0x800000 && to + len > 0x200)) {
+		return -EINVAL;
+	}
+	return macronix_otp(mtd, to, len, retlen, buf,
+				SPI_NOR_OPS_WRITE);
+}
+
+/*
+ * Write LDSO bit (Lock-Down Security OTP) to 1.
+ */
+static int macronix_lock_user_prot_reg(struct mtd_info *mtd,
+			loff_t from, size_t len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	if (len == 0)
+		return 0;
+
+	write_enable(nor);
+
+	return write_scur(nor);
+}
+
+/*
+ * Write protect selection command should be done before block lock.
+ */
+static int macronix_wpsel(struct spi_nor *nor)
+{
+	int retval;
+
+	/* read security register to check WPSEL status */
+	retval = read_scur(nor);
+	if (retval < 0)
+		return retval;
+	if ((u8)retval & 0x80)
+		return 0;
+
+	write_enable(nor);
+
+	return nor->write_reg(nor, SPINOR_OP_WPSEL, NULL, 0, 0);
+}
+
+static int macronix_gang_lock(struct mtd_info *mtd,
+			enum spi_nor_ops ops)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	write_enable(nor);
+
+	if (ops == SPI_NOR_OPS_LOCK)
+		return nor->write_reg(nor, SPINOR_OP_GBLK, NULL, 0, 0);
+	else /* ops == SPI_NOR_OPS_UNLOCK */
+		return nor->write_reg(nor, SPINOR_OP_GBULK, NULL, 0, 0);
+}
+
+static int macronix_read_lock_status(struct mtd_info *mtd, loff_t ofs,
+			uint64_t len, enum macronix_lock_type type)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct spi_nor_xfer_cfg cfg;
+	uint64_t end;
+	u32 move;
+	u8 status;
+	int ret;
+
+	/* do write protect selection first */
+	ret = macronix_wpsel(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_READ);
+	if (ret)
+		return ret;
+
+	if (type == MX_SBLK) {
+		cfg.cmd = SPINOR_OP_RDBLOCK;
+		cfg.addr_pins = nor->addr_width;
+	} else {
+		if (type == MX_SPB)
+			cfg.cmd = SPINOR_OP_RDSPB;
+		else /* type == MX_DPB */
+			cfg.cmd = SPINOR_OP_RDDPB;
+		cfg.addr_pins = 4;
+	}
+
+	cfg.cmd_pins = 1;
+	cfg.mode_pins = 0;
+	cfg.dummy_cycles = 0;
+
+	end = ofs + len - 1;
+
+	for (; ofs <= end && ofs < mtd->size; ofs += move) {
+		/* align the sector/blok size */
+		if (ofs < 0x10000 || ofs >= mtd->size - 0x10000)
+			move = 0x1000;
+		else
+			move = 0x10000;
+
+		cfg.addr = ofs;
+		nor->read_xfer(nor, &cfg, &status, 1);
+
+		/* status 0xff: protected, return 1 */
+		if (status == 0xff) {
+			spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
+			return 1;
+		}
+	}
+
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
+	return 0;
+}
+
+/*
+ * Macronix individual block lock. There are many types of
+ * block protection used on different flash memory.
+ * Single lock: volatile lock for E-series chips.
+ * Solid protection bit: non-volatile.
+ * Dynamic protection: volatile.
+ */
+static int macronix_block_lock(struct mtd_info *mtd, loff_t ofs,
+		uint64_t len, enum macronix_lock_type type,
+		enum spi_nor_ops ops)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct spi_nor_xfer_cfg cfg;
+	uint64_t end;
+	u32 move;
+	u8 *val, valtmp;
+	size_t datalen;
+	int ret;
+
+	/* do write protect selection first */
+	ret = macronix_wpsel(nor);
+	if (ret)
+		return ret;
+
+	/* use gang command to do whole chip lock and unlock */
+	if (len == mtd->size && type != MX_SPB)
+		return macronix_gang_lock(mtd, ops);
+
+	ret = spi_nor_lock_and_prep(nor, ops);
+	if (ret)
+		return ret;
+
+	if (type == MX_DPB) {
+		cfg.cmd = SPINOR_OP_WRDPB;
+		cfg.addr_pins = 4;
+		valtmp = (ops == SPI_NOR_OPS_LOCK) ? 0xff : 0;
+		val = &valtmp;
+		datalen = 1;
+	} else {
+		if (type == MX_SBLK) {
+			cfg.cmd = (ops == SPI_NOR_OPS_LOCK) ?
+				SPINOR_OP_SBLK : SPINOR_OP_SBULK;
+			cfg.addr_pins = nor->addr_width;
+		} else { /* type == MX_SPB */
+			cfg.cmd = SPINOR_OP_WRSPB;
+			cfg.addr_pins = 4;
+		}
+		val = NULL;
+		datalen = 0;
+	}
+
+	cfg.cmd_pins = 1;
+	cfg.mode_pins = 0;
+	cfg.dummy_cycles = 0;
+	cfg.wren = 1;
+
+	/*
+	 * The lock regions of Macronix are uniform. There use
+	 * unit sector (4KB) in the first/last block, and unit
+	 * block (64KB) in middle space of chips.
+	 */
+
+	end = ofs + len - 1;
+
+	for (; ofs <= end && ofs < mtd->size; ofs += move) {
+		if (ofs < 0x10000 || ofs >= mtd->size - 0x10000)
+			move = 0x1000;
+		else
+			move = 0x10000;
+
+		cfg.addr = ofs;
+		nor->write_xfer(nor, &cfg, val, datalen);
+	}
+
+	spi_nor_unlock_and_unprep(nor, ops);
+	return 0;
+}
+
+/*
+ * Single block lock/unlock/islock command.
+ */
+static int macronix_single_lock(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_block_lock(mtd, ofs, len, MX_SBLK,
+				SPI_NOR_OPS_LOCK);
+}
+
+static int macronix_single_unlock(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_block_lock(mtd, ofs, len, MX_SBLK,
+				SPI_NOR_OPS_UNLOCK);
+}
+
+static int macronix_single_is_locked(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_read_lock_status(mtd, ofs, len, MX_SBLK);
+}
+
+/*
+ * Solid protection bit lock/unlock/islock command.
+ */
+static int macronix_solid_lock(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_block_lock(mtd, ofs, len, MX_SPB,
+				SPI_NOR_OPS_LOCK);
+}
+
+static int macronix_solid_unlock(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	int ret;
+
+	/* do write protect selection first */
+	ret = macronix_wpsel(nor);
+	if (ret)
+		return ret;
+
+	write_enable(nor);
+
+	/* erase solid bits will unlock all the blocks */
+	return nor->write_reg(nor, SPINOR_OP_ESSPB, NULL, 0, 0);
+}
+
+static int macronix_solid_is_locked(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_read_lock_status(mtd, ofs, len, MX_SPB);
+}
+
+/*
+ * Dynamic protection bit lock/unlock/islock command.
+ */
+static int macronix_dynamic_lock(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_block_lock(mtd, ofs, len, MX_DPB,
+				SPI_NOR_OPS_LOCK);
+}
+
+static int macronix_dynamic_unlock(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_block_lock(mtd, ofs, len, MX_DPB,
+				SPI_NOR_OPS_UNLOCK);
+}
+
+static int macronix_dynamic_is_locked(struct mtd_info *mtd, loff_t ofs,
+				uint64_t len)
+{
+	return macronix_read_lock_status(mtd, ofs, len, MX_DPB);
+}
+
 static int macronix_quad_enable(struct spi_nor *nor)
 {
 	int ret, val;
@@ -931,6 +1356,202 @@ static int set_quad_mode(struct spi_nor *nor, struct flash_info *info)
 	}
 }
 
+/*
+ * Read SFDP ia an fundamental but important command for doing
+ * flash scan and probe.
+ */
+static int sfdp_read(struct spi_nor *nor, loff_t from, size_t len,
+		void *buf)
+{
+	struct spi_nor_xfer_cfg cfg;
+
+	cfg.cmd = SPINOR_OP_RDSFDP;
+	cfg.cmd_pins = 1;
+	cfg.addr = from;
+	cfg.addr_pins = 3;
+	cfg.mode_pins = 0;
+	cfg.dummy_cycles = 8;
+
+	return nor->read_xfer(nor, &cfg, (u8 *)buf, len);
+}
+
+/*
+ * Setup Macronix device with sfdp parameters.
+ */
+static void macronix_detect_sfdp(struct spi_nor *nor,
+			struct sfdp_param_header *facthdr)
+{
+	struct sfdp_macronix_params mxchip;
+	struct mtd_info *mtd = nor->mtd;
+	u32 ptr, len;
+
+	/* get macronix parameters */
+	ptr = facthdr->pointer[0] + (facthdr->pointer[1] << 8) +
+			(facthdr->pointer[2] << 16);
+	len = (facthdr->length * 4/*DWORDs*/ < sizeof(mxchip)) ?
+			(facthdr->length * 4) : sizeof(mxchip);
+	if (sfdp_read(nor, ptr, len, &mxchip))
+		return;
+
+	/* security OTP support */
+	if (mxchip.protection_param & 0x0800) {
+		mtd->_get_fact_prot_info  = macronix_get_fact_prot_info;
+		mtd->_read_fact_prot_reg  = macronix_read_fact_prot_reg;
+		mtd->_get_user_prot_info  = macronix_get_user_prot_info;
+		mtd->_read_user_prot_reg  = macronix_read_user_prot_reg;
+		mtd->_write_user_prot_reg = macronix_write_user_prot_reg;
+		mtd->_lock_user_prot_reg  = macronix_lock_user_prot_reg;
+	}
+
+	/* individual block lock support */
+	if (mxchip.protection_param & 0x0001) {
+
+		switch ((mxchip.protection_param >> 2) & 0xff) {
+		case SPINOR_OP_SBLK:
+			mtd->_lock      = macronix_single_lock;
+			mtd->_unlock    = macronix_single_unlock;
+			mtd->_is_locked = macronix_single_is_locked;
+			break;
+		case SPINOR_OP_WRSPB:
+			mtd->_lock      = macronix_solid_lock;
+			mtd->_unlock    = macronix_solid_unlock;
+			mtd->_is_locked = macronix_solid_is_locked;
+			break;
+		case SPINOR_OP_WRDPB:
+			mtd->_lock      = macronix_dynamic_lock;
+			mtd->_unlock    = macronix_dynamic_unlock;
+			mtd->_is_locked = macronix_dynamic_is_locked;
+			break;
+		default:
+			pr_err("Can not find Macronix protection parameters.\n");
+			return;
+		}
+
+		if (!(mxchip.protection_param & 0x0400))
+			mtd->_unlock(mtd, 0, mtd->size);
+	}
+}
+
+/*
+ * Check if the SPI NOR is SFDP compliant, returns 1 if it is, 0 otherwise.
+ * Directly update mtd information.
+ */
+static int spi_nor_detect_sfdp(struct spi_nor *nor, enum read_mode mode)
+{
+	struct spi_nor_sfdp_params sfdp;
+	struct sfdp_jedec_params jedec;
+	struct sfdp_param_header *jedechdr = NULL, *facthdr = NULL;
+	struct mtd_info *mtd = nor->mtd;
+	struct flash_info info;
+	u32 ptr, len;
+	int i, sect;
+
+	/* get JEDEC parameters */
+	sfdp_read(nor, 0, 4/*sizeof(sfdp.signature)*/, &sfdp.signature);
+	if (sfdp.signature != SFDP_SIGNATURE)
+		return 0;
+	if (sfdp_read(nor, 4, 4, &sfdp.minor_rev))
+		return 0;
+
+	if (sfdp.num_of_param_header < 1)
+		return 0;
+
+	if (sfdp_read(nor, 8,/*sizeof(sfdp.signature) + revision + header_num*/
+		sizeof(struct sfdp_param_header)*(sfdp.num_of_param_header+1),
+			sfdp.header)) {
+		return 0;
+	}
+
+	/*
+	 * Get JEDEC and manufacture parameter header.
+	 * Attention that num_of_param_header is zero base.
+	 */
+	for (i = 0; i <= sfdp.num_of_param_header; i++) {
+		if (sfdp.header[i].id == 0)
+			jedechdr = &sfdp.header[i];
+		else if (sfdp.header[i].id != 0xFF)
+			facthdr = &sfdp.header[i];
+		if (jedechdr && facthdr)
+			break;
+	}
+	if (!jedechdr || !facthdr || jedechdr->major_rev == 0)
+		return 0;
+
+	/* read JEDEC parameters */
+	ptr = jedechdr->pointer[0] + (jedechdr->pointer[1] << 8) +
+			(jedechdr->pointer[2] << 16);
+	len = (jedechdr->length * 4/*DWORDs*/ < sizeof(jedec)) ?
+		jedechdr->length * 4 : sizeof(jedec);
+	if (sfdp_read(nor, ptr, len, &jedec))
+		return 0;
+
+	mtd->writesize = (jedec.f_param & 0x04) ? 64 : 1;
+	mtd->size = jedec.flash_density + 1;
+
+	/* max number of sector type = 4 */
+#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
+	for (sect = 0; sect < 4; sect++)
+		if (jedec.e_type[sect].size_power == 12)
+			break;
+	if (sect == 4)
+#endif
+		/* use largest sector as erase unit */
+		for (sect = 0, i = 1; i < 4; i++) {
+			if (jedec.e_type[i].size_power >
+					jedec.e_type[sect].size_power)
+				sect = i;
+		}
+
+	nor->erase_opcode = jedec.e_type[sect].opcode;
+	mtd->erasesize = (1 << jedec.e_type[sect].size_power);
+	if (nor->erase_opcode == 0xff)
+		mtd->flags |= MTD_NO_ERASE;
+
+	if (mode == SPI_NOR_QUAD && jedec.fr_support & 0x20) {
+		if (set_quad_mode(nor, &info))
+			return 0;
+		nor->flash_read = SPI_NOR_QUAD;
+	} else if (mode == SPI_NOR_DUAL && jedec.fr_support & 0x01) {
+		nor->flash_read = SPI_NOR_DUAL;
+	}
+
+	nor->addr_width = ((jedec.fr_support >> 1) & 0x03) ? 4 : 3;
+
+	/*
+	 * Most of JEDEC 1.6 parameters are no use to mtd.
+	 * They are reserved in the struct 'spi_nor_sfdp_params'
+	 * for future usage.
+	 */
+
+	if (jedechdr->major_rev > 1 || jedechdr->minor_rev >= 6) {
+		nor->page_size = 1 << ((jedec.p_param >> 4) & 0x0F);
+		mtd->writebufsize = nor->page_size;
+	}
+
+	dev_info(nor->dev, "sfdp %u.%u compliant, jedec rev %u.%u\n",
+				sfdp.major_rev, sfdp.minor_rev,
+				jedechdr->major_rev, jedechdr->minor_rev);
+
+	/*
+	 * Get the manufacture defined parameters to mtd:
+	 * protection area, lock, unlock and islock function.
+	 */
+
+	switch (facthdr->id) {
+	case CFI_MFR_MACRONIX:
+		macronix_detect_sfdp(nor, facthdr);
+		break;
+
+	case CFI_MFR_ST:
+		/* nor protection support for STmicro chips */
+		mtd->_lock = spi_nor_lock;
+		mtd->_unlock = spi_nor_unlock;
+		break;
+	}
+
+	return 1;
+}
+
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
@@ -1000,7 +1621,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	if (JEDEC_MFR(info) == CFI_MFR_ATMEL ||
 	    JEDEC_MFR(info) == CFI_MFR_INTEL ||
-	    JEDEC_MFR(info) == CFI_MFR_SST) {
+	    JEDEC_MFR(info) == CFI_MFR_SST ||
+	    JEDEC_MFR(info) == CFI_MFR_MACRONIX) {
 		write_enable(nor);
 		write_sr(nor, 0);
 	}
@@ -1008,17 +1630,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
 	mtd->type = MTD_NORFLASH;
-	mtd->writesize = 1;
 	mtd->flags = MTD_CAP_NORFLASH;
-	mtd->size = info->sector_size * info->n_sectors;
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
-
-	/* nor protection support for STmicro chips */
-	if (JEDEC_MFR(info) == CFI_MFR_ST) {
-		mtd->_lock = spi_nor_lock;
-		mtd->_unlock = spi_nor_unlock;
-	}
+	mtd->_suspend = spi_nor_suspend;
+	mtd->_resume = spi_nor_resume;
 
 	/* sst nor chips use AAI word program */
 	if (info->flags & SST_WRITE)
@@ -1029,21 +1645,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (info->flags & USE_FSR)
 		nor->flags |= SNOR_F_USE_FSR;
 
-#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
-	/* prefer "small sector" erase if possible */
-	if (info->flags & SECT_4K) {
-		nor->erase_opcode = SPINOR_OP_BE_4K;
-		mtd->erasesize = 4096;
-	} else if (info->flags & SECT_4K_PMC) {
-		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
-		mtd->erasesize = 4096;
-	} else
-#endif
-	{
-		nor->erase_opcode = SPINOR_OP_SE;
-		mtd->erasesize = info->sector_size;
-	}
-
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
@@ -1066,6 +1667,45 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (info->flags & SPI_NOR_NO_FR)
 		nor->flash_read = SPI_NOR_NORMAL;
 
+	/*
+	 * We prepare to use SFDP to replace flash info struct, but
+	 * there are many flags not covered by SFDP such as SST_WRITE,
+	 * USE_FSR, SPI_NOR_NO_FR and SECT_4K_PMC. This part still need
+	 * to be modified by each flash manufacturer. Finally, we hope
+	 * we can setup spi-nor all from SFDP.
+	 */
+
+#ifndef CONFIG_MTD_SPI_NOR_SFDP
+	if (0)
+#endif
+		/* If the chip is SFDP compliant, update the mtd info. */
+		if (spi_nor_detect_sfdp(nor, mode))
+			goto scan_done;
+
+	mtd->writesize = 1;
+	mtd->size = info->sector_size * info->n_sectors;
+
+	/* nor protection support for STmicro chips */
+	if (JEDEC_MFR(info) == CFI_MFR_ST) {
+		mtd->_lock = spi_nor_lock;
+		mtd->_unlock = spi_nor_unlock;
+	}
+
+#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
+	/* prefer "small sector" erase if possible */
+	if (info->flags & SECT_4K) {
+		nor->erase_opcode = SPINOR_OP_BE_4K;
+		mtd->erasesize = 4096;
+	} else if (info->flags & SECT_4K_PMC) {
+		nor->erase_opcode = SPINOR_OP_BE_4K_PMC;
+		mtd->erasesize = 4096;
+	} else
+#endif
+	{
+		nor->erase_opcode = SPINOR_OP_SE;
+		mtd->erasesize = info->sector_size;
+	}
+
 	/* Quad/Dual-read mode takes precedence over fast/normal */
 	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
 		ret = set_quad_mode(nor, info);
@@ -1078,6 +1718,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		nor->flash_read = SPI_NOR_DUAL;
 	}
 
+	if (info->addr_width)
+		nor->addr_width = info->addr_width;
+	else if (mtd->size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_width = 4;
+	} else {
+		nor->addr_width = 3;
+	}
+scan_done:
+
 	/* Default commands */
 	switch (nor->flash_read) {
 	case SPI_NOR_QUAD:
@@ -1099,11 +1749,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	nor->program_opcode = SPINOR_OP_PP;
 
-	if (info->addr_width)
-		nor->addr_width = info->addr_width;
-	else if (mtd->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
+	if (info->addr_width == 4) {
 		if (JEDEC_MFR(info) == CFI_MFR_AMD) {
 			/* Dedicated 4-byte command set */
 			switch (nor->flash_read) {
@@ -1126,8 +1772,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 			mtd->erasesize = info->sector_size;
 		} else
 			set_4byte(nor, info, 1);
-	} else {
-		nor->addr_width = 3;
 	}
 
 	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 63aeccf..8f8f892 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -35,6 +35,11 @@
 #define SPINOR_OP_RDID		0x9f	/* Read JEDEC ID */
 #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
+#define SPINOR_OP_WRSCUR	0x2f	/* Write security register */
+#define SPINOR_OP_RDSCUR	0x2b	/* Read security register */
+#define SPINOR_OP_SUSPEND	0xb0	/* Erase/program suspend */
+#define SPINOR_OP_RESUME	0x30	/* Erase/program resume */
+#define SPINOR_OP_RDSFDP	0x5a	/* Read SFDP */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
 #define SPINOR_OP_READ4		0x13	/* Read data bytes (low frequency) */
@@ -53,6 +58,23 @@
 #define SPINOR_OP_EN4B		0xb7	/* Enter 4-byte mode */
 #define SPINOR_OP_EX4B		0xe9	/* Exit 4-byte mode */
 
+/* Used for Macronix flashes. */
+#define SPINOR_OP_DP		0xb9	/* Deep power-down */
+#define SPINOR_OP_RDP		0xab	/* Release from deep power-down */
+#define SPINOR_OP_ENSO		0xb1	/* Enter secured OTP */
+#define SPINOR_OP_EXSO		0xc1	/* Exit secured OTP */
+#define SPINOR_OP_WPSEL		0x68	/* Write protect selection */
+#define SPINOR_OP_SBLK		0x36	/* Single block lock */
+#define SPINOR_OP_SBULK		0x39	/* Single block unlock */
+#define SPINOR_OP_GBLK		0x7e	/* Gang block lock */
+#define SPINOR_OP_GBULK		0x98	/* Gang block unlock */
+#define SPINOR_OP_RDBLOCK	0x3c	/* Read block lock status */
+#define SPINOR_OP_WRSPB		0xe3	/* Write solid protection bit */
+#define SPINOR_OP_RDSPB		0xe2	/* Read solid protection bit */
+#define SPINOR_OP_ESSPB		0xe4	/* Rease solid protection bit */
+#define SPINOR_OP_WRDPB		0xe1	/* Write dynamic protection bit */
+#define SPINOR_OP_RDDPB		0xe0	/* Write dynamic protection bit */
+
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 
@@ -80,6 +102,185 @@ enum read_mode {
 	SPI_NOR_QUAD,
 };
 
+enum macronix_lock_type {
+	MX_SBLK = 0,
+	MX_SPB,
+	MX_DPB,
+};
+
+/**
+ * struct sfdp_vendor_macronix - Macronix SFDP parameter table
+ * @vcc_supply_max_voltage:	Maximun voltage of chip
+ * @vcc_supply_min_voltage:	Minimun voltage of chip
+ * @f_param:			Macronix flash parameters:
+ *				 Bit 0: support of H/W Reset# pin
+ *				 Bit 1: support of H/W Hold# pin
+ *				 Bit 2: support of deep power down mode
+ *				 Bit 3: support of S/W Reset
+ *				 Bit 4~11: software reset instruction
+ *				 Bit 12: support of program suspend/resume
+ *				 Bit 13: support of erase suspend/resume
+ *				 Bit 15: support of wrap-around read
+ * @wrap_around_read_opcode:	Wrap around read instrction
+ * @wrap_around_read_length:	Wrap around read length
+ * @protection_param:		Protection related parameters:
+ *				 Bit 0: support of individual block lock
+ *				 Bit 1: individual lock bits
+ *				 Bit 2~9: individual block lock opcode
+ *				 Bit 10: default status of individual lock
+ *				 Bit 11: support of security OTP
+ *				 Bit 12: support of read lock
+ *				 Bit 13: support of permanent lock
+ */
+struct sfdp_macronix_params {
+	u16 vcc_supply_max_voltage;
+	u16 vcc_supply_min_voltage;
+	u16 f_param;
+	u8 wrap_around_read_opcode;
+	u8 wrap_around_read_length;
+	u16 protection_param;
+	u8 reserved[6];
+};
+
+/**
+ * struct sfdp_erase_type - SFDP erase type parameter
+ * @size_power:		Erase size (2 to the n-th power)
+ * @opcode:		Erase instruction
+ */
+struct sfdp_erase_type {
+	u8 size_power;
+	u8 opcode;
+};
+
+/**
+ * struct sfdp_jedec_params - Basic JEDEC parameters of SFDP
+ * @f_param:		JEDEC flash parameters:
+ *			 Bit 0~1: Block/sector erase size
+ *			 Bit 2: write granularity (0 - 1B, 1 - 64B)
+ *			 Bit 3~4: command of write enable
+ * @be_4k_opcode:	4KByte block/sector erase instruction
+ * @fr_support:		Fast read supports:
+ *			 Bit 0: support of fast read 1-1-2
+ *			 Bit 1~2: address width
+ *			 Bit 3: support of DTR
+ *			 Bit 4~6: support of fast read 1-2-2, 1-4-4, 1-1-4
+ * @flash_density:	Flash memory density
+ * @fr_XXX_param:	(X-X-X) Fast read parameters:
+ *			 Bit 0~4: number of dummy clocks
+ *			 Bit 5~7: number of mode clocks
+ * @fr_XXX_opcode:	(X-X-X) Fast read instruction
+ * @fr_222_444_support:	Fast read (2-2-2/4-4-4) supports:
+ *			 Bit 0: support of fast read 2-2-2
+ *			 Bit 4: support of fast read 4-4-4
+ * @erase_type:		Erase type (size & instruction)
+ * @e_param:		Erase parameters (timing):
+ *			 Bit 0~3: multiplier from typical to max erase time
+ *			 Bit 4~32: typical time of each type of erase
+ * @p_param:		Program parameters:
+ *			 Bit 0~3: multiplier from typical to max program time
+ *			 Bit 4~7: page size (2 to the n-th power)
+ *			 Bit 8~30: typical time of PP, BP and chip erase
+ * @susp_param:		Suspend/Resume parameters:
+ *			 Bit 0~7: prohibited operations during suspend
+ *			 Bit 9~30: timing defininition
+ *			 Bit 31: support of suspend/resume
+ * @p_resu_opcode:	Program resume instruction
+ * @p_susp_opcode:	Program suspend instruction
+ * @resu_opcode:	Write/Erase resume instruction
+ * @susp_opcode:	Write/Erase suspend instruction
+ * @dp_param:		Deep powerdown parameters:
+ *			 Bit 2~14: delay and SR polliong
+ *			 Bit 15~22: exit deep powerdown instruction
+ *			 Bit 23~30: enter deep powerdown instruction
+ *			 Bit 31: support of deep powerdown
+ * @fr_quad_param:	(X-4-4) Fast read parameters:
+ *			 Bit 0~8: 4-4-4 mode disable/enable sequences
+ *			 Bit 9: support of fast read 0-4-4
+ *			 Bit 10~19: 0-4-4 mode exit/entry method
+ *			 Bit 20~22: quad enable requirements (QER)
+ *			 Bit 23: HOLD or RESET disable
+ * @en4b_param:		Method of enter 4-byte address
+ * @ex4b_softreset_param: method of exit 4-byte address and software reset
+ * @sr_param:		Volatile/Non-volatile status register 1 parameters
+ */
+struct sfdp_jedec_params {
+	u8 f_param;
+	u8 be_4k_opcode;
+	u8 fr_support;
+	u8 reserved1;
+	u32 flash_density;
+
+	u8 fr_144_param;
+	u8 fr_144_opcode;
+	u8 fr_114_param;
+	u8 fr_114_opcode;
+	u8 fr_112_param;
+	u8 fr_112_opcode;
+	u8 fr_122_param;
+	u8 fr_122_opcode;
+
+	u8 fr_222_444_support;
+	u8 reserved2[5];
+	u8 fr_222_param;
+	u8 fr_222_opcode;
+	u8 reserved3[2];
+	u8 fr_444_param;
+	u8 fr_444_opcode;
+
+	struct sfdp_erase_type e_type[4];
+
+	u32 e_param;
+	u32 p_param;
+	u32 susp_param;
+	u8 p_resu_opcode;
+	u8 p_susp_opcode;
+	u8 resu_opcode;
+	u8 susp_opcode;
+	u32 dp_param;
+	u32 fr_quad_param;
+	u8 en4b_param;
+	u16 ex4b_softreset_param;
+	u8 sr_param;
+};
+
+/**
+ * struct sfdp_param_header - SFDP parameter header
+ * @id:			Parameter ID LSB (manufacture ID)
+ * @minor_rev:		Parameter table minor revision number
+ * @major_rev:		Parameter table major revision number
+ * @length:		Parameter table length (DWORDs)
+ * @pointer:		Parameter table pointer (start address)
+ * @id_reserved:	Parameter ID MSB
+ */
+struct sfdp_param_header {
+	u8 id;
+	u8 minor_rev;
+	u8 major_rev;
+	u8 length;
+	u8 pointer[3];
+	u8 id_reserved;
+};
+
+/* SFDP signature (ASCII: 'S' 'F' 'D' 'P') */
+#define SFDP_SIGNATURE		0x50444653
+
+/**
+ * struct spi_nor_sfdp_params - Serial Flash Discoverable Parameters
+ * @signature:		SFDP signature for identification
+ * @minor_rev:		SFDP minor revision number
+ * @major_rev:		SFDP major revision number
+ * @num_of_param_header: Number of parameter headers (0 indicates 1 header)
+ * @header:		Header of JEDEC or vendor's parameters
+ */
+struct spi_nor_sfdp_params {
+	u32 signature;
+	u8 minor_rev;
+	u8 major_rev;
+	u8 num_of_param_header;
+	u8 reserved0;
+	struct sfdp_param_header header[5];
+};
+
 /**
  * struct spi_nor_xfer_cfg - Structure for defining a Serial Flash transfer
  * @wren:		command for "Write Enable", or 0x00 for not required
-- 
1.9.1
