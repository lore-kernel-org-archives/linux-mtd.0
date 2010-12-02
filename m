Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNwyH-0007Su-0k
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 00:24:26 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built
	Sep 7
	2010)) with ESMTP id <0LCR0079XYGK9840@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 09:24:20 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0LCR00J0DYGK8R@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 09:24:20 +0900 (KST)
Date: Thu, 02 Dec 2010 09:24:16 +0900
From: Kyungmin Park <kmpark@infradead.org>
Subject: [PATCH] mtd: OneNAND: Fix 4KiB pagesize OOB handling
To: linux-mtd@lists.infradead.org
Message-id: <20101202002416.GA807@july>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline
Cc: dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kyungmin Park <kyungmin.park@samsung.com>

Original 4KiB pagesize chip (SLC) doesn't support OOB operations at Spec.
And it's also same at Flex-OneNAND.

Remove the MLC macro if possible and use 4KiB pagesize macro since MLC has 4KiB pagesize.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 4d6e6c5..c38bf9c 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -400,8 +400,7 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		value = onenand_bufferram_address(this, block);
 		this->write_word(value, this->base + ONENAND_REG_START_ADDRESS2);
 
-		if (ONENAND_IS_MLC(this) || ONENAND_IS_2PLANE(this) ||
-		    ONENAND_IS_4KB_PAGE(this))
+		if (ONENAND_IS_2PLANE(this) || ONENAND_IS_4KB_PAGE(this))
 			/* It is always BufferRAM0 */
 			ONENAND_SET_BUFFERRAM0(this);
 		else
@@ -430,7 +429,7 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 		case FLEXONENAND_CMD_RECOVER_LSB:
 		case ONENAND_CMD_READ:
 		case ONENAND_CMD_READOOB:
-			if (ONENAND_IS_MLC(this) || ONENAND_IS_4KB_PAGE(this))
+			if (ONENAND_IS_4KB_PAGE(this))
 				/* It is always BufferRAM0 */
 				dataram = ONENAND_SET_BUFFERRAM0(this);
 			else
@@ -1353,7 +1352,7 @@ static int onenand_read_oob_nolock(struct mtd_info *mtd, loff_t from,
 
 	stats = mtd->ecc_stats;
 
-	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+	readcmd = ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
 
 	while (read < len) {
 		cond_resched();
@@ -1429,7 +1428,7 @@ static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int ret;
 
 	onenand_get_device(mtd, FL_READING);
-	ret = ONENAND_IS_MLC(this) || ONENAND_IS_4KB_PAGE(this) ?
+	ret = ONENAND_IS_4KB_PAGE(this) ?
 		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
 		onenand_read_ops_nolock(mtd, from, &ops);
 	onenand_release_device(mtd);
@@ -1464,7 +1463,7 @@ static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
 
 	onenand_get_device(mtd, FL_READING);
 	if (ops->datbuf)
-		ret = ONENAND_IS_MLC(this) || ONENAND_IS_4KB_PAGE(this) ?
+		ret = ONENAND_IS_4KB_PAGE(this) ?
 			onenand_mlc_read_ops_nolock(mtd, from, ops) :
 			onenand_read_ops_nolock(mtd, from, ops);
 	else
@@ -1558,7 +1557,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
 
 	column = from & (mtd->oobsize - 1);
 
-	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+	readcmd = ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
 
 	while (read < len) {
 		cond_resched();
@@ -1612,7 +1611,7 @@ static int onenand_verify_oob(struct mtd_info *mtd, const u_char *buf, loff_t to
 	u_char *oob_buf = this->oob_buf;
 	int status, i, readcmd;
 
-	readcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
+	readcmd = ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_READ : ONENAND_CMD_READOOB;
 
 	this->command(mtd, readcmd, to, mtd->oobsize);
 	onenand_update_bufferram(mtd, to, 0);
@@ -2079,7 +2078,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 
 	oobbuf = this->oob_buf;
 
-	oobcmd = ONENAND_IS_MLC(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
+	oobcmd = ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_PROG : ONENAND_CMD_PROGOOB;
 
 	/* Loop until all data write */
 	while (written < len) {
@@ -2098,7 +2097,7 @@ static int onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 			memcpy(oobbuf + column, buf, thislen);
 		this->write_bufferram(mtd, ONENAND_SPARERAM, oobbuf, 0, mtd->oobsize);
 
-		if (ONENAND_IS_MLC(this) || ONENAND_IS_4KB_PAGE(this)) {
+		if (ONENAND_IS_4KB_PAGE(this)) {
 			/* Set main area of DataRAM to 0xff*/
 			memset(this->page_buf, 0xff, mtd->writesize);
 			this->write_bufferram(mtd, ONENAND_DATARAM,
@@ -3041,7 +3040,7 @@ static int do_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
 	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
 	this->wait(mtd, FL_OTPING);
 
-	ret = ONENAND_IS_MLC(this) || ONENAND_IS_4KB_PAGE(this) ?
+	ret = ONENAND_IS_4KB_PAGE(this) ?
 		onenand_mlc_read_ops_nolock(mtd, from, &ops) :
 		onenand_read_ops_nolock(mtd, from, &ops);
 
@@ -3413,7 +3412,11 @@ static void onenand_check_features(struct mtd_info *mtd)
 		break;
 	}
 
-	if (ONENAND_IS_MLC(this) || ONENAND_IS_4KB_PAGE(this))
+	/* The MLC has 4KiB pagesize. */
+	if (ONENAND_IS_MLC(this))
+		this->options |= ONENAND_HAS_4KB_PAGE;
+
+	if (ONENAND_IS_4KB_PAGE(this))
 		this->options &= ~ONENAND_HAS_2PLANE;
 
 	if (FLEXONENAND(this)) {
@@ -3847,7 +3850,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	/* The data buffer size is equal to page size */
 	mtd->writesize = this->read_word(this->base + ONENAND_REG_DATA_BUFFER_SIZE);
 	/* We use the full BufferRAM */
-	if (ONENAND_IS_MLC(this) || ONENAND_IS_4KB_PAGE(this))
+	if (ONENAND_IS_4KB_PAGE(this))
 		mtd->writesize <<= 1;
 
 	mtd->oobsize = mtd->writesize >> 5;
