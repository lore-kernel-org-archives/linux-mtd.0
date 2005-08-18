Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E5fa5-0004nS-IT
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 04:17:03 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILE004M5SBOZX@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 17:16:36 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILE00C3ZSBNBO@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 18 Aug 2005 17:16:35 +0900 (KST)
Date: Thu, 18 Aug 2005 17:16:36 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0ILE00C40SBNBO@mmp1.samsung.com>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_MgkzOMYLnFF7/z73I2P87g)"
Cc: 'Thomas Gleixner' <tglx@linutronix.de>
Subject: [PATCH] OneNAND: Simple Bad Block handling support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--Boundary_(ID_MgkzOMYLnFF7/z73I2P87g)
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT

Hi

As I mentioned before we want to use another bad block handling method.

But now we have to push OneNAND to official MTD not experimental
so I implement simple bad block table (BBT) routine
It's almost same as NAND does.
After merge. we have to split BBT into core and chip specific code.
As the first step, I add bad block header file (bbm.h). It has bad block
data structure, macro and etc.
I don't know which directory are used as bbt_core.c(?) location?

Please let me know how to use as official OneNAND MTD support and when?

Any comments are welcome.

Thank you.

Kyungmin Park

--Boundary_(ID_MgkzOMYLnFF7/z73I2P87g)
Content-type: application/octet-stream; name=onenand-bbm.patch
Content-transfer-encoding: quoted-printable
Content-disposition: attachment; filename=onenand-bbm.patch

diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile=0A=
--- a/drivers/mtd/onenand/Makefile=0A=
+++ b/drivers/mtd/onenand/Makefile=0A=
@@ -3,7 +3,9 @@=0A=
 #=0A=
 =0A=
 # Core functionality.=0A=
-obj-$(CONFIG_MTD_ONENAND)		+=3D onenand_base.o=0A=
+obj-$(CONFIG_MTD_ONENAND)		+=3D onenand.o=0A=
 =0A=
 # Board specific.=0A=
 obj-$(CONFIG_MTD_ONENAND_OMAP)		+=3D omap-onenand.o=0A=
+=0A=
+onenand-objs =3D onenand_base.o onenand_bbt.o=0A=
diff --git a/drivers/mtd/onenand/onenand_base.c =
b/drivers/mtd/onenand/onenand_base.c=0A=
--- a/drivers/mtd/onenand/onenand_base.c=0A=
+++ b/drivers/mtd/onenand/onenand_base.c=0A=
@@ -311,19 +311,21 @@ static int onenand_wait(struct mtd_info =0A=
 	ctrl =3D this->read_word(this->base + ONENAND_REG_CTRL_STATUS);=0A=
 =0A=
 	if (ctrl & ONENAND_CTRL_ERROR) {=0A=
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =3D 0x%04x", =
ctrl);=0A=
-		return -EAGAIN;=0A=
+		/* It maybe occur at initial bad block */=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: controller error =3D =
0x%04x\n", ctrl);=0A=
+		/* Clear other interrupt bits for preventing ECC error */=0A=
+		interrupt &=3D ONENAND_INT_MASTER;=0A=
 	}=0A=
 =0A=
 	if (ctrl & ONENAND_CTRL_LOCK) {=0A=
-		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =3D 0x%04x", =
ctrl);=0A=
-		return -EIO;=0A=
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: it's locked error =3D =
0x%04x\n", ctrl);=0A=
+		return -EACCES;=0A=
 	}=0A=
 =0A=
 	if (interrupt & ONENAND_INT_READ) {=0A=
 		ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS);=0A=
 		if (ecc & ONENAND_ECC_2BIT_ALL) {=0A=
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =3D 0x%04x", ecc);=0A=
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_wait: ECC error =3D 0x%04x\n", ecc);=0A=
 			return -EBADMSG;=0A=
 		}=0A=
 	}=0A=
@@ -1060,6 +1062,25 @@ static int onenand_writev(struct mtd_inf=0A=
 }=0A=
 =0A=
 /**=0A=
+ * onenand_block_checkbad - [GENERIC] Check if a block is marked bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param ofs		offset from device start=0A=
+ * @param getchip	0, if the chip is already selected=0A=
+ * @param allowbbt	1, if its allowed to access the bbt area=0A=
+ *=0A=
+ * Check, if the block is bad. Either by reading the bad block table or=0A=
+ * calling of the scan function.=0A=
+ */=0A=
+static int onenand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int =
getchip, int allowbbt)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+=0A=
+	/* Return info from the table */=0A=
+	return bbm->isbad_bbt(mtd, ofs, allowbbt);=0A=
+}=0A=
+=0A=
+/**=0A=
  * onenand_erase - [MTD Interface] erase block(s)=0A=
  * @param mtd		MTD device structure=0A=
  * @param instr		erase instruction=0A=
@@ -1109,7 +1130,12 @@ static int onenand_erase(struct mtd_info=0A=
 =0A=
 	while (len) {=0A=
 =0A=
-		/* TODO Check badblock */=0A=
+		/* Check if we have a bad block, we do not erase bad blocks */=0A=
+		if (onenand_block_checkbad(mtd, addr, 0, 0)) {=0A=
+			printk (KERN_WARNING "onenand_erase: attempt to erase a bad block at =
addr 0x%08x\n", (unsigned int) addr);=0A=
+			instr->state =3D MTD_ERASE_FAILED;=0A=
+			goto erase_exit;=0A=
+		}=0A=
 =0A=
 		this->command(mtd, ONENAND_CMD_ERASE, addr, block_size);=0A=
 =0A=
@@ -1161,34 +1187,70 @@ static void onenand_sync(struct mtd_info=0A=
 	onenand_release_device(mtd);=0A=
 }=0A=
 =0A=
+=0A=
 /**=0A=
  * onenand_block_isbad - [MTD Interface] Check whether the block at the =
given offset is bad=0A=
  * @param mtd		MTD device structure=0A=
  * @param ofs		offset relative to mtd start=0A=
+ *=0A=
+ * Check whether the block is bad=0A=
  */=0A=
 static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)=0A=
 {=0A=
-	/*=0A=
-	 * TODO =0A=
-	 * 1. Bad block table (BBT)=0A=
-	 *   -> using NAND BBT to support JFFS2=0A=
-	 * 2. Bad block management (BBM)=0A=
-	 *   -> bad block replace scheme=0A=
-	 *=0A=
-	 * Currently we do nothing=0A=
-	 */=0A=
-	return 0;=0A=
+	/* Check for invalid offset */=0A=
+	if (ofs > mtd->size)=0A=
+		return -EINVAL;=0A=
+=0A=
+	return onenand_block_checkbad(mtd, ofs, 1, 0);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_default_block_markbad - [DEFAULT] mark a block bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param ofs		offset from device start=0A=
+ *=0A=
+ * This is the default implementation, which can be overridden by=0A=
+ * a hardware specific driver.=0A=
+ */=0A=
+static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t =
ofs)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	u_char buf[2] =3D {0, 0};=0A=
+	size_t retlen;=0A=
+	int block;=0A=
+=0A=
+	/* Get block number */=0A=
+	block =3D ((int) ofs) >> bbm->bbt_erase_shift;=0A=
+        if (bbm->bbt)=0A=
+                bbm->bbt[block >> 2] |=3D 0x01 << ((block & 0x03) << 1);=0A=
+=0A=
+        /* We write two bytes, so we dont have to mess with 16 bit =
access */=0A=
+        ofs +=3D mtd->oobsize + (bbm->badblockpos & ~0x01);=0A=
+        return mtd->write_oob(mtd, ofs , 2, &retlen, buf);=0A=
 }=0A=
 =0A=
 /**=0A=
  * onenand_block_markbad - [MTD Interface] Mark the block at the given =
offset as bad=0A=
  * @param mtd		MTD device structure=0A=
  * @param ofs		offset relative to mtd start=0A=
+ *=0A=
+ * Mark the block as bad=0A=
  */=0A=
 static int onenand_block_markbad(struct mtd_info *mtd, loff_t ofs)=0A=
 {=0A=
-	/* see above */=0A=
-	return 0;=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	int ret;=0A=
+=0A=
+	ret =3D onenand_block_isbad(mtd, ofs);=0A=
+	if (ret) {=0A=
+		/* If it was bad already, return success and do nothing */=0A=
+		if (ret > 0)=0A=
+			return 0;=0A=
+		return ret;=0A=
+	}=0A=
+=0A=
+	return this->block_markbad(mtd, ofs);=0A=
 }=0A=
 =0A=
 /**=0A=
@@ -1411,6 +1473,11 @@ int onenand_scan(struct mtd_info *mtd, i=0A=
 	if (!this->write_bufferram)=0A=
 		this->write_bufferram =3D onenand_write_bufferram;=0A=
 =0A=
+	if (!this->block_markbad)=0A=
+		this->block_markbad =3D onenand_default_block_markbad;=0A=
+	if (!this->scan_bbt)=0A=
+		this->scan_bbt =3D onenand_default_bbt;=0A=
+=0A=
 	if (onenand_probe(mtd))=0A=
 		return -ENXIO;=0A=
 =0A=
@@ -1472,7 +1539,7 @@ int onenand_scan(struct mtd_info *mtd, i=0A=
 	/* Unlock whole block */=0A=
 	mtd->unlock(mtd, 0x0, this->chipsize);=0A=
 =0A=
-	return 0;=0A=
+	return this->scan_bbt(mtd);=0A=
 }=0A=
 =0A=
 /**=0A=
diff --git a/drivers/mtd/onenand/onenand_bbt.c =
b/drivers/mtd/onenand/onenand_bbt.c=0A=
new file mode 100644=0A=
--- /dev/null=0A=
+++ b/drivers/mtd/onenand/onenand_bbt.c=0A=
@@ -0,0 +1,246 @@=0A=
+/*=0A=
+ *  linux/drivers/mtd/onenand/onenand_bbt.c=0A=
+ *=0A=
+ *  Bad Block Table support for the OneNAND driver=0A=
+ *=0A=
+ *  Copyright(c) 2005 Samsung Electronics=0A=
+ *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
+ *=0A=
+ *  Derived from nand_bbt.c=0A=
+ *=0A=
+ *  TODO:=0A=
+ *    Split BBT core and chip specific BBT.=0A=
+ */=0A=
+=0A=
+#include <linux/slab.h>=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/onenand.h>=0A=
+#include <linux/mtd/compatmac.h>=0A=
+=0A=
+/**=0A=
+ * check_short_pattern - [GENERIC] check if a pattern is in the buffer=0A=
+ * @param buf		the buffer to search=0A=
+ * @param len		the length of buffer to search=0A=
+ * @param paglen	the pagelength=0A=
+ * @param td		search pattern descriptor=0A=
+ *=0A=
+ * Check for a pattern at the given place. Used to search bad block=0A=
+ * tables and good / bad block identifiers. Same as check_pattern, but=0A=
+ * no optional empty check and the pattern is expected to start=0A=
+ * at offset 0.=0A=
+ *=0A=
+ */=0A=
+static int check_short_pattern(uint8_t *buf, int len, int paglen, =
struct nand_bbt_descr *td)=0A=
+{=0A=
+	int i;=0A=
+	uint8_t *p =3D buf;=0A=
+=0A=
+	/* Compare the pattern */=0A=
+	for (i =3D 0; i < td->len; i++) {=0A=
+		if (p[i] !=3D td->pattern[i])=0A=
+			return -1;=0A=
+	}=0A=
+        return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * create_bbt - [GENERIC] Create a bad block table by scanning the =
device=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param buf		temporary buffer=0A=
+ * @param bd		descriptor for the good/bad block search pattern=0A=
+ * @param chip		create the table for a specific chip, -1 read all chips.=0A=
+ *              Applies only if NAND_BBT_PERCHIP option is set=0A=
+ *=0A=
+ * Create a bad block table by scanning the device=0A=
+ * for the given good/bad block identify pattern=0A=
+ */=0A=
+static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct =
nand_bbt_descr *bd, int chip)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	int i, j, numblocks, len, scanlen;=0A=
+	int startblock;=0A=
+	loff_t from;=0A=
+	size_t readlen, ooblen;=0A=
+=0A=
+	printk(KERN_INFO "Scanning device for bad blocks\n");=0A=
+=0A=
+	len =3D 1;=0A=
+=0A=
+	/* We need only read few bytes from the OOB area */=0A=
+	scanlen =3D ooblen =3D 0;=0A=
+	readlen =3D bd->len;=0A=
+=0A=
+	/* chip =3D=3D -1 case only */=0A=
+	/* Note that numblocks is 2 * (real numblocks) here;=0A=
+	 * see i +=3D 2 below as it makses shifting and masking less painful=0A=
+	 */=0A=
+	numblocks =3D mtd->size >> (bbm->bbt_erase_shift - 1);=0A=
+	startblock =3D 0;=0A=
+	from =3D 0;=0A=
+=0A=
+	for (i =3D startblock; i < numblocks; ) {=0A=
+		int ret;=0A=
+=0A=
+		for (j =3D 0; j < len; j++) {=0A=
+			size_t retlen;=0A=
+=0A=
+			/* No need to read pages fully,=0A=
+			 * just read required OOB bytes */=0A=
+			ret =3D mtd->read_oob(mtd, from + j * mtd->oobblock + bd->offs,=0A=
+						readlen, &retlen, &buf[0]);=0A=
+=0A=
+			if (ret)=0A=
+				return ret;=0A=
+=0A=
+			if (check_short_pattern(&buf[j * scanlen], scanlen, mtd->oobblock, =
bd)) {=0A=
+				bbm->bbt[i >> 3] |=3D 0x03 << (i & 0x6);=0A=
+				printk(KERN_WARNING "Bad eraseblock %d at 0x%08x\n",=0A=
+					i >> 1, (unsigned int) from);=0A=
+				break;=0A=
+			}=0A=
+		}=0A=
+		i +=3D 2;=0A=
+		from +=3D (1 << bbm->bbt_erase_shift);=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+=0A=
+/**=0A=
+ * onenand_memory_bbt - [GENERIC] create a memory based bad block table=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param bd		descriptor for the good/bad block search pattern=0A=
+ *=0A=
+ * The function creates a memory based bbt by scanning the device=0A=
+ * for manufacturer / software marked good / bad blocks=0A=
+ */=0A=
+static inline int onenand_memory_bbt (struct mtd_info *mtd, struct =
nand_bbt_descr *bd)=0A=
+{=0A=
+	unsigned char data_buf[mtd->oobblock + mtd->oobsize];=0A=
+=0A=
+        bd->options &=3D ~NAND_BBT_SCANEMPTY;=0A=
+        return create_bbt(mtd, data_buf, bd, -1);=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_isbad_bbt - [OneNAND Interface] Check if a block is bad=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param offs		offset in the device=0A=
+ * @param allowbbt	allow access to bad block table region=0A=
+ */=0A=
+static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int =
allowbbt)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	int block;=0A=
+	uint8_t res;=0A=
+=0A=
+	/* Get block number * 2 */=0A=
+	block =3D (int) (offs >> (bbm->bbt_erase_shift - 1));=0A=
+	res =3D (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;=0A=
+=0A=
+	DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for offs 0x%08x: =
(block %d) 0x%02x\n",=0A=
+		(unsigned int) offs, block >> 1, res);=0A=
+=0A=
+	switch ((int) res) {=0A=
+	case 0x00:	return 0;=0A=
+	case 0x01:	return 1;=0A=
+	case 0x02:	return allowbbt ? 0 : 1;=0A=
+	}=0A=
+=0A=
+	return 1;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * onenand_scan_bbt - [OneNAND Interface] scan, find, read and maybe =
create bad block table(s)=0A=
+ * @param mtd		MTD device structure=0A=
+ * @param bd		descriptor for the good/bad block search pattern=0A=
+ *=0A=
+ * The function checks, if a bad block table(s) is/are already=0A=
+ * available. If not it scans the device for manufacturer=0A=
+ * marked good / bad blocks and writes the bad block table(s) to=0A=
+ * the selected place.=0A=
+ *=0A=
+ * The bad block table memory is allocated here. It must be freed=0A=
+ * by calling the onenand_free_bbt function.=0A=
+ *=0A=
+ */=0A=
+int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm =3D this->bbm;=0A=
+	int len, ret =3D 0;=0A=
+=0A=
+	len =3D mtd->size >> (this->erase_shift + 2);=0A=
+	/* Allocate memory (2bit per block) */=0A=
+	bbm->bbt =3D kmalloc(len, GFP_KERNEL);=0A=
+	if (!bbm->bbt) {=0A=
+		printk(KERN_ERR "onenand_scan_bbt: Out of memory\n");=0A=
+		return -ENOMEM;=0A=
+	}=0A=
+	/* Clear the memory bad block table */=0A=
+	memset(bbm->bbt, 0x00, len);=0A=
+=0A=
+	/* Set the bad block position */=0A=
+	bbm->badblockpos =3D ONENAND_BADBLOCK_POS;=0A=
+=0A=
+	/* Set erase shift */=0A=
+	bbm->bbt_erase_shift =3D this->erase_shift;=0A=
+=0A=
+	if (!bbm->isbad_bbt)=0A=
+		bbm->isbad_bbt =3D onenand_isbad_bbt;=0A=
+=0A=
+	/* Scan the device to build a memory based bad block table */=0A=
+	if ((ret =3D onenand_memory_bbt(mtd, bd))) {=0A=
+		printk(KERN_ERR "onenand_scan_bbt: Can't scan flash and build the =
RAM-based BBT\n");=0A=
+		kfree(bbm->bbt);=0A=
+		bbm->bbt =3D NULL;=0A=
+	}=0A=
+=0A=
+	return ret;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Define some generic bad / good block scan pattern which are used=0A=
+ * while scanning a device for factory marked good / bad blocks.=0A=
+ */=0A=
+static uint8_t scan_ff_pattern[] =3D { 0xff, 0xff };=0A=
+=0A=
+static struct nand_bbt_descr largepage_memorybased =3D {=0A=
+	.options =3D 0,=0A=
+	.offs =3D 0,=0A=
+	.len =3D 2,=0A=
+	.pattern =3D scan_ff_pattern,=0A=
+};=0A=
+=0A=
+/**=0A=
+ * onenand_default_bbt - [OneNAND Interface] Select a default bad block =
table for the device=0A=
+ * @param mtd		MTD device structure=0A=
+ *=0A=
+ * This function selects the default bad block table=0A=
+ * support for the device and calls the onenand_scan_bbt function=0A=
+ */=0A=
+int onenand_default_bbt(struct mtd_info *mtd)=0A=
+{=0A=
+	struct onenand_chip *this =3D mtd->priv;=0A=
+	struct bbm_info *bbm;=0A=
+=0A=
+	this->bbm =3D kmalloc(sizeof(struct bbm_info), GFP_KERNEL);=0A=
+	if (!this->bbm)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	bbm =3D this->bbm;=0A=
+=0A=
+	memset(bbm, 0, sizeof(struct bbm_info));=0A=
+=0A=
+	/* 1KB page has same configuration as 2KB page */=0A=
+	if (!bbm->badblock_pattern)=0A=
+		bbm->badblock_pattern =3D &largepage_memorybased;=0A=
+=0A=
+	return onenand_scan_bbt(mtd, bbm->badblock_pattern);=0A=
+}=0A=
+=0A=
+EXPORT_SYMBOL(onenand_scan_bbt);=0A=
+EXPORT_SYMBOL(onenand_default_bbt);=0A=
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h=0A=
new file mode 100644=0A=
--- /dev/null=0A=
+++ b/include/linux/mtd/bbm.h=0A=
@@ -0,0 +1,122 @@=0A=
+/*=0A=
+ *  linux/include/linux/mtd/bbm.h=0A=
+ *=0A=
+ *  NAND family Bad Block Management (BBM) header file=0A=
+ *    - Bad Block Table (BBT) implementation=0A=
+ *=0A=
+ *  Copyright (c) 2005 Samsung Electronics=0A=
+ *  Kyungmin Park <kyungmin.park@samsung.com>=0A=
+ *=0A=
+ *  Copyright (c) 2000-2005=0A=
+ *  Thomas Gleixner <tglx@linuxtronix.de>=0A=
+ *=0A=
+ */=0A=
+#ifndef __LINUX_MTD_BBM_H=0A=
+#define __LINUX_MTD_BBM_H=0A=
+=0A=
+/* The maximum number of NAND chips in an array */=0A=
+#define NAND_MAX_CHIPS		8=0A=
+=0A=
+/**=0A=
+ * struct nand_bbt_descr - bad block table descriptor=0A=
+ * @param options	options for this descriptor=0A=
+ * @param pages		the page(s) where we find the bbt, used with=0A=
+ * 			option BBT_ABSPAGE when bbt is searched,=0A=
+ * 			then we store the found bbts pages here.=0A=
+ *			Its an array and supports up to 8 chips now=0A=
+ * @param offs		offset of the pattern in the oob area of the page=0A=
+ * @param veroffs	offset of the bbt version counter in the oob are of =
the page=0A=
+ * @param version	version read from the bbt page during scan=0A=
+ * @param len		length of the pattern, if 0 no pattern check is performed=0A=
+ * @param maxblocks	maximum number of blocks to search for a bbt. This =
number of=0A=
+ *			blocks is reserved at the end of the device =0A=
+ *			where the tables are written.=0A=
+ * @param reserved_block_code	if non-0, this pattern denotes a reserved=0A=
+ *			(rather than bad) block in the stored bbt=0A=
+ * @param pattern	pattern to identify bad block table or factory marked=0A=
+ *			good / bad blocks, can be NULL, if len =3D 0=0A=
+ *=0A=
+ * Descriptor for the bad block table marker and the descriptor for the=0A=
+ * pattern which identifies good and bad blocks. The assumption is made=0A=
+ * that the pattern and the version count are always located in the oob =
area=0A=
+ * of the first block.=0A=
+ */=0A=
+struct nand_bbt_descr {=0A=
+	int options;=0A=
+	int pages[NAND_MAX_CHIPS];=0A=
+	int offs;=0A=
+	int veroffs;=0A=
+	uint8_t version[NAND_MAX_CHIPS];=0A=
+	int len;=0A=
+	int maxblocks;=0A=
+	int reserved_block_code;=0A=
+	uint8_t *pattern;=0A=
+};=0A=
+=0A=
+/* Options for the bad block table descriptors */=0A=
+=0A=
+/* The number of bits used per block in the bbt on the device */=0A=
+#define NAND_BBT_NRBITS_MSK	0x0000000F=0A=
+#define NAND_BBT_1BIT		0x00000001=0A=
+#define NAND_BBT_2BIT		0x00000002=0A=
+#define NAND_BBT_4BIT		0x00000004=0A=
+#define NAND_BBT_8BIT		0x00000008=0A=
+/* The bad block table is in the last good block of the device */=0A=
+#define NAND_BBT_LASTBLOCK	0x00000010=0A=
+/* The bbt is at the given page, else we must scan for the bbt */=0A=
+#define NAND_BBT_ABSPAGE	0x00000020=0A=
+/* The bbt is at the given page, else we must scan for the bbt */=0A=
+#define NAND_BBT_SEARCH		0x00000040=0A=
+/* bbt is stored per chip on multichip devices */=0A=
+#define NAND_BBT_PERCHIP	0x00000080=0A=
+/* bbt has a version counter at offset veroffs */=0A=
+#define NAND_BBT_VERSION	0x00000100=0A=
+/* Create a bbt if none axists */=0A=
+#define NAND_BBT_CREATE		0x00000200=0A=
+/* Search good / bad pattern through all pages of a block */=0A=
+#define NAND_BBT_SCANALLPAGES	0x00000400=0A=
+/* Scan block empty during good / bad block scan */=0A=
+#define NAND_BBT_SCANEMPTY	0x00000800=0A=
+/* Write bbt if neccecary */=0A=
+#define NAND_BBT_WRITE		0x00001000=0A=
+/* Read and write back block contents when writing bbt */=0A=
+#define NAND_BBT_SAVECONTENT	0x00002000=0A=
+/* Search good / bad pattern on the first and the second page */=0A=
+#define NAND_BBT_SCAN2NDPAGE	0x00004000=0A=
+=0A=
+/* The maximum number of blocks to scan for a bbt */=0A=
+#define NAND_BBT_SCAN_MAXBLOCKS	4=0A=
+=0A=
+/*=0A=
+ * Constants for oob configuration=0A=
+ */=0A=
+#define ONENAND_BADBLOCK_POS	0=0A=
+=0A=
+/**=0A=
+ * struct bbt_info - [GENERIC] Bad Block Table data structure=0A=
+ * @param bbt_erase_shift	[INTERN] number of address bits in a bbt entry=0A=
+ * @param badblockpos		[INTERN] position of the bad block marker in the =
oob area=0A=
+ * @param bbt			[INTERN] bad block table pointer=0A=
+ * @param badblock_pattern	[REPLACEABLE] bad block scan pattern used =
for initial bad block scan=0A=
+ * @param priv			[OPTIONAL] pointer to private bbm date=0A=
+ */=0A=
+struct bbm_info {=0A=
+	int bbt_erase_shift;=0A=
+	int badblockpos;=0A=
+	int options;=0A=
+=0A=
+	uint8_t *bbt;=0A=
+=0A=
+	int (*isbad_bbt)(struct mtd_info *mtd, loff_t ofs, int allowbbt);=0A=
+=0A=
+	/* TODO Add more NAND specific fileds */=0A=
+	struct nand_bbt_descr *badblock_pattern;=0A=
+=0A=
+	void *priv;=0A=
+};=0A=
+=0A=
+/* OneNAND BBT interface */=0A=
+extern int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr =
*bd);=0A=
+extern int onenand_default_bbt(struct mtd_info *mtd);=0A=
+=0A=
+#endif	/* __LINUX_MTD_BBM_H */=0A=
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h=0A=
--- a/include/linux/mtd/onenand.h=0A=
+++ b/include/linux/mtd/onenand.h=0A=
@@ -14,6 +14,7 @@=0A=
 =0A=
 #include <linux/spinlock.h>=0A=
 #include <linux/mtd/onenand_regs.h>=0A=
+#include <linux/mtd/bbm.h>=0A=
 =0A=
 #define MAX_BUFFERRAM		2=0A=
 =0A=
@@ -67,10 +68,14 @@ struct onenand_bufferram {=0A=
  * @param wait		[REPLACEABLE] hardware specific function for wait on =
ready=0A=
  * @param read_bufferram	[REPLACEABLE] hardware specific function for =
BufferRAM Area=0A=
  * @param write_bufferram	[REPLACEABLE] hardware specific function for =
BufferRAM Area=0A=
+ * @param read_word	[REPLACEABLE] hardware specific function for read =
register of OneNAND=0A=
+ * @param write_word	[REPLACEABLE] hardware specific function for write =
register of OneNAND=0A=
+ * @param scan_bbt	[REPLACEALBE] hardware specific function for scaning =
Bad block Table=0A=
  * @param chip_lock	[INTERN] spinlock used to protect access to this =
structure and the chip=0A=
  * @param wq		[INTERN] wait queue to sleep on if a OneNAND operation is =
in progress=0A=
  * @param state		[INTERN] the current state of the OneNAND device=0A=
  * @param autooob	[REPLACEABLE] the default (auto)placement scheme=0A=
+ * @param bbm		[REPLACEABLE] pointer to Bad Block Management =0A=
  * @param priv		[OPTIONAL] pointer to private chip date=0A=
  */=0A=
 struct onenand_chip {=0A=
@@ -96,6 +101,8 @@ struct onenand_chip {=0A=
 	unsigned short (*read_word)(void __iomem *addr);=0A=
 	void (*write_word)(unsigned short value, void __iomem *addr);=0A=
 	void (*mmcontrol)(struct mtd_info *mtd, int sync_read);=0A=
+	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);=0A=
+	int (*scan_bbt)(struct mtd_info *mtd);=0A=
 =0A=
 	spinlock_t		chip_lock;=0A=
 	wait_queue_head_t	wq;=0A=
@@ -103,6 +110,8 @@ struct onenand_chip {=0A=
 =0A=
 	struct nand_oobinfo	*autooob;=0A=
 =0A=
+	void 			*bbm;=0A=
+=0A=
 	void			*priv;=0A=
 };=0A=
 =0A=

--Boundary_(ID_MgkzOMYLnFF7/z73I2P87g)--
