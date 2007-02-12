Received: from [210.94.41.89] (helo=july7)
	by canuck.infradead.org with esmtpsa (Exim 4.63 #1 (Red Hat Linux))
	id 1HGQqU-0003Tw-Hf
	for linux-mtd@lists.infradead.org; Sun, 11 Feb 2007 21:23:12 -0500
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] Make ecclayout static const
Date: Mon, 12 Feb 2007 11:23:04 +0900
Message-ID: <007101c74e4c$bdb8bbb0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


As comment in "mtd.h" ecc layout pointer is read only.
So make it static const

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
--
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index acaf97b..37e609e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -52,9 +52,10 @@
 #endif
 
 /* Define default oob placement schemes for large and small page devices */
-static struct nand_ecclayout nand_oob_8 = {
+static const struct nand_ecclayout nand_oob_8 = {
 	.eccbytes = 3,
 	.eccpos = {0, 1, 2},
+	.oobavail = 4,
 	.oobfree = {
 		{.offset = 3,
 		 .length = 2},
@@ -62,20 +63,22 @@ static struct nand_ecclayout nand_oob_8 = {
 		 .length = 2}}
 };
 
-static struct nand_ecclayout nand_oob_16 = {
+static const struct nand_ecclayout nand_oob_16 = {
 	.eccbytes = 6,
 	.eccpos = {0, 1, 2, 3, 6, 7},
+	.oobavail = 8,
 	.oobfree = {
 		{.offset = 8,
 		 . length = 8}}
 };
 
-static struct nand_ecclayout nand_oob_64 = {
+static const struct nand_ecclayout nand_oob_64 = {
 	.eccbytes = 24,
 	.eccpos = {
 		   40, 41, 42, 43, 44, 45, 46, 47,
 		   48, 49, 50, 51, 52, 53, 54, 55,
 		   56, 57, 58, 59, 60, 61, 62, 63},
+	.oobavail = 38,
 	.oobfree = {
 		{.offset = 2,
 		 .length = 38}}
@@ -769,7 +772,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd,
struct nand_chip *chip,
 	uint8_t *p = buf;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	uint8_t *ecc_code = chip->buffers->ecccode;
-	int *eccpos = chip->ecc.layout->eccpos;
+	const int *eccpos = chip->ecc.layout->eccpos;
 
 	nand_read_page_raw(mtd, chip, buf);
 
@@ -811,7 +814,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd,
struct nand_chip *chip,
 	uint8_t *p = buf;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	uint8_t *ecc_code = chip->buffers->ecccode;
-	int *eccpos = chip->ecc.layout->eccpos;
+	const int *eccpos = chip->ecc.layout->eccpos;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_READ);
@@ -1417,7 +1420,7 @@ static void nand_write_page_swecc(struct mtd_info
*mtd, struct nand_chip *chip,
 	int eccsteps = chip->ecc.steps;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	const uint8_t *p = buf;
-	int *eccpos = chip->ecc.layout->eccpos;
+	const int *eccpos = chip->ecc.layout->eccpos;
 
 	/* Software ecc calculation */
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
@@ -1443,7 +1446,7 @@ static void nand_write_page_hwecc(struct mtd_info
*mtd, struct nand_chip *chip,
 	int eccsteps = chip->ecc.steps;
 	uint8_t *ecc_calc = chip->buffers->ecccalc;
 	const uint8_t *p = buf;
-	int *eccpos = chip->ecc.layout->eccpos;
+	const int *eccpos = chip->ecc.layout->eccpos;
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize) {
 		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
@@ -2408,7 +2411,6 @@ int nand_scan_ident(struct mtd_info *mtd, int
maxchips)
  */
 int nand_scan_tail(struct mtd_info *mtd)
 {
-	int i;
 	struct nand_chip *chip = mtd->priv;
 
 	if (!(chip->options & NAND_OWN_BUFFERS))
@@ -2517,15 +2519,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	}
 
 	/*
-	 * The number of bytes available for a client to place data into
-	 * the out of band area
-	 */
-	chip->ecc.layout->oobavail = 0;
-	for (i = 0; chip->ecc.layout->oobfree[i].length; i++)
-		chip->ecc.layout->oobavail +=
-			chip->ecc.layout->oobfree[i].length;
-
-	/*
 	 * Set the number of read / write steps for one page depending on
ECC
 	 * mode
 	 */
diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index c4a785a..6017a1a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -24,7 +24,7 @@
 /**
  * onenand_oob_64 - oob info for large (2KB) page
  */
-static struct nand_ecclayout onenand_oob_64 = {
+static const struct nand_ecclayout onenand_oob_64 = {
 	.eccbytes	= 20,
 	.eccpos		= {
 		8, 9, 10, 11, 12,
@@ -32,6 +32,7 @@ static struct nand_ecclayout onenand_oob_64 = {
 		40, 41, 42, 43, 44,
 		56, 57, 58, 59, 60,
 		},
+	.oobavail	= 20,
 	.oobfree	= {
 		{2, 3}, {14, 2}, {18, 3}, {30, 2},
 		{34, 3}, {46, 2}, {50, 3}, {62, 2}
@@ -41,12 +42,13 @@ static struct nand_ecclayout onenand_oob_64 = {
 /**
  * onenand_oob_32 - oob info for middle (1KB) page
  */
-static struct nand_ecclayout onenand_oob_32 = {
+static const struct nand_ecclayout onenand_oob_32 = {
 	.eccbytes	= 10,
 	.eccpos		= {
 		8, 9, 10, 11, 12,
 		24, 25, 26, 27, 28,
 		},
+	.oobavail	= 10,
 	.oobfree	= { {2, 3}, {14, 2}, {18, 3}, {30, 2} }
 };
 
@@ -827,13 +829,15 @@ static int onenand_transfer_auto_oob(struct mtd_info
*mtd, uint8_t *buf, int col
 				int thislen)
 {
 	struct onenand_chip *this = mtd->priv;
-	struct nand_oobfree *free;
+	const struct nand_oobfree *free;
 	int readcol = column;
 	int readend = column + thislen;
 	int lastgap = 0;
 	uint8_t *oob_buf = this->page_buf + mtd->writesize;
+	int i;
 
-	for (free = this->ecclayout->oobfree; free->length; ++free) {
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
 		if (readcol >= lastgap)
 			readcol += free->offset - lastgap;
 		if (readend >= lastgap)
@@ -841,7 +845,8 @@ static int onenand_transfer_auto_oob(struct mtd_info
*mtd, uint8_t *buf, int col
 		lastgap = free->offset + free->length;
 	}
 	this->read_bufferram(mtd, ONENAND_SPARERAM, oob_buf, 0, mtd-
>oobsize);
-	for (free = this->ecclayout->oobfree; free->length; ++free) {
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
 		int free_end = free->offset + free->length;
 		if (free->offset < readend && free_end > readcol) {
 			int st = max_t(int,free->offset,readcol);
@@ -849,8 +854,10 @@ static int onenand_transfer_auto_oob(struct mtd_info
*mtd, uint8_t *buf, int col
 			int n = ed - st;
 			memcpy(buf, oob_buf + st, n);
 			buf += n;
-		}
+		} else
+			break;
 	}
+
 	return 0;
 }
 
@@ -1270,19 +1277,22 @@ static int onenand_fill_auto_oob(struct mtd_info
*mtd, u_char *oob_buf,
 				  const u_char *buf, int column, int
thislen)
 {
 	struct onenand_chip *this = mtd->priv;
-	struct nand_oobfree *free;
+	const struct nand_oobfree *free;
 	int writecol = column;
 	int writeend = column + thislen;
 	int lastgap = 0;
+	int i;
 
-	for (free = this->ecclayout->oobfree; free->length; ++free) {
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
 		if (writecol >= lastgap)
 			writecol += free->offset - lastgap;
 		if (writeend >= lastgap)
 			writeend += free->offset - lastgap;
 		lastgap = free->offset + free->length;
 	}
-	for (free = this->ecclayout->oobfree; free->length; ++free) {
+	free = this->ecclayout->oobfree;
+	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
 		int free_end = free->offset + free->length;
 		if (free->offset < writeend && free_end > writecol) {
 			int st = max_t(int,free->offset,writecol);
@@ -1290,7 +1300,8 @@ static int onenand_fill_auto_oob(struct mtd_info
*mtd, u_char *oob_buf,
 			int n = ed - st;
 			memcpy(oob_buf + st, buf, n);
 			buf += n;
-		}
+		} else
+			break;
 	}
 	return 0;
 }
@@ -2289,7 +2300,6 @@ static void onenand_resume(struct mtd_info *mtd)
  */
 int onenand_scan(struct mtd_info *mtd, int maxchips)
 {
-	int i;
 	struct onenand_chip *this = mtd->priv;
 
 	if (!this->read_word)
@@ -2362,15 +2372,6 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 
 	this->subpagesize = mtd->writesize >> mtd->subpage_sft;
 
-	/*
-	 * The number of bytes available for a client to place data into
-	 * the out of band area
-	 */
-	this->ecclayout->oobavail = 0;
-	for (i = 0; this->ecclayout->oobfree[i].length; i++)
-		this->ecclayout->oobavail +=
-			this->ecclayout->oobfree[i].length;
-
 	mtd->ecclayout = this->ecclayout;
 
 	/* Fill in remaining MTD driver data */
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 58cb77b..6069340 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1099,7 +1099,7 @@ int jffs2_write_nand_badblock(struct jffs2_sb_info
*c, struct jffs2_eraseblock *
 
 int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
 {
-	struct nand_ecclayout *oinfo = c->mtd->ecclayout;
+	const struct nand_ecclayout *oinfo = c->mtd->ecclayout;
 
 	if (!c->mtd->oobsize)
 		return 0;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 6a8570b..5a69364 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -127,7 +127,7 @@ struct mtd_info {
 	int index;
 
 	/* ecc layout structure pointer - read only ! */
-	struct nand_ecclayout *ecclayout;
+	const struct nand_ecclayout *ecclayout;
 
 	/* Data for variable erase regions. If numeraseregions is zero,
 	 * it means that the whole device has erasesize as given above.
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9752388..8a39d59 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -259,7 +259,7 @@ struct nand_ecc_ctrl {
 	int			total;
 	int			prepad;
 	int			postpad;
-	struct nand_ecclayout	*layout;
+	const struct nand_ecclayout	*layout;
 	void			(*hwctl)(struct mtd_info *mtd, int mode);
 	int			(*calculate)(struct mtd_info *mtd,
 					     const uint8_t *dat,
@@ -404,7 +404,7 @@ struct nand_chip {
 
 	uint8_t		*oob_poi;
 	struct nand_hw_control  *controller;
-	struct nand_ecclayout	*ecclayout;
+	const struct nand_ecclayout	*ecclayout;
 
 	struct nand_ecc_ctrl ecc;
 	struct nand_buffers *buffers;
@@ -566,7 +566,7 @@ struct platform_nand_chip {
 	int			chip_offset;
 	int			nr_partitions;
 	struct mtd_partition	*partitions;
-	struct nand_ecclayout	*ecclayout;
+	const struct nand_ecclayout	*ecclayout;
 	int			chip_delay;
 	unsigned int		options;
 	void			*priv;
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index d8af8a9..b4f3399 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -124,7 +124,7 @@ struct onenand_chip {
 	unsigned char		*page_buf;
 
 	int			subpagesize;
-	struct nand_ecclayout	*ecclayout;
+	const struct nand_ecclayout	*ecclayout;
 
 	void			*bbm;
 
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index da6b3d6..ff0d0ff 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -41,7 +41,7 @@ struct mtd_partition {
 	u_int32_t size;			/* partition size */
 	u_int32_t offset;		/* offset within the master MTD
space */
 	u_int32_t mask_flags;		/* master MTD flags to mask out for
this partition */
-	struct nand_ecclayout *ecclayout;	/* out of band layout for
this partition (NAND only)*/
+	const struct nand_ecclayout *ecclayout;	/* out of band layout for
this partition (NAND only)*/
 	struct mtd_info **mtdp;		/* pointer to store the MTD object
*/
 };
 
