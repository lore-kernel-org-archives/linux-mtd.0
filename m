Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FiT0c-0005yX-VL
	for linux-mtd@lists.infradead.org; Tue, 23 May 2006 05:17:07 -0400
Date: Tue, 23 May 2006 13:17:25 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20060523131725.7ff62773.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH] nand_base fix for 2k page chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folks,

given that a) layouts stuff is not yet accepted, b) I somehow need to make my NAND driver work and c) I want it to be in sync with mainline, I made an attempt to fix (data, oob, ecc) x4 handling for 2k page NAND devices. I appreciate very much if you take a look at that before I commit it to my tree and start bugging dwmw2 to fetch it from there :)

Vitaly

Index: mtd/drivers/mtd/nand/nand_base.c
===================================================================
--- mtd.orig/drivers/mtd/nand/nand_base.c
+++ mtd/drivers/mtd/nand/nand_base.c
@@ -905,26 +905,25 @@ static int nand_write_page(struct mtd_in
 	default:
 		eccbytes = this->eccbytes;
 		for (; eccsteps; eccsteps--) {
+			int oobofs = mtd->oobsize / this->eccsteps * (this->eccsteps - eccsteps);
 			/* enable hardware ecc logic for write */
 			this->enable_hwecc(mtd, NAND_ECC_WRITE);
 			this->write_buf(mtd, &this->data_poi[datidx], this->eccsize);
 			this->calculate_ecc(mtd, &this->data_poi[datidx], ecc_code);
-			for (i = 0; i < eccbytes; i++, eccidx++)
-				oob_buf[oob_config[eccidx]] = ecc_code[i];
+			for (i = 0, eccidx = 0; i < eccbytes; i++, eccidx++)
+				oob_buf[oobofs + oob_config[eccidx]] = ecc_code[i];
 			/* If the hardware ecc provides syndromes then
 			 * the ecc code must be written immidiately after
 			 * the data bytes (words) */
 			if (this->options & NAND_HWECC_SYNDROME)
-				this->write_buf(mtd, ecc_code, eccbytes);
+				this->write_buf(mtd, &oob_buf[oobofs], mtd->oobsize / this->eccsteps);
 			datidx += this->eccsize;
 		}
 		break;
 	}
 
 	/* Write out OOB data */
-	if (this->options & NAND_HWECC_SYNDROME)
-		this->write_buf(mtd, &oob_buf[oobsel->eccbytes], mtd->oobsize - oobsel->eccbytes);
-	else
+	if (!(this->options & NAND_HWECC_SYNDROME))
 		this->write_buf(mtd, oob_buf, mtd->oobsize);
 
 	/* Send command to actually program the data */
@@ -1232,7 +1231,7 @@ int nand_do_read_ecc(struct mtd_info *mt
 			break;
 
 		default:
-			for (i = 0, datidx = 0; eccsteps; eccsteps--, i += eccbytes, datidx += ecc) {
+			for (i = 0, j = 0, datidx = 0; eccsteps; eccsteps--, i += eccbytes, j += mtd->oobsize / this->eccsteps, datidx += ecc) {
 				this->enable_hwecc(mtd, NAND_ECC_READ);
 				this->read_buf(mtd, &data_poi[datidx], ecc);
 
@@ -1242,11 +1241,11 @@ int nand_do_read_ecc(struct mtd_info *mt
 					/* Some hw ecc generators need to know when the
 					 * syndrome is read from flash */
 					this->enable_hwecc(mtd, NAND_ECC_READSYN);
-					this->read_buf(mtd, &oob_data[i], eccbytes);
+					this->read_buf(mtd, &oob_data[j], mtd->oobsize / this->eccsteps);
 					/* We calc error correction directly, it checks the hw
 					 * generator for an error, reads back the syndrome and
 					 * does the error correction on the fly */
-					ecc_status = this->correct_data(mtd, &data_poi[datidx], &oob_data[i], &ecc_code[i]);
+					ecc_status = this->correct_data(mtd, &data_poi[datidx], &oob_data[j], &ecc_code[i]);
 					if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
 						DEBUG(MTD_DEBUG_LEVEL0, "nand_read_ecc: "
 						      "Failed ECC read, page 0x%08x on chip %d\n", page, chipnr);
@@ -1259,13 +1258,12 @@ int nand_do_read_ecc(struct mtd_info *mt
 			break;
 		}
 
-		/* read oobdata */
-		this->read_buf(mtd, &oob_data[mtd->oobsize - oobreadlen], oobreadlen);
-
 		/* Skip ECC check, if not requested (ECC_NONE or HW_ECC with syndromes) */
 		if (!compareecc)
 			goto readoob;
 
+		/* read oobdata */
+		this->read_buf(mtd, &oob_data[mtd->oobsize - oobreadlen], oobreadlen);
 		/* Pick the ECC bytes out of the oob data */
 		for (j = 0; j < oobsel->eccbytes; j++)
 			ecc_code[j] = oob_data[oob_config[j]];
@@ -1380,7 +1378,7 @@ int nand_do_read_ecc(struct mtd_info *mt
  */
 static int nand_read_oob(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-	int i, col, page, chipnr;
+	int i, col, page, chipnr, sndcmd = 1;
 	struct nand_chip *this = mtd->priv;
 	int blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
 
@@ -1409,19 +1407,39 @@ static int nand_read_oob(struct mtd_info
 	/* Select the NAND device */
 	this->select_chip(mtd, chipnr);
 
-	/* Send the read command */
-	this->cmdfunc(mtd, NAND_CMD_READOOB, col, page & this->pagemask);
 	/*
 	 * Read the data, if we read more than one page
 	 * oob data, let the device transfer the data !
 	 */
 	i = 0;
 	while (i < len) {
-		int thislen = mtd->oobsize - col;
-		thislen = min_t(int, thislen, len);
-		this->read_buf(mtd, &buf[i], thislen);
-		i += thislen;
+		if (this->options & NAND_HWECC_SYNDROME) {
+			int thislen;
+			int eccsteps = this->eccsteps;
+			for (; eccsteps; eccsteps--) {
+				int oobofs = (mtd->oobsize + mtd->oobblock) / this->eccsteps * (this->eccsteps - eccsteps) + this->eccsize;
+				if (col >= mtd->oobsize / this->eccsteps) {
+					col -= mtd->oobsize / this->eccsteps;
+					goto next;
+				}
+				this->cmdfunc (mtd, NAND_CMD_READ0, oobofs + col, page & this->pagemask);
+				thislen = min_t(int, mtd->oobsize / this->eccsteps  - col, len);
+				this->read_buf(mtd, &buf[i], thislen);
+				i += thislen;
+				col = 0;
+			}
+		} else {
+			int thislen = mtd->oobsize - col;
+			thislen = min_t(int, thislen, len);
+			if (sndcmd) {
+				this->cmdfunc(mtd, NAND_CMD_READOOB, col, page &this->pagemask);
+				sndcmd = 0;
+			}
+			this->read_buf(mtd, &buf[i], thislen);
+			i += thislen;
+		}
 
+next:
 		/* Read more ? */
 		if (i < len) {
 			page++;
@@ -1447,10 +1465,8 @@ static int nand_read_oob(struct mtd_info
 			/* Check, if the chip supports auto page increment
 			 * or if we have hit a block boundary.
 			 */
-			if (!NAND_CANAUTOINCR(this) || !(page & blockcheck)) {
-				/* For subsequent page reads set offset to 0 */
-				this->cmdfunc(mtd, NAND_CMD_READOOB, 0x0, page & this->pagemask);
-			}
+			if (!NAND_CANAUTOINCR(this) || !(page & blockcheck))
+				sndcmd = 1;
 		}
 	}
 
@@ -1803,7 +1819,49 @@ static int nand_write_oob(struct mtd_inf
 	if (page == this->pagebuf)
 		this->pagebuf = -1;
 
-	if (NAND_MUST_PAD(this)) {
+	if (this->options & NAND_HWECC_SYNDROME) {
+		int thislen, totlen = 0;
+		int eccsteps = this->eccsteps;
+		for (; eccsteps; eccsteps--) {
+			int oobofs = (mtd->oobsize + mtd->oobblock) / this->eccsteps * (this->eccsteps - eccsteps) + this->eccsize;
+			if (column >= mtd->oobsize / this->eccsteps) {
+				column -= mtd->oobsize / this->eccsteps;
+				continue;
+			}
+			if (NAND_MUST_PAD(this)) {
+				this->cmdfunc (mtd, NAND_CMD_SEQIN, oobofs, page & this->pagemask);
+				/* prepad 0xff for partial programming */
+				this->write_buf(mtd, ffchars, column);
+				thislen = min_t(int, mtd->oobsize / this->eccsteps  - column, len);
+				this->write_buf(mtd, &buf[totlen], thislen);
+				totlen += thislen;
+				/* postpad 0xff for partial programming */
+				if (totlen == thislen)
+					this->write_buf(mtd, ffchars, mtd->oobsize / this->eccsteps  - column - thislen);
+				column = 0;
+			} else {
+				this->cmdfunc (mtd, NAND_CMD_SEQIN, oobofs + column, page & this->pagemask);
+				thislen = min_t(int, mtd->oobsize / this->eccsteps  - column, len);
+				this->write_buf(mtd, &buf[totlen], thislen);
+				totlen += thislen;
+				column = 0;
+			}
+			if (totlen == len)
+				break;
+			else {
+				/* Send command to program the OOB data */
+				this->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+				status = this->waitfunc(mtd, this, FL_WRITING);
+
+				/* See if device thinks it succeeded */
+				if (status & NAND_STATUS_FAIL) {
+					DEBUG(MTD_DEBUG_LEVEL0, "nand_write_oob: " "Failed write, page 0x%08x\n", page);
+					ret = -EIO;
+					goto out;
+				}
+			}
+		}
+	} else	if (NAND_MUST_PAD(this)) {
 		/* Write out desired data */
 		this->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->oobblock, page & this->pagemask);
 		/* prepad 0xff for partial programming */
