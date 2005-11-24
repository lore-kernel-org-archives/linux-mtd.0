Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfHq3-0003EM-PG
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 09:12:49 -0500
Date: Thu, 24 Nov 2005 17:12:50 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20051124171250.646cf9ea.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [PATCH] first shot on layout-based abstract OOB handling
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings MTD dev'ers,

lemme introduce the first shot of the NAND subsystem changes planned.
The main target was to facilitate work with free OOB bytes only for MTD users such as flash file systems, eliminating thus the need for such users to know the NAND page layout internals.

The work is somewhere in the middle so I'm far from asking if the following may be committed since a lot of things still needs to be done. Yet I hope this piece of work might be useful for YAFFS/JFFS maintainers.

So what was done basically:

- introduced ITEM_TYPE_OOBFREE to the layout structure
- reworked fill_autooob_layout which builds layouts basing on nand_oobinfo
- layouts aren't now multiplied by eccsteps
- nand_read_oob/nand_write_oob were rewritten to deal now with oobfree only
- nand_do_read_ecc was simplified (no need now to grab all oob data and then grab only oobfree)
- a dirty hack was introduced for the oobinfo to let nand_write_ecc work as it did and to retain JFFS2 compatibility
- oobavail bug was fixed (it wasn't exported to partitions)
- YAFFS2 interface to MTD was modified to use oobavail
- YAFFS2 structures were modifiled to be __packed__. It hasn't solved the whole problem but let yaffs2 work on my PITA tagret.

Lemme also elaborate a bit more on the last point. yaffs_PackedTags2 is a laaaaaarge structure (28 bytes or 25 bytes packed) and it doesn't fit into the oobavail on my target (64b - 40b (ecc) - 2b (bb) == 22). I guess that the last three bytes are used quite rarely so it works, although it anyway looks sad.
What I'd like to suggest here is trying to compact this structure, I'm sure it's possible. :)

Also, I'd also like to suggest JFFS2 dev'ers to move away from direct use of oobinfo as a) they can now use oobavail and b) I hope this whole structure will go away some shiny day in future :)

Suggestions/comments are always welcome.

Vitaly

diff -uNr linux/drivers/mtd/nand/nand_base.c linux/drivers/mtd/nand/nand_base.c
--- linux/drivers/mtd/nand/nand_base.c	2005-11-24 16:07:18.000000000 +0300
+++ linux/drivers/mtd/nand/nand_base.c	2005-11-24 16:31:12.000000000 +0300
@@ -117,42 +117,7 @@
 #define FFCHARS_SIZE		2048
 static u_char ffchars[FFCHARS_SIZE];
 
-static struct page_layout_item hw3_256_layout[] = {
-	{ .length = 256, .type = ITEM_TYPE_DATA, },
-	{ .length = 3, .type = ITEM_TYPE_ECC, },
-	{ .length = 5, .type = ITEM_TYPE_OOB, },
-	{ .length = 0, },
-};
-
-static struct page_layout_item hw3_512_layout[] = {
-	{ .length = 512, .type = ITEM_TYPE_DATA, },
-	{ .length = 3, .type = ITEM_TYPE_ECC, },
-	{ .length = 13, .type = ITEM_TYPE_OOB, },
-	{ .length = 0, },
-};
-
-static struct page_layout_item hw6_512_layout[] = {
-	{ .length = 512, .type = ITEM_TYPE_DATA, },
-	{ .length = 6, .type = ITEM_TYPE_ECC, },
-	{ .length = 10, .type = ITEM_TYPE_OOB, },
-	{ .length = 0, },
-};
-
-static struct page_layout_item hw8_512_layout[] = {
-	{ .length = 512, .type = ITEM_TYPE_DATA, },
-	{ .length = 8, .type = ITEM_TYPE_ECC, },
-	{ .length = 8, .type = ITEM_TYPE_OOB, },
-	{ .length = 0, },
-};
-
-static struct page_layout_item hw12_2048_layout[] = {
-	{ .length = 2048, .type = ITEM_TYPE_DATA, },
-	{ .length = 12, .type = ITEM_TYPE_ECC, },
-	{ .length = 52, .type = ITEM_TYPE_OOB, },
-	{ .length = 0, },
-};
-
-#define HW_AUTOOOB_LAYOUT_SIZE		8 /* should be enough */
+#define HW_AUTOOOB_LAYOUT_SIZE		32 /* should be enough */
 
 /*
  * NAND low-level MTD interface functions
@@ -893,7 +859,7 @@
 static int nand_write_page (struct mtd_info *mtd, struct nand_chip *this, int page,
 	u_char *oob_buf,  struct nand_oobinfo *oobsel, int cached)
 {
-	int 	i, oobidx, status;
+	int 	i = 0, j = 0, oobidx = 0, status;
 	u_char	ecc_code[40];
 	int	eccmode = oobsel->useecc ? this->eccmode : NAND_ECC_NONE;
 	int  	*oob_config = oobsel->eccpos;
@@ -927,28 +893,27 @@
 		break;
 	default:
 		eccbytes = this->eccbytes;
-		for (oobidx = 0; eccsteps; eccsteps--) {
-			int j = 0, last_datidx = datidx, last_oobidx;
-			for (; this->layout[j].length; j++) {
-				switch (this->layout[j].type) {
-				case ITEM_TYPE_DATA:
-					this->enable_hwecc(mtd, NAND_ECC_WRITE);
-					this->write_buf(mtd, &this->data_poi[datidx], this->layout[j].length);
-					datidx += this->layout[j].length;
-					break;
-				case ITEM_TYPE_ECC:
-					this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
-					this->calculate_ecc(mtd, &this->data_poi[last_datidx], &ecc_code[eccidx]);
-					for (last_oobidx = oobidx; oobidx < last_oobidx + this->layout[j].length; oobidx++, eccidx++)
-						oob_buf[oobidx] = ecc_code[eccidx];
-					this->write_buf(mtd, ecc_code, this->layout[j].length);
-					break;
-				case ITEM_TYPE_OOB:
-					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
-					this->write_buf(mtd, &oob_buf[oobidx], this->layout[j].length);
-					oobidx += this->layout[j].length;
-					break;
-				}
+		for (; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_DATA:
+				this->enable_hwecc(mtd, NAND_ECC_WRITE);
+				this->write_buf(mtd, &this->data_poi[datidx], this->layout[j].length);
+				datidx += this->layout[j].length;
+				break;
+			case ITEM_TYPE_ECC:
+				this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
+				this->calculate_ecc(mtd, &this->data_poi[datidx], &ecc_code[eccidx]);
+				this->write_buf(mtd, &ecc_code[eccidx], this->layout[j].length);
+				break;
+			case ITEM_TYPE_OOB:
+				this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				break;
+			case ITEM_TYPE_OOBFREE:
+				this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+				this->write_buf(mtd, &oob_buf[oobidx], this->layout[j].length);
+				oobidx += this->layout[j].length;
+				break;
 			}
 
 		}
@@ -1265,45 +1230,46 @@
 			break;
 
 		default:
-			for (oobidx = 0, datidx = 0, eccidx = 0; eccsteps; eccsteps--) {
-				int last_datidx = datidx, last_oobidx = oobidx;
-				for (j = 0; this->layout[j].length; j++) {
-					switch (this->layout[j].type) {
-					case ITEM_TYPE_DATA:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d bytes of data\n", __FUNCTION__, this->layout[j].length);
-						this->enable_hwecc(mtd, NAND_ECC_READ);
-						this->read_buf(mtd, &data_poi[datidx], this->layout[j].length);
-						datidx += this->layout[j].length;
-						break;
-
-					case ITEM_TYPE_ECC:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d ecc bytes\n", __FUNCTION__, this->layout[j].length);
-						/* let the particular driver decide whether to read ECC */
-						this->enable_hwecc(mtd, NAND_ECC_READSYN);
-						this->read_buf(mtd, &oob_data[oobidx], this->layout[j].length);
-						if (!compareecc) {
-							/* We calc error correction directly, it checks the hw
-							 * generator for an error, reads back the syndrome and
-							 * does the error correction on the fly */
-							ecc_status = this->correct_data(mtd, &data_poi[last_datidx], &oob_data[last_oobidx], &ecc_code[eccidx]);
-							if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
-								DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: "
-									"Failed ECC read, page 0x%08x on chip %d\n", page, chipnr);
-								ecc_failed++;
-							}
-						} else
-							this->calculate_ecc(mtd, &data_poi[last_datidx], &ecc_calc[eccidx]);
-						oobidx += this->layout[j].length;
-						eccidx += this->layout[j].length;
-						break;
-					case ITEM_TYPE_OOB:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d free oob bytes\n", __FUNCTION__, this->layout[j].length);
-						this->enable_hwecc(mtd, NAND_ECC_READOOB);
+			oobidx = 0;
+			datidx = 0;
+			eccidx = 0; 
+			for (j = 0; this->layout[j].length; j++) {
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d bytes of data\n", __FUNCTION__, this->layout[j].length);
+					this->enable_hwecc(mtd, NAND_ECC_READ);
+					this->read_buf(mtd, &data_poi[datidx], this->layout[j].length);
+					datidx += this->layout[j].length;
+					break;
 
-						this->read_buf(mtd, &oob_data[oobidx], this->layout[j].length);
+				case ITEM_TYPE_ECC:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d ecc bytes\n", __FUNCTION__, this->layout[j].length);
+					/* let the particular driver decide whether to read ECC */
+					this->enable_hwecc(mtd, NAND_ECC_READSYN);
+					this->read_buf(mtd, &ecc_code[eccidx], this->layout[j].length);
+					if (!compareecc) {
+						/* We calc error correction directly, it checks the hw
+						 * generator for an error, reads back the syndrome and
+						 * does the error correction on the fly */
+						ecc_status = this->correct_data(mtd, &data_poi[datidx], &oob_data[oobidx], &ecc_code[eccidx]);
+						if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
+							DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: "
+								"Failed ECC read, page 0x%08x on chip %d\n", page, chipnr);
+							ecc_failed++;
+						}
+					} else
+						this->calculate_ecc(mtd, &data_poi[datidx], &ecc_calc[eccidx]);
+					eccidx += this->layout[j].length;
+					break;
+				case ITEM_TYPE_OOB:
+				case ITEM_TYPE_OOBFREE:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d free oob bytes\n", __FUNCTION__, this->layout[j].length);
+					this->enable_hwecc(mtd, NAND_ECC_READOOB);
+
+					this->read_buf(mtd, &oob_data[oobidx], this->layout[j].length);
+					if (this->layout[j].type == ITEM_TYPE_OOBFREE) /* XXX? */
 						oobidx += this->layout[j].length;
-						break;
-					}
+					break;
 				}
 			}
 			break;
@@ -1313,10 +1279,6 @@
 		if (!compareecc)
 			goto readoob;
 
-		/* Pick the ECC bytes out of the oob data */
-		for (j = 0; j < oobsel->eccbytes; j++)
-			ecc_code[j] = oob_data[oob_config[j]];
-
 		/* correct data, if neccecary */
 		for (i = 0, j = 0, datidx = 0; i < this->eccsteps; i++, datidx += ecc) {
 			ecc_status = this->correct_data(mtd, &data_poi[datidx], &ecc_code[j], &ecc_calc[j]);
@@ -1340,27 +1302,6 @@
 		}
 
 	readoob:
-		/* check, if we have a fs supplied oob-buffer */
-		if (oob_buf) {
-			/* without autoplace. Legacy mode used by YAFFS1 */
-			switch(oobsel->useecc) {
-			case MTD_NANDECC_AUTOPLACE:
-			case MTD_NANDECC_AUTOPL_USR:
-				/* Walk through the autoplace chunks */
-				for (i = 0; oobsel->oobfree[i][1]; i++) {
-					int from = oobsel->oobfree[i][0];
-					int num = oobsel->oobfree[i][1];
-					memcpy(&oob_buf[oob], &oob_data[from], num);
-					oob += num;
-				}
-				break;
-			case MTD_NANDECC_PLACE:
-				/* YAFFS1 legacy mode */
-				oob_data += this->eccsteps * sizeof (int);
-			default:
-				oob_data += mtd->oobsize;
-			}
-		}
 	readdata:
 		/* Partial page read, transfer data into fs buffer */
 		if (!aligned) {
@@ -1482,80 +1423,81 @@
 
 			eccsteps = this->eccsteps;
 
-			for (; eccsteps; eccsteps--) {
-				for (j = 0; this->layout[j].length; j++) {
-					i = 0;
-					switch (this->layout[j].type) {
-					case ITEM_TYPE_DATA:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
-						reallen += this->layout[j].length;
+			for (j = 0; this->layout[j].length; j++) {
+				i = 0;
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+				case ITEM_TYPE_OOB:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
+					reallen += this->layout[j].length;
+					if (this->options & NAND_BUSWIDTH_16)
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+					else
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					break;
+
+				case ITEM_TYPE_ECC:
+#if 0
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: ecc bytes read\n", __FUNCTION__);
+					i = min_t(int, col, this->layout[j].length);
+					if (i) {
+						reallen += i;
 						if (this->options & NAND_BUSWIDTH_16)
 							this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
 						else
 							this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
-						break;
-
-					case ITEM_TYPE_ECC:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: ecc bytes read\n", __FUNCTION__);
-						i = min_t(int, col, this->layout[j].length);
-						if (i) {
-							reallen += i;
-							if (this->options & NAND_BUSWIDTH_16)
-								this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
-							else
-								this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
-						}
-						col -= i;
-						i = min_t(int, len - read, this->layout[j].length - i);
-						this->enable_hwecc(mtd, NAND_ECC_READSYN);
-						if (i) {
-							if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
-								oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
-								oob_data++; i--; reallen++;
-							}
-
-							this->read_buf(mtd, oob_data, i);
-							reallen += i;
-						}
-						if (oob_buf + len == oob_data + i) {
-							read += i;
-							goto out;
-						}
-						break;
-					case ITEM_TYPE_OOB:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: free oob bytes read\n", __FUNCTION__);
-						i = min_t(int, col, this->layout[j].length);
-						if (i) {
-							reallen += i;
-							if (this->options & NAND_BUSWIDTH_16)
-								this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
-							else
-								this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					}
+					col -= i;
+					i = min_t(int, len - read, this->layout[j].length - i);
+					this->enable_hwecc(mtd, NAND_ECC_READSYN);
+					if (i) {
+						if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
+							oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+							oob_data++; i--; reallen++;
 						}
-						col -= i;
 
-						this->enable_hwecc(mtd, NAND_ECC_READOOB);
-						i = min_t(int, len - read, this->layout[j].length - i);
-						if (i) {
-							if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
-								oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
-								oob_data++; i--; reallen++;
-							}
+						this->read_buf(mtd, oob_data, i);
+						reallen += i;
+					}
+					if (oob_buf + len == oob_data + i) {
+						read += i;
+						goto out;
+					}
+#endif
+					break;
+				case ITEM_TYPE_OOBFREE:
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
 
-							this->read_buf(mtd, oob_data, i);
-							reallen += i;
-						}
-						if (oob_buf + len == oob_data + i) {
-							read += i;
-							goto out;
+					this->enable_hwecc(mtd, NAND_ECC_READOOB);
+					i = min_t(int, len - read, this->layout[j].length - i);
+					if (i) {
+						if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
+							oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+							oob_data++; i--; reallen++;
 						}
 
-						break;
+						this->read_buf(mtd, oob_data, i);
+						reallen += i;
+					}
+					if (oob_buf + len == oob_data + i) {
+						read += i;
+						goto out;
 					}
-					read += i;
-					oob_data += i;
 
+					break;
 				}
+				read += i;
+				oob_data += i;
+
 			}
 		}
 out:
@@ -1910,6 +1852,7 @@
 {
 	int column, page, status, ret = -EIO, chipnr, eccsteps, fflen, ooblen;
 	struct nand_chip *this = mtd->priv;
+	int i, j;
 
 	DEBUG (MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n", __FUNCTION__, (unsigned int) to, (int) len);
 
@@ -1972,41 +1915,41 @@
 
 		eccsteps = this->eccsteps;
 
-		for (fflen = 0, ooblen = 0; eccsteps; eccsteps--) {
-			int i, j;
-			for (j = 0; this->layout[j].length; j++) {
-				switch (this->layout[j].type) {
-				case ITEM_TYPE_DATA:
-					this->enable_hwecc(mtd, NAND_ECC_WRITE);
-					this->write_buf(mtd, ffchars, this->layout[j].length);
-					fflen += this->layout[j].length;
-					break;
+		fflen = 0;
+		ooblen = 0; 
+		for (j = 0; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_OOB:
+			case ITEM_TYPE_DATA:
+				this->enable_hwecc(mtd, NAND_ECC_WRITE);
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				fflen += this->layout[j].length;
+				break;
 
-				case ITEM_TYPE_ECC:
-					this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
-					this->write_buf(mtd, ffchars, this->layout[j].length);
-					ooblen += this->layout[j].length;
-					break;
+			case ITEM_TYPE_ECC:
+				this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				fflen += this->layout[j].length;
+				break;
 
-				case ITEM_TYPE_OOB:
-					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
-					i = min_t(int, column, this->layout[j].length);
-					if (i)
-						this->write_buf(mtd, ffchars, i);
-					column -= i;
-					fflen += i;
-					i = min_t(int, len + column - ooblen, this->layout[j].length - i);
-
-					if (i)
-						this->write_buf(mtd, &oob_buf[ooblen], i);
-					ooblen += i;
-					if (ooblen == len) {
-						if (NAND_MUST_PAD(this))
-							this->write_buf(mtd, ffchars, mtd->oobsize + mtd->oobblock - fflen - ooblen);
-						goto finish;
-					}
-					break;
+			case ITEM_TYPE_OOBFREE:
+				this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+				i = min_t(int, column, this->layout[j].length);
+				if (i)
+					this->write_buf(mtd, ffchars, i);
+				column -= i;
+				fflen += i;
+				i = min_t(int, len + column - ooblen, this->layout[j].length - i);
+
+				if (i)
+					this->write_buf(mtd, &oob_buf[ooblen], i);
+				ooblen += i;
+				if (ooblen == len) {
+					if (NAND_MUST_PAD(this))
+						this->write_buf(mtd, ffchars, mtd->oobsize + mtd->oobblock - fflen - ooblen);
+					goto finish;
 				}
+				break;
 			}
 		}
 	}
@@ -2517,9 +2460,10 @@
 {
 	struct nand_chip *this = mtd->priv;
 	struct nand_oobinfo *oob = this->autooob;
+	int oobfreesize = 0;
 	int datasize = mtd->oobblock / this->eccsteps;
-	int i = 0, res = 0;
-	int eccpos = 0, eccbytes = 0, cur = 0;
+	int i = 0, j = 0, res = 0;
+	int eccpos = 0, eccbytes = 0, cur = 0, oobcur = 0;
 
 	this->layout = kmalloc(HW_AUTOOOB_LAYOUT_SIZE * sizeof (struct page_layout_item), GFP_KERNEL);
 
@@ -2529,32 +2473,47 @@
 		this->layout_allocated = 1;
 
 	while (i < HW_AUTOOOB_LAYOUT_SIZE - 1 &&
-		cur < (mtd->oobsize + mtd->oobblock) / this->eccsteps - 1) {
-		if (cur == 0) {
+		cur < (mtd->oobsize + mtd->oobblock)) {
+		if (cur % ((mtd->oobblock + mtd->oobsize) / this->eccsteps) == 0) {
 			this->layout[i].type = ITEM_TYPE_DATA;
 			this->layout[i].length = datasize;
-		} else if (oob->eccpos[eccpos] == cur - datasize) {
+			j++;
+			DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: data type, length %d\n", this->layout[i].length);
+		} else if (oob->oobfree[oobcur][0] == cur - j * datasize) {
+			this->layout[i].type = ITEM_TYPE_OOBFREE;
+			this->layout[i].length = oob->oobfree[oobcur][1];
+			oobfreesize += this->layout[i].length;
+			oobcur++;
+			DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oobfree type, length %d\n", this->layout[i].length);
+		} else if (oob->eccpos[eccpos] == cur - j * datasize) {
 			int eccpos_cur = eccpos;
 			do  {
 				eccpos++;
 				eccbytes++;
-			} while (eccbytes < oob->eccbytes / this->eccsteps && oob->eccpos[eccpos] == oob->eccpos[eccpos+1] - 1);
+			} while (eccbytes < oob->eccbytes && oob->eccpos[eccpos] == oob->eccpos[eccpos+1] - 1);
 			eccpos++;
 			eccbytes++;
 			this->layout[i].type = ITEM_TYPE_ECC;
 			this->layout[i].length = eccpos - eccpos_cur;
+			DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: ecc type, length %d\n", this->layout[i].length);
 		} else {
+			int len = min_t(int, oob->eccpos[eccpos], mtd->oobsize / this->eccsteps);
+			len = min_t(int, len, oob->oobfree[oobcur][0]);
 			this->layout[i].type = ITEM_TYPE_OOB;
-			if (eccbytes < oob->eccbytes / this->eccsteps)
-				this->layout[i].length = datasize - cur + oob->eccpos[eccpos];
-			else
-				this->layout[i].length = mtd->oobsize / this->eccsteps - (cur - datasize);
+			this->layout[i].length = len;
+			DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob type, length %d\n", this->layout[i].length);
 		}
 		cur += this->layout[i].length;
 		i++;
 	}
 	if (cur < (mtd->oobsize + mtd->oobblock) / this->eccsteps - 1)
 		res = -1;
+	else {
+		/* XXX */
+		oob->oobfree[0][0] = 0;
+		oob->oobfree[0][1] = oobfreesize;
+		oob->oobfree[1][0] = oob->oobfree[1][1] = 0;
+	}
 
 	return res;
 }
@@ -2913,27 +2872,11 @@
 	if (!this->layout) {
 		if (this->autooob)
 			fill_autooob_layout(mtd);
-		else {
-			switch (this->eccmode) {
-			case NAND_ECC_HW12_2048:
-				this->layout = hw12_2048_layout;
-				break;
-			case NAND_ECC_HW3_512:
-				this->layout = hw3_512_layout;
-				break;
-			case NAND_ECC_HW6_512:
-				this->layout = hw6_512_layout;
-				break;
-			case NAND_ECC_HW8_512:
-				this->layout = hw8_512_layout;
-				break;
-			case NAND_ECC_HW3_256:
-				this->layout = hw3_256_layout;
-				break;
-			}
-		}
+		else 
+			printk(KERN_WARNING "Neither layout nor autooob "
+					"specified, only SW ECC will work\n");
 	}
-
+	
 	/* Initialize state, waitqueue and spinlock */
 	this->state = FL_READY;
 	init_waitqueue_head (&this->wq);
diff -uNr linux/include/linux/mtd/nand.h linux/include/linux/mtd/nand.h
--- linux/include/linux/mtd/nand.h	2005-11-24 15:59:00.000000000 +0300
+++ linux/include/linux/mtd/nand.h	2005-11-23 17:50:32.000000000 +0300
@@ -171,6 +171,7 @@
 	enum {
 		ITEM_TYPE_DATA, 
 		ITEM_TYPE_OOB, 
+		ITEM_TYPE_OOBFREE, 
 		ITEM_TYPE_ECC,
 	} type;
 }; 

diff -uNr linux/fs/yaffs2/yaffs_ecc.h linux/fs/yaffs2/yaffs_ecc.h
--- linux/fs/yaffs2/yaffs_ecc.h	2005-11-24 16:51:17.126198088 +0300
+++ linux/fs/yaffs2/yaffs_ecc.h	2005-11-23 17:30:21.000000000 +0300
@@ -30,7 +30,7 @@
 	unsigned char colParity;
 	unsigned lineParity;
 	unsigned lineParityPrime;
-} yaffs_ECCOther;
+} __attribute__ ((__packed__)) yaffs_ECCOther;
 
 void yaffs_ECCCalculate(const unsigned char *data, unsigned char *ecc);
 int yaffs_ECCCorrect(unsigned char *data, unsigned char *read_ecc,
diff -uNr linux/fs/yaffs2/yaffs_mtdif2.c linux/fs/yaffs2/yaffs_mtdif2.c
--- linux/fs/yaffs2/yaffs_mtdif2.c	2005-11-24 16:51:17.134196872 +0300
+++ linux/fs/yaffs2/yaffs_mtdif2.c	2005-11-24 16:35:02.000000000 +0300
@@ -66,7 +66,7 @@
 				       data);
 		if (tags)
 			retval =
-			    mtd->write_oob(mtd, addr, mtd->oobsize, &dummy,
+			    mtd->write_oob(mtd, addr, mtd->oobavail, &dummy,
 					   (__u8 *) & pt);
 
 	}
@@ -112,7 +112,7 @@
 				      data);
 		if (tags)
 			retval =
-			    mtd->read_oob(mtd, addr, mtd->oobsize, &dummy,
+			    mtd->read_oob(mtd, addr, mtd->oobavail, &dummy,
 					  dev->spareBuffer);
 	}
 
diff -uNr linux/fs/yaffs2/yaffs_packedtags2.h linux/fs/yaffs2/yaffs_packedtags2.h
--- linux/fs/yaffs2/yaffs_packedtags2.h	2005-11-24 16:51:17.135196720 +0300
+++ linux/fs/yaffs2/yaffs_packedtags2.h	2005-11-23 17:30:21.000000000 +0300
@@ -11,12 +11,12 @@
 	unsigned objectId;
 	unsigned chunkId;
 	unsigned byteCount;
-} yaffs_PackedTags2TagsPart;
+} __attribute__((__packed__)) yaffs_PackedTags2TagsPart;
 
 typedef struct {
 	yaffs_PackedTags2TagsPart t;
 	yaffs_ECCOther ecc;
-} yaffs_PackedTags2;
+} __attribute__((__packed__)) yaffs_PackedTags2;
 
 void yaffs_PackTags2(yaffs_PackedTags2 * pt, const yaffs_ExtendedTags * t);
 void yaffs_UnpackTags2(yaffs_ExtendedTags * t, yaffs_PackedTags2 * pt);
