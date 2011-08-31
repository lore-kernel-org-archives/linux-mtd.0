Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZvi-00059D-Gf
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:49:31 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 05/12] mtd: rename MTD_OOB_* to MTD_OPS_*
Date: Tue, 30 Aug 2011 18:45:40 -0700
Message-ID: <1314755147-17756-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These modes are not necessarily for OOB only. Particularly, MTD_OOB_RAW
affected operations on in-band page data as well. To clarify these
options and to emphasize that their effect is applied per-operation, we
change the primary prefix to MTD_OPS_.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/doc2000.c          |    4 +-
 drivers/mtd/devices/doc2001.c          |    4 +-
 drivers/mtd/devices/doc2001plus.c      |    4 +-
 drivers/mtd/inftlcore.c                |    6 ++--
 drivers/mtd/mtdchar.c                  |   10 ++++---
 drivers/mtd/mtdpart.c                  |    2 +-
 drivers/mtd/mtdswap.c                  |    6 ++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
 drivers/mtd/nand/nand_base.c           |   40 ++++++++++++++++----------------
 drivers/mtd/nand/nand_bbt.c            |    8 +++---
 drivers/mtd/nand/sm_common.c           |    2 +-
 drivers/mtd/nftlcore.c                 |    6 ++--
 drivers/mtd/onenand/onenand_base.c     |   38 +++++++++++++++---------------
 drivers/mtd/onenand/onenand_bbt.c      |    2 +-
 drivers/mtd/sm_ftl.c                   |    4 +-
 drivers/mtd/ssfdc.c                    |    2 +-
 drivers/mtd/tests/mtd_oobtest.c        |   24 +++++++++---------
 drivers/mtd/tests/mtd_readtest.c       |    2 +-
 drivers/staging/spectra/lld_mtd.c      |    6 ++--
 fs/jffs2/wbuf.c                        |    6 ++--
 include/linux/mtd/mtd.h                |    2 +-
 include/mtd/mtd-abi.h                  |   16 ++++++------
 22 files changed, 99 insertions(+), 97 deletions(-)

diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index 8c97033..e9fad91 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -927,7 +927,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 	uint8_t *buf = ops->oobbuf;
 	size_t len = ops->len;
 
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
+	BUG_ON(ops->mode != MTD_OPS_PLACE_OOB);
 
 	ofs += ops->ooboffs;
 
@@ -1091,7 +1091,7 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 	struct DiskOnChip *this = mtd->priv;
 	int ret;
 
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
+	BUG_ON(ops->mode != MTD_OPS_PLACE_OOB);
 
 	mutex_lock(&this->lock);
 	ret = doc_write_oob_nolock(mtd, ofs + ops->ooboffs, ops->len,
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 3d2b459..a3f7a27 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -631,7 +631,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 	uint8_t *buf = ops->oobbuf;
 	size_t len = ops->len;
 
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
+	BUG_ON(ops->mode != MTD_OPS_PLACE_OOB);
 
 	ofs += ops->ooboffs;
 
@@ -689,7 +689,7 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 	uint8_t *buf = ops->oobbuf;
 	size_t len = ops->len;
 
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
+	BUG_ON(ops->mode != MTD_OPS_PLACE_OOB);
 
 	ofs += ops->ooboffs;
 
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index d28c9d9..99351bc 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -834,7 +834,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 	uint8_t *buf = ops->oobbuf;
 	size_t len = ops->len;
 
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
+	BUG_ON(ops->mode != MTD_OPS_PLACE_OOB);
 
 	ofs += ops->ooboffs;
 
@@ -919,7 +919,7 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 	uint8_t *buf = ops->oobbuf;
 	size_t len = ops->len;
 
-	BUG_ON(ops->mode != MTD_OOB_PLACE);
+	BUG_ON(ops->mode != MTD_OPS_PLACE_OOB);
 
 	ofs += ops->ooboffs;
 
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 21aa981..652065e 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -152,7 +152,7 @@ int inftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	struct mtd_oob_ops ops;
 	int res;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = offs & (mtd->writesize - 1);
 	ops.ooblen = len;
 	ops.oobbuf = buf;
@@ -172,7 +172,7 @@ int inftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	struct mtd_oob_ops ops;
 	int res;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = offs & (mtd->writesize - 1);
 	ops.ooblen = len;
 	ops.oobbuf = buf;
@@ -192,7 +192,7 @@ static int inftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
 	struct mtd_oob_ops ops;
 	int res;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = offs;
 	ops.ooblen = mtd->oobsize;
 	ops.oobbuf = oob;
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index d0eaef6..9b76438 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -221,7 +221,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 		{
 			struct mtd_oob_ops ops;
 
-			ops.mode = MTD_OOB_RAW;
+			ops.mode = MTD_OPS_RAW;
 			ops.datbuf = kbuf;
 			ops.oobbuf = NULL;
 			ops.len = len;
@@ -317,7 +317,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 		{
 			struct mtd_oob_ops ops;
 
-			ops.mode = MTD_OOB_RAW;
+			ops.mode = MTD_OPS_RAW;
 			ops.datbuf = kbuf;
 			ops.oobbuf = NULL;
 			ops.ooboffs = 0;
@@ -413,7 +413,8 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	ops.ooblen = length;
 	ops.ooboffs = start & (mtd->writesize - 1);
 	ops.datbuf = NULL;
-	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;
+	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OPS_RAW :
+		MTD_OPS_PLACE_OOB;
 
 	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
 		return -EINVAL;
@@ -457,7 +458,8 @@ static int mtd_do_readoob(struct file *file, struct mtd_info *mtd,
 	ops.ooblen = length;
 	ops.ooboffs = start & (mtd->writesize - 1);
 	ops.datbuf = NULL;
-	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OOB_RAW : MTD_OOB_PLACE;
+	ops.mode = (mfi->mode == MTD_MODE_RAW) ? MTD_OPS_RAW :
+		MTD_OPS_PLACE_OOB;
 
 	if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
 		return -EINVAL;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c90b7ba..cd7785a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -130,7 +130,7 @@ static int part_read_oob(struct mtd_info *mtd, loff_t from,
 	if (ops->oobbuf) {
 		size_t len, pages;
 
-		if (ops->mode == MTD_OOB_AUTO)
+		if (ops->mode == MTD_OPS_AUTO_OOB)
 			len = mtd->oobavail;
 		else
 			len = mtd->oobsize;
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 9961063b..910309f 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -350,7 +350,7 @@ static int mtdswap_read_markers(struct mtdswap_dev *d, struct swap_eb *eb)
 	ops.oobbuf = d->oob_buf;
 	ops.ooboffs = 0;
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_AUTO;
+	ops.mode = MTD_OPS_AUTO_OOB;
 
 	ret = mtdswap_read_oob(d, offset, &ops);
 
@@ -389,7 +389,7 @@ static int mtdswap_write_marker(struct mtdswap_dev *d, struct swap_eb *eb,
 
 	ops.ooboffs = 0;
 	ops.oobbuf = (uint8_t *)&n;
-	ops.mode = MTD_OOB_AUTO;
+	ops.mode = MTD_OPS_AUTO_OOB;
 	ops.datbuf = NULL;
 
 	if (marker == MTDSWAP_TYPE_CLEAN) {
@@ -931,7 +931,7 @@ static unsigned int mtdswap_eblk_passes(struct mtdswap_dev *d,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	ops.mode = MTD_OOB_AUTO;
+	ops.mode = MTD_OPS_AUTO_OOB;
 	ops.len = mtd->writesize;
 	ops.ooblen = mtd->ecclayout->oobavail;
 	ops.ooboffs = 0;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 99940bd..754ffed 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1159,7 +1159,7 @@ gpmi_ecc_write_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
 	 * The BCH will use all the (page + oob).
 	 * Our gpmi_hw_ecclayout can only prohibit the JFFS2 to write the oob.
 	 * But it can not stop some ioctls such MEMWRITEOOB which uses
-	 * MTD_OOB_PLACE. So We have to implement this function to prohibit
+	 * MTD_OPS_PLACE_OOB. So We have to implement this function to prohibit
 	 * these ioctls too.
 	 */
 	return -EPERM;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 12732a0..e5c6a13 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1382,12 +1382,12 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 {
 	switch (ops->mode) {
 
-	case MTD_OOB_PLACE:
-	case MTD_OOB_RAW:
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_RAW:
 		memcpy(oob, chip->oob_poi + ops->ooboffs, len);
 		return oob + len;
 
-	case MTD_OOB_AUTO: {
+	case MTD_OPS_AUTO_OOB: {
 		struct nand_oobfree *free = chip->ecc.layout->oobfree;
 		uint32_t boffs = 0, roffs = ops->ooboffs;
 		size_t bytes = 0;
@@ -1437,7 +1437,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	int ret = 0;
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
-	uint32_t max_oobsize = ops->mode == MTD_OOB_AUTO ?
+	uint32_t max_oobsize = ops->mode == MTD_OPS_AUTO_OOB ?
 		mtd->oobavail : mtd->oobsize;
 
 	uint8_t *bufpoi, *oob, *buf;
@@ -1469,7 +1469,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			}
 
 			/* Now read the page into the buffer */
-			if (unlikely(ops->mode == MTD_OOB_RAW))
+			if (unlikely(ops->mode == MTD_OPS_RAW))
 				ret = chip->ecc.read_page_raw(mtd, chip,
 							      bufpoi, page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
@@ -1759,7 +1759,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 
 	stats = mtd->ecc_stats;
 
-	if (ops->mode == MTD_OOB_AUTO)
+	if (ops->mode == MTD_OPS_AUTO_OOB)
 		len = chip->ecc.layout->oobavail;
 	else
 		len = mtd->oobsize;
@@ -1787,7 +1787,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 	page = realpage & chip->pagemask;
 
 	while (1) {
-		if (ops->mode == MTD_OOB_RAW)
+		if (ops->mode == MTD_OPS_RAW)
 			sndcmd = chip->ecc.read_oob_raw(mtd, chip, page, sndcmd);
 		else
 			sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
@@ -1865,9 +1865,9 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	nand_get_device(chip, mtd, FL_READING);
 
 	switch (ops->mode) {
-	case MTD_OOB_PLACE:
-	case MTD_OOB_AUTO:
-	case MTD_OOB_RAW:
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
+	case MTD_OPS_RAW:
 		break;
 
 	default:
@@ -2113,12 +2113,12 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
 
 	switch (ops->mode) {
 
-	case MTD_OOB_PLACE:
-	case MTD_OOB_RAW:
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_RAW:
 		memcpy(chip->oob_poi + ops->ooboffs, oob, len);
 		return oob + len;
 
-	case MTD_OOB_AUTO: {
+	case MTD_OPS_AUTO_OOB: {
 		struct nand_oobfree *free = chip->ecc.layout->oobfree;
 		uint32_t boffs = 0, woffs = ops->ooboffs;
 		size_t bytes = 0;
@@ -2167,7 +2167,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	uint32_t writelen = ops->len;
 
 	uint32_t oobwritelen = ops->ooblen;
-	uint32_t oobmaxlen = ops->mode == MTD_OOB_AUTO ?
+	uint32_t oobmaxlen = ops->mode == MTD_OPS_AUTO_OOB ?
 				mtd->oobavail : mtd->oobsize;
 
 	uint8_t *oob = ops->oobbuf;
@@ -2236,7 +2236,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		}
 
 		ret = chip->write_page(mtd, chip, wbuf, page, cached,
-				       (ops->mode == MTD_OOB_RAW));
+				       (ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
 
@@ -2356,7 +2356,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	pr_debug("%s: to = 0x%08x, len = %i\n",
 			 __func__, (unsigned int)to, (int)ops->ooblen);
 
-	if (ops->mode == MTD_OOB_AUTO)
+	if (ops->mode == MTD_OPS_AUTO_OOB)
 		len = chip->ecc.layout->oobavail;
 	else
 		len = mtd->oobsize;
@@ -2408,7 +2408,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 
 	nand_fill_oob(mtd, ops->oobbuf, ops->ooblen, ops);
 
-	if (ops->mode == MTD_OOB_RAW)
+	if (ops->mode == MTD_OPS_RAW)
 		status = chip->ecc.write_oob_raw(mtd, chip, page & chip->pagemask);
 	else
 		status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
@@ -2445,9 +2445,9 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 	nand_get_device(chip, mtd, FL_WRITING);
 
 	switch (ops->mode) {
-	case MTD_OOB_PLACE:
-	case MTD_OOB_AUTO:
-	case MTD_OOB_RAW:
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
+	case MTD_OPS_RAW:
 		break;
 
 	default:
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 6aa8125..c488bcb 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -302,7 +302,7 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	struct mtd_oob_ops ops;
 	int res;
 
-	ops.mode = MTD_OOB_RAW;
+	ops.mode = MTD_OPS_RAW;
 	ops.ooboffs = 0;
 	ops.ooblen = mtd->oobsize;
 
@@ -350,7 +350,7 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
 {
 	struct mtd_oob_ops ops;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = 0;
 	ops.ooblen = mtd->oobsize;
 	ops.datbuf = buf;
@@ -433,7 +433,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 	ops.oobbuf = buf;
 	ops.ooboffs = 0;
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 
 	for (j = 0; j < len; j++) {
 		/*
@@ -672,7 +672,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	ops.ooblen = mtd->oobsize;
 	ops.ooboffs = 0;
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 
 	if (!rcode)
 		rcode = 0xff;
diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.c
index b6332e8..2c438ef 100644
--- a/drivers/mtd/nand/sm_common.c
+++ b/drivers/mtd/nand/sm_common.c
@@ -47,7 +47,7 @@ static int sm_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 	/* As long as this function is called on erase block boundaries
 		it will work correctly for 256 byte nand */
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = 0;
 	ops.ooblen = mtd->oobsize;
 	ops.oobbuf = (void *)&oob;
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 93d6fc6..272e3c0 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -147,7 +147,7 @@ int nftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	struct mtd_oob_ops ops;
 	int res;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = offs & mask;
 	ops.ooblen = len;
 	ops.oobbuf = buf;
@@ -168,7 +168,7 @@ int nftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 	struct mtd_oob_ops ops;
 	int res;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = offs & mask;
 	ops.ooblen = len;
 	ops.oobbuf = buf;
@@ -191,7 +191,7 @@ static int nftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
 	struct mtd_oob_ops ops;
 	int res;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = offs & mask;
 	ops.ooblen = mtd->oobsize;
 	ops.oobbuf = oob;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 9edc8b1..65a8e18 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1125,7 +1125,7 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	pr_debug("%s: from = 0x%08x, len = %i\n", __func__, (unsigned int)from,
 			(int)len);
 
-	if (ops->mode == MTD_OOB_AUTO)
+	if (ops->mode == MTD_OPS_AUTO_OOB)
 		oobsize = this->ecclayout->oobavail;
 	else
 		oobsize = mtd->oobsize;
@@ -1170,7 +1170,7 @@ static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			thisooblen = oobsize - oobcolumn;
 			thisooblen = min_t(int, thisooblen, ooblen - oobread);
 
-			if (ops->mode == MTD_OOB_AUTO)
+			if (ops->mode == MTD_OPS_AUTO_OOB)
 				onenand_transfer_auto_oob(mtd, oobbuf, oobcolumn, thisooblen);
 			else
 				this->read_bufferram(mtd, ONENAND_SPARERAM, oobbuf, oobcolumn, thisooblen);
@@ -1229,7 +1229,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 	pr_debug("%s: from = 0x%08x, len = %i\n", __func__, (unsigned int)from,
 			(int)len);
 
-	if (ops->mode == MTD_OOB_AUTO)
+	if (ops->mode == MTD_OPS_AUTO_OOB)
 		oobsize = this->ecclayout->oobavail;
 	else
 		oobsize = mtd->oobsize;
@@ -1291,7 +1291,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			thisooblen = oobsize - oobcolumn;
 			thisooblen = min_t(int, thisooblen, ooblen - oobread);
 
-			if (ops->mode == MTD_OOB_AUTO)
+			if (ops->mode == MTD_OPS_AUTO_OOB)
 				onenand_transfer_auto_oob(mtd, oobbuf, oobcolumn, thisooblen);
 			else
 				this->read_bufferram(mtd, ONENAND_SPARERAM, oobbuf, oobcolumn, thisooblen);
@@ -1363,7 +1363,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 	/* Initialize return length value */
 	ops->oobretlen = 0;
 
-	if (mode == MTD_OOB_AUTO)
+	if (mode == MTD_OPS_AUTO_OOB)
 		oobsize = this->ecclayout->oobavail;
 	else
 		oobsize = mtd->oobsize;
@@ -1409,7 +1409,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 			break;
 		}
 
-		if (mode == MTD_OOB_AUTO)
+		if (mode == MTD_OPS_AUTO_OOB)
 			onenand_transfer_auto_oob(mtd, buf, column, thislen);
 		else
 			this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
@@ -1487,10 +1487,10 @@ static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 	int ret;
 
 	switch (ops->mode) {
-	case MTD_OOB_PLACE:
-	case MTD_OOB_AUTO:
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
 		break;
-	case MTD_OOB_RAW:
+	case MTD_OPS_RAW:
 		/* Not implemented yet */
 	default:
 		return -EINVAL;
@@ -1908,7 +1908,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	if (!len)
 		return 0;
 
-	if (ops->mode == MTD_OOB_AUTO)
+	if (ops->mode == MTD_OPS_AUTO_OOB)
 		oobsize = this->ecclayout->oobavail;
 	else
 		oobsize = mtd->oobsize;
@@ -1945,7 +1945,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 				/* We send data to spare ram with oobsize
 				 * to prevent byte access */
 				memset(oobbuf, 0xff, mtd->oobsize);
-				if (ops->mode == MTD_OOB_AUTO)
+				if (ops->mode == MTD_OPS_AUTO_OOB)
 					onenand_fill_auto_oob(mtd, oobbuf, oob, oobcolumn, thisooblen);
 				else
 					memcpy(oobbuf + oobcolumn, oob, thisooblen);
@@ -2084,7 +2084,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 	/* Initialize retlen, in case of early exit */
 	ops->oobretlen = 0;
 
-	if (mode == MTD_OOB_AUTO)
+	if (mode == MTD_OPS_AUTO_OOB)
 		oobsize = this->ecclayout->oobavail;
 	else
 		oobsize = mtd->oobsize;
@@ -2128,7 +2128,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 		/* We send data to spare ram with oobsize
 		 * to prevent byte access */
 		memset(oobbuf, 0xff, mtd->oobsize);
-		if (mode == MTD_OOB_AUTO)
+		if (mode == MTD_OPS_AUTO_OOB)
 			onenand_fill_auto_oob(mtd, oobbuf, buf, column, thislen);
 		else
 			memcpy(oobbuf + column, buf, thislen);
@@ -2217,10 +2217,10 @@ static int onenand_write_oob(struct mtd_info *mtd, loff_t to,
 	int ret;
 
 	switch (ops->mode) {
-	case MTD_OOB_PLACE:
-	case MTD_OOB_AUTO:
+	case MTD_OPS_PLACE_OOB:
+	case MTD_OPS_AUTO_OOB:
 		break;
-	case MTD_OOB_RAW:
+	case MTD_OPS_RAW:
 		/* Not implemented yet */
 	default:
 		return -EINVAL;
@@ -2603,7 +2603,7 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	struct bbm_info *bbm = this->bbm;
 	u_char buf[2] = {0, 0};
 	struct mtd_oob_ops ops = {
-		.mode = MTD_OOB_PLACE,
+		.mode = MTD_OPS_PLACE_OOB,
 		.ooblen = 2,
 		.oobbuf = buf,
 		.ooboffs = 0,
@@ -3171,7 +3171,7 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t from, size_t len,
 		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
 		this->wait(mtd, FL_RESETING);
 	} else {
-		ops.mode = MTD_OOB_PLACE;
+		ops.mode = MTD_OPS_PLACE_OOB;
 		ops.ooblen = len;
 		ops.oobbuf = buf;
 		ops.ooboffs = 0;
@@ -3677,7 +3677,7 @@ static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int start, int
 	int i, ret;
 	int block;
 	struct mtd_oob_ops ops = {
-		.mode = MTD_OOB_PLACE,
+		.mode = MTD_OPS_PLACE_OOB,
 		.ooboffs = 0,
 		.ooblen	= mtd->oobsize,
 		.datbuf	= NULL,
diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onenand_bbt.c
index 3b9a2a9..09956c4 100644
--- a/drivers/mtd/onenand/onenand_bbt.c
+++ b/drivers/mtd/onenand/onenand_bbt.c
@@ -80,7 +80,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	startblock = 0;
 	from = 0;
 
-	ops.mode = MTD_OOB_PLACE;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooblen = readlen;
 	ops.oobbuf = buf;
 	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 311a9e3..d927641 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -256,7 +256,7 @@ static int sm_read_sector(struct sm_ftl *ftl,
 	if (!oob)
 		oob = &tmp_oob;
 
-	ops.mode = ftl->smallpagenand ? MTD_OOB_RAW : MTD_OOB_PLACE;
+	ops.mode = ftl->smallpagenand ? MTD_OPS_RAW : MTD_OPS_PLACE_OOB;
 	ops.ooboffs = 0;
 	ops.ooblen = SM_OOB_SIZE;
 	ops.oobbuf = (void *)oob;
@@ -336,7 +336,7 @@ static int sm_write_sector(struct sm_ftl *ftl,
 	if (ftl->unstable)
 		return -EIO;
 
-	ops.mode = ftl->smallpagenand ? MTD_OOB_RAW : MTD_OOB_PLACE;
+	ops.mode = ftl->smallpagenand ? MTD_OPS_RAW : MTD_OPS_PLACE_OOB;
 	ops.len = SM_SECTOR_SIZE;
 	ops.datbuf = buffer;
 	ops.ooboffs = 0;
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 5f917f0..976e3d2 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -169,7 +169,7 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	struct mtd_oob_ops ops;
 	int ret;
 
-	ops.mode = MTD_OOB_RAW;
+	ops.mode = MTD_OPS_RAW;
 	ops.ooboffs = 0;
 	ops.ooblen = OOB_SIZE;
 	ops.oobbuf = buf;
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index dec92ae..6bcff42 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -131,7 +131,7 @@ static int write_eraseblock(int ebnum)
 
 	for (i = 0; i < pgcnt; ++i, addr += mtd->writesize) {
 		set_random_data(writebuf, use_len);
-		ops.mode      = MTD_OOB_AUTO;
+		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
 		ops.ooblen    = use_len;
@@ -184,7 +184,7 @@ static int verify_eraseblock(int ebnum)
 
 	for (i = 0; i < pgcnt; ++i, addr += mtd->writesize) {
 		set_random_data(writebuf, use_len);
-		ops.mode      = MTD_OOB_AUTO;
+		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
 		ops.ooblen    = use_len;
@@ -211,7 +211,7 @@ static int verify_eraseblock(int ebnum)
 		if (use_offset != 0 || use_len < mtd->ecclayout->oobavail) {
 			int k;
 
-			ops.mode      = MTD_OOB_AUTO;
+			ops.mode      = MTD_OPS_AUTO_OOB;
 			ops.len       = 0;
 			ops.retlen    = 0;
 			ops.ooblen    = mtd->ecclayout->oobavail;
@@ -276,7 +276,7 @@ static int verify_eraseblock_in_one_go(int ebnum)
 	size_t len = mtd->ecclayout->oobavail * pgcnt;
 
 	set_random_data(writebuf, len);
-	ops.mode      = MTD_OOB_AUTO;
+	ops.mode      = MTD_OPS_AUTO_OOB;
 	ops.len       = 0;
 	ops.retlen    = 0;
 	ops.ooblen    = len;
@@ -507,7 +507,7 @@ static int __init mtd_oobtest_init(void)
 		addr0 += mtd->erasesize;
 
 	/* Attempt to write off end of OOB */
-	ops.mode      = MTD_OOB_AUTO;
+	ops.mode      = MTD_OPS_AUTO_OOB;
 	ops.len       = 0;
 	ops.retlen    = 0;
 	ops.ooblen    = 1;
@@ -527,7 +527,7 @@ static int __init mtd_oobtest_init(void)
 	}
 
 	/* Attempt to read off end of OOB */
-	ops.mode      = MTD_OOB_AUTO;
+	ops.mode      = MTD_OPS_AUTO_OOB;
 	ops.len       = 0;
 	ops.retlen    = 0;
 	ops.ooblen    = 1;
@@ -551,7 +551,7 @@ static int __init mtd_oobtest_init(void)
 		       "block is bad\n");
 	else {
 		/* Attempt to write off end of device */
-		ops.mode      = MTD_OOB_AUTO;
+		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
 		ops.ooblen    = mtd->ecclayout->oobavail + 1;
@@ -571,7 +571,7 @@ static int __init mtd_oobtest_init(void)
 		}
 
 		/* Attempt to read off end of device */
-		ops.mode      = MTD_OOB_AUTO;
+		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
 		ops.ooblen    = mtd->ecclayout->oobavail + 1;
@@ -595,7 +595,7 @@ static int __init mtd_oobtest_init(void)
 			goto out;
 
 		/* Attempt to write off end of device */
-		ops.mode      = MTD_OOB_AUTO;
+		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
 		ops.ooblen    = mtd->ecclayout->oobavail;
@@ -615,7 +615,7 @@ static int __init mtd_oobtest_init(void)
 		}
 
 		/* Attempt to read off end of device */
-		ops.mode      = MTD_OOB_AUTO;
+		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
 		ops.ooblen    = mtd->ecclayout->oobavail;
@@ -655,7 +655,7 @@ static int __init mtd_oobtest_init(void)
 		addr = (i + 1) * mtd->erasesize - mtd->writesize;
 		for (pg = 0; pg < cnt; ++pg) {
 			set_random_data(writebuf, sz);
-			ops.mode      = MTD_OOB_AUTO;
+			ops.mode      = MTD_OPS_AUTO_OOB;
 			ops.len       = 0;
 			ops.retlen    = 0;
 			ops.ooblen    = sz;
@@ -683,7 +683,7 @@ static int __init mtd_oobtest_init(void)
 			continue;
 		set_random_data(writebuf, mtd->ecclayout->oobavail * 2);
 		addr = (i + 1) * mtd->erasesize - mtd->writesize;
-		ops.mode      = MTD_OOB_AUTO;
+		ops.mode      = MTD_OPS_AUTO_OOB;
 		ops.len       = 0;
 		ops.retlen    = 0;
 		ops.ooblen    = mtd->ecclayout->oobavail * 2;
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 836792d..587e1e3 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -66,7 +66,7 @@ static int read_eraseblock_by_page(int ebnum)
 		if (mtd->oobsize) {
 			struct mtd_oob_ops ops;
 
-			ops.mode      = MTD_OOB_PLACE;
+			ops.mode      = MTD_OPS_PLACE_OOB;
 			ops.len       = 0;
 			ops.retlen    = 0;
 			ops.ooblen    = mtd->oobsize;
diff --git a/drivers/staging/spectra/lld_mtd.c b/drivers/staging/spectra/lld_mtd.c
index 2bd3466..a9c309a 100644
--- a/drivers/staging/spectra/lld_mtd.c
+++ b/drivers/staging/spectra/lld_mtd.c
@@ -340,7 +340,7 @@ u16 mtd_Read_Page_Main_Spare(u8 *read_data, u32 Block,
 		struct mtd_oob_ops ops;
 		int ret;
 
-		ops.mode = MTD_OOB_AUTO;
+		ops.mode = MTD_OPS_AUTO_OOB;
 		ops.datbuf = read_data;
 		ops.len = DeviceInfo.wPageDataSize;
 		ops.oobbuf = read_data + DeviceInfo.wPageDataSize + BTSIG_OFFSET;
@@ -400,7 +400,7 @@ u16 mtd_Write_Page_Main_Spare(u8 *write_data, u32 Block,
 		struct mtd_oob_ops ops;
 		int ret;
 
-		ops.mode = MTD_OOB_AUTO;
+		ops.mode = MTD_OPS_AUTO_OOB;
 		ops.datbuf = write_data;
 		ops.len = DeviceInfo.wPageDataSize;
 		ops.oobbuf = write_data + DeviceInfo.wPageDataSize + BTSIG_OFFSET;
@@ -473,7 +473,7 @@ u16 mtd_Read_Page_Spare(u8 *read_data, u32 Block,
 		struct mtd_oob_ops ops;
 		int ret;
 
-		ops.mode = MTD_OOB_AUTO;
+		ops.mode = MTD_OPS_AUTO_OOB;
 		ops.datbuf = NULL;
 		ops.len = 0;
 		ops.oobbuf = read_data;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index a10fb24..b09e51d 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1025,7 +1025,7 @@ int jffs2_check_oob_empty(struct jffs2_sb_info *c,
 	int cmlen = min_t(int, c->oobavail, OOB_CM_SIZE);
 	struct mtd_oob_ops ops;
 
-	ops.mode = MTD_OOB_AUTO;
+	ops.mode = MTD_OPS_AUTO_OOB;
 	ops.ooblen = NR_OOB_SCAN_PAGES * c->oobavail;
 	ops.oobbuf = c->oobbuf;
 	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
@@ -1068,7 +1068,7 @@ int jffs2_check_nand_cleanmarker(struct jffs2_sb_info *c,
 	struct mtd_oob_ops ops;
 	int ret, cmlen = min_t(int, c->oobavail, OOB_CM_SIZE);
 
-	ops.mode = MTD_OOB_AUTO;
+	ops.mode = MTD_OPS_AUTO_OOB;
 	ops.ooblen = cmlen;
 	ops.oobbuf = c->oobbuf;
 	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
@@ -1094,7 +1094,7 @@ int jffs2_write_nand_cleanmarker(struct jffs2_sb_info *c,
 	struct mtd_oob_ops ops;
 	int cmlen = min_t(int, c->oobavail, OOB_CM_SIZE);
 
-	ops.mode = MTD_OOB_AUTO;
+	ops.mode = MTD_OPS_AUTO_OOB;
 	ops.ooblen = cmlen;
 	ops.oobbuf = (uint8_t *)&oob_cleanmarker;
 	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 3b2c678..e02e65b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -79,7 +79,7 @@ struct mtd_erase_region_info {
  * @ooblen:	number of oob bytes to write/read
  * @oobretlen:	number of oob bytes written/read
  * @ooboffs:	offset of oob data in the oob area (only relevant when
- *		mode = MTD_OOB_PLACE)
+ *		mode = MTD_OPS_PLACE_OOB)
  * @datbuf:	data buffer - if NULL only oob data are read/written
  * @oobbuf:	oob data buffer
  *
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index af42c7a..d30990e 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -46,18 +46,18 @@ struct mtd_oob_buf64 {
 };
 
 /*
- * oob operation modes
+ * MTD operation modes
  *
- * MTD_OOB_PLACE:       oob data are placed at the given offset (default)
- * MTD_OOB_AUTO:        oob data are automatically placed at the free areas
- *                      which are defined by the internal ecclayout
- * MTD_OOB_RAW:         mode to read or write oob and data without doing ECC
+ * MTD_OPS_PLACE_OOB:	oob data are placed at the given offset (default)
+ * MTD_OPS_AUTO_OOB:	oob data are automatically placed at the free areas
+ *			which are defined by the internal ecclayout
+ * MTD_OPS_RAW:		mode to read or write oob and data without doing ECC
  *			checking
  */
 enum {
-	MTD_OOB_PLACE = 0,
-	MTD_OOB_AUTO = 1,
-	MTD_OOB_RAW = 2,
+	MTD_OPS_PLACE_OOB = 0,
+	MTD_OPS_AUTO_OOB = 1,
+	MTD_OPS_RAW = 2,
 };
 
 #define MTD_ABSENT		0
-- 
1.7.5.4
