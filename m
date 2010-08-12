Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjVPu-0004bI-Nu
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 10:53:48 +0000
Date: Thu, 12 Aug 2010 18:51:17 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v2 2/6]nand/denali: Add bad block management for MRST
Message-ID: <20100812105117.GB11634@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom 675731420dabad00dc4337c3e89613c606f52906 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 12 Aug 2010 17:56:30 +0800
Subject: [PATCH 2/6] nand/denali: Add bad block management for MRST

Denali controller in MRST uses 15bits or 8bits ECC correction
according to the size of NAND chip OOB area. Both of these two
corrections will consume most of the OOB bytes. There are no
enough bytes for MTD bad block management to use for some kind
of NAND chip.
On the other side, when use MLC NAND, OOB area is not a trust
area to store BBT.
So here design a new bad block mangement for denali controller.

Driver will scan available NAND blocks to create a memery BBT
for the first time and store it in the last 8(default) blocks.
The next time driver only need to read BBT from these blocks out
and create a memery BBT. Also add a kernel config to let user
choose how many blocks to store BBT for MRST.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/Kconfig  |   26 +++-
 drivers/mtd/nand/denali.c |  484 +++++++++++++++++++++++++++++++++++++++++=
+++-
 drivers/mtd/nand/denali.h |   16 ++
 3 files changed, 523 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8b4b67c..6aece56 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -56,7 +56,7 @@ config MTD_NAND_DENALI
         help
           Enable the driver for NAND flash on Intel Moorestown, using the
           Denali NAND controller core.
-=20
+
 config MTD_NAND_DENALI_SCRATCH_REG_ADDR
         hex "Denali NAND size scratch register address"
         default "0xFF108018"
@@ -68,6 +68,30 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
           scratch register here to enable this feature. On Intel Moorestown
           boards, the scratch register is at 0xFF108018.
=20
+choice
+	prompt "Compile for"
+	depends on MTD_NAND_DENALI
+	default MRST_NAND_CONTROLLER
+
+config MRST_NAND_CONTROLLER
+	bool "MRST NAND controller"
+	help
+
+config CE4100_NAND_CONTROLLER
+	bool "CE4100 NAND controller"
+	help
+
+endchoice
+
+config MTD_NAND_DENALI_BBT_BLKNUM
+	int "blocknums to store BBT -- MRST platform will use this"
+	default 8
+	range 2 10
+	depends on MTD_NAND_DENALI && MRST_NAND_CONTROLLER
+	help
+	  This parameter defines the blocknums which is used to store Bad
+	  Block Table.
+
 config MTD_NAND_EDB7312
 	tristate "Support for Cirrus Logic EBD7312 evaluation board"
 	depends on ARCH_EDB7312
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index dd32d04..a7d71e8 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -473,6 +473,9 @@ static void find_valid_banks(struct denali_nand_info *d=
enali)
=20
 static void detect_partition_feature(struct denali_nand_info *denali)
 {
+	void __iomem *scratch_reg;
+	int8_t shift;
+
 	/* For MRST platform, denali->fwblks represent the
 	 * number of blocks firmware is taken,
 	 * FW is in protect partition and MTD driver has no
@@ -493,6 +496,22 @@ static void detect_partition_feature(struct denali_nan=
d_info *denali)
 			denali->fwblks =3D SPECTRA_START_BLOCK;
 	} else
 		denali->fwblks =3D SPECTRA_START_BLOCK;
+
+	/* For MRST platform, denali->manageblks represent the
+	 * number of blocks firmware can manage.
+	 * */
+	scratch_reg =3D ioremap_nocache(SCRATCH_REG_ADDR, SCRATCH_REG_SIZE);
+	if (!scratch_reg)
+		dev_err(&denali->dev->dev,
+				"denali: scrach reg ioremap failed\n");
+	else {
+		shift =3D (int8_t)ioread8(scratch_reg);
+		if (shift > 0)
+			denali->manageblks =3D 1 << shift;
+		else
+			denali->manageblks =3D 0;
+		iounmap(scratch_reg);
+	}
 }
=20
 static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
@@ -546,8 +565,6 @@ static uint16_t denali_nand_timing_set(struct denali_na=
nd_info *denali)
=20
 	find_valid_banks(denali);
=20
-	detect_partition_feature(denali);
-
 	/* If the user specified to override the default timings
 	 * with a specific ONFI mode, we apply those changes here.
 	 */
@@ -1324,6 +1341,438 @@ static void denali_cmdfunc(struct mtd_info *mtd, un=
signed int cmd, int col,
 	}
 }
=20
+/**
+ * check_bbt_block: when reading the block which is contained
+ * BBT infromation, we do a check here. If reading failed, suppose
+ * device is power off during drive writing this block. So just
+ * erase this block and reture with special value.
+ *
+ * return value:
+ * 0: no error happend, read success;
+ * 1: read failed, erase success;
+ * -EIO: read failed, erase failed;
+ * other: param wrong
+ */
+static int check_bbt_block(struct mtd_info *mtd, loff_t from,
+						   uint32_t len, uint8_t *buf)
+{
+	uint32_t ret, retlen =3D 0;
+	memset(buf, 0, len);
+	ret =3D mtd->read(mtd, from, len, &retlen, buf);
+	/* If read failed, driver should erase this block
+	 * If erase failed, mark this block bad
+	 * */
+	if (ret =3D=3D -EBADMSG) {
+		/* this Block was bad for some reason
+		 * erase it right now*/
+		struct erase_info ei;
+		memset(&ei, 0, sizeof(struct erase_info));
+		ei.mtd =3D mtd;
+		ei.addr =3D from;
+		ei.len =3D mtd->erasesize;
+		ret =3D mtd->erase(mtd, &ei);
+		if (ret !=3D -EIO && ret !=3D -EINVAL)
+			ret =3D 1;
+	} else if (ret =3D=3D -EUCLEAN)
+		ret =3D 0;
+
+	return ret;
+}
+
+/*
+ * write_bbt_to_blk: write BBT information to the specified block
+ *
+ * return value:
+ * 0: no error happend, write success;
+ * 1: write failed;
+ * other: system error;
+ * */
+static int write_bbt_to_blk(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	struct denali_bbt_info *ptr =3D &denali->bbtinfo;
+	struct nand_chip *chip =3D &denali->nand;
+	struct erase_info ei;
+	struct device *dev =3D &denali->dev->dev;
+	uint32_t *bbtblk, len, blk;
+	uint8_t *buf, *bbt =3D NULL;
+	uint32_t ret, i, retlen;
+	int write_done;
+	loff_t to;
+retry:
+	if (denali->availbbtblk <=3D 0) {
+		dev_err(dev, "No available block reserved for storing BBT\n");
+		ret =3D 1;
+		return ret;
+	}
+	ptr->bbtlen =3D 4 * mtd->ecc_stats.badblocks;
+	ptr->serial++;
+	len =3D HEAD_LEN + ptr->bbtlen;
+	if (len % mtd->writesize)
+		len =3D (len / mtd->writesize + 1) * mtd->writesize;
+
+	buf =3D kzalloc(len, GFP_KERNEL);
+	if (buf =3D=3D NULL) {
+		ret =3D -ENOMEM;
+		return ret;
+	}
+
+	/* Get bad block number form memery bbt */
+	bbt =3D chip->bbt;
+	bbtblk =3D  (uint32_t *)&buf[HEAD_LEN];
+	for (i =3D 0; i < denali->totalblks / 4; i++, bbt++) {
+		blk =3D *bbt;
+		if (!blk)
+			continue;
+		if (blk & 0x03)
+			*bbtblk++ =3D i * 4;
+		if ((blk >> 2) & 0x03)
+			*bbtblk++ =3D 1 + i * 4;
+		if ((blk >> 4) & 0x03)
+			*bbtblk++ =3D 2 + i * 4;
+		if ((blk >> 6) & 0x03)
+			*bbtblk++ =3D 3 + i * 4;
+	}
+
+	/* Add BBT basic information as BBT format said
+	 * and write BBT information to specified blocks.
+	 * Each block contains the same BBT
+	 * */
+	write_done =3D 0;
+	buf[0] =3D 'B';
+	buf[1] =3D 'B';
+	buf[2] =3D 'T';
+	buf[3] =3D '0';
+	*(uint32_t *)(buf + 4) =3D ptr->bbtlen;
+	*(uint32_t *)(buf + 8) =3D ptr->serial;
+	for (i =3D denali->bbtstartblk; i < denali->totalblks; i++) {
+		/* skip Bad Block */
+		if (chip->bbt[i>>2] & (0x3<<((i&3)<<1)))
+			continue;
+		to =3D (loff_t)i * mtd->erasesize;
+		memset(&ei, 0, sizeof(struct erase_info));
+		ei.mtd =3D mtd;
+		ei.addr =3D to;
+		ei.len =3D mtd->erasesize;
+		ret =3D mtd->erase(mtd, &ei);
+		if (ret) {
+			/* If erase failed, mark this block bad
+			 * and go to top to try to write again */
+			chip->bbt[i>>2] |=3D 0x1 << ((i&3)<<1);
+			mtd->ecc_stats.badblocks++;
+			denali->availbbtblk--;
+			kfree(buf);
+			dev_info(&denali->dev->dev, "erase bbtblk failed!!"
+					"found new bad block %d", i);
+			goto retry;
+		}
+		ret =3D mtd->write(mtd, to, len, &retlen, buf);
+		if (ret || retlen !=3D len) {
+			/* If write failed, mark this block bad
+			 * and go to top to try to write again */
+			chip->bbt[i>>2] |=3D 0x1 << ((i&3)<<1);
+			mtd->ecc_stats.badblocks++;
+			denali->availbbtblk--;
+			kfree(buf);
+			dev_info(&denali->dev->dev, "write bbtblk failed!!"
+					"found new bad block %d", i);
+			goto retry;
+		}
+		write_done++;
+	}
+
+	kfree(buf);
+
+	/* If at lease one block is written successfully,
+	 * return with success*/
+	if (write_done)
+		ret =3D 0;
+	else {
+		if (denali->availbbtblk > 0)
+			BUG();
+		ret =3D 1;
+	}
+
+	return ret;
+}
+
+/*
+ * create_bbt: scan NAND and create memery bbt
+ *
+ * Driver will scan the first 3 pages in each block.
+ * The first 2 bytes in OOB area in the 3 pages will
+ * identify whether the current block is bad.
+ * */
+static int create_bbt(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	struct nand_chip *chip =3D &denali->nand;
+	struct device *dev =3D &denali->dev->dev;
+	struct mtd_oob_ops ops;
+	uint32_t startblk, endblk, i, j, pagecnt =3D 3,
+			 skip =3D denali->bbtskipbytes;
+	int checkbyte, ret =3D 0;
+	uint8_t *buf =3D NULL;
+	loff_t from =3D 0;
+
+	if (denali->manageblks =3D=3D 0) {
+		dev_err(dev, "Never be here. The whole nand"
+				" should be managed by FTL\n");
+		BUG();
+	}
+
+	/* we skip protected partition because
+	 * there is no permission for MTD driver
+	 * to access, also skip kboot part, since
+	 * this part bad block is managed by FTL
+	 * */
+	startblk =3D denali->manageblks;
+	endblk =3D denali->totalblks;
+
+	buf =3D kzalloc(mtd->oobsize, GFP_KERNEL);
+	if (buf =3D=3D NULL) {
+		ret =3D -ENOMEM;
+		return ret;
+	}
+
+	memset(&ops, 0, sizeof(struct mtd_oob_ops));
+	ops.mode =3D MTD_OOB_PLACE;
+	ops.ooblen =3D mtd->oobsize;
+	ops.oobbuf =3D buf;
+	ops.ooboffs =3D 0;
+	ops.oobretlen =3D 0;
+	ops.datbuf =3D NULL;
+	for (i =3D startblk; i < endblk; i++) {
+		from =3D (loff_t)i * mtd->erasesize;
+		for (j =3D 0; j < pagecnt; j++) {
+			ret =3D mtd->read_oob(mtd, from, &ops);
+			if (ret)
+				goto read_oob_failed;
+			for (checkbyte =3D 0;
+					checkbyte < skip;
+					checkbyte++)
+				if (ops.oobbuf[checkbyte] !=3D 0xff) {
+					chip->bbt[i>>2] |=3D 0x3 << ((i&3)<<1);
+					mtd->ecc_stats.badblocks++;
+					goto next_scan;
+				}
+			from +=3D mtd->writesize;
+		}
+next_scan:
+		continue;
+	}
+read_oob_failed:
+	kfree(buf);
+	return ret;
+}
+
+/*
+ * denali_scan_bbt - To creat a memery BBT if the BBT information
+ * is already stored in the blocks driver reserved.
+ *
+ * If NAND contains BBT information, denali_scan_bbt will create
+ * chip->bbt by reading BBT out.
+ * If NAND doesn't contain, suppose this NAND to be a new NAND.
+ *
+ * BBT is stored in the end 8(default) blocks of NAND chip. Each
+ * block contains the same BBT information. That means NAND chip
+ * contain 8 copys of a BBT information. If these blocks are all
+ * bad, driver will return with failure.
+ *
+ * Format of BBT defines below:
+ * --------------------------------------------------------------
+ * | magic    | length   | serial   | reserved  |  bad block    |
+ * | number   |          | number   |           |  number       |
+ * | (4bytes) | (4bytes) | (4bytes) | (32bytes) |  information  |
+ * --------------------------------------------------------------
+ * @ magic number is: 'B''B''T''0' to identify whether this block contains
+ * BBT information.
+ * @ length: represent the length of "bad block number information" part.
+ * @ serial number: represent the version of BBT. each time update the
+ * BBT will increase this value by 1.
+ * @ reserved: no use right now.
+ * @ bad block number information: store bad block number, each number
+ * is a 32bits value.
+ * */
+static int denali_scan_bbt(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	struct nand_chip *chip =3D &denali->nand;
+	struct denali_bbt_info *ptr =3D &denali->bbtinfo;
+	struct device *dev =3D &denali->dev->dev;
+	uint32_t len =3D denali->totalblks;
+	uint32_t serial;
+	uint64_t mtdsize;
+	uint32_t i, badblk, get_bbt =3D 0, ret =3D 0;
+	uint8_t bbt_w =3D 0,/* a flag represent whether write BBT to NAND*/
+			*buf =3D NULL;
+	loff_t from =3D 0;
+	/* let mtd know the BBT blocks
+	 * after handle BBT, resett mtd size back*/
+	mtdsize =3D mtd->size;
+	mtd->size =3D chip->numchips * chip->chipsize;
+	/* alloc 2 bit for each data block
+	 * do the same as kernel did */
+	if (len % 4)
+		len =3D len/4 + 1;
+	else
+		len =3D len/4;
+	chip->bbt =3D NULL;
+	chip->bbt =3D kzalloc(len, GFP_KERNEL);
+	if (chip->bbt =3D=3D NULL) {
+		ret =3D -ENOMEM;
+		goto failed_alloc_bbt;
+	}
+
+	/* alloc buffer
+	 * suppose the BBT size is the maximum value */
+	len =3D denali->totalblks * 4 + HEAD_LEN;
+	if (len % mtd->writesize)
+		len =3D (len/mtd->writesize + 1) * mtd->writesize;
+	buf =3D kzalloc(len, GFP_KERNEL);
+	if (buf =3D=3D NULL) {
+		ret =3D -ENOMEM;
+		goto failed_alloc_buf;
+	}
+
+	/* check whether if there is already a bbt in NAND */
+	for (i =3D denali->bbtstartblk; i < denali->totalblks; i++) {
+		from =3D (loff_t)i * mtd->erasesize;
+		ret =3D check_bbt_block(mtd, from, len, buf);
+		if (ret =3D=3D -EIO) {
+			dev_notice(dev, "bbt start block %d is BAD", i);
+			/* mark the storing BBT block to be bad */
+			chip->bbt[i>>2] |=3D 0x01 << ((i&0x03)<<1);
+			denali->availbbtblk--;
+			mtd->ecc_stats.badblocks++;
+			continue;
+		} else if (ret =3D=3D 1) {
+			dev_notice(dev, "bbt start block %d is ERASED,"
+					" start NEXT", i);
+			continue;
+		} else if (ret) {
+			dev_err(dev, "ERROR param in check_bbt_block"
+					" ret %d", ret);
+			goto failed_tail;
+		}
+		/* If read successed, store BBT basic information
+		 * If there are different serial number, the block
+		 * contained the biggest serial number must have
+		 * the latest BBT information.
+		 * so here just update BBT basice information
+		 * only if found a bigger serial number.*/
+		if (buf[0] =3D=3D 'B' && buf[1] =3D=3D 'B' &&
+				buf[2] =3D=3D 'T' && buf[3] =3D=3D '0') {
+			serial =3D *(uint32_t *)(buf + 8);
+			if (serial > ptr->serial) {
+				ptr->version =3D i;
+				ptr->bbtlen =3D *(uint32_t *)(buf + 4);
+				ptr->serial =3D serial;
+			}
+			get_bbt =3D 1;
+		}
+		memset(buf, 0, mtd->writesize);
+	}
+
+	if (denali->availbbtblk <=3D 0) {
+		/* all the blocks stored BBT are bad
+		 * driver thought this is a bad NAND chip
+		 * and return with a failure
+		 * */
+		ret =3D 1;
+		goto failed_tail;
+	}
+
+	if (get_bbt) {
+		/* Found NAND contains available BBT information
+		 * and will read it out.
+		 * needn't check because we have already checked
+		 * above*/
+		len =3D ptr->bbtlen + HEAD_LEN;
+		if (len % mtd->writesize)
+			len =3D (len/mtd->writesize + 1) * mtd->writesize;
+		from =3D (loff_t)ptr->version * mtd->erasesize;
+		check_bbt_block(mtd, from, len, buf);
+		if (ptr->serial !=3D *(uint32_t *)(buf + 8) ||
+			ptr->bbtlen !=3D *(uint32_t *)(buf + 4)) {
+			dev_err(dev, "BUG when get BBT form block %d",
+					ptr->version);
+			BUG();
+		}
+		for (i =3D HEAD_LEN; i < ptr->bbtlen + HEAD_LEN; i +=3D 4) {
+			badblk =3D *(uint32_t *)(buf + i);
+			if (!(chip->bbt[badblk >> 2] &
+					(0x3 << ((badblk & 0x3) << 1)))) {
+				chip->bbt[badblk >> 2] |=3D
+					0x03 << ((badblk & 0x3) << 1);
+				mtd->ecc_stats.badblocks++;
+			}
+		}
+	} else {
+		/* If NAND doesn't contain any BBT information,
+		 * driver create memery BBT by scaning NAND itself
+		 * */
+		ret =3D create_bbt(mtd);
+		if (ret)
+			goto failed_tail;
+		ptr->version =3D 0;
+		ptr->serial =3D 0;
+		ptr->bbtlen =3D 0;
+		bbt_w =3D 1; /* set to write BBT to NAND */
+	}
+
+	/* If found new bad block or driver scaned NAND itself,
+	 * write BBT information back to NAND
+	 * */
+	if (ptr->bbtlen < mtd->ecc_stats.badblocks * 4)
+		ret =3D write_bbt_to_blk(mtd);
+	else if (ptr->bbtlen > mtd->ecc_stats.badblocks * 4) {
+		dev_err(dev, "bbtlen can't be large than badblocks number");
+		BUG();
+	}
+
+	if (!ret) {
+		kfree(buf);
+		mtd->size =3D mtdsize;
+		return ret;
+	}
+
+failed_tail:
+	kfree(buf);
+failed_alloc_buf:
+	kfree(chip->bbt);
+failed_alloc_bbt:
+	mtd->size =3D mtdsize;
+	return ret;
+}
+
+/*
+ * denali_block_markbad: To mark a block as bad.
+ * Update memery bbt and BBT nand information
+ * */
+static int denali_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	struct nand_chip *chip =3D &denali->nand;
+	uint32_t block =3D ofs >> chip->bbt_erase_shift;
+	uint64_t mtdsize;
+	int ret =3D 0;
+	/* let mtd know the BBT blocks */
+	mtdsize =3D mtd->size;
+	mtd->size =3D chip->numchips * chip->chipsize;
+
+	chip->bbt[block >> 2] |=3D 0x01 << ((block & 0x03) << 1);
+	mtd->ecc_stats.badblocks++;
+	/* update the flash based BBT */
+	ret =3D write_bbt_to_blk(mtd);
+	if (ret)
+		mtd->ecc_stats.badblocks--;
+
+	/* after handle BBT, resett mtd size back*/
+	mtd->size =3D mtdsize;
+	return ret;
+}
+
 /* stubs for ECC functions not used by the NAND core */
 static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc_code)
@@ -1641,6 +2090,37 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 				denali->nand.phys_erase_shift;
 	denali->blksperchip =3D denali->totalblks / denali->nand.numchips;
=20
+	if (denali->platform =3D=3D INTEL_MRST) {
+		denali->bbtblks =3D BBT_BLKNUM;
+		denali->availbbtblk =3D denali->bbtblks;
+		denali->bbtstartblk =3D denali->totalblks - denali->bbtblks;
+		detect_partition_feature(denali);
+		denali->nand.bbt_td =3D NULL;
+		denali->nand.bbt_md =3D NULL;
+		denali->nand.options &=3D ~(NAND_USE_FLASH_BBT);
+		if (denali->manageblks) {
+			/* represent FW just manages a part of the whole NAND,
+			 * and the reset of the NAND need MTD driver to care,
+			 * so NAND driver need to manage BBT. BBT is hidden by
+			 * NAND driver, user can not access BBT blocks.
+			 * */
+			denali->mtd.size -=3D denali->mtd.erasesize *
+								denali->bbtblks;
+			denali->nand.options &=3D ~(NAND_SKIP_BBTSCAN);
+		}
+		/* otherwise represent FW manages the whole NAND and there must
+		 * has a FTL layer, FTL layer will manage the whole NAND,
+		 * so MTD driver needn't care the BBT
+		 * and just report the whole NAND size
+		 * in this situation, user can only use those filesystem base on
+		 * block device, e.g.ext3. NAND filesystem can't be used, e.g.
+		 * YAFFS/YAFFS2 and ubifs.
+		 * */
+		denali->nand.options |=3D NAND_NO_SUBPAGE_WRITE;
+		denali->nand.scan_bbt =3D denali_scan_bbt;
+		denali->nand.block_markbad =3D denali_block_markbad;
+	}
+
 	/* These functions are required by the NAND core framework, otherwise,
 	 * the NAND core will assert. However, we don't need them, so we'll stub
 	 * them out. */
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 3918bcb..05f7415 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -714,6 +714,7 @@
 #define LLD_MAX_FLASH_BANKS     4
=20
 #define DENALI_BUF_SIZE		(NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE)
+#define BBT_BLKNUM CONFIG_MTD_NAND_DENALI_BBT_BLKNUM
=20
 struct nand_buf {
 	int head;
@@ -724,6 +725,14 @@ struct nand_buf {
=20
 #define INTEL_CE4100	1
 #define INTEL_MRST	2
+#define HEAD_LEN 44
+
+/*denali_bbt_info: To store basic BBT information*/
+struct denali_bbt_info {
+	uint32_t version;
+	uint32_t bbtlen;
+	uint32_t serial;
+};
=20
 struct denali_nand_info {
 	struct mtd_info mtd;
@@ -748,9 +757,16 @@ struct denali_nand_info {
=20
 	uint32_t devnum;	/* represent how many nands connected */
 	uint32_t fwblks; /* represent how many blocks FW used */
+	uint32_t manageblks; /* how many blocks managed by FW */
 	uint32_t totalblks;
 	uint32_t blksperchip;
+	uint32_t bbtstartblk;
+	uint32_t bbtblks;
 	uint32_t bbtskipbytes;
+
+	/*used for BBT management*/
+	struct denali_bbt_info bbtinfo;
+	uint32_t availbbtblk; /* how many available blocks can store BBT */
 };
=20
 #endif /*_LLD_NAND_*/
--=20
1.6.6.1
