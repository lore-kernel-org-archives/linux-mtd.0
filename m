Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeD3-0006pV-R6
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:52:58 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 27/46] mtd: nandsim: Add no_oob mode
Date: Wed, 21 Sep 2016 11:52:39 +0200
Message-Id: <841fb44617cbab08601de74159c374613d4b73a4.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

This allows using a nanddump image directly as file backend.
The use case is dumping without OOB from a real device,
startup nandsim with the same NAND ID an use the file.

That way NAND dumps can loaded into nandsim much faster
since no nandwrite is needed and, of course, less RAM is
consumed.

no_oob tells nandsim to not write nor read OOB data
from the backing file. If OOB data is requested it simply
returns 0xff.
This also means that no ECC is performed.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 66 ++++++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/nandsim.h |  1 +
 2 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 7a95802..c93d946 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -221,7 +221,7 @@ MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default val
 
 /* Calculate the page offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET(ns) \
-	(((ns)->regs.row * (ns)->geom.pgszoob) + (ns)->regs.column)
+	(((ns)->regs.row * ((ns)->no_oob ? (ns)->geom.pgsz : (ns)->geom.pgszoob)) + (ns)->regs.column)
 
 /* Calculate the OOB offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET_OOB(ns) (NS_RAW_OFFSET(ns) + ns->geom.pgsz)
@@ -360,6 +360,7 @@ struct nandsim {
                 int wp;  /* write Protect */
         } lines;
 
+	bool no_oob;
 	struct ns_backend_ops *bops;
 	void *backend_data;
 
@@ -1713,6 +1714,25 @@ static void ns_file_read_page(struct nandsim *ns, int num)
 
 	NS_DBG("read_page: page %d written, reading from %d\n",
 		ns->regs.row, ns->regs.column + ns->regs.off);
+
+	if (ns->no_oob) {
+		loff_t pg_read_end = ns->regs.column + ns->regs.off + num;
+
+		/* direct read from OOB */
+		if (ns->regs.column + ns->regs.off >= ns->geom.pgsz) {
+			memset(ns->buf.byte, 0xff, num);
+			return;
+		}
+
+		/* read overlapps into OOB, needs fixup */
+		if (pg_read_end > ns->geom.pgsz) {
+			loff_t oob_part = pg_read_end - ns->geom.pgsz;
+
+			memset(ns->buf.byte + pg_read_end - oob_part, 0xff, oob_part);
+			num -= oob_part;
+		}
+	}
+
 	pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 	tx = kernel_read(data->file, pos, ns->buf.byte, num);
 	if (tx == 0)
@@ -1756,14 +1776,15 @@ static void ns_file_erase_sector(struct nandsim *ns)
 	int i;
 	loff_t pos;
 	ssize_t tx;
+	unsigned int pagesz = ns->no_oob ? ns->geom.pgsz : ns->geom.pgszoob;
 	struct ns_file_data *data = ns->backend_data;
 
-	memset(data->file_buf, 0xff, ns->geom.pgszoob);
+	memset(data->file_buf, 0xff, pagesz);
 
 	for (i = 0; i < ns->geom.pgsec; i++) {
-		pos = (loff_t)(ns->regs.row + i) * ns->geom.pgszoob;
-		tx = kernel_write(data->file, data->file_buf, ns->geom.pgszoob, pos);
-		if (tx != ns->geom.pgszoob) {
+		pos = (loff_t)(ns->regs.row + i) * pagesz;
+		tx = kernel_write(data->file, data->file_buf, pagesz, pos);
+		if (tx != pagesz) {
 			NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 		}
 	}
@@ -1852,6 +1873,18 @@ static int ns_file_prog_page(struct nandsim *ns, int num)
 
 	NS_DBG("prog_page: writing page %d\n", ns->regs.row);
 
+	if (ns->no_oob) {
+		loff_t pg_write_end = ns->regs.column + ns->regs.off + num;
+
+		/* direct write into oob */
+		if (ns->regs.column + ns->regs.off >= ns->geom.pgsz)
+			return 0;
+
+		/* write overlapps into OOB, needs fixup */
+		if (pg_write_end > ns->geom.pgsz)
+			num -= pg_write_end - ns->geom.pgsz;
+	}
+
 	pg_off = data->file_buf + ns->regs.column + ns->regs.off;
 	off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 
@@ -2001,7 +2034,11 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 			return -1;
 		}
 
-		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
+		if (ns->no_oob)
+			num = ns->geom.pgsz - ns->regs.off - ns->regs.column;
+		else
+			num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
+
 		if (num != ns->regs.count) {
 			NS_ERR("do_state_action: too few bytes were input (%d instead of %d)\n",
 					ns->regs.count, num);
@@ -2535,6 +2572,7 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 	memcpy(nsparam->id_bytes, req->id_bytes, sizeof(nsparam->id_bytes));
 	nsparam->bus_width = req->bus_width;
 	nsparam->file_fd = req->file_fd;
+	nsparam->no_oob = !!req->no_oob;
 
 	switch (req->backend) {
 		case NANDSIM_BACKEND_RAM:
@@ -2716,8 +2754,6 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	chip->write_buf  = ns_nand_write_buf;
 	chip->read_buf   = ns_nand_read_buf;
 	chip->read_word  = ns_nand_read_word;
-	chip->ecc.mode   = NAND_ECC_SOFT;
-	chip->ecc.algo   = NAND_ECC_HAMMING;
 	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
 	/* and 'badblocks' parameters to work */
 	chip->options   |= NAND_SKIP_BBTSCAN;
@@ -2784,7 +2820,16 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		goto error;
 	}
 
-	if (nsparam->bch) {
+	if (nsparam->no_oob) {
+		if (nsparam->bch) {
+			NS_ERR("Cannot use ECC without OOB\n");
+			retval = -EINVAL;
+			goto error;
+		}
+
+		chip->ecc.mode = NAND_ECC_NONE;
+		nand->no_oob = true;
+	} else if (nsparam->bch) {
 		unsigned int eccsteps, eccbytes;
 		if (!mtd_nand_has_bch()) {
 			NS_ERR("BCH ECC support is disabled\n");
@@ -2811,6 +2856,9 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 		chip->ecc.strength = nsparam->bch;
 		chip->ecc.bytes = eccbytes;
 		NS_INFO("using %u-bit/%u bytes BCH ECC\n", nsparam->bch, chip->ecc.size);
+	} else {
+		chip->ecc.mode = NAND_ECC_SOFT;
+		chip->ecc.algo = NAND_ECC_HAMMING;
 	}
 
 	retval = nand_scan_tail(nsmtd);
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index d71a02f..05ac7e3 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -25,6 +25,7 @@ struct nandsim_params {
 	unsigned int bch;
 	unsigned char id_bytes[8];
 	unsigned int file_fd;
+	bool no_oob;
 	struct ns_backend_ops *bops;
 };
 
-- 
2.8.3
