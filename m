Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwX4b-0007he-J3
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 13:03:33 +0000
From: Caizhiyong <caizhiyong@hisilicon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd: nand: remove NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE
Date: Fri, 27 Dec 2013 13:02:27 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F25E480B4@SZXEMA512-MBX.china.huawei.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, Rashika Kheria <rashika.kheria@gmail.com>,
 "Gupta, Pekon" <pekon@ti.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cai Zhiyong <caizhiyong@huawei.com>
Date: Fri, 27 Dec 2013 20:23:09 +0800
Subject: [PATCH] mtd: nand: remove NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE

remove NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE, dynamic allocate
NAND buffer after detecting NAND writesize and oobsize.

 - save memory. when use MACRO allocate static buffer, use a small
   page size NAND chip, the buffer is still 8k, the memory is wasted.

 - reduce maintenance. NAND chip pagesize and oobsize update frequently,
   allocate buffer according to the detecting size will reduce maintenance.

 - this fix was suggested by Brian Norris [computersforpeace@gmail.com]
                         and Huang Shijie [b32955@freescale.com]

Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
---
 drivers/mtd/nand/cafe_nand.c           | 15 +++++++--
 drivers/mtd/nand/denali.c              |  9 -----
 drivers/mtd/nand/denali.h              |  2 +-
 drivers/mtd/nand/fsmc_nand.c           |  4 +--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  4 +--
 drivers/mtd/nand/mxc_nand.c            |  5 ++-
 drivers/mtd/nand/nand_base.c           | 60 ++++++++++++++++++++----------=
----
 drivers/mtd/nand/nand_bbt.c            |  2 +-
 drivers/mtd/nand/omap2.c               |  6 ++--
 include/linux/mtd/nand.h               | 17 +++-------
 10 files changed, 66 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index c34985a..c784621 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -53,6 +53,9 @@
 #define CAFE_GLOBAL_IRQ_MASK	0x300c
 #define CAFE_NAND_RESET		0x3034
=20
+#define CAFE_MAX_OOBSIZE	744
+#define CAFE_MAX_PAGESIZE	8192
+
 /* Missing from the datasheet: bit 19 of CTRL1 sets CE0 vs. CE1 */
 #define CTRL1_CHIPSELECT	(1<<19)
=20
@@ -657,13 +660,21 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err =3D -ENOMEM;
 		goto out_free_mtd;
 	}
-	cafe->dmabuf =3D dma_alloc_coherent(&cafe->pdev->dev, 2112 + sizeof(struc=
t nand_buffers),
+	cafe->dmabuf =3D dma_alloc_coherent(&cafe->pdev->dev,
+					  (2112 + CAFE_MAX_OOBSIZE * 3
+					   + CAFE_MAX_PAGESIZE),
 					  &cafe->dmaaddr, GFP_KERNEL);
 	if (!cafe->dmabuf) {
 		err =3D -ENOMEM;
 		goto out_ior;
 	}
-	cafe->nand.buffers =3D (void *)cafe->dmabuf + 2112;
+
+	cafe->nand.buffers.buffer =3D (void *)cafe->dmabuf + 2112;
+	cafe->nand.buffers.ecccalc =3D cafe->nand.buffers.buffer;
+	cafe->nand.buffers.ecccode =3D cafe->nand.buffers.ecccalc
+		+ CAFE_MAX_OOBSIZE;
+	cafe->nand.buffers.databuf =3D cafe->nand.buffers.ecccode
+		+ CAFE_MAX_OOBSIZE;
=20
 	cafe->rs =3D init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
 	if (!cafe->rs) {
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3a3a47f..e86c995 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1475,15 +1475,6 @@ int denali_init(struct denali_nand_info *denali)
 		goto failed_req_irq;
 	}
=20
-	/* MTD supported page sizes vary by kernel. We validate our
-	 * kernel supports the device here.
-	 */
-	if (denali->mtd.writesize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE) {
-		ret =3D -ENODEV;
-		pr_err("Spectra: device size not supported by this version of MTD.");
-		goto failed_req_irq;
-	}
-
 	/* support for multi nand
 	 * MTD known nothing about multi nand,
 	 * so we should tell it the real pagesize
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index cec5712..5feb466 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -455,7 +455,7 @@
=20
 #define ECC_SECTOR_SIZE     512
=20
-#define DENALI_BUF_SIZE		(NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE)
+#define DENALI_BUF_SIZE		(8192 + 744)
=20
 struct nand_buf {
 	int head;
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 8b27522..082c880 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -719,8 +719,8 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, s=
truct nand_chip *chip,
 	int eccbytes =3D chip->ecc.bytes;
 	int eccsteps =3D chip->ecc.steps;
 	uint8_t *p =3D buf;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
-	uint8_t *ecc_code =3D chip->buffers->ecccode;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
+	uint8_t *ecc_code =3D chip->buffers.ecccode;
 	int off, len, group =3D 0;
 	/*
 	 * ecc_oob is intentionally taken as uint16_t. In 16bit devices, we
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi=
-nand/gpmi-nand.c
index e2f5820..7618e71 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1298,7 +1298,7 @@ static int mx23_check_transcription_stamp(struct gpmi=
_nand_data *this)
 	unsigned int search_area_size_in_strides;
 	unsigned int stride;
 	unsigned int page;
-	uint8_t *buffer =3D chip->buffers->databuf;
+	uint8_t *buffer =3D chip->buffers.databuf;
 	int saved_chip_number;
 	int found_an_ncb_fingerprint =3D false;
=20
@@ -1357,7 +1357,7 @@ static int mx23_write_transcription_stamp(struct gpmi=
_nand_data *this)
 	unsigned int block;
 	unsigned int stride;
 	unsigned int page;
-	uint8_t      *buffer =3D chip->buffers->databuf;
+	uint8_t      *buffer =3D chip->buffers.databuf;
 	int saved_chip_number;
 	int status;
=20
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 567a5e5..5343c4f 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -137,6 +137,9 @@
=20
 #define NFC_V3_DELAY_LINE		(host->regs_ip + 0x34)
=20
+#define MXC_MAX_OOBSIZE			744
+#define MXC_MAX_PAGESIZE		8192
+
 struct mxc_nand_host;
=20
 struct mxc_nand_devtype_data {
@@ -1400,7 +1403,7 @@ static int mxcnd_probe(struct platform_device *pdev)
=20
 	/* Allocate memory for MTD device structure and private data */
 	host =3D devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host) +
-			NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE, GFP_KERNEL);
+			    MXC_MAX_PAGESIZE + MXC_MAX_OOBSIZE, GFP_KERNEL);
 	if (!host)
 		return -ENOMEM;
=20
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9b3bb3c..57c1b57a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1078,8 +1078,8 @@ static int nand_read_page_swecc(struct mtd_info *mtd,=
 struct nand_chip *chip,
 	int eccbytes =3D chip->ecc.bytes;
 	int eccsteps =3D chip->ecc.steps;
 	uint8_t *p =3D buf;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
-	uint8_t *ecc_code =3D chip->buffers->ecccode;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
+	uint8_t *ecc_code =3D chip->buffers.ecccode;
 	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
 	unsigned int max_bitflips =3D 0;
=20
@@ -1147,7 +1147,7 @@ static int nand_read_subpage(struct mtd_info *mtd, st=
ruct nand_chip *chip,
=20
 	/* Calculate ECC */
 	for (i =3D 0; i < eccfrag_len ; i +=3D chip->ecc.bytes, p +=3D chip->ecc.=
size)
-		chip->ecc.calculate(mtd, p, &chip->buffers->ecccalc[i]);
+		chip->ecc.calculate(mtd, p, &chip->buffers.ecccalc[i]);
=20
 	/*
 	 * The performance is faster if we position offsets according to
@@ -1183,14 +1183,14 @@ static int nand_read_subpage(struct mtd_info *mtd, =
struct nand_chip *chip,
 	}
=20
 	for (i =3D 0; i < eccfrag_len; i++)
-		chip->buffers->ecccode[i] =3D chip->oob_poi[eccpos[i + index]];
+		chip->buffers.ecccode[i] =3D chip->oob_poi[eccpos[i + index]];
=20
 	p =3D bufpoi + data_col_addr;
 	for (i =3D 0; i < eccfrag_len ; i +=3D chip->ecc.bytes, p +=3D chip->ecc.=
size) {
 		int stat;
=20
 		stat =3D chip->ecc.correct(mtd, p,
-			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
+			&chip->buffers.ecccode[i], &chip->buffers.ecccalc[i]);
 		if (stat < 0) {
 			mtd->ecc_stats.failed++;
 		} else {
@@ -1218,8 +1218,8 @@ static int nand_read_page_hwecc(struct mtd_info *mtd,=
 struct nand_chip *chip,
 	int eccbytes =3D chip->ecc.bytes;
 	int eccsteps =3D chip->ecc.steps;
 	uint8_t *p =3D buf;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
-	uint8_t *ecc_code =3D chip->buffers->ecccode;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
+	uint8_t *ecc_code =3D chip->buffers.ecccode;
 	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
 	unsigned int max_bitflips =3D 0;
=20
@@ -1271,9 +1271,9 @@ static int nand_read_page_hwecc_oob_first(struct mtd_=
info *mtd,
 	int eccbytes =3D chip->ecc.bytes;
 	int eccsteps =3D chip->ecc.steps;
 	uint8_t *p =3D buf;
-	uint8_t *ecc_code =3D chip->buffers->ecccode;
+	uint8_t *ecc_code =3D chip->buffers.ecccode;
 	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
 	unsigned int max_bitflips =3D 0;
=20
 	/* Read the OOB area first */
@@ -1452,7 +1452,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, lof=
f_t from,
=20
 		/* Is the current page in the buffer? */
 		if (realpage !=3D chip->pagebuf || oob) {
-			bufpoi =3D aligned ? buf : chip->buffers->databuf;
+			bufpoi =3D aligned ? buf : chip->buffers.databuf;
=20
 			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
=20
@@ -1491,7 +1491,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, lof=
f_t from,
 					/* Invalidate page cache */
 					chip->pagebuf =3D -1;
 				}
-				memcpy(buf, chip->buffers->databuf + col, bytes);
+				memcpy(buf, chip->buffers.databuf + col, bytes);
 			}
=20
 			buf +=3D bytes;
@@ -1514,7 +1514,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, lof=
f_t from,
 					nand_wait_ready(mtd);
 			}
 		} else {
-			memcpy(buf, chip->buffers->databuf + col, bytes);
+			memcpy(buf, chip->buffers.databuf + col, bytes);
 			buf +=3D bytes;
 			max_bitflips =3D max_t(unsigned int, max_bitflips,
 					     chip->pagebuf_bitflips);
@@ -1932,7 +1932,7 @@ static int nand_write_page_swecc(struct mtd_info *mtd=
, struct nand_chip *chip,
 	int i, eccsize =3D chip->ecc.size;
 	int eccbytes =3D chip->ecc.bytes;
 	int eccsteps =3D chip->ecc.steps;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
 	const uint8_t *p =3D buf;
 	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
=20
@@ -1959,7 +1959,7 @@ static int nand_write_page_hwecc(struct mtd_info *mtd=
, struct nand_chip *chip,
 	int i, eccsize =3D chip->ecc.size;
 	int eccbytes =3D chip->ecc.bytes;
 	int eccsteps =3D chip->ecc.steps;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
 	const uint8_t *p =3D buf;
 	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
=20
@@ -1993,7 +1993,7 @@ static int nand_write_subpage_hwecc(struct mtd_info *=
mtd,
 				int oob_required)
 {
 	uint8_t *oob_buf  =3D chip->oob_poi;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
 	int ecc_size      =3D chip->ecc.size;
 	int ecc_bytes     =3D chip->ecc.bytes;
 	int ecc_steps     =3D chip->ecc.steps;
@@ -2028,7 +2028,7 @@ static int nand_write_subpage_hwecc(struct mtd_info *=
mtd,
=20
 	/* copy calculated ECC for whole page to chip->buffer->oob */
 	/* this include masked-value(0xFF) for unwritten subpages */
-	ecc_calc =3D chip->buffers->ecccalc;
+	ecc_calc =3D chip->buffers.ecccalc;
 	for (i =3D 0; i < chip->ecc.total; i++)
 		chip->oob_poi[eccpos[i]] =3D ecc_calc[i];
=20
@@ -2282,9 +2282,9 @@ static int nand_do_write_ops(struct mtd_info *mtd, lo=
ff_t to,
 			cached =3D 0;
 			bytes =3D min_t(int, bytes - column, (int) writelen);
 			chip->pagebuf =3D -1;
-			memset(chip->buffers->databuf, 0xff, mtd->writesize);
-			memcpy(&chip->buffers->databuf[column], buf, bytes);
-			wbuf =3D chip->buffers->databuf;
+			memset(chip->buffers.databuf, 0xff, mtd->writesize);
+			memcpy(&chip->buffers.databuf[column], buf, bytes);
+			wbuf =3D chip->buffers.databuf;
 		}
=20
 		if (unlikely(oob)) {
@@ -3564,13 +3564,21 @@ int nand_scan_tail(struct mtd_info *mtd)
 	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
 			!(chip->bbt_options & NAND_BBT_USE_FLASH));
=20
-	if (!(chip->options & NAND_OWN_BUFFERS))
-		chip->buffers =3D kmalloc(sizeof(*chip->buffers), GFP_KERNEL);
-	if (!chip->buffers)
+	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		chip->buffers.buffer =3D
+			kmalloc(mtd->oobsize * 3 + mtd->writesize, GFP_KERNEL);
+		if (!chip->buffers.buffer)
+			return -ENOMEM;
+
+		chip->buffers.ecccalc =3D chip->buffers.buffer;
+		chip->buffers.ecccode =3D chip->buffers.ecccalc + mtd->oobsize;
+		chip->buffers.databuf =3D chip->buffers.ecccode + mtd->oobsize;
+	}
+	if (!chip->buffers.buffer)
 		return -ENOMEM;
=20
 	/* Set the internal oob buffer location, just after the page data */
-	chip->oob_poi =3D chip->buffers->databuf + mtd->writesize;
+	chip->oob_poi =3D chip->buffers.databuf + mtd->writesize;
=20
 	/*
 	 * If no default placement scheme is given, select an appropriate one.
@@ -3886,8 +3894,10 @@ void nand_release(struct mtd_info *mtd)
=20
 	/* Free bad block table memory */
 	kfree(chip->bbt);
-	if (!(chip->options & NAND_OWN_BUFFERS))
-		kfree(chip->buffers);
+	if (!(chip->options & NAND_OWN_BUFFERS)) {
+		kfree(chip->buffers.buffer);
+		chip->buffers.buffer =3D NULL;
+	}
=20
 	/* Free bad block descriptor memory */
 	if (chip->badblock_pattern && chip->badblock_pattern->options
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c0615d1..5cc4253 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -829,7 +829,7 @@ static inline int nand_memory_bbt(struct mtd_info *mtd,=
 struct nand_bbt_descr *b
 {
 	struct nand_chip *this =3D mtd->priv;
=20
-	return create_bbt(mtd, this->buffers->databuf, bd, -1);
+	return create_bbt(mtd, this->buffers.databuf, bd, -1);
 }
=20
 /**
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f777250..c67986d 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1519,7 +1519,7 @@ static int omap_write_page_bch(struct mtd_info *mtd, =
struct nand_chip *chip,
 				  const uint8_t *buf, int oob_required)
 {
 	int i;
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
 	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
=20
 	/* Enable GPMC ecc engine */
@@ -1557,8 +1557,8 @@ static int omap_write_page_bch(struct mtd_info *mtd, =
struct nand_chip *chip,
 static int omap_read_page_bch(struct mtd_info *mtd, struct nand_chip *chip=
,
 				uint8_t *buf, int oob_required, int page)
 {
-	uint8_t *ecc_calc =3D chip->buffers->ecccalc;
-	uint8_t *ecc_code =3D chip->buffers->ecccode;
+	uint8_t *ecc_calc =3D chip->buffers.ecccalc;
+	uint8_t *ecc_code =3D chip->buffers.ecccode;
 	uint32_t *eccpos =3D chip->ecc.layout->eccpos;
 	uint8_t *oob =3D &chip->oob_poi[eccpos[0]];
 	uint32_t oob_pos =3D mtd->writesize + chip->ecc.layout->eccpos[0];
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index f3ea8da..ce9466f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -52,14 +52,6 @@ extern int nand_unlock(struct mtd_info *mtd, loff_t ofs,=
 uint64_t len);
 #define NAND_MAX_CHIPS		8
=20
 /*
- * This constant declares the max. oobsize / page, which
- * is supported now. If you add a chip with bigger oobsize/page
- * adjust this accordingly.
- */
-#define NAND_MAX_OOBSIZE	744
-#define NAND_MAX_PAGESIZE	8192
-
-/*
  * Constants for hardware specific CLE/ALE/NCE function
  *
  * These are bits which can be or'ed to set/clear multiple
@@ -419,9 +411,10 @@ struct nand_ecc_ctrl {
  * consecutive order.
  */
 struct nand_buffers {
-	uint8_t	ecccalc[NAND_MAX_OOBSIZE];
-	uint8_t	ecccode[NAND_MAX_OOBSIZE];
-	uint8_t databuf[NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE];
+	uint8_t *buffer;
+	uint8_t *ecccalc;
+	uint8_t *ecccode;
+	uint8_t *databuf;
 };
=20
 /**
@@ -574,7 +567,7 @@ struct nand_chip {
 	struct nand_hw_control *controller;
=20
 	struct nand_ecc_ctrl ecc;
-	struct nand_buffers *buffers;
+	struct nand_buffers buffers;
 	struct nand_hw_control hwcontrol;
=20
 	uint8_t *bbt;
--=20
1.8.1.5
