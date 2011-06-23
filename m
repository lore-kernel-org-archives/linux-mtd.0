Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZrCa-0006rh-16
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 21:12:45 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd: spelling, capitalization, uniformity
Date: Thu, 23 Jun 2011 14:12:08 -0700
Message-ID: <1308863528-32194-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Therefor -> Therefore
[Intern], [Internal] -> [INTERN]
[REPLACABLE] -> [REPLACEABLE]
syndrom, syndom -> syndrome
ecc -> ECC
buswith -> buswidth
endianess -> endianness
dont -> don't
occures -> occurs
independend -> independent
wihin -> within
erease -> erase
blockes -> blocks
...

(This is based on Artem's l2-mtd-2.6 git tree)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c    |    2 +-
 drivers/mtd/devices/doc2000.c      |    2 +-
 drivers/mtd/devices/doc2001.c      |    2 +-
 drivers/mtd/devices/doc2001plus.c  |    2 +-
 drivers/mtd/devices/docecc.c       |    2 +-
 drivers/mtd/mtdchar.c              |    6 +-
 drivers/mtd/nand/au1550nd.c        |   29 +++++------
 drivers/mtd/nand/cafe_nand.c       |    2 +-
 drivers/mtd/nand/diskonchip.c      |    4 +-
 drivers/mtd/nand/nand_base.c       |  105 ++++++++++++++++++------------------
 drivers/mtd/nand/nand_bbt.c        |    8 ++--
 drivers/mtd/nand/nand_ecc.c        |   10 ++--
 drivers/mtd/nand/rtc_from4.c       |    2 +-
 drivers/mtd/onenand/onenand_base.c |   12 ++--
 drivers/mtd/sm_ftl.c               |    2 +-
 include/linux/mtd/mtd.h            |    2 +-
 include/linux/mtd/nand.h           |   50 +++++++++---------
 17 files changed, 119 insertions(+), 123 deletions(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index ea832ea..d40c410 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1914,7 +1914,7 @@ static void jedec_reset(u32 base, struct map_info *map, struct cfi_private *cfi)
 	 * (oh and incidentaly the jedec spec - 3.5.3.3) the reset
 	 * sequence is *supposed* to be 0xaa at 0x5555, 0x55 at
 	 * 0x2aaa, 0xF0 at 0x5555 this will not affect the AMD chips
-	 * as they will ignore the writes and dont care what address
+	 * as they will ignore the writes and don't care what address
 	 * the F0 is written to */
 	if (cfi->addr_unlock1) {
 		DEBUG( MTD_DEBUG_LEVEL3,
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index f7fbf60..ed15447 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -699,7 +699,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 #ifdef ECC_DEBUG
 			printk(KERN_ERR "DiskOnChip ECC Error: Read at %lx\n", (long)from);
 #endif
-			/* Read the ECC syndrom through the DiskOnChip ECC
+			/* Read the ECC syndrome through the DiskOnChip ECC
 			   logic.  These syndrome will be all ZERO when there
 			   is no error */
 			for (i = 0; i < 6; i++) {
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 241192f..c6ea860 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -464,7 +464,7 @@ static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
 #ifdef ECC_DEBUG
 		printk("DiskOnChip ECC Error: Read at %lx\n", (long)from);
 #endif
-		/* Read the ECC syndrom through the DiskOnChip ECC logic.
+		/* Read the ECC syndrome through the DiskOnChip ECC logic.
 		   These syndrome will be all ZERO when there is no error */
 		for (i = 0; i < 6; i++) {
 			syndrome[i] = ReadDOC(docptr, ECCSyndrome0 + i);
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 09ae0ad..fe82fbf 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -655,7 +655,7 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 #ifdef ECC_DEBUG
 		printk("DiskOnChip ECC Error: Read at %lx\n", (long)from);
 #endif
-		/* Read the ECC syndrom through the DiskOnChip ECC logic.
+		/* Read the ECC syndrome through the DiskOnChip ECC logic.
 		   These syndrome will be all ZERO when there is no error */
 		for (i = 0; i < 6; i++)
 			syndrome[i] = ReadDOC(docptr, Mplus_ECCSyndrome0 + i);
diff --git a/drivers/mtd/devices/docecc.c b/drivers/mtd/devices/docecc.c
index 37ef29a..4a1c39b 100644
--- a/drivers/mtd/devices/docecc.c
+++ b/drivers/mtd/devices/docecc.c
@@ -2,7 +2,7 @@
  * ECC algorithm for M-systems disk on chip. We use the excellent Reed
  * Solmon code of Phil Karn (karn@ka9q.ampr.org) available under the
  * GNU GPL License. The rest is simply to convert the disk on chip
- * syndrom into a standard syndom.
+ * syndrome into a standard syndome.
  *
  * Author: Fabrice Bellard (fabrice.bellard@netgem.com)
  * Copyright (C) 2000 Netgem S.A.
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 9f8658e..92fa82d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -233,9 +233,9 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 		default:
 			ret = mtd->read(mtd, *ppos, len, &retlen, kbuf);
 		}
-		/* Nand returns -EBADMSG on ecc errors, but it returns
+		/* Nand returns -EBADMSG on ECC errors, but it returns
 		 * the data. For our userspace tools it is important
-		 * to dump areas with ecc errors !
+		 * to dump areas with ECC errors!
 		 * For kernel internal usage it also might return -EUCLEAN
 		 * to signal the caller that a bitflip has occurred and has
 		 * been corrected by the ECC algorithm.
@@ -883,7 +883,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 	}
 #endif
 
-	/* This ioctl is being deprecated - it truncates the ecc layout */
+	/* This ioctl is being deprecated - it truncates the ECC layout */
 	case ECCGETLAYOUT:
 	{
 		struct nand_ecclayout_user *usrlay;
diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index e7767ee..60d58d3 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -48,7 +48,7 @@ static const struct mtd_partition partition_info[] = {
  * au_read_byte -  read one byte from the chip
  * @mtd:	MTD device structure
  *
- *  read function for 8bit buswith
+ * read function for 8bit buswidth
  */
 static u_char au_read_byte(struct mtd_info *mtd)
 {
@@ -63,7 +63,7 @@ static u_char au_read_byte(struct mtd_info *mtd)
  * @mtd:	MTD device structure
  * @byte:	pointer to data byte to write
  *
- *  write function for 8it buswith
+ * write function for 8it buswidth
  */
 static void au_write_byte(struct mtd_info *mtd, u_char byte)
 {
@@ -73,11 +73,10 @@ static void au_write_byte(struct mtd_info *mtd, u_char byte)
 }
 
 /**
- * au_read_byte16 -  read one byte endianess aware from the chip
+ * au_read_byte16 -  read one byte endianness aware from the chip
  * @mtd:	MTD device structure
  *
- *  read function for 16bit buswith with
- * endianess conversion
+ * read function for 16bit buswidth with endianness conversion
  */
 static u_char au_read_byte16(struct mtd_info *mtd)
 {
@@ -88,12 +87,11 @@ static u_char au_read_byte16(struct mtd_info *mtd)
 }
 
 /**
- * au_write_byte16 -  write one byte endianess aware to the chip
+ * au_write_byte16 -  write one byte endianness aware to the chip
  * @mtd:	MTD device structure
  * @byte:	pointer to data byte to write
  *
- *  write function for 16bit buswith with
- * endianess conversion
+ * write function for 16bit buswidth with endianness conversion
  */
 static void au_write_byte16(struct mtd_info *mtd, u_char byte)
 {
@@ -106,8 +104,7 @@ static void au_write_byte16(struct mtd_info *mtd, u_char byte)
  * au_read_word -  read one word from the chip
  * @mtd:	MTD device structure
  *
- *  read function for 16bit buswith without
- * endianess conversion
+ * read function for 16bit buswidth without endianness conversion
  */
 static u16 au_read_word(struct mtd_info *mtd)
 {
@@ -123,7 +120,7 @@ static u16 au_read_word(struct mtd_info *mtd)
  * @buf:	data buffer
  * @len:	number of bytes to write
  *
- *  write function for 8bit buswith
+ * write function for 8bit buswidth
  */
 static void au_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
@@ -142,7 +139,7 @@ static void au_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
  * @buf:	buffer to store date
  * @len:	number of bytes to read
  *
- *  read function for 8bit buswith
+ * read function for 8bit buswidth
  */
 static void au_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
@@ -161,7 +158,7 @@ static void au_read_buf(struct mtd_info *mtd, u_char *buf, int len)
  * @buf:	buffer containing the data to compare
  * @len:	number of bytes to compare
  *
- *  verify function for 8bit buswith
+ * verify function for 8bit buswidth
  */
 static int au_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
 {
@@ -183,7 +180,7 @@ static int au_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
  * @buf:	data buffer
  * @len:	number of bytes to write
  *
- *  write function for 16bit buswith
+ * write function for 16bit buswidth
  */
 static void au_write_buf16(struct mtd_info *mtd, const u_char *buf, int len)
 {
@@ -205,7 +202,7 @@ static void au_write_buf16(struct mtd_info *mtd, const u_char *buf, int len)
  * @buf:	buffer to store date
  * @len:	number of bytes to read
  *
- *  read function for 16bit buswith
+ * read function for 16bit buswidth
  */
 static void au_read_buf16(struct mtd_info *mtd, u_char *buf, int len)
 {
@@ -226,7 +223,7 @@ static void au_read_buf16(struct mtd_info *mtd, u_char *buf, int len)
  * @buf:	buffer containing the data to compare
  * @len:	number of bytes to compare
  *
- *  verify function for 16bit buswith
+ * verify function for 16bit buswidth
  */
 static int au_verify_buf16(struct mtd_info *mtd, const u_char *buf, int len)
 {
diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index db3bfac..661e5dc 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -370,7 +370,7 @@ static int cafe_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 	return 1;
 }
 /**
- * cafe_nand_read_page_syndrome - {REPLACABLE] hardware ecc syndrom based page read
+ * cafe_nand_read_page_syndrome - [REPLACEABLE] hardware ecc syndrome based page read
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index b657d7f..de93a98 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -132,7 +132,7 @@ static struct rs_control *rs_decoder;
 
 /*
  * The HW decoder in the DoC ASIC's provides us a error syndrome,
- * which we must convert to a standard syndrom usable by the generic
+ * which we must convert to a standard syndrome usable by the generic
  * Reed-Solomon library code.
  *
  * Fabrice Bellard figured this out in the old docecc code. I added
@@ -153,7 +153,7 @@ static int doc_ecc_decode(struct rs_control *rs, uint8_t *data, uint8_t *ecc)
 	ds[3] = ((ecc[3] & 0xc0) >> 6) | ((ecc[0] & 0xff) << 2);
 	parity = ecc[1];
 
-	/* Initialize the syndrom buffer */
+	/* Initialize the syndrome buffer */
 	for (i = 0; i < NROOTS; i++)
 		s[i] = ds[0];
 	/*
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0a3cc39..f41d1af 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -21,7 +21,7 @@
  *  TODO:
  *	Enable cached programming for 2k page size chips
  *	Check, if mtd->ecctype should be set to MTD_ECC_HW
- *	if we have HW ecc support.
+ *	if we have HW ECC support.
  *	The AG-AND chips have nice features for speed improvement,
  *	which are not supported yet. Read / program 4 pages in one go.
  *	BBT table is not serialized, has to be fixed
@@ -159,7 +159,7 @@ static void nand_release_device(struct mtd_info *mtd)
  * nand_read_byte - [DEFAULT] read one byte from the chip
  * @mtd: MTD device structure
  *
- * Default read function for 8bit buswith.
+ * Default read function for 8bit buswidth
  */
 static uint8_t nand_read_byte(struct mtd_info *mtd)
 {
@@ -169,9 +169,11 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
 
 /**
  * nand_read_byte16 - [DEFAULT] read one byte endianess aware from the chip
+ * nand_read_byte16 - [DEFAULT] read one byte endianness aware from the chip
  * @mtd: MTD device structure
  *
- * Default read function for 16bit buswith with endianess conversion.
+ * Default read function for 16bit buswidth with endianness conversion.
+ *
  */
 static uint8_t nand_read_byte16(struct mtd_info *mtd)
 {
@@ -183,7 +185,7 @@ static uint8_t nand_read_byte16(struct mtd_info *mtd)
  * nand_read_word - [DEFAULT] read one word from the chip
  * @mtd: MTD device structure
  *
- * Default read function for 16bit buswith without endianess conversion.
+ * Default read function for 16bit buswidth without endianness conversion.
  */
 static u16 nand_read_word(struct mtd_info *mtd)
 {
@@ -220,7 +222,7 @@ static void nand_select_chip(struct mtd_info *mtd, int chipnr)
  * @buf: data buffer
  * @len: number of bytes to write
  *
- * Default write function for 8bit buswith.
+ * Default write function for 8bit buswidth.
  */
 static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
@@ -237,7 +239,7 @@ static void nand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
  * @buf: buffer to store date
  * @len: number of bytes to read
  *
- * Default read function for 8bit buswith.
+ * Default read function for 8bit buswidth.
  */
 static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
@@ -254,7 +256,7 @@ static void nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
  * @buf: buffer containing the data to compare
  * @len: number of bytes to compare
  *
- * Default verify function for 8bit buswith.
+ * Default verify function for 8bit buswidth.
  */
 static int nand_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
@@ -273,7 +275,7 @@ static int nand_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
  * @buf: data buffer
  * @len: number of bytes to write
  *
- * Default write function for 16bit buswith.
+ * Default write function for 16bit buswidth.
  */
 static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
@@ -293,7 +295,7 @@ static void nand_write_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
  * @buf: buffer to store date
  * @len: number of bytes to read
  *
- * Default read function for 16bit buswith.
+ * Default read function for 16bit buswidth.
  */
 static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
 {
@@ -312,7 +314,7 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
  * @buf: buffer containing the data to compare
  * @len: number of bytes to compare
  *
- * Default verify function for 16bit buswith.
+ * Default verify function for 16bit buswidth.
  */
 static int nand_verify_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
@@ -499,7 +501,7 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
 	}
 }
 
-/* Wait for the ready pin, after a command. The timeout is catched later */
+/* Wait for the ready pin, after a command. The timeout is caught later. */
 void nand_wait_ready(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
@@ -510,7 +512,7 @@ void nand_wait_ready(struct mtd_info *mtd)
 		return panic_nand_wait_ready(mtd, 400);
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
-	/* Wait until command is processed or timeout occures */
+	/* Wait until command is processed or timeout occurs */
 	do {
 		if (chip->dev_ready(mtd))
 			break;
@@ -629,8 +631,8 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
  * @page_addr: the page address for this command, -1 if none
  *
  * Send command to NAND device. This is the version for the new large page
- * devices We dont have the separate regions as we have in the small page
- * devices.  We must emulate NAND_CMD_READOOB to keep the code compatible.
+ * devices. We don't have the separate regions as we have in the small page
+ * devices. We must emulate NAND_CMD_READOOB to keep the code compatible.
  */
 static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 			    int column, int page_addr)
@@ -754,7 +756,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 static void panic_nand_get_device(struct nand_chip *chip,
 		      struct mtd_info *mtd, int new_state)
 {
-	/* Hardware controller shared among independend devices */
+	/* Hardware controller shared among independent devices */
 	chip->controller->active = chip;
 	chip->state = new_state;
 }
@@ -1032,14 +1034,13 @@ out:
 EXPORT_SYMBOL(nand_lock);
 
 /**
- * nand_read_page_raw - [Intern] read raw page data without ecc
+ * nand_read_page_raw - [INTERN] read raw page data without ecc
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
  * @page: page number to read
  *
- * Not for syndrome calculating ecc controllers, which use a special oob
- * layout.
+ * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
 static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 			      uint8_t *buf, int page)
@@ -1050,7 +1051,7 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_read_page_raw_syndrome - [Intern] read raw page data without ecc
+ * nand_read_page_raw_syndrome - [INTERN] read raw page data without ecc
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
@@ -1093,7 +1094,7 @@ static int nand_read_page_raw_syndrome(struct mtd_info *mtd,
 }
 
 /**
- * nand_read_page_swecc - [REPLACABLE] software ecc based page read function
+ * nand_read_page_swecc - [REPLACEABLE] software ECC based page read function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
@@ -1134,7 +1135,7 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_read_subpage - [REPLACABLE] software ecc based sub-page read function
+ * nand_read_subpage - [REPLACEABLE] software ECC based sub-page read function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @data_offs: offset of requested data within the page
@@ -1152,7 +1153,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	int busw = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
 	int index = 0;
 
-	/* Column address wihin the page aligned to ECC size (256bytes) */
+	/* Column address within the page aligned to ECC size (256bytes) */
 	start_step = data_offs / chip->ecc.size;
 	end_step = (data_offs + readlen - 1) / chip->ecc.size;
 	num_steps = end_step - start_step + 1;
@@ -1175,7 +1176,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 
 	/*
 	 * The performance is faster if we position offsets according to
-	 * ecc.pos. Let's make sure that there are no gaps in ecc positions.
+	 * ecc.pos. Let's make sure that there are no gaps in ECC positions.
 	 */
 	for (i = 0; i < eccfrag_len - 1; i++) {
 		if (eccpos[i + start_step * chip->ecc.bytes] + 1 !=
@@ -1189,7 +1190,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
 	} else {
 		/*
-		 * Send the command to read the particular ecc bytes take care
+		 * Send the command to read the particular ECC bytes take care
 		 * about buswidth alignment in read_buf.
 		 */
 		index = start_step * chip->ecc.bytes;
@@ -1224,14 +1225,13 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_read_page_hwecc - [REPLACABLE] hardware ecc based page read function
+ * nand_read_page_hwecc - [REPLACEABLE] hardware ECC based page read function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
  * @page: page number to read
  *
- * Not for syndrome calculating ecc controllers which need a special oob
- * layout.
+ * Not for syndrome calculating ECC controllers which need a special oob layout.
  */
 static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int page)
@@ -1270,7 +1270,7 @@ static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_read_page_hwecc_oob_first - [REPLACABLE] hw ecc, read oob first
+ * nand_read_page_hwecc_oob_first - [REPLACEABLE] hw ecc, read oob first
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
@@ -1318,7 +1318,7 @@ static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
 }
 
 /**
- * nand_read_page_syndrome - [REPLACABLE] hardware ecc syndrom based page read
+ * nand_read_page_syndrome - [REPLACEABLE] hardware ECC syndrome based page read
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: buffer to store read data
@@ -1373,7 +1373,7 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_transfer_oob - [Internal] Transfer oob to client buffer
+ * nand_transfer_oob - [INTERN] Transfer oob to client buffer
  * @chip: nand chip structure
  * @oob: oob destination address
  * @ops: oob ops structure
@@ -1421,7 +1421,7 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 }
 
 /**
- * nand_do_read_ops - [Internal] Read data with ECC
+ * nand_do_read_ops - [INTERN] Read data with ECC
  * @mtd: MTD device structure
  * @from: offset to read from
  * @ops: oob ops structure
@@ -1599,7 +1599,7 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 }
 
 /**
- * nand_read_oob_std - [REPLACABLE] the most common OOB data read function
+ * nand_read_oob_std - [REPLACEABLE] the most common OOB data read function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @page: page number to read
@@ -1617,7 +1617,7 @@ static int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_read_oob_syndrome - [REPLACABLE] OOB data read function for HW ECC
+ * nand_read_oob_syndrome - [REPLACEABLE] OOB data read function for HW ECC
  *			    with syndromes
  * @mtd: mtd info structure
  * @chip: nand chip info structure
@@ -1656,7 +1656,7 @@ static int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_write_oob_std - [REPLACABLE] the most common OOB data write function
+ * nand_write_oob_std - [REPLACEABLE] the most common OOB data write function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @page: page number to write
@@ -1679,7 +1679,7 @@ static int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_write_oob_syndrome - [REPLACABLE] OOB data write function for HW ECC
+ * nand_write_oob_syndrome - [REPLACEABLE] OOB data write function for HW ECC
  *			     with syndrome - only for large page flash
  * @mtd: mtd info structure
  * @chip: nand chip info structure
@@ -1738,7 +1738,7 @@ static int nand_write_oob_syndrome(struct mtd_info *mtd,
 }
 
 /**
- * nand_do_read_oob - [Intern] NAND read out-of-band
+ * nand_do_read_oob - [INTERN] NAND read out-of-band
  * @mtd: MTD device structure
  * @from: offset to read from
  * @ops: oob operations description structure
@@ -1878,13 +1878,12 @@ out:
 
 
 /**
- * nand_write_page_raw - [Intern] raw page write function
+ * nand_write_page_raw - [INTERN] raw page write function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
  *
- * Not for syndrome calculating ecc controllers, which use a special oob
- * layout.
+ * Not for syndrome calculating ECC controllers, which use a special oob layout.
  */
 static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf)
@@ -1894,7 +1893,7 @@ static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_write_page_raw_syndrome - [Intern] raw page write function
+ * nand_write_page_raw_syndrome - [INTERN] raw page write function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
@@ -1933,7 +1932,7 @@ static void nand_write_page_raw_syndrome(struct mtd_info *mtd,
 		chip->write_buf(mtd, oob, size);
 }
 /**
- * nand_write_page_swecc - [REPLACABLE] software ecc based page write function
+ * nand_write_page_swecc - [REPLACEABLE] software ECC based page write function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
@@ -1948,7 +1947,7 @@ static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 	const uint8_t *p = buf;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
 
-	/* Software ecc calculation */
+	/* Software ECC calculation */
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 
@@ -1959,7 +1958,7 @@ static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_write_page_hwecc - [REPLACABLE] hardware ecc based page write function
+ * nand_write_page_hwecc - [REPLACEABLE] hardware ECC based page write function
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
@@ -1987,7 +1986,7 @@ static void nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_write_page_syndrome - [REPLACABLE] hardware ecc syndrom based page write
+ * nand_write_page_syndrome - [REPLACEABLE] hardware ECC syndrome based page write
  * @mtd: mtd info structure
  * @chip: nand chip info structure
  * @buf: data buffer
@@ -2052,7 +2051,7 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->ecc.write_page(mtd, chip, buf);
 
 	/*
-	 * Cached progamming disabled for now, Not sure if its worth the
+	 * Cached progamming disabled for now. Not sure if it's worth the
 	 * trouble. The speed gain is not very impressive. (2.3->2.6Mib/s).
 	 */
 	cached = 0;
@@ -2087,7 +2086,7 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_fill_oob - [Internal] Transfer client buffer to oob
+ * nand_fill_oob - [INTERN] Transfer client buffer to oob
  * @mtd: MTD device structure
  * @oob: oob data buffer
  * @len: oob data write length
@@ -2145,7 +2144,7 @@ static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
 #define NOTALIGNED(x)	((x & (chip->subpagesize - 1)) != 0)
 
 /**
- * nand_do_write_ops - [Internal] NAND write with ECC
+ * nand_do_write_ops - [INTERN] NAND write with ECC
  * @mtd: MTD device structure
  * @to: offset to write to
  * @ops: oob operations description structure
@@ -2451,7 +2450,7 @@ out:
 }
 
 /**
- * single_erease_cmd - [GENERIC] NAND standard block erase command function
+ * single_erase_cmd - [GENERIC] NAND standard block erase command function
  * @mtd: MTD device structure
  * @page: the page address of the block which will be erased
  *
@@ -2466,7 +2465,7 @@ static void single_erase_cmd(struct mtd_info *mtd, int page)
 }
 
 /**
- * multi_erease_cmd - [GENERIC] AND specific block erase command function
+ * multi_erase_cmd - [GENERIC] AND specific block erase command function
  * @mtd: MTD device structure
  * @page: the page address of the block which will be erased
  *
@@ -2497,7 +2496,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 #define BBT_PAGE_MASK	0xffffff3f
 /**
- * nand_erase_nand - [Internal] erase block(s)
+ * nand_erase_nand - [INTERN] erase block(s)
  * @mtd: MTD device structure
  * @instr: erase instruction
  * @allowbbt: allow erasing the bbt area
@@ -2547,7 +2546,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	 * If BBT requires refresh, set the BBT page mask to see if the BBT
 	 * should be rewritten. Otherwise the mask is set to 0xffffffff which
 	 * can not be matched. This is also done when the bbt is actually
-	 * erased to avoid recusrsive updates.
+	 * erased to avoid recursive updates.
 	 */
 	if (chip->options & BBT_AUTO_REFRESH && !allowbbt)
 		bbt_masked_page = chip->bbt_td->pages[chipnr] & BBT_PAGE_MASK;
@@ -2821,7 +2820,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	int i;
 	int val;
 
-	/* Try ONFI for unknow chip or LP */
+	/* Try ONFI for unknown chip or LP */
 	chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
 	if (chip->read_byte(mtd) != 'O' || chip->read_byte(mtd) != 'N' ||
 		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
@@ -3392,7 +3391,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 */
 	chip->ecc.steps = mtd->writesize / chip->ecc.size;
 	if (chip->ecc.steps * chip->ecc.size != mtd->writesize) {
-		printk(KERN_WARNING "Invalid ecc parameters\n");
+		printk(KERN_WARNING "Invalid ECC parameters\n");
 		BUG();
 	}
 	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 8875d6d..f30807c 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -149,7 +149,7 @@ static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
  * add_marker_len - compute the length of the marker in data area
  * @td: BBT descriptor used for computation
  *
- * The length will be 0 if the markeris located in OOB area.
+ * The length will be 0 if the marker is located in OOB area.
  */
 static u32 add_marker_len(struct nand_bbt_descr *td)
 {
@@ -170,7 +170,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
  * @buf: temporary buffer
  * @page: the starting page
  * @num: the number of bbt descriptors to read
- * @td:	 the bbt describtion table
+ * @td: the bbt describtion table
  * @offs: offset in the memory table
  *
  * Read the bad block table starting from page.
@@ -1241,7 +1241,7 @@ static struct nand_bbt_descr agand_flashbased = {
 	.pattern = scan_agand_pattern
 };
 
-/* Generic flash bbt decriptors */
+/* Generic flash bbt descriptors */
 static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
 static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
 
@@ -1286,7 +1286,7 @@ static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
 };
 
 /**
- * nand_create_default_bbt_descr - [Internal] Creates a BBT descriptor structure
+ * nand_create_default_bbt_descr - [INTERN] Creates a BBT descriptor structure
  * @this: NAND chip to create descriptor for
  *
  * This function allocates and initializes a nand_bbt_descr for BBM detection
diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index 271b8e7..b7cfe0d 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -110,7 +110,7 @@ static const char bitsperbyte[256] = {
 
 /*
  * addressbits is a lookup table to filter out the bits from the xor-ed
- * ecc data that identify the faulty location.
+ * ECC data that identify the faulty location.
  * this is only used for repairing parity
  * see the comments in nand_correct_data for more details
  */
@@ -153,7 +153,7 @@ static const char addressbits[256] = {
  * __nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256/512-byte
  *			 block
  * @buf:	input buffer with raw data
- * @eccsize:	data bytes per ecc step (256 or 512)
+ * @eccsize:	data bytes per ECC step (256 or 512)
  * @code:	output buffer with ECC
  */
 void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
@@ -348,7 +348,7 @@ void __nand_calculate_ecc(const unsigned char *buf, unsigned int eccsize,
 		rp17 = (par ^ rp16) & 0xff;
 
 	/*
-	 * Finally calculate the ecc bits.
+	 * Finally calculate the ECC bits.
 	 * Again here it might seem that there are performance optimisations
 	 * possible, but benchmarks showed that on the system this is developed
 	 * the code below is the fastest
@@ -436,7 +436,7 @@ EXPORT_SYMBOL(nand_calculate_ecc);
  * @buf:	raw data read from the chip
  * @read_ecc:	ECC from the chip
  * @calc_ecc:	the ECC calculated from raw data
- * @eccsize:	data bytes per ecc step (256 or 512)
+ * @eccsize:	data bytes per ECC step (256 or 512)
  *
  * Detect and correct a 1 bit error for eccsize byte block
  */
@@ -505,7 +505,7 @@ int __nand_correct_data(unsigned char *buf,
 	}
 	/* count nr of bits; use table lookup, faster than calculating it */
 	if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
-		return 1;	/* error in ecc data; no action needed */
+		return 1;	/* error in ECC data; no action needed */
 
 	printk(KERN_ERR "uncorrectable error : ");
 	return -1;
diff --git a/drivers/mtd/nand/rtc_from4.c b/drivers/mtd/nand/rtc_from4.c
index a07da2a..33fe922 100644
--- a/drivers/mtd/nand/rtc_from4.c
+++ b/drivers/mtd/nand/rtc_from4.c
@@ -351,7 +351,7 @@ static int rtc_from4_correct_data(struct mtd_info *mtd, const u_char *buf, u_cha
 		return 0;
 	}
 
-	/* Read the syndrom pattern from the FPGA and correct the bitorder */
+	/* Read the syndrome pattern from the FPGA and correct the bitorder */
 	rs_ecc = (volatile unsigned short *)(rtc_from4_fio_base + RTC_FROM4_RS_ECC);
 	for (i = 0; i < 8; i++) {
 		ecc[i] = bitrev8(*rs_ecc);
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index ac9e959..5ac37d6 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1015,7 +1015,7 @@ static void onenand_release_device(struct mtd_info *mtd)
 }
 
 /**
- * onenand_transfer_auto_oob - [Internal] oob auto-placement transfer
+ * onenand_transfer_auto_oob - [INTERN] oob auto-placement transfer
  * @param mtd		MTD device structure
  * @param buf		destination address
  * @param column	oob offset to read from
@@ -1821,7 +1821,7 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 }
 
 /**
- * onenand_fill_auto_oob - [Internal] oob auto-placement transfer
+ * onenand_fill_auto_oob - [INTERN] oob auto-placement transfer
  * @param mtd		MTD device structure
  * @param oob_buf	oob buffer
  * @param buf		source address
@@ -2055,7 +2055,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 
 
 /**
- * onenand_write_oob_nolock - [Internal] OneNAND write out-of-band
+ * onenand_write_oob_nolock - [INTERN] OneNAND write out-of-band
  * @param mtd		MTD device structure
  * @param to		offset to write to
  * @param len		number of bytes to write
@@ -2281,7 +2281,7 @@ static int onenand_multiblock_erase_verify(struct mtd_info *mtd,
 }
 
 /**
- * onenand_multiblock_erase - [Internal] erase block(s) using multiblock erase
+ * onenand_multiblock_erase - [INTERN] erase block(s) using multiblock erase
  * @param mtd		MTD device structure
  * @param instr		erase instruction
  * @param region	erase region
@@ -2397,7 +2397,7 @@ static int onenand_multiblock_erase(struct mtd_info *mtd,
 
 
 /**
- * onenand_block_by_block_erase - [Internal] erase block(s) using regular erase
+ * onenand_block_by_block_erase - [INTERN] erase block(s) using regular erase
  * @param mtd		MTD device structure
  * @param instr		erase instruction
  * @param region	erase region
@@ -2922,7 +2922,7 @@ static int onenand_otp_command(struct mtd_info *mtd, int cmd, loff_t addr,
 }
 
 /**
- * onenand_otp_write_oob_nolock - [Internal] OneNAND write out-of-band, specific to OTP
+ * onenand_otp_write_oob_nolock - [INTERN] OneNAND write out-of-band, specific to OTP
  * @param mtd		MTD device structure
  * @param to		offset to write to
  * @param len		number of bytes to write
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index ed3d6cd..a8befde 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -138,7 +138,7 @@ static int sm_get_lba(uint8_t *lba)
 	if ((lba[0] & 0xF8) != 0x10)
 		return -2;
 
-	/* check parity - endianess doesn't matter */
+	/* check parity - endianness doesn't matter */
 	if (hweight16(*(uint16_t *)lba) & 1)
 		return -2;
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index b2b454b..db8a2b0 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -172,7 +172,7 @@ struct mtd_info {
 	const char *name;
 	int index;
 
-	/* ecc layout structure pointer - read only ! */
+	/* ECC layout structure pointer - read only! */
 	struct nand_ecclayout *ecclayout;
 
 	/* Data for variable erase regions. If numeraseregions is zero,
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index da6e252..38a2fb6 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -42,10 +42,10 @@ extern void nand_release(struct mtd_info *mtd);
 /* Internal helper for board drivers which need to override command function */
 extern void nand_wait_ready(struct mtd_info *mtd);
 
-/* locks all blockes present in the device */
+/* locks all blocks present in the device */
 extern int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
-/* unlocks specified locked blockes */
+/* unlocks specified locked blocks */
 extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 /* The maximum number of NAND chips in an array */
@@ -150,7 +150,7 @@ typedef enum {
 #define NAND_ECC_READ		0
 /* Reset Hardware ECC for write */
 #define NAND_ECC_WRITE		1
-/* Enable Hardware ECC before syndrom is read back from flash */
+/* Enable Hardware ECC before syndrome is read back from flash */
 #define NAND_ECC_READSYN	2
 
 /* Bit mask for flags passed to do_nand_read_ecc */
@@ -163,7 +163,7 @@ typedef enum {
  */
 /* Chip can not auto increment pages */
 #define NAND_NO_AUTOINCR	0x00000001
-/* Buswitdh is 16 bit */
+/* Buswidth is 16 bit */
 #define NAND_BUSWIDTH_16	0x00000002
 /* Device supports partial programming without padding */
 #define NAND_NO_PADDING		0x00000004
@@ -319,26 +319,26 @@ struct nand_hw_control {
 };
 
 /**
- * struct nand_ecc_ctrl - Control structure for ecc
- * @mode:	ecc mode
- * @steps:	number of ecc steps per page
- * @size:	data bytes per ecc step
- * @bytes:	ecc bytes per step
- * @total:	total number of ecc bytes per page
- * @prepad:	padding information for syndrome based ecc generators
- * @postpad:	padding information for syndrome based ecc generators
+ * struct nand_ecc_ctrl - Control structure for ECC
+ * @mode:	ECC mode
+ * @steps:	number of ECC steps per page
+ * @size:	data bytes per ECC step
+ * @bytes:	ECC bytes per step
+ * @total:	total number of ECC bytes per page
+ * @prepad:	padding information for syndrome based ECC generators
+ * @postpad:	padding information for syndrome based ECC generators
  * @layout:	ECC layout control struct pointer
- * @priv:	pointer to private ecc control data
- * @hwctl:	function to control hardware ecc generator. Must only
+ * @priv:	pointer to private ECC control data
+ * @hwctl:	function to control hardware ECC generator. Must only
  *		be provided if an hardware ECC is available
- * @calculate:	function for ecc calculation or readback from ecc hardware
- * @correct:	function for ecc correction, matching to ecc generator (sw/hw)
+ * @calculate:	function for ECC calculation or readback from ECC hardware
+ * @correct:	function for ECC correction, matching to ECC generator (sw/hw)
  * @read_page_raw:	function to read a raw page without ECC
  * @write_page_raw:	function to write a raw page without ECC
- * @read_page:	function to read a page according to the ecc generator
+ * @read_page:	function to read a page according to the ECC generator
  *		requirements.
  * @read_subpage:	function to read parts of the page covered by ECC.
- * @write_page:	function to write a page according to the ecc generator
+ * @write_page:	function to write a page according to the ECC generator
  *		requirements.
  * @read_oob:	function to read chip OOB data
  * @write_oob:	function to write chip OOB data
@@ -376,8 +376,8 @@ struct nand_ecc_ctrl {
 
 /**
  * struct nand_buffers - buffer structure for read/write
- * @ecccalc:	buffer for calculated ecc
- * @ecccode:	buffer for ecc read from flash
+ * @ecccalc:	buffer for calculated ECC
+ * @ecccode:	buffer for ECC read from flash
  * @databuf:	buffer for data - dynamically sized
  *
  * Do not change the order of buffers. databuf and oobrbuf must be in
@@ -410,7 +410,7 @@ struct nand_buffers {
  *			mtd->oobsize, mtd->writesize and so on.
  *			@id_data contains the 8 bytes values of NAND_CMD_READID.
  *			Return with the bus width.
- * @dev_ready:		[BOARDSPECIFIC] hardwarespecific function for accesing
+ * @dev_ready:		[BOARDSPECIFIC] hardwarespecific function for accessing
  *			device ready/busy line. If set to NULL no access to
  *			ready/busy is available and the ready/busy information
  *			is read from the chip status register.
@@ -418,7 +418,7 @@ struct nand_buffers {
  *			commands to the chip.
  * @waitfunc:		[REPLACEABLE] hardwarespecific function for wait on
  *			ready.
- * @ecc:		[BOARDSPECIFIC] ecc control ctructure
+ * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buffers:		buffer structure for read/write
  * @hwcontrol:		platform-specific hardware control structure
  * @ops:		oob operation operands
@@ -455,7 +455,7 @@ struct nand_buffers {
  *			non 0 if ONFI supported.
  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
  *			supported, 0 otherwise.
- * @ecclayout:		[REPLACEABLE] the default ecc placement scheme
+ * @ecclayout:		[REPLACEABLE] the default ECC placement scheme
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
@@ -463,7 +463,7 @@ struct nand_buffers {
  * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for initial
  *			bad block scan.
  * @controller:		[REPLACEABLE] a pointer to a hardware controller
- *			structure which is shared among multiple independend
+ *			structure which is shared among multiple independent
  *			devices.
  * @priv:		[OPTIONAL] pointer to private chip date
  * @errstat:		[OPTIONAL] hardware specific function to perform
@@ -603,7 +603,7 @@ extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
  * @partitions:		mtd partition list
  * @chip_delay:		R/B delay value in us
  * @options:		Option flags, e.g. 16bit buswidth
- * @ecclayout:		ecc layout info structure
+ * @ecclayout:		ECC layout info structure
  * @part_probe_types:	NULL-terminated array of probe types
  * @set_parts:		platform specific function to set partitions
  * @priv:		hardware controller specific settings
-- 
1.7.0.4
