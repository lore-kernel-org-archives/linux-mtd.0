Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmqmS-0000WC-4v
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 17:55:42 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: fix compiler warnings in older diskonchip drivers
Date: Mon, 16 Jan 2012 09:54:08 -0800
Message-Id: <1326736448-4295-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This eliminates multiple instances of 

warning: value computed is not used

Compile-tested only (for arm), but the change is straightforward and benign.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 drivers/mtd/devices/doc2000.c     |    8 +++---
 drivers/mtd/devices/doc2001plus.c |   10 ++++----
 drivers/mtd/devices/docprobe.c    |    8 +++---
 drivers/mtd/nand/diskonchip.c     |   46 +++++++++++++++++++++----------------
 4 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index b1cdf64..3e66c97 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -862,7 +862,7 @@ static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 		/* There's an implicit DoC_WaitReady() in DoC_Command */
 
 		if (DoC_is_Millennium(this)) {
-			ReadDOC(docptr, ReadPipeInit);
+			dummy = ReadDOC(docptr, ReadPipeInit);
 			status = ReadDOC(docptr, LastDataRead);
 		} else {
 			dummy = ReadDOC(docptr, CDSNSlowIO);
@@ -1031,7 +1031,7 @@ static int doc_write_oob_nolock(struct mtd_info *mtd, loff_t ofs, size_t len,
 		/* DoC_WaitReady() is implicit in DoC_Command */
 
 		if (DoC_is_Millennium(this)) {
-			ReadDOC(docptr, ReadPipeInit);
+			dummy = ReadDOC(docptr, ReadPipeInit);
 			status = ReadDOC(docptr, LastDataRead);
 		} else {
 			dummy = ReadDOC(docptr, CDSNSlowIO);
@@ -1056,7 +1056,7 @@ static int doc_write_oob_nolock(struct mtd_info *mtd, loff_t ofs, size_t len,
 	/* DoC_WaitReady() is implicit in DoC_Command */
 
 	if (DoC_is_Millennium(this)) {
-		ReadDOC(docptr, ReadPipeInit);
+		dummy = ReadDOC(docptr, ReadPipeInit);
 		status = ReadDOC(docptr, LastDataRead);
 	} else {
 		dummy = ReadDOC(docptr, CDSNSlowIO);
@@ -1131,7 +1131,7 @@ static int doc_erase(struct mtd_info *mtd, struct erase_info *instr)
 		DoC_Command(this, NAND_CMD_STATUS, CDSN_CTRL_WP);
 
 		if (DoC_is_Millennium(this)) {
-			ReadDOC(docptr, ReadPipeInit);
+			dummy = ReadDOC(docptr, ReadPipeInit);
 			status = ReadDOC(docptr, LastDataRead);
 		} else {
 			dummy = ReadDOC(docptr, CDSNSlowIO);
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 177510d..a3bb5c0 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -622,8 +622,8 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 	*retlen = len;
 	ret = 0;
 
-	ReadDOC(docptr, Mplus_ReadPipeInit);
-	ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
 
 	/* Read the data via the internal pipeline through CDSN IO
 	   register, see Pipelined Read Operations 11.3 */
@@ -822,7 +822,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[ofs >> this->chipshift];
 	size_t i, size, got, want;
-	uint8_t *buf = ops->oobbuf;
+	uint8_t dummy, *buf = ops->oobbuf;
 	size_t len = ops->len;
 
 	BUG_ON(ops->mode != MTD_OPS_PLACE_OOB);
@@ -879,8 +879,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t ofs,
 		WriteDOC(0, docptr, Mplus_FlashControl);
 		DoC_WaitReady(docptr);
 
-		ReadDOC(docptr, Mplus_ReadPipeInit);
-		ReadDOC(docptr, Mplus_ReadPipeInit);
+		dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
+		dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
 		MemReadDOC(docptr, &buf[got], size - 2);
 		buf[got + size - 2] = ReadDOC(docptr, Mplus_LastDataRead);
 		buf[got + size - 1] = ReadDOC(docptr, Mplus_LastDataRead);
diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index 706b847..98ae1d7 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -82,7 +82,7 @@ static inline int __init doccheck(void __iomem *potential, unsigned long physadr
 	void __iomem *window=potential;
 	unsigned char tmp, tmpb, tmpc, ChipID;
 #ifndef DOC_PASSIVE_PROBE
-	unsigned char tmp2;
+	unsigned char tmp2, dummy;
 #endif
 
 	/* Routine copied from the Linux DOC driver */
@@ -135,8 +135,8 @@ static inline int __init doccheck(void __iomem *potential, unsigned long physadr
 
 	case DOC_ChipID_DocMil:
 		/* Check for the new 2000 with Millennium ASIC */
-		ReadDOC(window, ChipID);
-		ReadDOC(window, ChipID);
+		dummy = ReadDOC(window, ChipID);
+		dummy = ReadDOC(window, ChipID);
 		if (ReadDOC(window, ChipID) != DOC_ChipID_DocMil)
 			ChipID = DOC_ChipID_Doc2kTSOP;
 
@@ -155,7 +155,7 @@ static inline int __init doccheck(void __iomem *potential, unsigned long physadr
 #ifndef DOC_PASSIVE_PROBE
 		/* Possibly release from power down mode */
 		for (tmp = 0; (tmp < 4); tmp++)
-			ReadDOC(window, Mplus_Power);
+			dummy = ReadDOC(window, Mplus_Power);
 
 		/* Reset the DiskOnChip ASIC */
 		tmp = DOC_MODE_RESET | DOC_MODE_MDWREN | DOC_MODE_RST_LAT |
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index df921e7..62772e7 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -313,9 +313,9 @@ static u_char doc2000_read_byte(struct mtd_info *mtd)
 	struct nand_chip *this = mtd->priv;
 	struct doc_priv *doc = this->priv;
 	void __iomem *docptr = doc->virtadr;
-	u_char ret;
+	u_char ret, dummy;
 
-	ReadDOC(docptr, CDSNSlowIO);
+	dummy = ReadDOC(docptr, CDSNSlowIO);
 	DoC_Delay(doc, 2);
 	ret = ReadDOC(docptr, 2k_CDSN_IO);
 	if (debug)
@@ -487,11 +487,12 @@ static u_char doc2001_read_byte(struct mtd_info *mtd)
 	struct nand_chip *this = mtd->priv;
 	struct doc_priv *doc = this->priv;
 	void __iomem *docptr = doc->virtadr;
+	u_char dummy;
 
 	//ReadDOC(docptr, CDSNSlowIO);
 	/* 11.4.5 -- delay twice to allow extended length cycle */
 	DoC_Delay(doc, 2);
-	ReadDOC(docptr, ReadPipeInit);
+	dummy = ReadDOC(docptr, ReadPipeInit);
 	//return ReadDOC(docptr, Mil_CDSN_IO);
 	return ReadDOC(docptr, LastDataRead);
 }
@@ -515,9 +516,10 @@ static void doc2001_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 	struct doc_priv *doc = this->priv;
 	void __iomem *docptr = doc->virtadr;
 	int i;
+	u_char dummy;
 
 	/* Start read pipeline */
-	ReadDOC(docptr, ReadPipeInit);
+	dummy = ReadDOC(docptr, ReadPipeInit);
 
 	for (i = 0; i < len - 1; i++)
 		buf[i] = ReadDOC(docptr, Mil_CDSN_IO + (i & 0xff));
@@ -532,13 +534,14 @@ static int doc2001_verifybuf(struct mtd_info *mtd, const u_char *buf, int len)
 	struct doc_priv *doc = this->priv;
 	void __iomem *docptr = doc->virtadr;
 	int i;
+	u_char dummy;
 
 	/* Start read pipeline */
-	ReadDOC(docptr, ReadPipeInit);
+	dummy = ReadDOC(docptr, ReadPipeInit);
 
 	for (i = 0; i < len - 1; i++)
 		if (buf[i] != ReadDOC(docptr, Mil_CDSN_IO)) {
-			ReadDOC(docptr, LastDataRead);
+			dummy = ReadDOC(docptr, LastDataRead);
 			return i;
 		}
 	if (buf[i] != ReadDOC(docptr, LastDataRead))
@@ -551,10 +554,10 @@ static u_char doc2001plus_read_byte(struct mtd_info *mtd)
 	struct nand_chip *this = mtd->priv;
 	struct doc_priv *doc = this->priv;
 	void __iomem *docptr = doc->virtadr;
-	u_char ret;
+	u_char ret, dummy;
 
-	ReadDOC(docptr, Mplus_ReadPipeInit);
-	ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
 	ret = ReadDOC(docptr, Mplus_LastDataRead);
 	if (debug)
 		printk("read_byte returns %02x\n", ret);
@@ -585,13 +588,14 @@ static void doc2001plus_readbuf(struct mtd_info *mtd, u_char *buf, int len)
 	struct doc_priv *doc = this->priv;
 	void __iomem *docptr = doc->virtadr;
 	int i;
+	u_char dummy;
 
 	if (debug)
 		printk("readbuf of %d bytes: ", len);
 
 	/* Start read pipeline */
-	ReadDOC(docptr, Mplus_ReadPipeInit);
-	ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
 
 	for (i = 0; i < len - 2; i++) {
 		buf[i] = ReadDOC(docptr, Mil_CDSN_IO);
@@ -616,18 +620,19 @@ static int doc2001plus_verifybuf(struct mtd_info *mtd, const u_char *buf, int le
 	struct doc_priv *doc = this->priv;
 	void __iomem *docptr = doc->virtadr;
 	int i;
+	u_char dummy;
 
 	if (debug)
 		printk("verifybuf of %d bytes: ", len);
 
 	/* Start read pipeline */
-	ReadDOC(docptr, Mplus_ReadPipeInit);
-	ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
+	dummy = ReadDOC(docptr, Mplus_ReadPipeInit);
 
 	for (i = 0; i < len - 2; i++)
 		if (buf[i] != ReadDOC(docptr, Mil_CDSN_IO)) {
-			ReadDOC(docptr, Mplus_LastDataRead);
-			ReadDOC(docptr, Mplus_LastDataRead);
+			dummy = ReadDOC(docptr, Mplus_LastDataRead);
+			dummy = ReadDOC(docptr, Mplus_LastDataRead);
 			return i;
 		}
 	if (buf[len - 2] != ReadDOC(docptr, Mplus_LastDataRead))
@@ -1445,15 +1450,16 @@ static inline int __init doc2001_init(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
 	struct doc_priv *doc = this->priv;
+	u_char dummy;
 
 	this->read_byte = doc2001_read_byte;
 	this->write_buf = doc2001_writebuf;
 	this->read_buf = doc2001_readbuf;
 	this->verify_buf = doc2001_verifybuf;
 
-	ReadDOC(doc->virtadr, ChipID);
-	ReadDOC(doc->virtadr, ChipID);
-	ReadDOC(doc->virtadr, ChipID);
+	dummy = ReadDOC(doc->virtadr, ChipID);
+	dummy = ReadDOC(doc->virtadr, ChipID);
+	dummy = ReadDOC(doc->virtadr, ChipID);
 	if (ReadDOC(doc->virtadr, ChipID) != DOC_ChipID_DocMil) {
 		/* It's not a Millennium; it's one of the newer
 		   DiskOnChip 2000 units with a similar ASIC.
@@ -1495,7 +1501,7 @@ static inline int __init doc2001plus_init(struct mtd_info *mtd)
 
 static int __init doc_probe(unsigned long physadr)
 {
-	unsigned char ChipID;
+	unsigned char ChipID, dummy;
 	struct mtd_info *mtd;
 	struct nand_chip *nand;
 	struct doc_priv *doc;
@@ -1544,7 +1550,7 @@ static int __init doc_probe(unsigned long physadr)
 		/* Possible Millennium Plus, need to do more checks */
 		/* Possibly release from power down mode */
 		for (tmp = 0; (tmp < 4); tmp++)
-			ReadDOC(virtadr, Mplus_Power);
+			dummy = ReadDOC(virtadr, Mplus_Power);
 
 		/* Reset the Millennium Plus ASIC */
 		tmp = DOC_MODE_RESET | DOC_MODE_MDWREN | DOC_MODE_RST_LAT | DOC_MODE_BDECT;
-- 
1.7.3.4
