Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcnXO-00034u-Al
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 12:27:18 -0500
Date: Thu, 17 Nov 2005 20:27:05 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Message-Id: <20051117202705.74a3b581.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] eliminate nand_{read,write}_oob_hwecc
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

below is the patch that gets rid of separate functions for reading/writing OOB in case of hardware ECC.
May I commit it to the CVS?

Patches coming soon are:
- reading/writing oobfree _only_ in read_oob/write_oob
- getting rid of nand_oobinfo (only oobfree length will be necessary).

Best regards,
   Vitaly

Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.155
diff -u -r1.155 nand_base.c
--- drivers/mtd/nand/nand_base.c	14 Nov 2005 06:45:25 -0000	1.155
+++ drivers/mtd/nand/nand_base.c	17 Nov 2005 17:06:02 -0000
@@ -113,7 +113,7 @@
 	.oobfree = { {2, 38} }
 };
 
-/* This is used for padding purposes in nand_write_oob/nand_write_oob_hwecc */
+/* This is used for padding purposes in nand_write_oob */
 #define FFCHARS_SIZE		2048
 static u_char ffchars[FFCHARS_SIZE];
 
@@ -1431,102 +1431,7 @@
  *
  * NAND read out-of-band data from the spare area
  */
-static int nand_read_oob (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * buf)
-{
-	int i, col, page, chipnr;
-	struct nand_chip *this = mtd->priv;
-	int	blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
-
-	DEBUG (MTD_DEBUG_LEVEL3, "nand_read_oob: from = 0x%08x, len = %i\n", (unsigned int) from, (int) len);
-
-	/* Shift to get page */
-	page = (int)(from >> this->page_shift);
-	chipnr = (int)(from >> this->chip_shift);
-
-	/* Mask to get column */
-	col = from & (mtd->oobsize - 1);
-
-	/* Initialize return length value */
-	*retlen = 0;
-
-	/* Do not allow reads past end of device */
-	if ((from + len) > mtd->size) {
-		DEBUG (MTD_DEBUG_LEVEL0, "nand_read_oob: Attempt read beyond end of device\n");
-		*retlen = 0;
-		return -EINVAL;
-	}
-
-	/* Grab the lock and see if the device is available */
-	nand_get_device (this, mtd , FL_READING);
-
-	/* Select the NAND device */
-	this->select_chip(mtd, chipnr);
-
-	/* Send the read command */
-	this->cmdfunc (mtd, NAND_CMD_READOOB, col, page & this->pagemask);
-	/*
-	 * Read the data, if we read more than one page
-	 * oob data, let the device transfer the data !
-	 */
-	i = 0;
-	while (i < len) {
-		int thislen = mtd->oobsize - col;
-		thislen = min_t(int, thislen, len);
-		this->read_buf(mtd, &buf[i], thislen);
-		i += thislen;
-
-		/* Read more ? */
-		if (i < len) {
-			page++;
-			col = 0;
-
-			/* Check, if we cross a chip boundary */
-			if (!(page & this->pagemask)) {
-				chipnr++;
-				this->select_chip(mtd, -1);
-				this->select_chip(mtd, chipnr);
-			}
-
-			/* Apply delay or wait for ready/busy pin
-			 * Do this before the AUTOINCR check, so no problems
-			 * arise if a chip which does auto increment
-			 * is marked as NOAUTOINCR by the board driver.
-			 */
-			if (!this->dev_ready)
-				udelay (this->chip_delay);
-			else
-				nand_wait_ready(mtd);
-
-			/* Check, if the chip supports auto page increment
-			 * or if we have hit a block boundary.
-			*/
-			if (!NAND_CANAUTOINCR(this) || !(page & blockcheck)) {
-				/* For subsequent page reads set offset to 0 */
-			        this->cmdfunc (mtd, NAND_CMD_READOOB, 0x0, page & this->pagemask);
-			}
-		}
-	}
-
-	/* Deselect and wake up anyone waiting on the device */
-	nand_release_device(mtd);
-
-	/* Return happy */
-	*retlen = len;
-	return 0;
-}
-
-/**
- * nand_read_oob_hwecc - [MTD Interface] NAND read out-of-band (HW ECC)
- * @mtd:	MTD device structure
- * @from:	offset to read from
- * @len:	number of bytes to read
- * @retlen:	pointer to variable to store the number of read bytes
- * @oob_buf:	the databuffer to put data
- *
- * NAND read out-of-band data from the spare area
- * W/o assumptions that are valid only for software ECC
- */
-static int nand_read_oob_hwecc (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * oob_buf)
+static int nand_read_oob (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * oob_buf)
 {
 
 	int i, j, col, realpage, page, end, ecc, chipnr, sndcmd = 1i, reallen = 0;
@@ -1561,106 +1466,118 @@
 
 	end = mtd->oobblock;
 	ecc = this->eccsize;
-
+	
 	/* Loop until all data read */
 	while (read < len) {
-		/* Check, if we must send the read command */
-		if (sndcmd) {
-			this->cmdfunc (mtd, NAND_CMD_READ0, 0x00, page);
-			sndcmd = 0;
-		}
-
-		eccsteps = this->eccsteps;
-
-		for (; eccsteps; eccsteps--) {
-			for (j = 0; this->layout[j].length; j++) {
-				i = 0;
-				switch (this->layout[j].type) {
-				case ITEM_TYPE_DATA:
-					DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
-					reallen += this->layout[j].length;
-					if (this->options & NAND_BUSWIDTH_16)
-						this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
-					else
-						this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
-					break;
-
-				case ITEM_TYPE_ECC:
-					DEBUG (MTD_DEBUG_LEVEL3, "%s: ecc bytes read\n", __FUNCTION__);
-					i = min_t(int, col, this->layout[j].length);
-					if (i) {
-						reallen += i;
-						if (this->options & NAND_BUSWIDTH_16)
+		if (this->eccmode == NAND_ECC_SOFT || this->eccmode == NAND_ECC_NONE) {
+			int thislen = mtd->oobsize - col;
+			if (sndcmd) {
+				this->cmdfunc (mtd, NAND_CMD_READOOB, col, page);
+				col = 0;
+				sndcmd = 0;
+			}	
+			thislen = min_t(int, thislen, len);
+			this->read_buf(mtd, &oob_buf[read], thislen);
+			read += thislen;
+		} else {
+			/* Check, if we must send the read command */
+			if (sndcmd) {
+				this->cmdfunc (mtd, NAND_CMD_READ0, 0x00, page);
+				sndcmd = 0;
+			}	
+
+			eccsteps = this->eccsteps;
+		
+			for (; eccsteps; eccsteps--) {
+				for (j = 0; this->layout[j].length; j++) {
+					i = 0;
+					switch (this->layout[j].type) {
+					case ITEM_TYPE_DATA:
+						DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
+						reallen += this->layout[j].length;
+						if (this->options & NAND_BUSWIDTH_16) 
 							this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
 						else
 							this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
-					}
-					col -= i;
-					i = min_t(int, len - read, this->layout[j].length - i);
-					this->enable_hwecc(mtd, NAND_ECC_READSYN);
-					if (i) {
-						if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
-							oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
-							oob_data++; i--; reallen++;
-						}
+						break;
 
-						this->read_buf(mtd, oob_data, i);
-						reallen += i;
-					}
-					if (oob_buf + len == oob_data + i) {
-						read += i;
-						goto out;
-					}
-					break;
-				case ITEM_TYPE_OOB:
-					DEBUG (MTD_DEBUG_LEVEL3, "%s: free oob bytes read\n", __FUNCTION__);
-					i = min_t(int, col, this->layout[j].length);
-					if (i) {
-						reallen += i;
-						if (this->options & NAND_BUSWIDTH_16)
-							this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
-						else
-							this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
-					}
-					col -= i;
+					case ITEM_TYPE_ECC:
+						DEBUG (MTD_DEBUG_LEVEL3, "%s: ecc bytes read\n", __FUNCTION__);
+						i = min_t(int, col, this->layout[j].length);
+						if (i) {
+							reallen += i;
+							if (this->options & NAND_BUSWIDTH_16) 
+								this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+							else
+								this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+						}
+						col -= i;
+						i = min_t(int, len - read, this->layout[j].length - i);
+						this->enable_hwecc(mtd, NAND_ECC_READSYN);
+						if (i) {
+							if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
+								oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+								oob_data++; i--; reallen++;
+							}
+								
+							this->read_buf(mtd, oob_data, i);
+							reallen += i;
+						}
+						if (oob_buf + len == oob_data + i) {
+							read += i;
+							goto out;
+						}
+						break;
+					case ITEM_TYPE_OOB:
+						DEBUG (MTD_DEBUG_LEVEL3, "%s: free oob bytes read\n", __FUNCTION__);
+						i = min_t(int, col, this->layout[j].length);
+						if (i) {
+							reallen += i;
+							if (this->options & NAND_BUSWIDTH_16) 
+								this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+							else
+								this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+						}
+						col -= i;
+					
+						this->enable_hwecc(mtd, NAND_ECC_READOOB);
+						i = min_t(int, len - read, this->layout[j].length - i);
+						if (i) {
+							if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
+								oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+								oob_data++; i--; reallen++;
+							}
 
-					this->enable_hwecc(mtd, NAND_ECC_READOOB);
-					i = min_t(int, len - read, this->layout[j].length - i);
-					if (i) {
-						if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
-							oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
-							oob_data++; i--; reallen++;
+							this->read_buf(mtd, oob_data, i);
+							reallen += i;
+						}
+						if (oob_buf + len == oob_data + i) {
+							read += i;
+							goto out;
 						}
 
-						this->read_buf(mtd, oob_data, i);
-						reallen += i;
-					}
-					if (oob_buf + len == oob_data + i) {
-						read += i;
-						goto out;
+						break;
 					}
+					read += i;
+					oob_data += i;
 
-					break;
 				}
-				read += i;
-				oob_data += i;
-
 			}
 		}
 out:
 
-		/* Apply delay or wait for ready/busy pin
+		/* Apply delay or wait for ready/busy pin 
 		 * Do this before the AUTOINCR check, so no problems
 		 * arise if a chip which does auto increment
 		 * is marked as NOAUTOINCR by the board driver.
 		*/
-		if (!this->dev_ready)
+		if (!this->dev_ready) 
 			udelay (this->chip_delay);
 		else
 			nand_wait_ready(mtd);
-
+			
 		if (read == len)
-			break;
+			break;	
 
 		/* For subsequent reads align to page boundary. */
 		reallen = col = 0;
@@ -1674,13 +1591,13 @@
 			this->select_chip(mtd, -1);
 			this->select_chip(mtd, chipnr);
 		}
-		/* Check, if the chip supports auto page increment
-		 * or if we have hit a block boundary.
-		*/
+		/* Check, if the chip supports auto page increment 
+		 * or if we have hit a block boundary. 
+		*/ 
 		if (!NAND_CANAUTOINCR(this) || !(page & blockcheck))
-			sndcmd = 1;
+			sndcmd = 1;				
 	}
-
+	
 	/* Deselect and wake up anyone waiting on the device */
 	nand_release_device(mtd);
 
@@ -1689,7 +1606,6 @@
 	 * Return success
 	 */
 	return 0;
-
 }
 
 
@@ -1995,109 +1911,7 @@
  *
  * NAND write out-of-band
  */
-static int nand_write_oob (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * buf)
-{
-	int column, page, status, ret = -EIO, chipnr;
-	struct nand_chip *this = mtd->priv;
-
-	DEBUG (MTD_DEBUG_LEVEL3, "nand_write_oob: to = 0x%08x, len = %i\n", (unsigned int) to, (int) len);
-
-	/* Shift to get page */
-	page = (int) (to >> this->page_shift);
-	chipnr = (int) (to >> this->chip_shift);
-
-	/* Mask to get column */
-	column = to & (mtd->oobsize - 1);
-
-	/* Initialize return length value */
-	*retlen = 0;
-
-	/* Do not allow write past end of page */
-	if ((column + len) > mtd->oobsize) {
-		DEBUG (MTD_DEBUG_LEVEL0, "nand_write_oob: Attempt to write past end of page\n");
-		return -EINVAL;
-	}
-
-	/* Grab the lock and see if the device is available */
-	nand_get_device (this, mtd, FL_WRITING);
-
-	/* Select the NAND device */
-	this->select_chip(mtd, chipnr);
-
-	/* Reset the chip. Some chips (like the Toshiba TC5832DC found
-	   in one of my DiskOnChip 2000 test units) will clear the whole
-	   data page too if we don't do this. I have no clue why, but
-	   I seem to have 'fixed' it in the doc2000 driver in
-	   August 1999.  dwmw2. */
-	this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
-
-	/* Check, if it is write protected */
-	if (nand_check_wp(mtd))
-		goto out;
-
-	/* Invalidate the page cache, if we write to the cached page */
-	if (page == this->pagebuf)
-		this->pagebuf = -1;
-
-	if (NAND_MUST_PAD(this)) {
-		/* Write out desired data */
-		this->cmdfunc (mtd, NAND_CMD_SEQIN, mtd->oobblock, page & this->pagemask);
-		/* prepad 0xff for partial programming */
-		this->write_buf(mtd, ffchars, column);
-		/* write data */
-		this->write_buf(mtd, buf, len);
-		/* postpad 0xff for partial programming */
-		this->write_buf(mtd, ffchars, mtd->oobsize - (len+column));
-	} else {
-		/* Write out desired data */
-		this->cmdfunc (mtd, NAND_CMD_SEQIN, mtd->oobblock + column, page & this->pagemask);
-		/* write data */
-		this->write_buf(mtd, buf, len);
-	}
-	/* Send command to program the OOB data */
-	this->cmdfunc (mtd, NAND_CMD_PAGEPROG, -1, -1);
-
-	status = this->waitfunc (mtd, this, FL_WRITING);
-
-	/* See if device thinks it succeeded */
-	if (status & NAND_STATUS_FAIL) {
-		DEBUG (MTD_DEBUG_LEVEL0, "nand_write_oob: " "Failed write, page 0x%08x\n", page);
-		ret = -EIO;
-		goto out;
-	}
-	/* Return happy */
-	*retlen = len;
-
-#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
-	/* Send command to read back the data */
-	this->cmdfunc (mtd, NAND_CMD_READOOB, column, page & this->pagemask);
-
-	if (this->verify_buf(mtd, buf, len)) {
-		DEBUG (MTD_DEBUG_LEVEL0, "nand_write_oob: " "Failed write verify, page 0x%08x\n", page);
-		ret = -EIO;
-		goto out;
-	}
-#endif
-	ret = 0;
-out:
-	/* Deselect and wake up anyone waiting on the device */
-	nand_release_device(mtd);
-
-	return ret;
-}
-
-/**
- * nand_write_oob_hwecc - [MTD Interface] NAND write out-of-band
- * @mtd:	MTD device structure
- * @to:		offset to write to
- * @len:	number of bytes to write
- * @retlen:	pointer to variable to store the number of written bytes
- * @oob_buf:	the data to write
- *
- * NAND write out-of-band
- * W/o assumptions that are valid only for software ECC
- */
-static int nand_write_oob_hwecc (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * oob_buf)
+static int nand_write_oob (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * oob_buf)
 {
 	int i, j, column, page, status, ret = -EIO, chipnr, eccsteps, ecclen, ooblen;
 	struct nand_chip *this = mtd->priv;
@@ -2136,44 +1950,62 @@
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd))
 		goto out;
-
+	
 	/* Invalidate the page cache, if we write to the cached page */
 	if (page == this->pagebuf)
 		this->pagebuf = -1;
 
-	/* Write out desired data */
-	this->cmdfunc (mtd, NAND_CMD_SEQIN, 0, page & this->pagemask);
-
-	eccsteps = this->eccsteps;
+	if (this->eccmode == NAND_ECC_SOFT || this->eccmode == NAND_ECC_NONE) {
+		if (NAND_MUST_PAD(this)) {
+			/* Write out desired data */
+			this->cmdfunc (mtd, NAND_CMD_SEQIN, mtd->oobblock, page & this->pagemask);
+			/* prepad 0xff for partial programming */
+			this->write_buf(mtd, ffchars, column);
+			/* write data */
+			this->write_buf(mtd, oob_buf, len);
+			/* postpad 0xff for partial programming */
+			this->write_buf(mtd, ffchars, mtd->oobsize - (len+column));
+		} else {
+			/* Write out desired data */
+			this->cmdfunc (mtd, NAND_CMD_SEQIN, mtd->oobblock + column, page & this->pagemask);
+			/* write data */
+			this->write_buf(mtd, oob_buf, len);
+		}
+	} else {
+		/* Write out desired data */
+		this->cmdfunc (mtd, NAND_CMD_SEQIN, 0, page & this->pagemask);
 
-	for (ecclen = 0, ooblen = 0; eccsteps; eccsteps--) {
-		for (j = 0; this->layout[j].length; j++) {
-			switch (this->layout[j].type) {
-			case ITEM_TYPE_DATA:
-				this->enable_hwecc(mtd, NAND_ECC_WRITE);
-				this->write_buf(mtd, ffchars, this->layout[j].length);
-				break;
+		eccsteps = this->eccsteps;
+		
+		for (ecclen = 0, ooblen = 0; eccsteps; eccsteps--) {
+			for (j = 0; this->layout[j].length; j++) {
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+					this->enable_hwecc(mtd, NAND_ECC_WRITE);
+					this->write_buf(mtd, ffchars, this->layout[j].length);
+					break;
 
-			case ITEM_TYPE_ECC:
-				this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
-				this->write_buf(mtd, ffchars, this->layout[j].length);
-				ecclen += this->layout[j].length;
-				break;
+				case ITEM_TYPE_ECC:
+					this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
+					this->write_buf(mtd, ffchars, this->layout[j].length);
+					ecclen += this->layout[j].length;
+					break;
 
-			case ITEM_TYPE_OOB:
-				this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
-				i = min_t(int, column, this->layout[j].length);
-				if (i)
-					this->write_buf(mtd, ffchars, i);
-				column -= i;
-				i = min_t(int, len + column - ooblen, this->layout[j].length - i);
-
-				if (i)
-					this->write_buf(mtd, &oob_buf[ooblen], i);
-				ooblen += i;
-				if (ooblen == len)
-					goto finish;
-				break;
+				case ITEM_TYPE_OOB:
+					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+					i = min_t(int, column, this->layout[j].length);
+					if (i)
+						this->write_buf(mtd, ffchars, i);
+					column -= i;
+					i = min_t(int, len + column - ooblen, this->layout[j].length - i);
+		
+					if (i)
+						this->write_buf(mtd, &oob_buf[ooblen], i);
+					ooblen += i;
+					if (ooblen == len)
+						goto finish;
+					break;
+				}
 			}
 		}
 	}
@@ -2193,6 +2025,16 @@
 	*retlen = len;
 
 #ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+	if (this->eccmode == NAND_ECC_SOFT | this->eccmode == NAND_ECC_NONE) {
+		/* Send command to read back the data */
+		this->cmdfunc (mtd, NAND_CMD_READOOB, column, page & this->pagemask);
+
+		if (this->verify_buf(mtd, buf, len)) {
+			DEBUG (MTD_DEBUG_LEVEL0, "nand_write_oob: " "Failed write verify, page 0x%08x\n", page);
+			ret = -EIO;
+			goto out;
+		}
+	}
 #warning "Verify for OOB data in HW ECC case is NOT YET implemented"
 #endif
 	ret = 0;
@@ -2203,6 +2045,7 @@
 	return ret;
 }
 
+
 /**
  * nand_writev - [MTD Interface] compabilty function for nand_writev_ecc
  * @mtd:	MTD device structure
@@ -2732,10 +2575,6 @@
 {
 	int i, nand_maf_id, nand_dev_id, busw, maf_id;
 	struct nand_chip *this = mtd->priv;
-	int hwecc = 1;
-
-	if (this->eccmode == NAND_ECC_NONE || this->eccmode == NAND_ECC_SOFT)
-			hwecc = 0;
 
 	/* Get buswidth to select the correct functions*/
 	busw = this->options & NAND_BUSWIDTH_16;
@@ -3117,8 +2956,8 @@
 	mtd->write = nand_write;
 	mtd->read_ecc = nand_read_ecc;
 	mtd->write_ecc = nand_write_ecc;
-	mtd->read_oob = hwecc ? nand_read_oob_hwecc : nand_read_oob;
-	mtd->write_oob = hwecc ? nand_write_oob_hwecc : nand_write_oob;
+	mtd->read_oob = nand_read_oob;
+	mtd->write_oob = nand_write_oob;
 	mtd->readv = NULL;
 	mtd->writev = nand_writev;
 	mtd->writev_ecc = nand_writev_ecc;
