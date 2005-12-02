Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ei4um-0002d2-7d
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 02:01:14 -0500
Message-ID: <438FF127.4030402@ru.mvista.com>
Date: Fri, 02 Dec 2005 10:00:55 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------020902000202020703000707"
Subject: [PATCH] [update] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020902000202020703000707
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

the patch attached implements treating the OOB data as a chunk of _free_ OOB bytes of mtd->oobavail size.
This is what was announced several times. This patch is a working one (verified with yaffs2 and jffs2), however, it's not completely ready to work with 16bit NAND flashes.
Anyway, I'd like to ask for a permission to commit it to let other people start using it/report the problems/etc. etc.

The main difference with the previous one is
- fixed fill_autooob_layout (zero'ing the last field)

Of course input of any kind is welcome.

Best regards,
   Vitaly


--------------020902000202020703000707
Content-Type: text/plain;
 name="mtd-nand_base-layouts.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-nand_base-layouts.patch"

diff -uNr linux-2.6.10.orig/drivers/mtd/nand/nand_base.c linux-2.6.10.nand/drivers/mtd/nand/nand_base.c
--- linux-2.6.10.orig/drivers/mtd/nand/nand_base.c	2005-11-24 16:07:18.000000000 +0300
+++ linux-2.6.10.nand/drivers/mtd/nand/nand_base.c	2005-11-29 16:55:13.634260952 +0300
@@ -117,42 +117,8 @@
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
+#define SW_ECC_LAYOUT_SIZE		8
 
 /*
  * NAND low-level MTD interface functions
@@ -893,11 +859,10 @@
 static int nand_write_page (struct mtd_info *mtd, struct nand_chip *this, int page,
 	u_char *oob_buf,  struct nand_oobinfo *oobsel, int cached)
 {
-	int 	i, oobidx, status;
+	int 	j = 0, oobidx = 0, status;
 	u_char	ecc_code[40];
 	int	eccmode = oobsel->useecc ? this->eccmode : NAND_ECC_NONE;
-	int  	*oob_config = oobsel->eccpos;
-	int	datidx = 0, eccidx = 0, eccsteps = this->eccsteps;
+	int	datidx = 0, last_datidx = 0, eccidx = 0;
 	int	eccbytes = 0;
 
 	/* FIXME: Enable cached programming */
@@ -914,41 +879,35 @@
 		this->write_buf(mtd, this->data_poi, mtd->oobblock);
 		break;
 
-	/* Software ecc 3/256, write all */
-	case NAND_ECC_SOFT:
-		for (; eccsteps; eccsteps--) {
-			this->calculate_ecc(mtd, &this->data_poi[datidx], ecc_code);
-			for (i = 0; i < 3; i++, eccidx++)
-				oob_buf[oob_config[eccidx]] = ecc_code[i];
-			datidx += this->eccsize;
-		}
-		this->write_buf(mtd, this->data_poi, mtd->oobblock);
-		this->write_buf(mtd, oob_buf, mtd->oobsize);
-		break;
 	default:
 		eccbytes = this->eccbytes;
-		for (oobidx = 0; eccsteps; eccsteps--) {
-			int j = 0, last_datidx = datidx, last_oobidx;
-			for (; this->layout[j].length; j++) {
-				switch (this->layout[j].type) {
-				case ITEM_TYPE_DATA:
+		for (; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_DATA:
+				if (eccmode != NAND_ECC_SOFT)
 					this->enable_hwecc(mtd, NAND_ECC_WRITE);
-					this->write_buf(mtd, &this->data_poi[datidx], this->layout[j].length);
-					datidx += this->layout[j].length;
-					break;
-				case ITEM_TYPE_ECC:
+				this->write_buf(mtd, &this->data_poi[datidx], this->layout[j].length);
+				last_datidx = datidx;
+				datidx += this->layout[j].length;
+				break;
+			case ITEM_TYPE_ECC:
+				if (eccmode != NAND_ECC_SOFT)
 					this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
-					this->calculate_ecc(mtd, &this->data_poi[last_datidx], &ecc_code[eccidx]);
-					for (last_oobidx = oobidx; oobidx < last_oobidx + this->layout[j].length; oobidx++, eccidx++)
-						oob_buf[oobidx] = ecc_code[eccidx];
-					this->write_buf(mtd, ecc_code, this->layout[j].length);
-					break;
-				case ITEM_TYPE_OOB:
+				this->calculate_ecc(mtd, &this->data_poi[last_datidx], &ecc_code[eccidx]);
+				this->write_buf(mtd, &ecc_code[eccidx], this->layout[j].length);
+				break;
+			case ITEM_TYPE_OOB:
+				if (eccmode != NAND_ECC_SOFT)
 					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
-					this->write_buf(mtd, &oob_buf[oobidx], this->layout[j].length);
-					oobidx += this->layout[j].length;
-					break;
-				}
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				break;
+			case ITEM_TYPE_OOBFREE:
+				if (eccmode != NAND_ECC_SOFT)
+					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
+				DEBUG (MTD_DEBUG_LEVEL3, "%s: writing %02x %02x...\n", __FUNCTION__, oob_buf[oobidx], oob_buf[oobidx+1]);
+				this->write_buf(mtd, &oob_buf[oobidx], this->layout[j].length);
+				oobidx += this->layout[j].length;
+				break;
 			}
 
 		}
@@ -1003,7 +962,7 @@
 static int nand_verify_pages (struct mtd_info *mtd, struct nand_chip *this, int page, int numpages,
 	u_char *oob_buf, struct nand_oobinfo *oobsel, int chipnr, int oobmode)
 {
-	int 	i, j, datidx = 0, oobofs = 0, res = -EIO;
+	int 	j, datidx = 0, oobofs = 0, res = -EIO;
 	int	eccsteps = this->eccsteps;
 	int	hweccbytes;
 	u_char 	oobdata[64];
@@ -1014,50 +973,33 @@
 	this->cmdfunc (mtd, NAND_CMD_READ0, 0, page);
 
 	for(;;) {
-		for (j = 0; j < eccsteps; j++) {
-			/* Loop through and verify the data */
-			if (this->verify_buf(mtd, &this->data_poi[datidx], mtd->eccsize)) {
-				DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
-				goto out;
-			}
-			datidx += mtd->eccsize;
-			/* Have we a hw generator layout ? */
-			if (!hweccbytes)
-				continue;
-			if (this->verify_buf(mtd, &this->oob_buf[oobofs], hweccbytes)) {
-				DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
-				goto out;
-			}
-			oobofs += hweccbytes;
-		}
-
-		/* check, if we must compare all data or if we just have to
-		 * compare the ecc bytes
-		 */
-		if (oobmode) {
-			if (this->verify_buf(mtd, &oob_buf[oobofs], mtd->oobsize - hweccbytes * eccsteps)) {
-				DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
-				goto out;
-			}
-		} else {
-			/* Read always, else autoincrement fails */
-			this->read_buf(mtd, oobdata, mtd->oobsize - hweccbytes * eccsteps);
-
-			if (oobsel->useecc != MTD_NANDECC_OFF && !hweccbytes) {
-				int ecccnt = oobsel->eccbytes;
-
-				for (i = 0; i < ecccnt; i++) {
-					int idx = oobsel->eccpos[i];
-					if (oobdata[idx] != oob_buf[oobofs + idx] ) {
-						DEBUG (MTD_DEBUG_LEVEL0,
-					       	"%s: Failed ECC write "
-						"verify, page 0x%08x, " "%6i bytes were succesful\n", __FUNCTION__, page, i);
+		for (j = 0; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_DATA:
+				/* Loop through and verify the data */
+				if (this->verify_buf(mtd, &this->data_poi[datidx], this->layout[j].length)) {
+					DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
+					goto out;
+				}
+				datidx += this->layout[j].length;
+				break;
+			case ITEM_TYPE_OOBFREE:
+				if (oobmode) {
+					if (this->verify_buf(mtd, &this->oob_buf[oobofs], this->layout[j].length)) {
+						DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
 						goto out;
 					}
+					oobofs += this->layout[j].length;
+					break;
 				}
+			case ITEM_TYPE_ECC:
+			case ITEM_TYPE_OOB:
+				/* Read always, else autoincrement fails */
+				this->read_buf(mtd, oobdata, this->layout[j].length);
 			}
+
 		}
-		oobofs += mtd->oobsize - hweccbytes * eccsteps;
+
 		page++;
 		numpages--;
 
@@ -1153,13 +1095,13 @@
 {
 
 	int i, j, col, realpage, page, end, ecc, chipnr, sndcmd = 1;
-	int read = 0, oob = 0, oobidx, ecc_status = 0, ecc_failed = 0, eccidx;
+	int read = 0, oobidx, ecc_status = 0, ecc_failed = 0, eccidx;
 	struct nand_chip *this = mtd->priv;
 	u_char *data_poi, *oob_data = oob_buf;
 	u_char ecc_calc[32];
 	u_char ecc_code[32];
         int eccmode, eccsteps;
-	int	*oob_config, datidx;
+	int	*oob_config, datidx = 0, last_datidx = 0;
 	int	blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
 	int	eccbytes;
 	int	compareecc = 1;
@@ -1240,8 +1182,7 @@
 		}
 
 		/* get oob area, if we have no oob buffer from fs-driver */
-		if (!oob_buf || oobsel->useecc == MTD_NANDECC_AUTOPLACE ||
-			oobsel->useecc == MTD_NANDECC_AUTOPL_USR)
+		if (!oob_buf)
 			oob_data = &this->data_buf[end];
 
 		eccsteps = this->eccsteps;
@@ -1257,53 +1198,52 @@
 			break;
 		}
 
-		case NAND_ECC_SOFT:	/* Software ECC 3/256: Read in a page + oob data */
-			this->read_buf(mtd, data_poi, end);
-			for (i = 0, datidx = 0; eccsteps; eccsteps--, i+=3, datidx += ecc)
-				this->calculate_ecc(mtd, &data_poi[datidx], &ecc_calc[i]);
-			this->read_buf(mtd, &oob_data[mtd->oobsize - oobreadlen], oobreadlen);
-			break;
-
 		default:
-			for (oobidx = 0, datidx = 0, eccidx = 0; eccsteps; eccsteps--) {
-				int last_datidx = datidx, last_oobidx = oobidx;
-				for (j = 0; this->layout[j].length; j++) {
-					switch (this->layout[j].type) {
-					case ITEM_TYPE_DATA:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d bytes of data\n", __FUNCTION__, this->layout[j].length);
+			oobidx = 0;
+			datidx = last_datidx = 0;
+			eccidx = 0; 
+			for (j = 0; this->layout[j].length; j++) {
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d bytes of data\n", __FUNCTION__, this->layout[j].length);
+					if (eccmode != NAND_ECC_SOFT)
 						this->enable_hwecc(mtd, NAND_ECC_READ);
-						this->read_buf(mtd, &data_poi[datidx], this->layout[j].length);
-						datidx += this->layout[j].length;
-						break;
-
-					case ITEM_TYPE_ECC:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d ecc bytes\n", __FUNCTION__, this->layout[j].length);
-						/* let the particular driver decide whether to read ECC */
+					this->read_buf(mtd, &data_poi[datidx], this->layout[j].length);
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: read %02x %02x...\n", __FUNCTION__, data_poi[datidx], data_poi[datidx+1]);
+					last_datidx = datidx;
+					datidx += this->layout[j].length;
+					break;
+
+				case ITEM_TYPE_ECC:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d ecc bytes\n", __FUNCTION__, this->layout[j].length);
+					/* let the particular driver decide whether to read ECC */
+					if (eccmode != NAND_ECC_SOFT)
 						this->enable_hwecc(mtd, NAND_ECC_READSYN);
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
+					this->read_buf(mtd, &ecc_code[eccidx], this->layout[j].length);
+					if (!compareecc) {
+						/* We calc error correction directly, it checks the hw
+						 * generator for an error, reads back the syndrome and
+						 * does the error correction on the fly */
+						ecc_status = this->correct_data(mtd, &data_poi[last_datidx], &ecc_code[eccidx], &ecc_code[eccidx]);
+						if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
+							DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: "
+								"Failed ECC read, page 0x%08x on chip %d\n", page, chipnr);
+							ecc_failed++;
+						}
+					} else
+						this->calculate_ecc(mtd, &data_poi[last_datidx], &ecc_calc[eccidx]);
+					eccidx += this->layout[j].length;
+					break;
+				case ITEM_TYPE_OOB:
+				case ITEM_TYPE_OOBFREE:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: reading %d oob bytes\n", __FUNCTION__, this->layout[j].length);
+					if (eccmode != NAND_ECC_SOFT)
 						this->enable_hwecc(mtd, NAND_ECC_READOOB);
 
-						this->read_buf(mtd, &oob_data[oobidx], this->layout[j].length);
+					this->read_buf(mtd, &oob_data[oobidx], this->layout[j].length);
+					if (this->layout[j].type == ITEM_TYPE_OOBFREE)
 						oobidx += this->layout[j].length;
-						break;
-					}
+					break;
 				}
 			}
 			break;
@@ -1311,11 +1251,7 @@
 
 		/* Skip ECC check, if not requested (ECC_NONE or HW_ECC with syndromes) */
 		if (!compareecc)
-			goto readoob;
-
-		/* Pick the ECC bytes out of the oob data */
-		for (j = 0; j < oobsel->eccbytes; j++)
-			ecc_code[j] = oob_data[oob_config[j]];
+			goto readdata;
 
 		/* correct data, if neccecary */
 		for (i = 0, j = 0, datidx = 0; i < this->eccsteps; i++, datidx += ecc) {
@@ -1324,43 +1260,12 @@
 			/* Get next chunk of ecc bytes */
 			j += eccbytes;
 
-			/* Check, if we have a fs supplied oob-buffer,
-			 * This is the legacy mode. Used by YAFFS1
-			 * Should go away some day
-			 */
-			if (oob_buf && oobsel->useecc == MTD_NANDECC_PLACE) {
-				int *p = (int *)(&oob_data[mtd->oobsize]);
-				p[i] = ecc_status;
-			}
-
 			if ((ecc_status == -1) || (ecc_status > (flags && 0xff))) {
 				DEBUG (MTD_DEBUG_LEVEL0, "nand_read_ecc: " "Failed ECC read, page 0x%08x\n", page);
 				ecc_failed++;
 			}
 		}
 
-	readoob:
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
@@ -1432,7 +1337,6 @@
 	int read = 0;
 	struct nand_chip *this = mtd->priv;
 	u_char *oob_data = oob_buf;
-        int 	eccsteps;
 	int	blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
 
 
@@ -1463,7 +1367,7 @@
 
 	/* Loop until all data read */
 	while (read < len) {
-		if (this->eccmode == NAND_ECC_SOFT || this->eccmode == NAND_ECC_NONE) {
+		if (this->eccmode == NAND_ECC_NONE) {
 			int thislen = mtd->oobsize - col;
 			if (sndcmd) {
 				this->cmdfunc (mtd, NAND_CMD_READOOB, col, page);
@@ -1480,81 +1384,48 @@
 				sndcmd = 0;
 			}
 
-			eccsteps = this->eccsteps;
+			for (j = 0; this->layout[j].length; j++) {
+				i = 0;
+				switch (this->layout[j].type) {
+				case ITEM_TYPE_DATA:
+				case ITEM_TYPE_OOB:
+				case ITEM_TYPE_ECC:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
+					reallen += this->layout[j].length;
+					if (this->options & NAND_BUSWIDTH_16)
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen & ~1, page);
+					else
+						this->cmdfunc (mtd, NAND_CMD_READ0, reallen, page);
+					break;
 
-			for (; eccsteps; eccsteps--) {
-				for (j = 0; this->layout[j].length; j++) {
-					i = 0;
-					switch (this->layout[j].type) {
-					case ITEM_TYPE_DATA:
-						DEBUG (MTD_DEBUG_LEVEL3, "%s: dummy data read\n", __FUNCTION__);
-						reallen += this->layout[j].length;
+				case ITEM_TYPE_OOBFREE:
+					DEBUG (MTD_DEBUG_LEVEL3, "%s: free oob bytes read\n", __FUNCTION__);
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
-						}
-						col -= i;
+					}
+					col -= i;
 
+					if (this->eccmode != NAND_ECC_SOFT)
 						this->enable_hwecc(mtd, NAND_ECC_READOOB);
-						i = min_t(int, len - read, this->layout[j].length - i);
-						if (i) {
-							if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
-								oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
-								oob_data++; i--; reallen++;
-							}
-
-							this->read_buf(mtd, oob_data, i);
-							reallen += i;
+					i = min_t(int, len - read, this->layout[j].length - i);
+					if (i) {
+						if (this->options & NAND_BUSWIDTH_16 && reallen & 1) {
+							oob_data[0] = cpu_to_le16(this->read_word(mtd)) >> 8;
+							oob_data++; i--; reallen++;
 						}
-						if (oob_buf + len == oob_data + i) {
-							read += i;
-							goto out;
-						}
-
-						break;
+						this->read_buf(mtd, oob_data, i);
+						reallen += i;
 					}
 					read += i;
 					oob_data += i;
-
+					if (oob_buf + len == oob_data) 
+						goto out;
+					break;
 				}
 			}
 		}
@@ -1664,67 +1535,6 @@
 	return 0;
 }
 
-
-/**
- * nand_prepare_oobbuf - [GENERIC] Prepare the out of band buffer
- * @mtd:	MTD device structure
- * @fsbuf:	buffer given by fs driver
- * @oobsel:	out of band selection structre
- * @autoplace:	1 = place given buffer into the oob bytes
- * @numpages:	number of pages to prepare
- *
- * Return:
- * 1. Filesystem buffer available and autoplacement is off,
- *    return filesystem buffer
- * 2. No filesystem buffer or autoplace is off, return internal
- *    buffer
- * 3. Filesystem buffer is given and autoplace selected
- *    put data from fs buffer into internal buffer and
- *    retrun internal buffer
- *
- * Note: The internal buffer is filled with 0xff. This must
- * be done only once, when no autoplacement happens
- * Autoplacement sets the buffer dirty flag, which
- * forces the 0xff fill before using the buffer again.
- *
-*/
-static u_char * nand_prepare_oobbuf (struct mtd_info *mtd, u_char *fsbuf, struct nand_oobinfo *oobsel,
-		int autoplace, int numpages)
-{
-	struct nand_chip *this = mtd->priv;
-	int i, len, ofs;
-
-	/* Zero copy fs supplied buffer */
-	if (fsbuf && !autoplace)
-		return fsbuf;
-
-	/* Check, if the buffer must be filled with ff again */
-	if (this->oobdirty) {
-		memset (this->oob_buf, 0xff,
-			mtd->oobsize << (this->phys_erase_shift - this->page_shift));
-		this->oobdirty = 0;
-	}
-
-	/* If we have no autoplacement or no fs buffer use the internal one */
-	if (!autoplace || !fsbuf)
-		return this->oob_buf;
-
-	/* Walk through the pages and place the data */
-	this->oobdirty = 1;
-	ofs = 0;
-	while (numpages--) {
-		for (i = 0, len = 0; len < mtd->oobavail; i++) {
-			int to = ofs + oobsel->oobfree[i][0];
-			int num = oobsel->oobfree[i][1];
-			memcpy (&this->oob_buf[to], fsbuf, num);
-			len += num;
-			fsbuf += num;
-		}
-		ofs += mtd->oobavail;
-	}
-	return this->oob_buf;
-}
-
 #define NOTALIGNED(x) (x & (mtd->oobblock-1)) != 0
 
 /**
@@ -1817,7 +1627,7 @@
 	startpage = page;
 	/* Calc number of pages we can write in one go */
 	numpages = min (ppblock - (startpage  & (ppblock - 1)), totalpages);
-	oobbuf = nand_prepare_oobbuf (mtd, eccbuf, oobsel, autoplace, numpages);
+	oobbuf = eccbuf ? eccbuf : ffchars;
 	bufstart = (u_char *)buf;
 
 	/* Loop until all data is written */
@@ -1867,8 +1677,7 @@
 			numpages = min (totalpages, ppblock);
 			page &= this->pagemask;
 			startpage = page;
-			oobbuf = nand_prepare_oobbuf (mtd, eccbuf, oobsel,
-					autoplace, numpages);
+			oobbuf = eccbuf ? eccbuf : ffchars;
 			oob = 0;
 			/* Check, if we cross a chip boundary */
 			if (!page) {
@@ -1910,6 +1719,7 @@
 {
 	int column, page, status, ret = -EIO, chipnr, eccsteps, fflen, ooblen;
 	struct nand_chip *this = mtd->priv;
+	int i, j;
 
 	DEBUG (MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n", __FUNCTION__, (unsigned int) to, (int) len);
 
@@ -1950,7 +1760,7 @@
 	if (page == this->pagebuf)
 		this->pagebuf = -1;
 
-	if (this->eccmode == NAND_ECC_SOFT || this->eccmode == NAND_ECC_NONE) {
+	if (this->eccmode == NAND_ECC_NONE) {
 		if (NAND_MUST_PAD(this)) {
 			/* Write out desired data */
 			this->cmdfunc (mtd, NAND_CMD_SEQIN, mtd->oobblock, page & this->pagemask);
@@ -1972,41 +1782,43 @@
 
 		eccsteps = this->eccsteps;
 
-		for (fflen = 0, ooblen = 0; eccsteps; eccsteps--) {
-			int i, j;
-			for (j = 0; this->layout[j].length; j++) {
-				switch (this->layout[j].type) {
-				case ITEM_TYPE_DATA:
+		fflen = 0;
+		ooblen = 0; 
+		for (j = 0; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_OOB:
+			case ITEM_TYPE_DATA:
+				if (this->eccmode != NAND_ECC_SOFT)
 					this->enable_hwecc(mtd, NAND_ECC_WRITE);
-					this->write_buf(mtd, ffchars, this->layout[j].length);
-					fflen += this->layout[j].length;
-					break;
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				fflen += this->layout[j].length;
+				break;
 
-				case ITEM_TYPE_ECC:
+			case ITEM_TYPE_ECC:
+				if (this->eccmode != NAND_ECC_SOFT)
 					this->enable_hwecc(mtd, NAND_ECC_WRITESYN);
-					this->write_buf(mtd, ffchars, this->layout[j].length);
-					ooblen += this->layout[j].length;
-					break;
+				this->write_buf(mtd, ffchars, this->layout[j].length);
+				fflen += this->layout[j].length;
+				break;
 
-				case ITEM_TYPE_OOB:
+			case ITEM_TYPE_OOBFREE:
+				if (this->eccmode != NAND_ECC_SOFT)
 					this->enable_hwecc(mtd, NAND_ECC_WRITEOOB);
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
+				i = min_t(int, column, this->layout[j].length);
+				if (i)
+					this->write_buf(mtd, ffchars, i);
+				column -= i;
+				fflen += i;
+				i = min_t(int, len + column - ooblen, this->layout[j].length - i);
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
@@ -2026,17 +1838,57 @@
 	*retlen = len;
 
 #ifdef CONFIG_MTD_NAND_VERIFY_WRITE
-	if (this->eccmode == NAND_ECC_SOFT | this->eccmode == NAND_ECC_NONE) {
+	if (this->eccmode == NAND_ECC_SOFT || this->eccmode == NAND_ECC_NONE) {
 		/* Send command to read back the data */
 		this->cmdfunc (mtd, NAND_CMD_READOOB, column, page & this->pagemask);
 
-		if (this->verify_buf(mtd, buf, len)) {
+		if (this->verify_buf(mtd, oob_buf, len)) {
 			DEBUG (MTD_DEBUG_LEVEL0, "nand_write_oob: " "Failed write verify, page 0x%08x\n", page);
 			ret = -EIO;
 			goto out;
 		}
+	} else {
+		int oobofs;
+		int read_len;
+		int real_ofs = 0;
+		
+		column = to & (mtd->oobsize - 1);
+
+		/* Send command to read back the data */
+		this->cmdfunc (mtd, NAND_CMD_READ0, 0, page & this->pagemask);
+		for (j = 0, oobofs = 0; this->layout[j].length; j++) {
+			switch (this->layout[j].type) {
+			case ITEM_TYPE_OOBFREE:
+				i = min_t(int, column, this->layout[j].length);
+				if (i) {
+					real_ofs += i;
+					this->cmdfunc (mtd, NAND_CMD_READ0, real_ofs, page);
+				}
+				column -= i;
+
+				read_len = min_t(int, i, len);
+				if (this->verify_buf(mtd, &oob_buf[oobofs], read_len)) {
+					DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
+					ret = -EIO;
+					goto out;
+				}
+				oobofs += read_len;
+				real_ofs += read_len;
+				if (len == oobofs) {
+					ret = 0;
+					goto out;
+				}
+				break;
+			case ITEM_TYPE_ECC:
+			case ITEM_TYPE_OOB:
+			case ITEM_TYPE_DATA:
+				real_ofs += this->layout[j].length;
+				this->cmdfunc (mtd, NAND_CMD_READ0, real_ofs, page & this->pagemask);
+				break;
+			}
+
+		}
 	}
-#warning "Verify for OOB data in HW ECC case is NOT YET implemented"
 #endif
 	ret = 0;
 out:
@@ -2150,7 +2002,7 @@
 			numpages = (vecs->iov_len - len) >> this->page_shift;
 			/* Do not cross block boundaries */
 			numpages = min (ppblock - (startpage & (ppblock - 1)), numpages);
-			oobbuf = nand_prepare_oobbuf (mtd, NULL, oobsel, autoplace, numpages);
+			oobbuf = eccbuf ? eccbuf : ffchars;
 			bufstart = (u_char *)vecs->iov_base;
 			bufstart += len;
 			this->data_poi = bufstart;
@@ -2194,7 +2046,7 @@
 			this->data_poi = this->data_buf;
 			bufstart = this->data_poi;
 			numpages = 1;
-			oobbuf = nand_prepare_oobbuf (mtd, NULL, oobsel, autoplace, numpages);
+			oobbuf = eccbuf ? eccbuf : ffchars;
 			ret = nand_write_page (mtd, this, page & this->pagemask,
 				oobbuf, oobsel, 0);
 			if (ret)
@@ -2513,13 +2365,66 @@
 
 }
 
+/**
+ * fill_swecc_layout - [NAND Interface] build the layout for software ECC case
+ * @mtd:	MTD device structure
+ * @eccbytes:	Number of ECC bytes per page
+ *
+ * Build the page_layout array for NAND page handling for software ECC
+ * handling basing on the number of the ECC bytes per page
+ */
+static int fill_swecc_layout(struct mtd_info *mtd, int eccbytes)
+{
+	struct nand_chip *this = mtd->priv;
+
+	this->layout = kmalloc(SW_ECC_LAYOUT_SIZE * sizeof (struct page_layout_item), GFP_KERNEL);
+
+	if (this->layout == NULL)
+		return -ENOMEM;
+	else
+		this->layout_allocated = 1;
+
+	memset(this->layout, 0, sizeof(struct page_layout_item) * SW_ECC_LAYOUT_SIZE);
+	this->layout[0].type = ITEM_TYPE_DATA;
+	this->layout[0].length = mtd->oobblock;
+
+	if (this->badblockpos == 0) {
+		this->layout[1].type = ITEM_TYPE_OOB;
+		this->layout[1].length = 1;
+		this->layout[2].type = ITEM_TYPE_OOBFREE;
+		this->layout[2].length = mtd->oobsize - 1 - eccbytes * this->eccsteps;
+		this->layout[3].type = ITEM_TYPE_ECC;
+		this->layout[3].length = 3 * this->eccsteps;
+	} else {
+		this->layout[1].type = ITEM_TYPE_OOBFREE;
+		this->layout[1].length = this->badblockpos;
+		this->layout[2].type = ITEM_TYPE_OOB;
+		this->layout[2].length = 1;
+		this->layout[3].type = ITEM_TYPE_OOBFREE;
+		this->layout[3].length = mtd->oobsize - 1 - this->badblockpos - eccbytes * this->eccsteps;
+		this->layout[3].type = ITEM_TYPE_ECC;
+		this->layout[3].length = 3 * this->eccsteps;
+	}
+
+	return 0;
+}
+
+/**
+ * fill_autooob_layout - [NAND Interface] build the layout for hardware ECC case
+ * @mtd:	MTD device structure
+ * @eccbytes:	Number of ECC bytes per page
+ *
+ * Build the page_layout array for NAND page handling for hardware ECC
+ * handling basing on the nand_oobinfo structure supplied for the chip
+ */
 static int fill_autooob_layout(struct mtd_info *mtd)
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
 
@@ -2529,32 +2434,49 @@
 		this->layout_allocated = 1;
+
+		memset(this->layout, 0, HW_AUTOOOB_LAYOUT_SIZE * sizeof (struct page_layout_item));
 
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
@@ -2911,29 +2831,15 @@
 	/* We consider only layout allocation performed in nand_base */
 	this->layout_allocated = 0;
 	if (!this->layout) {
-		if (this->autooob)
+		if (this->eccmode == NAND_ECC_SOFT)
+			fill_swecc_layout(mtd, 3);
+		else if (this->autooob)
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
+			printk(KERN_WARNING "Couldn't generate layout. "
+					"Only NAND_ECC_NONE will work\n");
 	}
-
+	
 	/* Initialize state, waitqueue and spinlock */
 	this->state = FL_READY;
 	init_waitqueue_head (&this->wq);
diff -uNr linux-2.6.10.orig/drivers/mtd/nand/nand_ecc.c linux-2.6.10.nand/drivers/mtd/nand/nand_ecc.c
--- linux-2.6.10.orig/drivers/mtd/nand/nand_ecc.c	2005-11-24 15:58:37.000000000 +0300
+++ linux-2.6.10.nand/drivers/mtd/nand/nand_ecc.c	2005-11-25 21:20:19.000000000 +0300
@@ -38,6 +38,7 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 
 /*
@@ -116,34 +117,40 @@
  */
 int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
 {
+	struct nand_chip *this = mtd->priv;
 	u_char idx, reg1, reg2, reg3;
-	int j;
+	int i, j;
+	u_char *ecc_calc = ecc_code;
 	
-	/* Initialize variables */
-	reg1 = reg2 = reg3 = 0;
-	ecc_code[0] = ecc_code[1] = ecc_code[2] = 0;
+	for (i = 0; i < this->eccsteps; i++) {
+		/* Initialize variables */
+		reg1 = reg2 = reg3 = 0;
+		ecc_calc[0] = ecc_calc[1] = ecc_calc[2] = 0;
 	
-	/* Build up column parity */ 
-	for(j = 0; j < 256; j++) {
+		/* Build up column parity */ 
+		for(j = 0; j < 256; j++) {
 		
-		/* Get CP0 - CP5 from table */
-		idx = nand_ecc_precalc_table[dat[j]];
-		reg1 ^= (idx & 0x3f);
+			/* Get CP0 - CP5 from table */
+			idx = nand_ecc_precalc_table[dat[j]];
+			reg1 ^= (idx & 0x3f);
 		
-		/* All bit XOR = 1 ? */
-		if (idx & 0x40) {
-			reg3 ^= (u_char) j;
-			reg2 ^= ~((u_char) j);
+			/* All bit XOR = 1 ? */
+			if (idx & 0x40) {
+				reg3 ^= (u_char) j;
+				reg2 ^= ~((u_char) j);
+			}
 		}
-	}
 	
-	/* Create non-inverted ECC code from line parity */
-	nand_trans_result(reg2, reg3, ecc_code);
+		/* Create non-inverted ECC code from line parity */
+		nand_trans_result(reg2, reg3, ecc_calc);
 	
-	/* Calculate final ECC code */
-	ecc_code[0] = ~ecc_code[0];
-	ecc_code[1] = ~ecc_code[1];
-	ecc_code[2] = ((~reg1) << 2) | 0x03;
+		/* Calculate final ECC code */
+		ecc_calc[0] = ~ecc_calc[0];
+		ecc_calc[1] = ~ecc_calc[1];
+		ecc_calc[2] = ((~reg1) << 2) | 0x03;
+
+		ecc_calc += 3;
+	}
 	return 0;
 }
diff -uNr linux-2.6.10.orig/include/linux/mtd/nand.h linux-2.6.10.nand/include/linux/mtd/nand.h
--- linux-2.6.10.orig/include/linux/mtd/nand.h	2005-11-24 15:59:00.000000000 +0300
+++ linux-2.6.10.nand/include/linux/mtd/nand.h	2005-11-23 17:50:32.000000000 +0300
@@ -171,6 +171,7 @@
 	enum {
 		ITEM_TYPE_DATA, 
 		ITEM_TYPE_OOB, 
+		ITEM_TYPE_OOBFREE, 
 		ITEM_TYPE_ECC,
 	} type;
 }; 



--------------020902000202020703000707--
