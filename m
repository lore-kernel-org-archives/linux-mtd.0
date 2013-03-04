Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYlb-0002HN-Kg
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 17:01:41 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/nand: implement user otp for Micron chips
Date: Mon,  4 Mar 2013 18:00:45 +0100
Message-Id: <1362416445-6627-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---

Notes:
    Changes since (implicit) v1, sent with
    Message-id: 1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de
    
     - move to nandchip-micron.c
       some functions defined in nand_base.c must be changed to non-static
       to make this work.
     - implement locking
     - report otp_info per block, as this is the unit that can be locked.
       I still didn't find out how to determine if a page is locked.
     - add an additional select_chip as on v3.8 (opposed to v3.6)
       nand_do_write_ops unselects the chip. (commit
       b0bb690 (mtd: remove the de-select chip code in nand_release_device()))
     - use chip->write_byte, and so depend on patch
    
    	mtd/nand: don't use {read,write}_buf for 8-bit transfers
    
       which I sent to the list.
       (Message-Id: 1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de)
     - some style fixes

 drivers/mtd/nand/Kconfig           |   7 ++
 drivers/mtd/nand/Makefile          |   2 +-
 drivers/mtd/nand/nand.h            |  13 +++
 drivers/mtd/nand/nand_base.c       |  19 ++--
 drivers/mtd/nand/nandchip-micron.c | 199 +++++++++++++++++++++++++++++++++++++
 5 files changed, 229 insertions(+), 11 deletions(-)
 create mode 100644 drivers/mtd/nand/nand.h
 create mode 100644 drivers/mtd/nand/nandchip-micron.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5819eb5..a9ded6f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -37,6 +37,13 @@ config MTD_NAND_ECC_BCH
 	  ECC codes. They are used with NAND devices requiring more than 1 bit
 	  of error correction.
 
+config MTD_NAND_OTP
+	bool "Support access to one-time programmable area of some Micron chips"
+	select HAVE_MTD_OTP
+	help
+	  This enables support for reading and writing to the OTP area of some
+	  Micron chips.
+
 config MTD_SM_COMMON
 	tristate
 	default n
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index d76d912..ca09035 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -54,4 +54,4 @@ obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
 obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
 
-nand-objs := nand_base.o nand_bbt.o
+nand-objs := nand_base.o nand_bbt.o nandchip-micron.o
diff --git a/drivers/mtd/nand/nand.h b/drivers/mtd/nand/nand.h
new file mode 100644
index 0000000..bf521c4
--- /dev/null
+++ b/drivers/mtd/nand/nand.h
@@ -0,0 +1,13 @@
+#include <linux/mtd/mtd.h>
+
+#define NOTALIGNED(x)	((x & (chip->subpagesize - 1)) != 0)
+
+int nand_get_device(struct mtd_info *mtd, int new_state);
+void nand_release_device(struct mtd_info *mtd);
+
+int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
+			    struct mtd_oob_ops *ops);
+int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
+			     struct mtd_oob_ops *ops);
+
+void nandchip_micron_init(struct mtd_info *mtd, int dev_id);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 956b499..fbfb745 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -39,7 +39,6 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-#include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
@@ -49,6 +48,8 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 
+#include "nand.h"
+
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
 	.eccbytes = 3,
@@ -93,8 +94,6 @@ static struct nand_ecclayout nand_oob_128 = {
 		 .length = 78} }
 };
 
-static int nand_get_device(struct mtd_info *mtd, int new_state);
-
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
@@ -131,7 +130,7 @@ static int check_offs_len(struct mtd_info *mtd,
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct mtd_info *mtd)
+void nand_release_device(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
 
@@ -797,8 +796,7 @@ static void panic_nand_get_device(struct nand_chip *chip,
  *
  * Get the device and lock it for exclusive access
  */
-static int
-nand_get_device(struct mtd_info *mtd, int new_state)
+int nand_get_device(struct mtd_info *mtd, int new_state)
 {
 	struct nand_chip *chip = mtd->priv;
 	spinlock_t *lock = &chip->controller->lock;
@@ -1483,7 +1481,7 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
  *
  * Internal function. Called with chip held.
  */
-static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
+int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
 	int chipnr, page, realpage, col, bytes, aligned, oob_required;
@@ -2185,8 +2183,6 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
 	return NULL;
 }
 
-#define NOTALIGNED(x)	((x & (chip->subpagesize - 1)) != 0)
-
 /**
  * nand_do_write_ops - [INTERN] NAND write with ECC
  * @mtd: MTD device structure
@@ -2195,7 +2191,7 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
  *
  * NAND write with ECC.
  */
-static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
+int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops)
 {
 	int chipnr, realpage, page, blockmask, column;
@@ -3353,6 +3349,9 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	if (*maf_id == NAND_MFR_MICRON)
+		nandchip_micron_init(mtd, *dev_id);
+
 	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
 		" %dMiB, page size: %d, OOB size: %d\n",
 		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
diff --git a/drivers/mtd/nand/nandchip-micron.c b/drivers/mtd/nand/nandchip-micron.c
new file mode 100644
index 0000000..68443e2
--- /dev/null
+++ b/drivers/mtd/nand/nandchip-micron.c
@@ -0,0 +1,199 @@
+#include <linux/types.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/flashchip.h>
+
+#include "nand.h"
+
+#define MICRON_SETFEATURE_ARRAYOP	0x90
+#define MICRON_SETFEATURE_ARRAYOP_NORMAL	((uint8_t[]){0,0,0,0})
+#define MICRON_SETFEATURE_ARRAYOP_OTP		((uint8_t[]){1,0,0,0})
+#define MICRON_SETFEATURE_ARRAYOP_OTPPROTECT	((uint8_t[]){3,0,0,0})
+
+#define MICRON_NUM_OTP_FIRSTPAGE	2
+#define MICRON_NUM_OTP_PAGES		30
+
+static int mt29f_get_user_prot_info(struct mtd_info *mtd, struct otp_info *buf,
+		size_t len)
+{
+	int i;
+
+	if (len < MICRON_NUM_OTP_PAGES * sizeof(*buf))
+		return -ENOSPC;
+
+	for (i = 0; i < MICRON_NUM_OTP_PAGES; ++i) {
+
+		buf->start = i * mtd->writesize;
+		buf->length = mtd->writesize;
+
+		/*
+		 * XXX: don't know how to find out, if a page is locked
+		 */
+		buf->locked = 0;
+
+		buf++;
+	}
+
+	return MICRON_NUM_OTP_PAGES * sizeof(*buf);
+}
+
+static int mt29f_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, uint8_t *buf)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops ops;
+	int ret;
+
+	/* Valid pages in otp are 02h-1Fh. */
+	if (from > MICRON_NUM_OTP_PAGES << chip->page_shift)
+		return -EIO;
+
+	if (from + len > MICRON_NUM_OTP_PAGES << chip->page_shift)
+		len = (MICRON_NUM_OTP_PAGES << chip->page_shift) - from;
+
+	from += MICRON_NUM_OTP_FIRSTPAGE << chip->page_shift;
+
+	/* XXX: FL_READING? */
+	nand_get_device(mtd, FL_READING);
+
+	chip->select_chip(mtd, 0);
+
+	ret = chip->onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_OTP);
+	if (ret)
+		goto out;
+
+	ops.len = len;
+	ops.datbuf = buf;
+	ops.oobbuf = NULL;
+	ops.mode = 0;
+	/*
+	 * XXX: some things in nand_do_read_ops might be wrong for OTP. e.g.
+	 * chip->pagemask, chip->pagebuf handling, caching
+	 */
+	ret = nand_do_read_ops(mtd, from, &ops);
+	*retlen = ops.retlen;
+
+	/* nand_do_read_ops deselects the chip so reselect here */
+	chip->select_chip(mtd, 0);
+
+	chip->onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_NORMAL);
+out:
+	nand_release_device(mtd);
+	return ret;
+}
+
+static int mt29f_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
+		size_t len, size_t *retlen, uint8_t *buf)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops ops;
+	int ret;
+
+	/* Valid pages in otp are 02h-1Fh. */
+	if (to > MICRON_NUM_OTP_PAGES << chip->page_shift)
+		return -EIO;
+
+	if (to + len > MICRON_NUM_OTP_PAGES << chip->page_shift)
+		len = (MICRON_NUM_OTP_PAGES << chip->page_shift) - to;
+
+	to += MICRON_NUM_OTP_FIRSTPAGE << chip->page_shift;
+
+	nand_get_device(mtd, FL_WRITING);
+
+	chip->select_chip(mtd, 0);
+
+	ret = chip->onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_OTP);
+	if (ret)
+		goto out;
+
+	ops.len = len;
+	ops.datbuf = buf;
+	ops.oobbuf = NULL;
+	ops.mode = 0;
+	/*
+	 * some things in nand_do_write_ops might be wrong for OTP. e.g.
+	 * chip->pagemask, chip->pagebuf handling
+	 */
+	ret = nand_do_write_ops(mtd, to, &ops);
+	*retlen = ops.retlen;
+
+	/* nand_do_write_ops deselects the chip so reselect here */
+	chip->select_chip(mtd, 0);
+
+	chip->onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_NORMAL);
+out:
+	nand_release_device(mtd);
+	return ret;
+}
+
+static int mt29f_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
+		size_t len)
+{
+	struct nand_chip *chip = mtd->priv;
+	int ret;
+	int i;
+
+	/* assert from and len are aligned */
+	if (NOTALIGNED(from) || NOTALIGNED(len)) {
+		pr_notice("%s: attempt to lock non page aligned data\n",
+				__func__);
+		return -EINVAL;
+	}
+
+	if (!len)
+		return 0;
+
+	if (from > MICRON_NUM_OTP_PAGES << chip->page_shift)
+		return -EINVAL;
+
+	if (from + len > MICRON_NUM_OTP_PAGES << chip->page_shift)
+		return -EINVAL;
+
+	from += MICRON_NUM_OTP_FIRSTPAGE << chip->page_shift;
+
+	nand_get_device(mtd, FL_WRITING);
+
+	chip->select_chip(mtd, 0);
+
+	ret = chip->onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_OTPPROTECT);
+	if (ret)
+		goto out;
+
+	for (i = 0; i < len << chip->page_shift; ++i) {
+		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0,
+				(from << chip->page_shift) + i);
+
+		chip->write_byte(mtd, 0);
+
+		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	}
+
+	chip->onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_NORMAL);
+out:
+	nand_release_device(mtd);
+	return ret;
+}
+
+void nandchip_micron_init(struct mtd_info *mtd, int dev_id)
+{
+	/*
+	 * OTP is available on (at least) Micron's MT29F2G{08,16}AB[AB]EA,
+	 * MT29F[48]G{08,16}AB[AB]DA, MT29F16G08AJADA having device IDs:
+	 *      0xda, 0xca, 0xaa, 0xba;
+	 *      0xdc, 0xcc, 0xac, 0xbc, 0xa3, 0xb3, 0xd3, 0xc3;
+	 *      0xd3
+	 */
+	if (IS_ENABLED(CONFIG_MTD_NAND_OTP) &&
+			((dev_id + 0x20) & 0xc0) == 0xc0 &&
+			((dev_id & 0x09) == 8 || (dev_id & 0x0f) == 3)) {
+		mtd->_get_user_prot_info = mt29f_get_user_prot_info;
+		mtd->_read_user_prot_reg = mt29f_read_user_prot_reg;
+		mtd->_write_user_prot_reg = mt29f_write_user_prot_reg;
+		mtd->_lock_user_prot_reg = mt29f_lock_user_prot_reg;
+	}
+}
-- 
1.8.2.rc2
