Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F8W4m-00023X-EI
	for linux-mtd@lists.infradead.org; Mon, 13 Feb 2006 00:16:50 -0500
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IUM00ADN1BLJ0@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 13 Feb 2006 14:16:34 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0IUM00AJ61BL9L@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 13 Feb 2006 14:16:33 +0900 (KST)
Date: Mon, 13 Feb 2006 14:16:33 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0IUM00AJ71BL9L@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: 'Jarkko Lavinen' <jarkko.lavinen@nokia.com>
Subject: [PATCH] OneNAND One-Time Programmable (OTP) support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

This patch supports OneNAND OTP operations.

We need to modify flash_otp_write program for wrigting with page aligned.
It don't break NOR implementation. please review the code.

Remain issues:
	spare area(oob) in OTP page hadling.
	1st OTP block lock support for secure boot.

Regards,
Kyungmin Park

E.g., OTP opearations

% OTP info (In OneNAND 1Gb)

Note: The block means page.

/ # /mtd-utils/flash_otp_info -u /dev/mtd1
Number of OTP user blocks on /dev/mtd1: 10
block  0:  offset = 0x0000  size = 2048 bytes  [unlocked]
block  1:  offset = 0x0800  size = 2048 bytes  [unlocked]
block  2:  offset = 0x1000  size = 2048 bytes  [unlocked]
...snip..
block  8:  offset = 0x4000  size = 2048 bytes  [unlocked]
block  9:  offset = 0x4800  size = 2048 bytes  [unlocked]

/ # /mtd-utils/flash_otp_info -f /dev/mtd1
Number of OTP user blocks on /dev/mtd1: 54
block  0:  offset = 0x5000  size = 2048 bytes  [unlocked]
block  1:  offset = 0x5800  size = 2048 bytes  [unlocked]
block  2:  offset = 0x6000  size = 2048 bytes  [unlocked]
...snip..
block 52:  offset = 0x1f000  size = 2048 bytes  [unlocked]
block 53:  offset = 0x1f800  size = 2048 bytes  [unlocked]

% OTP dump
/ # /mtd-utils/flash_otp_dump -u /dev/mtd1
OTP user data for /dev/mtd1

% OTP write
/ # /mtd-utils/flash_otp_write -u /dev/mtd1 0x3000 < /mtd-utils/watermark
Writing OTP user data on /dev/mtd1 at offset 0x3000
Wrote 2048 bytes of OTP user data

% OTP lock
/ # /mtd-utils/flash_otp_lock -u /dev/mtd1 0x0000 0x10
About to lock OTP user data on /dev/mtd1 from 0x0000 to 0x1010
Are you sure (yes|no)? yes
Done.

--

Index: drivers/mtd/mtdchar.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdchar.c,v
retrieving revision 1.79
diff -u -p -r1.79 mtdchar.c
--- drivers/mtd/mtdchar.c	6 Jan 2006 13:35:31 -0000	1.79
+++ drivers/mtd/mtdchar.c	10 Feb 2006 07:46:48 -0000
@@ -557,7 +557,7 @@ static int mtd_ioctl(struct inode *inode
 		break;
 	}
 
-#ifdef CONFIG_MTD_OTP
+#if defined(CONFIG_MTD_OTP) || defined(CONFIG_MTD_ONENAND_OTP)
 	case OTPSELECT:
 	{
 		int mode;
Index: drivers/mtd/onenand/Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/onenand/Kconfig,v
retrieving revision 1.7
diff -u -p -r1.7 Kconfig
--- drivers/mtd/onenand/Kconfig	7 Nov 2005 00:00:21 -0000	1.7
+++ drivers/mtd/onenand/Kconfig	10 Feb 2006 07:46:48 -0000
@@ -29,6 +29,20 @@ config MTD_ONENAND_GENERIC
 	help
 	  Support for OneNAND flash via platform device driver.
 
+config MTD_ONENAND_OTP
+	bool "OneNAND OTP Support"
+	depends on MTD_ONENAND
+	help
+	  One Block of the NAND Flash Array memory is reserved as
+	  a One-Time Programmable Block memory area.
+	  Also, 1st Block of NAND Flash Array can be used as OTP.
+
+	  The OTP block can be read, programmed and locked using the same
+	  operations as any other NAND Flash Array memory block.
+	  OTP block cannot be erased.
+
+	  OTP block is fully-guaranteed to be a valid block.
+
 config MTD_ONENAND_SYNC_READ
 	bool "OneNAND Sync. Burst Read Support"
 	depends on ARCH_OMAP
Index: drivers/mtd/onenand/onenand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/onenand/onenand_base.c,v
retrieving revision 1.18
diff -u -p -r1.18 onenand_base.c
--- drivers/mtd/onenand/onenand_base.c	27 Jan 2006 00:26:34 -0000	1.18
+++ drivers/mtd/onenand/onenand_base.c	10 Feb 2006 07:46:49 -0000
@@ -209,6 +209,7 @@ static int onenand_command(struct mtd_in
 
 	case ONENAND_CMD_ERASE:
 	case ONENAND_CMD_BUFFERRAM:
+	case ONENAND_CMD_OTP_ACCESS:
 		block = (int) (addr >> this->erase_shift);
 		page = -1;
 		break;
@@ -237,7 +238,7 @@ static int onenand_command(struct mtd_in
 		value = onenand_block_address(this, block);
 		this->write_word(value, this->base +
ONENAND_REG_START_ADDRESS1);
 
-		if (cmd == ONENAND_CMD_ERASE) {
+		if (cmd == ONENAND_CMD_ERASE || cmd ==
ONENAND_CMD_OTP_ACCESS) {
 			/* Select DataRAM for DDP */
 			value = onenand_bufferram_address(this, block);
 			this->write_word(value, this->base +
ONENAND_REG_START_ADDRESS2);
@@ -1414,6 +1415,171 @@ static int onenand_unlock(struct mtd_inf
 	return 0;
 }
 
+#ifdef CONFIG_MTD_ONENAND_OTP
+#define DPRINTK(format, args...)					\
+do {									\
+	printk("%s[%d]: " format "\n", __func__, __LINE__, ##args);	\
+} while (0)
+
+typedef int (*otp_op_t)(struct mtd_info *mtd, loff_t form, size_t len,
+		size_t *retlen, u_char *buf);
+
+static int do_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
+{
+	struct onenand_chip *this = mtd->priv;
+	int ret;
+
+	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
+
+	this->wait(mtd, FL_OTPING);
+
+	ret = mtd->read(mtd, from, len, retlen, buf);
+
+	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
+
+	this->wait(mtd, FL_RESETING);
+
+	return ret;
+}
+
+static int do_otp_write(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
+{
+	struct onenand_chip *this = mtd->priv;
+	unsigned char *pbuf = buf;
+	int ret;
+
+	/* Force buffer page aligned */
+	if (len < mtd->oobblock) {
+		memcpy(this->page_buf, buf, len);
+		memset(this->page_buf + len, 0xff, mtd->oobblock - len);
+		pbuf = this->page_buf;
+		len = mtd->oobblock;
+	}
+
+	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
+
+	this->wait(mtd, FL_OTPING);
+
+	ret = mtd->write(mtd, from, len, retlen, pbuf);
+
+	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
+
+	this->wait(mtd, FL_RESETING);
+
+	return ret;
+}
+
+static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
+			size_t *retlen, u_char *buf,
+			otp_op_t action, int mode)
+{
+	struct onenand_chip *this = mtd->priv;
+	int otp_pages;
+	int density;
+	int ret = 0;
+
+	*retlen = 0;
+
+	density = this->device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
+	if (density < ONENAND_DEVICE_DENSITY_512Mb)
+		otp_pages = 20;
+	else
+		otp_pages = 10;
+
+	if (mode == MTD_OTP_FACTORY) {
+		from += mtd->oobblock * otp_pages;
+		otp_pages = 64 - otp_pages;
+	}
+
+	/* Check User/Factory boundary */
+	if (((mtd->oobblock * otp_pages) - (from + len)) < 0)
+		return 0;
+
+	while (len > 0 && otp_pages > 0) {
+		if (!action) {	/* OTP Info functions */
+			struct otp_info *otpinfo;
+
+			len -= sizeof(struct otp_info);
+			if (len <= 0)
+				return -ENOSPC;
+
+			otpinfo = (struct otp_info *) buf;
+			otpinfo->start = from;
+			otpinfo->length = mtd->oobblock;
+			otpinfo->locked = 0;
+
+			from += mtd->oobblock;
+			buf += sizeof(struct otp_info);
+			*retlen += sizeof(struct otp_info);
+		} else {
+			size_t tmp_retlen;
+			int size = len;
+
+			ret = action(mtd, from, len, &tmp_retlen, buf);
+
+			buf += size;
+			len -= size;
+			*retlen += size;
+
+			if (ret < 0)
+				return ret;
+		}
+		otp_pages--;
+	}
+
+	return 0;
+}
+
+static int onenand_get_fact_prot_info(struct mtd_info *mtd,
+			struct otp_info *buf, size_t len)
+{
+	size_t retlen;
+	int ret;
+
+	ret = onenand_otp_walk(mtd, 0, len, &retlen, (u_char *) buf, NULL,
MTD_OTP_FACTORY);
+
+	return ret ? : retlen;
+}
+
+static int onenand_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
+			size_t len, size_t *retlen, u_char *buf)
+{
+	return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_read,
MTD_OTP_FACTORY);
+}
+
+static int onenand_get_user_prot_info(struct mtd_info *mtd,
+			struct otp_info *buf, size_t len)
+{
+	size_t retlen;
+	int ret;
+
+	ret = onenand_otp_walk(mtd, 0, len, &retlen, (u_char *) buf, NULL,
MTD_OTP_USER);
+
+	return ret ? : retlen;
+}
+
+static int onenand_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+			size_t len, size_t *retlen, u_char *buf)
+{
+	return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_read,
MTD_OTP_USER);
+}
+
+static int onenand_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
+			size_t len, size_t *retlen, u_char *buf)
+{
+	return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_write,
MTD_OTP_USER);
+}
+
+static int onenand_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
+			size_t len)
+{
+	DPRINTK();
+	return 0;
+}
+#endif
+
 /**
  * onenand_print_device_info - Print device ID
  * @param device        device ID
@@ -1657,6 +1823,14 @@ int onenand_scan(struct mtd_info *mtd, i
 	mtd->write_ecc = onenand_write_ecc;
 	mtd->read_oob = onenand_read_oob;
 	mtd->write_oob = onenand_write_oob;
+#ifdef CONFIG_MTD_ONENAND_OTP
+	mtd->get_fact_prot_info = onenand_get_fact_prot_info;
+	mtd->read_fact_prot_reg = onenand_read_fact_prot_reg;
+	mtd->get_user_prot_info = onenand_get_user_prot_info;
+	mtd->read_user_prot_reg = onenand_read_user_prot_reg;
+	mtd->write_user_prot_reg = onenand_write_user_prot_reg;
+	mtd->lock_user_prot_reg = onenand_lock_user_prot_reg;
+#endif
 	mtd->readv = NULL;
 	mtd->readv_ecc = NULL;
 	mtd->writev = onenand_writev;
Index: include/linux/mtd/onenand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/onenand.h,v
retrieving revision 1.12
diff -u -p -r1.12 onenand.h
--- include/linux/mtd/onenand.h	18 Jan 2006 15:16:40 -0000	1.12
+++ include/linux/mtd/onenand.h	10 Feb 2006 07:46:49 -0000
@@ -37,6 +37,8 @@ typedef enum {
 	FL_SYNCING,
 	FL_UNLOCKING,
 	FL_LOCKING,
+	FL_RESETING,
+	FL_OTPING,
 	FL_PM_SUSPENDED,
 } onenand_state_t;
 
Index: include/linux/mtd/onenand_regs.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/onenand_regs.h,v
retrieving revision 1.3
diff -u -p -r1.3 onenand_regs.h
--- include/linux/mtd/onenand_regs.h	18 Jan 2006 15:16:40 -0000	1.3
+++ include/linux/mtd/onenand_regs.h	10 Feb 2006 07:46:49 -0000
@@ -114,6 +114,7 @@
 #define ONENAND_CMD_LOCK_TIGHT		(0x2C)
 #define ONENAND_CMD_ERASE		(0x94)
 #define ONENAND_CMD_RESET		(0xF0)
+#define ONENAND_CMD_OTP_ACCESS		(0x65)
 #define ONENAND_CMD_READID		(0x90)
 
 /* NOTE: Those are not *REAL* commands */
Index: util/Makefile
===================================================================
RCS file: /home/cvs/mtd/util/Makefile,v
retrieving revision 1.60
diff -u -p -r1.60 Makefile
--- util/Makefile	7 Nov 2005 11:15:09 -0000	1.60
+++ util/Makefile	10 Feb 2006 07:46:49 -0000
@@ -12,7 +12,8 @@ CFLAGS := -I../include -O2 -Wall
 
 TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	mkfs.jffs ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
-	flash_otp_info flash_otp_dump mtd_debug flashcp nandwrite \
+	flash_otp_info flash_otp_dump flash_otp_write flash_otp_lock \
+	mtd_debug flashcp nandwrite \
 	jffs2dump \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
Index: util/flash_otp_write.c
===================================================================
RCS file: /home/cvs/mtd/util/flash_otp_write.c,v
retrieving revision 1.2
diff -u -p -r1.2 flash_otp_write.c
--- util/flash_otp_write.c	7 Nov 2005 11:15:10 -0000	1.2
+++ util/flash_otp_write.c	10 Feb 2006 07:46:49 -0000
@@ -17,7 +17,7 @@ int main(int argc,char *argv[])
 {
 	int fd, val, ret, size, wrote;
 	off_t offset;
-	char *p, buf[256];
+	char *p, buf[2048];
 
 	if (argc != 4 || strcmp(argv[1], "-u")) {
 		fprintf(stderr, "Usage: %s -u <device> <offset>\n",
argv[0]);
ad user OTP area.
+ */
+static int onenand_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+			size_t len, size_t *retlen, u_char *buf)
+{
+	return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_read,
MTD_OTP_USER);
+}
+
+/**
+ * onenand_write_user_prot_reg - [MTD Interface] Write user OTP area
+ * @param mtd		MTD device structure
+ * @param from		The offset to write
+ * @param len		number of bytes to write
+ * @param retlen	pointer to variable to store the number of write
bytes
+ * @param buf		the databuffer to put/get data
+ *
+ * Write user OTP area.
+ */
+static int onenand_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
+			size_t len, size_t *retlen, u_char *buf)
+{
+	return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_write,
MTD_OTP_USER);
+}
+
+/**
+ * onenand_lock_user_prot_reg - [MTD Interface] Lock user OTP area
+ * @param mtd		MTD device structure
+ * @param from		The offset to lock
+ * @param len		number of bytes to unlock
+ *
+ * Write lock mark on spare area in page 0 in OTP block 
+ */
+static int onenand_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
+			size_t len)
+{
+	unsigned char oob_buf[64];
+	size_t retlen;
+	int ret;
+
+	memset(oob_buf, 0xff, mtd->oobsize);
+	/*
+	 * Note: OTP lock operation
+	 *       OTP block : 0xXXFC
+	 *       1st block : 0xXXF3 (If chip support)
+	 *       Both      : 0xXXF0 (If chip support)
+	 */
+	oob_buf[ONENAND_OTP_LOCK_OFFSET] = 0xFC;
+
+	/*
+	 * Write lock mark to 8th word of sector0 of page0 of the spare0.
+	 * We write 16 bytes spare area instead of 2 bytes.
+	 */
+	from = 0;
+	len = 16;
+
+	ret = onenand_otp_walk(mtd, from, len, &retlen, oob_buf,
do_otp_lock, MTD_OTP_USER);
+
+	return ret ? : retlen;
+}
+#endif	/* CONFIG_MTD_ONENAND_OTP */
+
 /**
  * onenand_print_device_info - Print device ID
  * @param device        device ID
@@ -1487,13 +1787,13 @@ static int onenand_probe(struct mtd_info
 	bram_maf_id = this->read_word(this->base + ONENAND_BOOTRAM + 0x0);
 	bram_dev_id = this->read_word(this->base + ONENAND_BOOTRAM + 0x2);
 
+	/* Reset OneNAND to read default register values */
+	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);
+
 	/* Check manufacturer ID */
 	if (onenand_check_maf(bram_maf_id))
 		return -ENXIO;
 
-	/* Reset OneNAND to read default register values */
-	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);
-
 	/* Read manufacturer and device IDs from Register */
 	maf_id = this->read_word(this->base + ONENAND_REG_MANUFACTURER_ID);
 	dev_id = this->read_word(this->base + ONENAND_REG_DEVICE_ID);
@@ -1565,7 +1865,6 @@ static void onenand_resume(struct mtd_in
 				"in suspended state\n");
 }
 
-
 /**
  * onenand_scan - [OneNAND Interface] Scan for the OneNAND device
  * @param mtd		MTD device structure
@@ -1657,6 +1956,14 @@ int onenand_scan(struct mtd_info *mtd, i
 	mtd->write_ecc = onenand_write_ecc;
 	mtd->read_oob = onenand_read_oob;
 	mtd->write_oob = onenand_write_oob;
+#ifdef CONFIG_MTD_ONENAND_OTP
+	mtd->get_fact_prot_info = onenand_get_fact_prot_info;
+	mtd->read_fact_prot_reg = onenand_read_fact_prot_reg;
+	mtd->get_user_prot_info = onenand_get_user_prot_info;
+	mtd->read_user_prot_reg = onenand_read_user_prot_reg;
+	mtd->write_user_prot_reg = onenand_write_user_prot_reg;
+	mtd->lock_user_prot_reg = onenand_lock_user_prot_reg;
+#endif
 	mtd->readv = NULL;
 	mtd->readv_ecc = NULL;
 	mtd->writev = onenand_writev;
Index: include/linux/mtd/onenand.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/onenand.h,v
retrieving revision 1.12
diff -u -p -r1.12 onenand.h
--- include/linux/mtd/onenand.h	18 Jan 2006 15:16:40 -0000	1.12
+++ include/linux/mtd/onenand.h	13 Feb 2006 04:18:31 -0000
@@ -37,6 +37,8 @@ typedef enum {
 	FL_SYNCING,
 	FL_UNLOCKING,
 	FL_LOCKING,
+	FL_RESETING,
+	FL_OTPING,
 	FL_PM_SUSPENDED,
 } onenand_state_t;
 
Index: include/linux/mtd/onenand_regs.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/onenand_regs.h,v
retrieving revision 1.3
diff -u -p -r1.3 onenand_regs.h
--- include/linux/mtd/onenand_regs.h	18 Jan 2006 15:16:40 -0000	1.3
+++ include/linux/mtd/onenand_regs.h	13 Feb 2006 04:18:31 -0000
@@ -114,6 +114,7 @@
 #define ONENAND_CMD_LOCK_TIGHT		(0x2C)
 #define ONENAND_CMD_ERASE		(0x94)
 #define ONENAND_CMD_RESET		(0xF0)
+#define ONENAND_CMD_OTP_ACCESS		(0x65)
 #define ONENAND_CMD_READID		(0x90)
 
 /* NOTE: Those are not *REAL* commands */
@@ -154,6 +155,8 @@
 #define ONENAND_CTRL_ERASE		(1 << 11)
 #define ONENAND_CTRL_ERROR		(1 << 10)
 #define ONENAND_CTRL_RSTB		(1 << 7)
+#define ONENAND_CTRL_OTP_L		(1 << 6)
+#define ONENAND_CTRL_OTP_BL		(1 << 5)
 
 /*
  * Interrupt Status Register F241h (R)
@@ -179,4 +182,9 @@
 #define ONENAND_ECC_2BIT		(1 << 1)
 #define ONENAND_ECC_2BIT_ALL		(0xAAAA)
 
+/*
+ * One-Time Programmable (OTP)
+ */
+#define ONENAND_OTP_LOCK_OFFSET		(14)
+
 #endif	/* __ONENAND_REG_H */
Index: util/flash_otp_write.c
===================================================================
RCS file: /home/cvs/mtd/util/flash_otp_write.c,v
retrieving revision 1.2
diff -u -p -r1.2 flash_otp_write.c
--- util/flash_otp_write.c	7 Nov 2005 11:15:10 -0000	1.2
+++ util/flash_otp_write.c	13 Feb 2006 04:18:31 -0000
@@ -15,9 +15,10 @@
 
 int main(int argc,char *argv[])
 {
-	int fd, val, ret, size, wrote;
+	int fd, val, ret, size, wrote, len;
+	mtd_info_t mtdInfo;
 	off_t offset;
-	char *p, buf[256];
+	char *p, buf[2048];
 
 	if (argc != 4 || strcmp(argv[1], "-u")) {
 		fprintf(stderr, "Usage: %s -u <device> <offset>\n",
argv[0]);
@@ -39,6 +40,11 @@ int main(int argc,char *argv[])
 		return errno;
 	}
 
+	if (ioctl(fd, MEMGETINFO, &mtdInfo)) {
+		perror("MEMGETINFO");
+		return errno;
+	}
+
 	offset = strtoul(argv[3], &p, 0);
 	if (argv[3][0] == 0 || *p != 0) {
 		fprintf(stderr, "%s: bad offset value\n", argv[0]);
@@ -52,14 +58,24 @@ int main(int argc,char *argv[])
 
 	printf("Writing OTP user data on %s at offset 0x%lx\n", argv[2],
offset);
 
+	if (mtdInfo.type == MTD_NANDFLASH)
+		len = mtdInfo.oobblock;
+	else
+		len = 256;
+
 	wrote = 0;
-	while ((size = read(0, buf, sizeof(buf)))) {
+	while ((size = read(0, buf, len))) {
 		if (size < 0) {
 			perror("read()");
 			return errno;
 		}
 		p = buf;
 		while (size > 0) {
+			if (mtdInfo.type == MTD_NANDFLASH) {
+				/* Fill remain buffers with 0xff */
+				memset(buf + size, 0xff, mtdInfo.oobblock -
size);
+				size = mtdInfo.oobblock;
+			}
 			ret = write(fd, p, size);
 			if (ret < 0) {
 				perror("write()");
