Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1corGn-0004SU-QD
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:46:26 +0000
From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rahul Bedarkar <rahul.bedarkar@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [RFC 5/6] mtd: spi-nor: add support to read/write user OTP
Date: Fri, 17 Mar 2017 18:13:55 +0530
Message-ID: <1489754636-21461-6-git-send-email-rahul.bedarkar@imgtec.com>
In-Reply-To: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Many NOR flash chips have One-Time-Programmable area a.k.a security
registers. This patch adds generic support to read/write user OTP.

OTP specific read/write methods will use interfaces read_xfer/
write_xfer. Based on manufacturer, specific details like read, write,
erase opcode can be set.

SPI_NOR_HAS_OTP flag is introduced to notify that chips has OTP area.
OTP_INFO macro is introduced to specify details of OTP which may vary
from chip to chip. OTP_INFO includes size of OTP area, number of OTP
areas/banks, starting address of OTP area and difference between
consecutive OTP banks if there are many OTP areas.

At least s25fl016k chips has three OTP areas with starting addresses
0x1000, 0x2000, 0x3000. This generic support gives user space, linear
address view of OTP rather than user specifying actual physical
addresses. That is for s25fl016k chip, linear address will be
0x000-0x2FF. Then this framework will convert it to actual physical
address while reading/writing OTP area.

_get_user_prot_info hook is likely to be specific to manufacturer as
it involves reading status register to get status of lock bits for OTP.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 278 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |  17 +++
 2 files changed, 295 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 747645c..a91fa4c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/math64.h>
 #include <linux/sizes.h>
+#include <linux/slab.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
@@ -85,6 +86,14 @@ struct flash_info {
 					 * Use dedicated 4byte address op codes
 					 * to support memory size above 128Mib.
 					 */
+#define SPI_NOR_HAS_OTP		BIT(12)	/* Flash supports OTP */
+
+	unsigned int	otp_size;	/* OTP size in bytes */
+	u16		n_otps;		/* Number of OTP banks */
+	loff_t		otp_start_addr;	/* Starting address of OTP area */
+
+	/* Difference between consecutive OTP banks if there are many */
+	loff_t		otp_addr_offset;
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -920,6 +929,12 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		.addr_width = 3,					\
 		.flags = SPI_NOR_NO_FR | SPI_S3AN,
 
+#define OTP_INFO(_otp_size, _n_otps, _otp_start_addr, _otp_addr_offset)	\
+		.otp_size = (_otp_size),				\
+		.n_otps = (_n_otps),					\
+		.otp_start_addr = (_otp_start_addr),			\
+		.otp_addr_offset = (_otp_addr_offset),
+
 /* NOTE: double check command sets and memory organization when you add
  * more nor chips.  This current list focusses on newer chips, which
  * have been converging on command sets which including JEDEC ID.
@@ -1526,6 +1541,262 @@ static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
 	return 0;
 }
 
+/*
+ * For given actual OTP address find the start address of OTP register/bank
+ */
+static inline loff_t spi_nor_otp_addr_to_start_addr(struct spi_nor *nor,
+	loff_t addr)
+{
+	loff_t last_bank_addr;
+
+	if (nor->otp_addr_offset)
+		last_bank_addr = nor->n_otps * nor->otp_addr_offset;
+	else
+		last_bank_addr = nor->otp_start_addr;
+
+	return addr & (last_bank_addr);
+}
+
+/*
+ * For given actual OTP address find the relative address from start of OTP
+ * register/bank
+ */
+static inline loff_t spi_nor_otp_addr_to_offset(struct spi_nor *nor,
+	loff_t addr)
+{
+	return addr & (nor->otp_size - 1);
+}
+
+/*
+ * For given linear OTP address find the actual OTP address
+ */
+static loff_t spi_nor_otp_offset_to_addr(struct spi_nor *nor, loff_t offset)
+{
+	int i;
+	loff_t addr = nor->otp_start_addr;
+
+	for (i = 0; i < nor->n_otps; i++) {
+		if (offset < ((i + 1) * nor->otp_size)) {
+			addr |= offset & (nor->otp_size - 1);
+			break;
+		}
+		addr += nor->otp_addr_offset;
+	}
+
+	return addr;
+}
+
+static ssize_t spi_nor_read_security_reg(struct spi_nor *nor, loff_t from,
+	size_t len, u_char *buf)
+{
+	int ret;
+	struct spi_nor_xfer_cfg cfg = {};
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_READ);
+	if (ret)
+		return ret;
+
+	cfg.cmd = nor->otp_read_opcode;
+	cfg.addr = from;
+	cfg.addr_width = nor->addr_width;
+	cfg.mode = SPI_NOR_NORMAL;
+	cfg.dummy_cycles = nor->otp_read_dummy;
+
+	ret = nor->read_xfer(nor, &cfg, buf, len);
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
+	return ret;
+}
+
+static int spi_nor_read_user_otp(struct mtd_info *mtd, loff_t from, size_t len,
+	size_t *retlen, u_char *buf)
+{
+	int i;
+	int ret;
+	loff_t end_addr, reg_offset, new_addr;
+	size_t read_len;
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	size_t total_size = nor->otp_size * nor->n_otps;
+
+	if (from < 0 || from > total_size || (from + len) > total_size)
+		return -EINVAL;
+
+	if (!len)
+		return 0;
+
+	end_addr = from + len;
+	read_len = 0;
+
+	for (i = from; i < end_addr; i += read_len) {
+		reg_offset = i & (nor->otp_size - 1);
+
+		if (reg_offset) {
+			if ((reg_offset + len) <= nor->otp_size)
+				read_len = len;
+			else
+				read_len = nor->otp_size - reg_offset;
+		} else if ((end_addr - i) < nor->otp_size)
+			read_len = end_addr - i;
+		else
+			read_len = nor->otp_size;
+
+		new_addr = spi_nor_otp_offset_to_addr(nor, i);
+
+		ret = spi_nor_read_security_reg(nor, new_addr, read_len,
+			buf + (i - from));
+		if (ret < 0)
+			return ret;
+
+		*retlen += ret;
+	}
+
+	return 0;
+}
+
+static int spi_nor_erase_security_reg(struct spi_nor *nor, loff_t offset)
+{
+	int ret;
+	struct spi_nor_xfer_cfg cfg = {};
+
+	write_enable(nor);
+
+	cfg.cmd = nor->otp_erase_opcode;
+	cfg.addr = offset;
+	cfg.addr_width = nor->addr_width;
+	cfg.mode = SPI_NOR_NORMAL;
+
+	ret = nor->write_xfer(nor, &cfg, NULL, 0);
+
+	if (ret < 0)
+		return ret;
+
+	return spi_nor_wait_till_ready(nor);
+}
+
+static ssize_t spi_nor_write_security_reg(struct spi_nor *nor, loff_t to,
+	size_t len, u_char *buf)
+{
+	int ret;
+	struct spi_nor_xfer_cfg cfg = {};
+	u8 *reg_buf;
+	ssize_t written = 0;
+
+	reg_buf = kmalloc(nor->otp_size, GFP_KERNEL);
+	if (!reg_buf)
+		return -ENOMEM;
+
+	ret = spi_nor_read_security_reg(nor,
+		spi_nor_otp_addr_to_start_addr(nor, to),
+		nor->otp_size, reg_buf);
+	if (ret < 0)
+		goto free_buf;
+
+	memcpy(reg_buf + spi_nor_otp_addr_to_offset(nor, to), buf, len);
+
+	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_WRITE);
+	if (ret)
+		goto free_buf;
+
+	ret = spi_nor_erase_security_reg(nor,
+		spi_nor_otp_addr_to_start_addr(nor, to));
+	if (ret)
+		goto unlock;
+
+	cfg.cmd = nor->otp_program_opcode;
+	cfg.addr = spi_nor_otp_addr_to_start_addr(nor, to);
+	cfg.addr_width = nor->addr_width;
+	cfg.mode = SPI_NOR_NORMAL;
+
+	write_enable(nor);
+
+	ret = nor->write_xfer(nor, &cfg, reg_buf, nor->otp_size);
+	if (ret < 0)
+		goto unlock;
+
+	written = ret;
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (!ret)
+		ret = written;
+
+unlock:
+	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_WRITE);
+free_buf:
+	kfree(reg_buf);
+
+	return ret;
+}
+
+static int spi_nor_write_user_otp(struct mtd_info *mtd, loff_t to, size_t len,
+	size_t *retlen, u_char *buf)
+{
+	int ret;
+	int i;
+	loff_t end_addr, reg_offset, new_addr;
+	size_t write_len;
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	size_t total_size = nor->otp_size * nor->n_otps;
+
+	if (to < 0 || to > total_size || (to + len) > total_size)
+		return -EINVAL;
+
+	if (!len)
+		return 0;
+
+	end_addr = to + len;
+	write_len = 0;
+
+	for (i = to; i < end_addr; i += write_len) {
+		reg_offset = i & (nor->otp_size - 1);
+
+		if (reg_offset) {
+			if ((reg_offset + len) <= nor->otp_size)
+				write_len = len;
+			else
+				write_len = nor->otp_size - reg_offset;
+		} else if ((end_addr - i) < nor->otp_size)
+			write_len = end_addr - i;
+		else
+			write_len = nor->otp_size;
+
+		new_addr = spi_nor_otp_offset_to_addr(nor, i);
+
+		ret = spi_nor_write_security_reg(nor, new_addr, write_len,
+			buf + (i - to));
+		if (ret < 0)
+			return ret;
+
+		*retlen += ret;
+	}
+
+	return ret;
+}
+
+static int spi_nor_set_otp_info(struct spi_nor *nor,
+	const struct flash_info *info)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	if (!nor->read_xfer || !nor->write_xfer) {
+		dev_err(nor->dev,
+			"OTP support needs read_xfer and write_xfer hooks\n");
+		return -EINVAL;
+	}
+
+	switch (JEDEC_MFR(info)) {
+	default:
+		return -EINVAL;
+	}
+
+	nor->otp_size = info->otp_size;
+	nor->n_otps = info->n_otps;
+	nor->otp_start_addr = info->otp_start_addr;
+	nor->otp_addr_offset = info->otp_addr_offset;
+
+	mtd->_read_user_prot_reg = spi_nor_read_user_otp;
+	mtd->_write_user_prot_reg = spi_nor_write_user_otp;
+	return 0;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 {
 	const struct flash_info *info = NULL;
@@ -1728,6 +1999,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 			return ret;
 	}
 
+	if (info->flags & SPI_NOR_HAS_OTP) {
+		ret = spi_nor_set_otp_info(nor, info);
+		if (ret)
+			dev_warn(dev, "can't enable OTP support for %s\n",
+				 info->name);
+	}
+
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 64b4a54..f32b46f 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -186,6 +186,14 @@ enum spi_nor_option_flags {
  * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
  * @cfg:		used by the read_xfer/write_xfer
  * @cmd_buf:		used by the write_reg
+ * @otp_size:		size of OTP bank in bytes
+ * @n_otps:		number of OTP banks
+ * @otp_start_addr:	starting address of OTP
+ * @otp_addr_offset:	difference between consecutive OTP banks
+ * @otp_erase_opcode:	the opcode for erasing a OTP bank
+ * @otp_read_opcode:	the read opcode for OTP
+ * @otp_program_opcode:	the program opcode for OTP
+ * @otp_read_dummy:	the dummy needed by the read operation for OTP
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
  * @unprepare:		[OPTIONAL] do some post work after the
@@ -220,6 +228,15 @@ struct spi_nor {
 	u32			flags;
 	struct spi_nor_xfer_cfg	cfg;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
+	unsigned int		otp_size;
+	u16			n_otps;
+	loff_t			otp_start_addr;
+	loff_t			otp_addr_offset;
+	u8			otp_erase_opcode;
+	u8			otp_read_opcode;
+	u8			otp_program_opcode;
+	u8			otp_read_dummy;
+
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-- 
2.6.2
