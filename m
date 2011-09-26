Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R84V7-0000NZ-Ty
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 06:17:15 +0000
From: <b35362@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH] mtd/nand : workaround for Freescale FCM to support large-page
	Nand chip
Date: Mon, 26 Sep 2011 13:10:06 +0800
Message-ID: <1317013806-23640-1-git-send-email-b35362@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Liu Shuo <b35362@freescale.com>, Artem.Bityutskiy@nokia.com,
	Li Yang <leoli@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Liu Shuo <b35362@freescale.com>

Freescale FCM controller has a 2K size limitation of buffer RAM. In order
to support the Nand flash chip whose page size is larger than 2K bytes,
we read/write 2k data repeatedly by issuing FIR_OP_RB/FIR_OP_WB and save
them to a large buffer.

Signed-off-by: Liu Shuo <b35362@freescale.com>
Signed-off-by: Li Yang <leoli@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |  182 ++++++++++++++++++++++++++++++++++---
 1 files changed, 167 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index a212116..183e532 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -76,6 +76,9 @@ struct fsl_elbc_fcm_ctrl {
 	unsigned int oob;        /* Non zero if operating on OOB data     */
 	unsigned int counter;	 /* counter for the initializations	  */
 	char *oob_poi;           /* Place to write ECC after read back    */
+
+	char *buffer;
+	int page_size;		 /* the mutiple of 2048 */
 };
 
 /* These map to the positions used by the FCM hardware ECC generator */
@@ -151,6 +154,44 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 };
 
 /*=================================*/
+static void io_to_buffer(struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl,
+		int subpage, int off, int len, int oob)
+{
+	void *src, *dst;
+
+	if (!len)
+		len = (oob ? 64 : 2048);
+
+	if (oob)
+		dst = elbc_fcm_ctrl->buffer + elbc_fcm_ctrl->page_size +
+			subpage * 64 + off;
+	else
+		dst = elbc_fcm_ctrl->buffer + subpage * 2048 + off;
+
+	src = elbc_fcm_ctrl->addr + (oob ? 2048 : 0) + off;
+	memcpy_fromio(dst, src, len);
+}
+
+static void buffer_to_io(struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl,
+		int subpage, int off, int len, int oob)
+{
+	void *src, *dst;
+
+	if (!len)
+		len = (oob ? 64 : 2048);
+
+	if (oob)
+		src = elbc_fcm_ctrl->buffer + elbc_fcm_ctrl->page_size +
+			subpage * 64 + off;
+	else
+		src = elbc_fcm_ctrl->buffer + subpage * 2048 + off;
+
+	dst = elbc_fcm_ctrl->addr + (oob ? 2048 : 0) + off;
+
+	memcpy_toio(dst, src, len);
+	in_8(elbc_fcm_ctrl->addr);
+}
+
 
 /*
  * Set up the FCM hardware block and page address fields, and the fcm
@@ -167,15 +208,14 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
 
 	elbc_fcm_ctrl->page = page_addr;
 
-	out_be32(&lbc->fbar,
-	         page_addr >> (chip->phys_erase_shift - chip->page_shift));
-
 	if (priv->page_size) {
+		out_be32(&lbc->fbar, page_addr >> 6);
 		out_be32(&lbc->fpar,
 		         ((page_addr << FPAR_LP_PI_SHIFT) & FPAR_LP_PI) |
 		         (oob ? FPAR_LP_MS : 0) | column);
 		buf_num = (page_addr & 1) << 2;
 	} else {
+		out_be32(&lbc->fbar, page_addr >> 5);
 		out_be32(&lbc->fpar,
 		         ((page_addr << FPAR_SP_PI_SHIFT) & FPAR_SP_PI) |
 		         (oob ? FPAR_SP_MS : 0) | column);
@@ -187,7 +227,7 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
 
 	/* for OOB data point to the second half of the buffer */
 	if (oob)
-		elbc_fcm_ctrl->index += priv->page_size ? 2048 : 512;
+		elbc_fcm_ctrl->index += mtd->writesize;
 
 	dev_vdbg(priv->dev, "set_addr: bank=%d, "
 			    "elbc_fcm_ctrl->addr=0x%p (0x%p), "
@@ -286,6 +326,7 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
+	int i;
 
 	elbc_fcm_ctrl->use_mdr = 0;
 
@@ -314,6 +355,27 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 
 		fsl_elbc_do_read(chip, 0);
 		fsl_elbc_run_command(mtd);
+
+		if (priv->page_size <= 1)
+			return;
+
+		/* Continue to read the rest bytes if writesize > 2048 */
+		io_to_buffer(elbc_fcm_ctrl, 0, 0, 0, 0);
+		io_to_buffer(elbc_fcm_ctrl, 0, 0, 0, 1);
+
+		for (i = 1; i < priv->page_size; i++) {
+			/*
+			 * Maybe there are some reasons of FCM hardware timming,
+			 * we must insert a FIR_OP_NOP(0x00) before FIR_OP_RB.
+			 */
+			out_be32(&lbc->fir, FIR_OP_RB << FIR_OP1_SHIFT);
+			out_be32(&lbc->fbcr, 0);
+			fsl_elbc_run_command(mtd);
+
+			io_to_buffer(elbc_fcm_ctrl, i, 0, 0, 0);
+			io_to_buffer(elbc_fcm_ctrl, i, 0, 0, 1);
+		}
+
 		return;
 
 	/* READOOB reads only the OOB because no ECC is performed. */
@@ -322,13 +384,31 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		         "fsl_elbc_cmdfunc: NAND_CMD_READOOB, page_addr:"
 			 " 0x%x, column: 0x%x.\n", page_addr, column);
 
-		out_be32(&lbc->fbcr, mtd->oobsize - column);
-		set_addr(mtd, column, page_addr, 1);
+		out_be32(&lbc->fbcr, 64);
+		set_addr(mtd, 0, page_addr, 1);
 
 		elbc_fcm_ctrl->read_bytes = mtd->writesize + mtd->oobsize;
+		elbc_fcm_ctrl->index += column;
 
 		fsl_elbc_do_read(chip, 1);
 		fsl_elbc_run_command(mtd);
+
+		if (priv->page_size <= 1)
+			return;
+
+		if (column < 64)
+			io_to_buffer(elbc_fcm_ctrl, 0, 0, 0, 1);
+
+		out_be32(&lbc->fpar, in_be32(&lbc->fpar) & ~FPAR_LP_MS);
+		for (i = 1; i < priv->page_size; i++) {
+			fsl_elbc_do_read(chip, 0);
+			out_be32(&lbc->fir, FIR_OP_RB << FIR_OP1_SHIFT);
+			out_be32(&lbc->fbcr, 2112);
+			fsl_elbc_run_command(mtd);
+
+			if (column < (64 * (i + 1)))
+				io_to_buffer(elbc_fcm_ctrl, i, 0, 0, 1);
+		}
 		return;
 
 	/* READID must read all 5 possible bytes while CEB is active */
@@ -396,7 +476,14 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		      (NAND_CMD_SEQIN    << FCR_CMD2_SHIFT) |
 		      (NAND_CMD_PAGEPROG << FCR_CMD3_SHIFT);
 
-		if (priv->page_size) {
+		if (priv->page_size > 1) {
+			/* writesize > 2048 */
+			out_be32(&lbc->fir,
+			         (FIR_OP_CM2 << FIR_OP0_SHIFT) |
+			         (FIR_OP_CA  << FIR_OP1_SHIFT) |
+			         (FIR_OP_PA  << FIR_OP2_SHIFT) |
+			         (FIR_OP_WB  << FIR_OP3_SHIFT));
+		} else if (priv->page_size) {
 			out_be32(&lbc->fir,
 			         (FIR_OP_CM2 << FIR_OP0_SHIFT) |
 			         (FIR_OP_CA  << FIR_OP1_SHIFT) |
@@ -453,8 +540,29 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 			full_page = 1;
 		}
 
+		if (priv->page_size > 1) {
+			buffer_to_io(elbc_fcm_ctrl, 0, 0, 0, 0);
+			buffer_to_io(elbc_fcm_ctrl, 0, 0, 0, 1);
+		}
+
 		fsl_elbc_run_command(mtd);
 
+		for (i = 1; i < priv->page_size; i++) {
+			elbc_fcm_ctrl->use_mdr = 1;
+			if (i == priv->page_size - 1)
+				out_be32(&lbc->fir,
+			                (FIR_OP_WB  << FIR_OP1_SHIFT) |
+			                (FIR_OP_CM3 << FIR_OP2_SHIFT) |
+			                (FIR_OP_CW1 << FIR_OP3_SHIFT) |
+			                (FIR_OP_RS  << FIR_OP4_SHIFT));
+			else
+				out_be32(&lbc->fir, FIR_OP_WB << FIR_OP1_SHIFT);
+			out_be32(&lbc->fbcr, 0);
+			buffer_to_io(elbc_fcm_ctrl, i, 0, 0, 0);
+			buffer_to_io(elbc_fcm_ctrl, i, 0, 0, 1);
+			fsl_elbc_run_command(mtd);
+		}
+
 		/* Read back the page in order to fill in the ECC for the
 		 * caller.  Is this really needed?
 		 */
@@ -541,7 +649,14 @@ static void fsl_elbc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
 		len = bufsize - elbc_fcm_ctrl->index;
 	}
 
-	memcpy_toio(&elbc_fcm_ctrl->addr[elbc_fcm_ctrl->index], buf, len);
+	if (mtd->writesize > 2048)
+		memcpy(&elbc_fcm_ctrl->buffer[elbc_fcm_ctrl->index],
+				buf, len);
+	else {
+		memcpy_toio(&elbc_fcm_ctrl->addr[elbc_fcm_ctrl->index],
+				buf, len);
+	}
+
 	/*
 	 * This is workaround for the weird elbc hangs during nand write,
 	 * Scott Wood says: "...perhaps difference in how long it takes a
@@ -587,7 +702,12 @@ static void fsl_elbc_read_buf(struct mtd_info *mtd, u8 *buf, int len)
 
 	avail = min((unsigned int)len,
 			elbc_fcm_ctrl->read_bytes - elbc_fcm_ctrl->index);
-	memcpy_fromio(buf, &elbc_fcm_ctrl->addr[elbc_fcm_ctrl->index], avail);
+	if (mtd->writesize > 2048)
+		memcpy(buf, &elbc_fcm_ctrl->buffer[elbc_fcm_ctrl->index],
+				avail);
+	else
+		memcpy_fromio(buf, &elbc_fcm_ctrl->addr[elbc_fcm_ctrl->index],
+				avail);
 	elbc_fcm_ctrl->index += avail;
 
 	if (len > avail)
@@ -623,10 +743,16 @@ static int fsl_elbc_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
 		return -EINVAL;
 	}
 
-	for (i = 0; i < len; i++)
-		if (in_8(&elbc_fcm_ctrl->addr[elbc_fcm_ctrl->index + i])
-				!= buf[i])
-			break;
+	if (mtd->writesize > 2048)
+		for (i = 0; i < len; i++)
+			if (elbc_fcm_ctrl->buffer[elbc_fcm_ctrl->index + i]
+					!= buf[i])
+				break;
+	else
+		for (i = 0; i < len; i++)
+			if (in_8(&elbc_fcm_ctrl->addr[elbc_fcm_ctrl->index + i])
+					!= buf[i])
+				break;
 
 	elbc_fcm_ctrl->index += len;
 	return i == len && elbc_fcm_ctrl->status == LTESR_CC ? 0 : -EIO;
@@ -655,6 +781,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	struct fsl_elbc_mtd *priv = chip->priv;
 	struct fsl_lbc_ctrl *ctrl = priv->ctrl;
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
+	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
 	unsigned int al;
 
 	/* calculate FMR Address Length field */
@@ -705,12 +832,17 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	dev_dbg(priv->dev, "fsl_elbc_init: mtd->oobsize = %d\n",
 	        mtd->oobsize);
 
+	kfree(elbc_fcm_ctrl->buffer);
+	elbc_fcm_ctrl->buffer = NULL;
+
 	/* adjust Option Register and ECC to match Flash page size */
 	if (mtd->writesize == 512) {
 		priv->page_size = 0;
 		clrbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
-	} else if (mtd->writesize == 2048) {
-		priv->page_size = 1;
+	} else if (mtd->writesize >= 2048) {
+		/* page_size = writesize / 2048 */
+		priv->page_size = mtd->writesize >> 11;
+
 		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
 		/* adjust ecc setup if needed */
 		if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
@@ -721,6 +853,15 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 			                   &fsl_elbc_oob_lp_eccm0;
 			chip->badblock_pattern = &largepage_memorybased;
 		}
+		elbc_fcm_ctrl->page_size = mtd->writesize;
+
+		/* re-malloc if pagesize > 2048*/
+		if (mtd->writesize > 2048) {
+			elbc_fcm_ctrl->buffer = kmalloc(mtd->writesize +
+						mtd->oobsize, GFP_KERNEL);
+			if (!elbc_fcm_ctrl->buffer)
+				return -ENOMEM;
+		}
 	} else {
 		dev_err(priv->dev,
 		        "fsl_elbc_init: page size %d is not supported\n",
@@ -888,6 +1029,17 @@ static int __devinit fsl_elbc_nand_probe(struct platform_device *pdev)
 			goto err;
 		}
 		elbc_fcm_ctrl->counter++;
+		/*
+		 * Freescale FCM controller has a 2K size limitation of buffer
+		 * RAM, so elbc_fcm_ctrl->buffer have to be used if writesize
+		 * of chip is greater than 2048.
+		 * We malloc a large enough buffer at this point, because we
+		 * don't know writesize before calling nand_scan(). We will
+		 * re-malloc later if needed.
+		 */
+		elbc_fcm_ctrl->buffer = kmalloc(4096 * 6, GFP_KERNEL);
+		if (!elbc_fcm_ctrl->buffer)
+			return -ENOMEM;
 
 		spin_lock_init(&elbc_fcm_ctrl->controller.lock);
 		init_waitqueue_head(&elbc_fcm_ctrl->controller.wq);
-- 
1.7.1
