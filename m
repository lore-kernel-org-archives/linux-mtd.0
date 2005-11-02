Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EXJCk-0007bS-Ed
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2005 09:03:17 -0500
Date: Wed, 2 Nov 2005 17:03:25 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-Id: <20051102170325.568b4130.vwool@ru.mvista.com>
In-Reply-To: <20051018160445.1ab94549.vwool@ru.mvista.com>
References: <20051018160445.1ab94549.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] more flexible HW ECC support for nand_base: version 4
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

below is the new version of the patch introducing layout-based handling of the NAND flash pages.
Now it 
- properly generates layout for the page basing on the eccbytes/eccsize;
- doesn't do additional kmalloc's 
- uses one 'ffchars' throughout the code 
- was verified on i.MX targets

Best regards,
   Vitaly

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>
Description:
    Enables support in MTD for complex NAND page layouts for hardware ECC
    calculation

Index: linux-2.6.10.my/drivers/mtd/nand/nand_base.c
===================================================================
--- linux-2.6.10.my.orig/drivers/mtd/nand/nand_base.c
+++ linux-2.6.10.my/drivers/mtd/nand/nand_base.c
@@ -111,18 +111,47 @@ static struct nand_oobinfo nand_oob_64 =
 	.oobfree = { {2, 38} }
 };
 
-/* This is used for padding purposes in nand_write_oob */
-static u_char ffchars[] = {
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+/* This is used for padding purposes in nand_write_oob/nand_write_oob_hwecc */
+#define FFCHARS_SIZE		2048
+static u_char ffchars[FFCHARS_SIZE];
+
+static struct page_layout_item hw3_256_layout[] = {
+	{ .length = 256, .type = ITEM_TYPE_DATA, },
+	{ .length = 3, .type = ITEM_TYPE_ECC, },
+	{ .length = 5, .type = ITEM_TYPE_OOB, },
+	{ .length = 0, },
 };
 
+static struct page_layout_item hw3_512_layout[] = {
+	{ .length = 512, .type = ITEM_TYPE_DATA, },
+	{ .length = 3, .type = ITEM_TYPE_ECC, },
+	{ .length = 13, .type = ITEM_TYPE_OOB, },
+	{ .length = 0, },
+};
+
+static struct page_layout_item hw6_512_layout[] = {
+	{ .length = 512, .type = ITEM_TYPE_DATA, },
+	{ .length = 6, .type = ITEM_TYPE_ECC, },
+	{ .length = 10, .type = ITEM_TYPE_OOB, },
+	{ .length = 0, },
+};
+
+static struct page_layout_item hw8_512_layout[] = {
+	{ .length = 512, .type = ITEM_TYPE_DATA, },
+	{ .length = 8, .type = ITEM_TYPE_ECC, },
+	{ .length = 8, .type = ITEM_TYPE_OOB, },
+	{ .length = 0, },
+};
+
+static struct page_layout_item hw12_2048_layout[] = {
+	{ .length = 2048, .type = ITEM_TYPE_DATA, },
+	{ .length = 12, .type = ITEM_TYPE_ECC, },
+	{ .length = 52, .type = ITEM_TYPE_OOB, },
+	{ .length = 0, },
+};
+
+#define HW_AUTOOOB_LAYOUT_SIZE		8 /* should be enough */
+
 /*
  * NAND low-level MTD interface functions
  */
@@ -416,7 +445,7 @@ static int nand_block_bad(struct mtd_inf
 	int page, chipnr, res = 0;
 	struct nand_chip *this = mtd->priv;
 	u16 bad;
-
+	
 	if (getchip) {
 		page = (int)(ofs >> this->page_shift);
 		chipnr = (int)(ofs >> this->chip_shift);
@@ -446,7 +475,7 @@ static int nand_block_bad(struct mtd_inf
 		/* Deselect and wake up anyone waiting on the device */
 		nand_release_device(mtd);
 	}	
-	
+
 	return res;
 }
 
@@ -862,7 +891,7 @@ static int nand_write_page (struct mtd_i
 	u_char *oob_buf,  struct nand_oobinfo *oobsel, int cached)
 {
 	int 	i, status;
-	u_char	ecc_code[32];
+	u_char	ecc_code[40];
 	int	eccmode = oobsel->useecc ? this->eccmode : NAND_ECC_NONE;
 	int  	*oob_config = oobsel->eccpos;
 	int	datidx = 0, eccidx = 0, eccsteps = this->eccsteps;
@@ -891,32 +920,42 @@ static int nand_write_page (struct mtd_i
 			datidx += this->eccsize;
 		}
 		this->write_buf(mtd, this->data_poi, mtd->oobblock);
+		this->write_buf(mtd, oob_buf, mtd->oobsize);
 		break;
 	default:
 		eccbytes = this->eccbytes;
-		for (; eccsteps; eccsteps--) {
-			/* enable hardware ecc logic for write */
-			this->enable_hwecc(mtd, NAND_ECC_WRITE);
-			this->write_buf(mtd, &this->data_poi[datidx], this->eccsize);
-			this->calculate_ecc(mtd, &this->data_poi[datidx], ecc_code);
-			for (i = 0; i < eccbytes; i++, eccidx++)
-				oob_buf[oob_config[eccidx]] = ecc_code[i];
-			/* If the hardware ecc provides syndromes then
-			 * the ecc code must be written immidiately after
-			 * the data bytes (words) */
-			if (this->options & NAND_HWECC_SYNDROME)
-				this->write_buf(mtd, ecc_code, eccbytes);
-			datidx += this->eccsize;
+		for (i = 0; eccsteps; eccsteps--) {
+			int j = 0, last_datidx = datidx, last_i = i;
+			for (; this->layout[j].length; j++) {
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+					this->enable_hwecc(mtd, NAND_ECC_WRITE);
+					this->write_buf(mtd, &this->data_poi[datidx], this->layout[j].length);
+					datidx += this->layout[j].length;
+					break;
+				case ITEM_TYPE_ECC:
+					this->enable_hwecc(mtd, NAND_ECC_WRITESYN); /* XXX: only for syndrome? */
+					this->calculate_ecc(mtd, &this->data_poi[last_datidx], &ecc_code[i]);
+					for (; i < last_i + this->layout[j].length; i++, eccidx++)
+						oob_buf[oob_config[eccidx]] = ecc_code[i];
+					/* If the hardware ecc provides syndromes then
+					 * the ecc code must be written immidiately after
+					 * the data bytes (words) */
+					if (this->options & NAND_HWECC_SYNDROME)
+						this->write_buf(mtd, ecc_code, this->layout[j].length);
+					break;
+				case ITEM_TYPE_OOB:
+					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+					this->write_buf(mtd, &oob_buf[i], this->layout[j].length);
+					i += this->layout[j].length;
+					break;
+				}
+			}
+					
 		}
 		break;
 	}
 										
-	/* Write out OOB data */
-	if (this->options & NAND_HWECC_SYNDROME)
-		this->write_buf(mtd, &oob_buf[oobsel->eccbytes], mtd->oobsize - oobsel->eccbytes);
-	else 
-		this->write_buf(mtd, oob_buf, mtd->oobsize);
-
 	/* Send command to actually program the data */
 	this->cmdfunc (mtd, cached ? NAND_CMD_CACHEDPROG : NAND_CMD_PAGEPROG, -1, -1);
 
@@ -1118,8 +1157,8 @@ int nand_do_read_ecc (struct mtd_info *m
 	int read = 0, oob = 0, ecc_status = 0, ecc_failed = 0;
 	struct nand_chip *this = mtd->priv;
 	u_char *data_poi, *oob_data = oob_buf;
-	u_char ecc_calc[32];
-	u_char ecc_code[32];
+	u_char ecc_calc[40];
+	u_char ecc_code[40];
         int eccmode, eccsteps;
 	int	*oob_config, datidx;
 	int	blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
@@ -1223,39 +1262,57 @@ int nand_do_read_ecc (struct mtd_info *m
 			this->read_buf(mtd, data_poi, end);
 			for (i = 0, datidx = 0; eccsteps; eccsteps--, i+=3, datidx += ecc) 
 				this->calculate_ecc(mtd, &data_poi[datidx], &ecc_calc[i]);
+			this->read_buf(mtd, &oob_data[mtd->oobsize - oobreadlen], oobreadlen);
 			break;	
 
 		default:
-			for (i = 0, datidx = 0; eccsteps; eccsteps--, i+=eccbytes, datidx += ecc) {
-				this->enable_hwecc(mtd, NAND_ECC_READ);
-				this->read_buf(mtd, &data_poi[datidx], ecc);
-
-				/* HW ecc with syndrome calculation must read the
-				 * syndrome from flash immidiately after the data */
-				if (!compareecc) {
-					/* Some hw ecc generators need to know when the
-					 * syndrome is read from flash */
-					this->enable_hwecc(mtd, NAND_ECC_READSYN);
-					this->read_buf(mtd, &oob_data[i], eccbytes);
-					/* We calc error correction directly, it checks the hw
-					 * generator for an error, reads back the syndrome and
-					 * does the error correction on the fly */
-					ecc_status = this->correct_data(mtd, &data_poi[datidx], &oob_data[i], &ecc_code[i]);
-					if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
-						DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: " 
-							"Failed ECC read, page 0x%08x on chip %d\n", page, chipnr);
-						ecc_failed++;
+			for (i = 0, datidx = 0; eccsteps; eccsteps--) {
+				int last_datidx = datidx, last_i = i;
+				for (j = 0; this->layout[j].length; j++) {
+					switch (this->layout[j].type) {
+					case ITEM_TYPE_DATA:
+						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d bytes of data\n", __FUNCTION__, this->layout[j].length);
+						this->enable_hwecc(mtd, NAND_ECC_READ);
+						this->read_buf(mtd, &data_poi[datidx], this->layout[j].length);
+						datidx += this->layout[j].length;
+						break;
+
+					case ITEM_TYPE_ECC:
+						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d ecc bytes\n", __FUNCTION__, this->layout[j].length);
+						/* HW ecc with syndrome calculation must read the
+						 * syndrome from flash immidiately after the data */
+						if (!compareecc) {
+							this->enable_hwecc(mtd, NAND_ECC_READSYN);
+							this->read_buf(mtd, &oob_data[i], this->layout[j].length);
+
+							/* We calc error correction directly, it checks the hw
+							 * generator for an error, reads back the syndrome and
+							 * does the error correction on the fly */
+							ecc_status = this->correct_data(mtd, &data_poi[last_datidx], &oob_data[last_i], &ecc_code[last_i]);
+							if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
+								DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: " 
+									"Failed ECC read, page 0x%08x on chip %d\n", page, chipnr);
+								ecc_failed++;
+							}
+							i += this->layout[j].length;
+						} else {
+							this->calculate_ecc(mtd, &data_poi[last_datidx], &ecc_calc[last_i]);
+							i += this->layout[j].length;
+						}
+						break;
+					case ITEM_TYPE_OOB:
+						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d free oob bytes\n", __FUNCTION__, this->layout[j].length);
+						this->enable_hwecc(mtd, NAND_ECC_READOOB);
+
+						this->read_buf(mtd, &oob_data[i], this->layout[j].length);
+						i += this->layout[j].length;
+						break;
 					}
-				} else {
-					this->calculate_ecc(mtd, &data_poi[datidx], &ecc_calc[i]);
-				}	
+				}
 			}
 			break;						
 		}
 
-		/* read oobdata */
-		this->read_buf(mtd, &oob_data[mtd->oobsize - oobreadlen], oobreadlen);
-
 		/* Skip ECC check, if not requested (ECC_NONE or HW_ECC with syndromes) */
 		if (!compareecc)
 			goto readoob;	
@@ -1457,6 +1514,184 @@ static int nand_read_oob (struct mtd_inf
 }
 
 /**
+ * nand_read_oob_hwecc - [MTD Interface] NAND read out-of-band (HW ECC)
+ * @mtd:	MTD device structure
+ * @from:	offset to read from
+ * @len:	number of bytes to read
+ * @retlen:	pointer to variable to store the number of read bytes
+ * @oob_buf:	the databuffer to put data
+ *
+ * NAND read out-of-band data from the spare area
+ * W/o assumptions that are valid only for software ECC
+ */
+static int nand_read_oob_hwecc (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * oob_buf)
+{
+
+	int i, j, col, realpage, page, end, ecc, chipnr, sndcmd = 1i, reallen = 0;
+	int read = 0;
+	struct nand_chip *this = mtd->priv;
+	u_char *oob_data = oob_buf;
+        int 	eccsteps;
+	int	blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
+
+
+	DEBUG (MTD_DEBUG_LEVEL3, "%s: from = 0x%08x, len = %i\n", __FUNCTION__, (unsigned int) from, (int) len);
+
+	/* Do not allow reads past end of device */
+	if ((from + len) > mtd->size) {
+		*retlen = 0;
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	nand_get_device (this, mtd, FL_READING);
+
+	/* Select the NAND device */
+	chipnr = (int)(from >> this->chip_shift);
+	this->select_chip(mtd, chipnr);
+
+	/* First we calculate the starting page */
+	realpage = (int) (from >> this->page_shift);
+	page = realpage & this->pagemask;
+
+	/* Get raw starting column */
+	col = from & (mtd->oobblock - 1);
+
+	end = mtd->oobblock;
+	ecc = this->eccsize;
+	
+	/* Loop until all data read */
+	while (read < len) {
+		/* Check, if we must send the read command */
+		if (sndcmd) {
+			this->cmdfunc (mtd, NAND_CMD_READ0, 0x00, page);
+			sndcmd = 0;
+		}	
+
+		eccsteps = this->eccsteps;
+		
+		for (; eccsteps; eccsteps--) {
+			for (j = 0; this->layout[j].length; j++) {
+				i = 0;
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
+					reallen += this->layout[j].length;
+					if (this->options & NAND_BUSWIDTH_16) 
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+					else
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					break;
+
+				case ITEM_TYPE_ECC:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: ecc bytes read\n", __FUNCTION__);
+					i = min_t(int, col, this->layout[j].length);
+					if (i) {
+						reallen += i;
+						if (this->options & NAND_BUSWIDTH_16) 
+							this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+						else
+							this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					}
+					col -= i;
+					i = min_t(int, len - read, this->layout[j].length - i);
+					this->enable_hwecc(mtd, NAND_ECC_READSYN);
+					if (i) {
+						if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
+							oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+							oob_data++; i--; reallen++;
+						}
+							
+						this->read_buf(mtd, oob_data, i);
+						reallen += i;
+					}
+					if (oob_buf + len == oob_data + i) {
+						read += i;
+						goto out;
+					}
+					break;
+				case ITEM_TYPE_OOB:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: free oob bytes read\n", __FUNCTION__);
+					i = min_t(int, col, this->layout[j].length);
+					if (i) {
+						reallen += i;
+						if (this->options & NAND_BUSWIDTH_16) 
+							this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+						else
+							this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					}
+					col -= i;
+					
+					this->enable_hwecc(mtd, NAND_ECC_READOOB);
+					i = min_t(int, len - read, this->layout[j].length - i);
+					if (i) {
+						if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
+							oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+							oob_data++; i--; reallen++;
+						}
+
+						this->read_buf(mtd, oob_data, i);
+						reallen += i;
+					}
+					if (oob_buf + len == oob_data + i) {
+						read += i;
+						goto out;
+					}
+
+					break;
+				}
+				read += i;
+				oob_data += i;
+
+			}
+		}		
+out:
+
+		/* Apply delay or wait for ready/busy pin 
+		 * Do this before the AUTOINCR check, so no problems
+		 * arise if a chip which does auto increment
+		 * is marked as NOAUTOINCR by the board driver.
+		*/
+		if (!this->dev_ready) 
+			udelay (this->chip_delay);
+		else
+			nand_wait_ready(mtd);
+			
+		if (read == len)
+			break;	
+
+		/* For subsequent reads align to page boundary. */
+		reallen = col = 0;
+		/* Increment page address */
+		realpage++;
+
+		page = realpage & this->pagemask;
+		/* Check, if we cross a chip boundary */
+		if (!page) {
+			chipnr++;
+			this->select_chip(mtd, -1);
+			this->select_chip(mtd, chipnr);
+		}
+		/* Check, if the chip supports auto page increment 
+		 * or if we have hit a block boundary. 
+		*/ 
+		if (!NAND_CANAUTOINCR(this) || !(page & blockcheck))
+			sndcmd = 1;				
+	}
+	
+	/* Deselect and wake up anyone waiting on the device */
+	nand_release_device(mtd);
+
+	*retlen = read;
+	/*
+	 * Return success
+	 */
+	return 0;
+
+}
+
+
+/**
  * nand_read_raw - [GENERIC] Read raw data including oob into buffer
  * @mtd:	MTD device structure
  * @buf:	temporary buffer
@@ -1848,6 +2083,122 @@ out:
 	return ret;
 }
 
+/**
+ * nand_write_oob_hwecc - [MTD Interface] NAND write out-of-band
+ * @mtd:	MTD device structure
+ * @to:		offset to write to
+ * @len:	number of bytes to write
+ * @retlen:	pointer to variable to store the number of written bytes
+ * @oob_buf:	the data to write
+ *
+ * NAND write out-of-band
+ * W/o assumptions that are valid only for software ECC
+ */
+static int nand_write_oob_hwecc (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * oob_buf)
+{
+	int i, j, column, page, status, ret = -EIO, chipnr, eccsteps, ecclen, ooblen;
+	struct nand_chip *this = mtd->priv;
+
+	DEBUG (MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n", __FUNCTION__, (unsigned int) to, (int) len);
+
+	/* Shift to get page */
+	page = (int) (to >> this->page_shift);
+	chipnr = (int) (to >> this->chip_shift);
+
+	/* Mask to get column */
+	column = to & (mtd->oobsize - 1);
+
+	/* Initialize return length value */
+	*retlen = 0;
+
+	/* Do not allow write past end of page */
+	if ((column + len) > mtd->oobsize) {
+		DEBUG (MTD_DEBUG_LEVEL0, "%s: Attempt to write past end of page\n", __FUNCTION__);
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	nand_get_device (this, mtd, FL_WRITING);
+
+	/* Select the NAND device */
+	this->select_chip(mtd, chipnr);
+
+	/* Reset the chip. Some chips (like the Toshiba TC5832DC found
+	   in one of my DiskOnChip 2000 test units) will clear the whole
+	   data page too if we don't do this. I have no clue why, but
+	   I seem to have 'fixed' it in the doc2000 driver in
+	   August 1999.  dwmw2. */
+	this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+
+	/* Check, if it is write protected */
+	if (nand_check_wp(mtd))
+		goto out;
+	
+	/* Invalidate the page cache, if we write to the cached page */
+	if (page == this->pagebuf)
+		this->pagebuf = -1;
+
+	/* Write out desired data */
+	this->cmdfunc (mtd, NAND_CMD_SEQIN, 0, page & this->pagemask);
+
+	eccsteps = this->eccsteps;
+		
+	for (ecclen = 0, ooblen = 0; eccsteps; eccsteps--) {
+		for (j = 0; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_DATA:
+				this->enable_hwecc(mtd, NAND_ECC_WRITE);
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				break;
+
+			case ITEM_TYPE_ECC:
+				this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				ecclen += this->layout[j].length;
+				break;
+
+			case ITEM_TYPE_OOB:
+				this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+				i = min_t(int, column, this->layout[j].length);
+				if (i)
+					this->write_buf(mtd, ffchars, i);
+				column -= i;
+				i = min_t(int, len + column - ooblen, this->layout[j].length - i);
+				
+				if (i)
+					this->write_buf(mtd, &oob_buf[ooblen], i);
+				ooblen += i;
+				if (ooblen == len)
+					goto finish;
+				break;
+			}
+		}
+	}
+finish:
+	/* Send command to program the OOB data */
+	this->cmdfunc (mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	status = this->waitfunc (mtd, this, FL_WRITING);
+
+	/* See if device thinks it succeeded */
+	if (status & NAND_STATUS_FAIL) {
+		DEBUG (MTD_DEBUG_LEVEL0, "%s: Failed write, page 0x%08x\n", __FUNCTION__, page);
+		ret = -EIO;
+		goto out;
+	}
+	/* Return happy */
+	*retlen = len;
+
+#ifdef CONFIG_MTD_NAND_VERIFY_WRITE
+#warning "Verify for OOB data in HW ECC case is NOT YET implemented"
+#endif
+	ret = 0;
+out:
+	/* Deselect and wake up anyone waiting on the device */
+	nand_release_device(mtd);
+
+	return ret;
+}
 
 /**
  * nand_writev - [MTD Interface] compabilty function for nand_writev_ecc
@@ -2316,6 +2667,51 @@ static void nand_resume(struct mtd_info 
 
 }
 
+static int fill_autooob_layout(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd->priv;
+	struct nand_oobinfo *oob = this->autooob;
+	int datasize = mtd->oobblock / this->eccsteps;
+	int i = 0, res = 0;
+	int eccpos = 0, eccbytes = 0, cur = 0;
+
+	this->layout = kmalloc(HW_AUTOOOB_LAYOUT_SIZE * sizeof (struct page_layout_item), GFP_KERNEL);
+
+	if (this->layout == NULL)
+		return -ENOMEM;
+	else
+		this->layout_allocated = 1;
+
+	while (i < HW_AUTOOOB_LAYOUT_SIZE - 1 &&
+		cur < (mtd->oobsize + mtd->oobblock) / this->eccsteps - 1) {
+		if (cur == 0) {
+			this->layout[i].type = ITEM_TYPE_DATA;
+			this->layout[i].length = datasize;
+		} else if (oob->eccpos[eccpos] == cur - datasize) {
+			int eccpos_cur = eccpos;
+			do  {
+				eccpos++;
+				eccbytes++;
+			} while (eccbytes < oob->eccbytes / this->eccsteps && oob->eccpos[eccpos] == oob->eccpos[eccpos+1] - 1);
+			eccpos++;
+			eccbytes++;
+			this->layout[i].type = ITEM_TYPE_ECC;
+			this->layout[i].length = eccpos - eccpos_cur;
+		} else {
+			this->layout[i].type = ITEM_TYPE_OOB;
+			if (eccbytes < oob->eccbytes / this->eccsteps)
+				this->layout[i].length = datasize - cur + oob->eccpos[eccpos];
+			else
+				this->layout[i].length = mtd->oobsize / this->eccsteps - (cur - datasize); 
+		}
+		cur += this->layout[i].length;
+		i++;
+	}
+	if (cur < (mtd->oobsize + mtd->oobblock) / this->eccsteps - 1)
+		res = -1;
+
+	return res;
+}
 
 /**
  * nand_scan - [NAND Interface] Scan for the NAND device
@@ -2333,6 +2729,10 @@ int nand_scan (struct mtd_info *mtd, int
 {
 	int i, nand_maf_id, nand_dev_id, busw, maf_id;
 	struct nand_chip *this = mtd->priv;
+	int hwecc = 1;
+	
+	if (this->eccmode == NAND_ECC_NONE || this->eccmode == NAND_ECC_SOFT)
+			hwecc = 0;
 
 	/* Get buswidth to select the correct functions*/
 	busw = this->options & NAND_BUSWIDTH_16;
@@ -2372,6 +2772,9 @@ int nand_scan (struct mtd_info *mtd, int
 	if (!this->scan_bbt)
 		this->scan_bbt = nand_default_bbt;
 
+	/* 'ff' the ffchars */
+	memset(ffchars, 0xff, FFCHARS_SIZE);
+
 	/* Select the device */
 	this->select_chip(mtd, 0);
 
@@ -2646,6 +3049,49 @@ int nand_scan (struct mtd_info *mtd, int
 		break;
 	}
 	
+	switch (this->eccmode) {
+	case NAND_ECC_HW12_2048:
+		this->eccbytes += 4;
+	case NAND_ECC_HW8_512: 
+		this->eccbytes += 2;
+	case NAND_ECC_HW6_512: 
+		this->eccbytes += 3;
+	case NAND_ECC_HW3_512: 
+	case NAND_ECC_HW3_256:
+		if (this->calculate_ecc && this->correct_data && this->enable_hwecc)
+			break;
+		printk (KERN_WARNING "No ECC functions supplied, Hardware ECC not possible\n");
+		BUG();	
+	}
+		
+	mtd->eccsize = this->eccsize;
+
+	/* We consider only layout allocation performed in nand_base */
+	this->layout_allocated = 0;
+	if (!this->layout) {
+		if (this->autooob)
+			fill_autooob_layout(mtd);
+		else {
+			switch (this->eccmode) {
+			case NAND_ECC_HW12_2048:
+				this->layout = hw12_2048_layout;
+				break;
+			case NAND_ECC_HW3_512:
+				this->layout = hw3_512_layout;
+				break;
+			case NAND_ECC_HW6_512:
+				this->layout = hw6_512_layout;
+				break;
+			case NAND_ECC_HW8_512:
+				this->layout = hw8_512_layout;
+				break;
+			case NAND_ECC_HW3_256:
+				this->layout = hw3_256_layout;
+				break;
+			}
+		}
+	}
+
 	/* Initialize state, waitqueue and spinlock */
 	this->state = FL_READY;
 	init_waitqueue_head (&this->wq);
@@ -2668,8 +3114,8 @@ int nand_scan (struct mtd_info *mtd, int
 	mtd->write = nand_write;
 	mtd->read_ecc = nand_read_ecc;
 	mtd->write_ecc = nand_write_ecc;
-	mtd->read_oob = nand_read_oob;
-	mtd->write_oob = nand_write_oob;
+	mtd->read_oob = hwecc ? nand_read_oob_hwecc : nand_read_oob;
+	mtd->write_oob = hwecc ? nand_write_oob_hwecc : nand_write_oob;
 	mtd->readv = NULL;
 	mtd->writev = nand_writev;
 	mtd->writev_ecc = nand_writev_ecc;
@@ -2718,6 +3164,9 @@ void nand_release (struct mtd_info *mtd)
 	/* Buffer allocated by nand_scan ? */
 	if (this->options & NAND_DATABUF_ALLOC)
 		kfree (this->data_buf);
+	/* Free layout array if it was allocated by fill_autooob_layout */
+	if (this->layout_allocated)
+		kfree(this->layout);
 }
 
 EXPORT_SYMBOL_GPL (nand_scan);
Index: linux-2.6.10.my/include/linux/mtd/nand.h
===================================================================
--- linux-2.6.10.my.orig/include/linux/mtd/nand.h
+++ linux-2.6.10.my/include/linux/mtd/nand.h
@@ -157,13 +157,22 @@ extern int nand_read_raw (struct mtd_inf
 #define NAND_ECC_HW3_256	2
 /* Hardware ECC 3 byte ECC per 512 Byte data */
 #define NAND_ECC_HW3_512	3
-/* Hardware ECC 3 byte ECC per 512 Byte data */
+/* Hardware ECC 6 byte ECC per 512 Byte data */
 #define NAND_ECC_HW6_512	4
 /* Hardware ECC 8 byte ECC per 512 Byte data */
 #define NAND_ECC_HW8_512	6
 /* Hardware ECC 12 byte ECC per 2048 Byte data */
 #define NAND_ECC_HW12_2048	7
 
+struct page_layout_item {
+	int length;
+	enum {
+		ITEM_TYPE_DATA, 
+		ITEM_TYPE_OOB, 
+		ITEM_TYPE_ECC,
+	} type;
+}; 
+
 /*
  * Constants for Hardware ECC
  */
@@ -173,6 +182,9 @@ extern int nand_read_raw (struct mtd_inf
 #define NAND_ECC_WRITE		1
 /* Enable Hardware ECC before syndrom is read back from flash */
 #define NAND_ECC_READSYN	2
+#define NAND_ECC_WRITESYN	3
+#define NAND_ECC_READOOB	4
+#define NAND_ECC_WRITEOOB	5
 
 /* Bit mask for flags passed to do_nand_read_ecc */
 #define NAND_GET_DEVICE		0x80
@@ -370,6 +382,8 @@ struct nand_chip {
 	int		pagemask;
 	int		pagebuf;
 	struct nand_oobinfo	*autooob;
+	struct page_layout_item *layout;
+	int		layout_allocated;
 	uint8_t		*bbt;
 	struct nand_bbt_descr	*bbt_td;
 	struct nand_bbt_descr	*bbt_md;
Index: linux-2.6.10.my/include/mtd/mtd-abi.h
===================================================================
--- linux-2.6.10.my.orig/include/mtd/mtd-abi.h
+++ linux-2.6.10.my/include/mtd/mtd-abi.h
@@ -115,7 +115,7 @@ struct nand_oobinfo {
 	uint32_t useecc;
 	uint32_t eccbytes;
 	uint32_t oobfree[8][2];
-	uint32_t eccpos[32];
+	uint32_t eccpos[40];
 };
 
 #endif /* __MTD_ABI_H__ */
