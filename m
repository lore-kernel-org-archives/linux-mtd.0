Received: from mail2.atmark-techno.com ([210.191.215.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJLv1-0002XA-Sa
	for linux-mtd@lists.infradead.org; Thu, 17 Jul 2008 05:20:44 +0000
Message-ID: <487ED6A1.4020702@atmark-techno.com>
Date: Thu, 17 Jul 2008 14:20:33 +0900
From: chris <chris@atmark-techno.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nand: nand_oobfree handling
Content-Type: multipart/mixed; boundary="------------050805010906040303060102"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050805010906040303060102
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi

It seems that while OOB layout structures (nand_ecclayout) are defined
to handle 8 (MTD_MAX_OOBFREE_ENTRIES) free areas, the current nand_base
code expects at least one area with a zero length.

http://lxr.linux.no/linux+v2.6.26/include/mtd/mtd-abi.h#L124
http://lxr.linux.no/linux+v2.6.26/drivers/mtd/nand/nand_base.c#L2552

This could cause problems for drivers that want to use all 8 free areas.

Also, it seems that flash_eraseall -j expects the first free area to be
big enough for the cleanmarker, which might not always be true.

I have attached a couple of patches that fix the problems I have
described above. They are taken against 2.6.24 and a non-current version
of mtd-utils... would you like me to prepare patches for the latest trees?

Cheers,

Chris

--------------050805010906040303060102
Content-Type: text/x-diff;
 name="flash_eraseall.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="flash_eraseall.patch"

diff --git a/flash_eraseall.c b/flash_eraseall.c
index 3694e3d..1609859 100644
--- a/flash_eraseall.c
+++ b/flash_eraseall.c
@@ -56,12 +56,16 @@ static void display_version (void);
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
 
+#define MTD_MAX_OOBFREE_ENTRIES	8
+
 int main (int argc, char *argv[])
 {
 	mtd_info_t meminfo;
 	int fd, clmpos = 0, clmlen = 8;
 	erase_info_t erase;
 	int isNAND, bbtest = 1;
+	struct nand_oobinfo oobinfo;
+	unsigned char oobdata[64];
 
 	process_options(argc, argv);
 
@@ -81,29 +85,46 @@ int main (int argc, char *argv[])
 	isNAND = meminfo.type == MTD_NANDFLASH ? 1 : 0;
 
 	if (jffs2) {
+
+		/* prepare cleanmarker */
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
 		if (!isNAND)
 			cleanmarker.totlen = cpu_to_je32 (sizeof (struct jffs2_unknown_node));
-		else {
-			struct nand_oobinfo oobinfo;
+		else
+			cleanmarker.totlen = cpu_to_je32(8);
+		cleanmarker.hdr_crc =  cpu_to_je32(crc32(0, &cleanmarker,
+			sizeof(struct jffs2_unknown_node) - 4));
 
+		if (isNAND) {
 			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0) {
 				fprintf(stderr, "%s: %s: unable to get NAND oobinfo\n", exe_name, mtd_device);
 				exit(1);
 			}
-
 			/* Check for autoplacement */
 			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
-				/* Get the position of the free bytes */
-				if (!oobinfo.oobfree[0][1]) {
-					fprintf (stderr, " Eeep. Autoplacement selected and no empty space in oob\n");
+				int i, one_len, copied = 0;
+				memset(oobdata, 0xff, sizeof(oobdata));
+				for (i = 0; copied < 8 &&
+						i < MTD_MAX_OOBFREE_ENTRIES &&
+						oobinfo.oobfree[i][1]; i++) {
+					if (8 - copied <= oobinfo.oobfree[i][1])
+						one_len = 8 - copied;
+					else
+						one_len = oobinfo.oobfree[i][1];
+					memcpy(oobdata + oobinfo.oobfree[i][0],
+						(char *)&cleanmarker + copied,
+						one_len);
+					copied += one_len;
+				}
+				clmpos = 0;
+				clmlen = oobinfo.oobfree[i][0] + one_len;
+				if (clmlen < 2) {
+					fprintf (stderr, " Eeep. Autoplacement"
+						" selected and no empty space"
+						" in oob\n");
 					exit(1);
 				}
-				clmpos = oobinfo.oobfree[0][0];
-				clmlen = oobinfo.oobfree[0][1];
-				if (clmlen > 8)
-					clmlen = 8;
 			} else {
 				/* Legacy mode */
 				switch (meminfo.oobsize) {
@@ -121,9 +142,8 @@ int main (int argc, char *argv[])
 					break;
 				}
 			}
-			cleanmarker.totlen = cpu_to_je32(8);
 		}
-		cleanmarker.hdr_crc =  cpu_to_je32 (crc32 (0, &cleanmarker,  sizeof (struct jffs2_unknown_node) - 4));
+
 	}
 
 	for (erase.start = 0; erase.start < meminfo.size; erase.start += meminfo.erasesize) {
@@ -169,7 +189,10 @@ int main (int argc, char *argv[])
 		/* write cleanmarker */
 		if (isNAND) {
 			struct mtd_oob_buf oob;
-			oob.ptr = (unsigned char *) &cleanmarker;
+			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE)
+				oob.ptr = oobdata;
+			else
+				oob.ptr = (unsigned char *) &cleanmarker;
 			oob.start = erase.start + clmpos;
 			oob.length = clmlen;
 			if (ioctl (fd, MEMWRITEOOB, &oob) != 0) {

--------------050805010906040303060102
Content-Type: text/x-diff;
 name="nand-oobfree-loop-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand-oobfree-loop-fix.patch"

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e29c1da..4ebfe54 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -905,6 +905,8 @@ static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
 static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 				  struct mtd_oob_ops *ops, size_t len)
 {
+	int i;
+
 	switch(ops->mode) {
 
 	case MTD_OOB_PLACE:
@@ -917,20 +919,21 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 		uint32_t boffs = 0, roffs = ops->ooboffs;
 		size_t bytes = 0;
 
-		for(; free->length && len; free++, len -= bytes) {
+		for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES &&
+				free[i].length && len; i++, len -= bytes) {
 			/* Read request not from offset 0 ? */
 			if (unlikely(roffs)) {
-				if (roffs >= free->length) {
-					roffs -= free->length;
+				if (roffs >= free[i].length) {
+					roffs -= free[i].length;
 					continue;
 				}
-				boffs = free->offset + roffs;
+				boffs = free[i].offset + roffs;
 				bytes = min_t(size_t, len,
-					      (free->length - roffs));
+					      (free[i].length - roffs));
 				roffs = 0;
 			} else {
-				bytes = min_t(size_t, len, free->length);
-				boffs = free->offset;
+				bytes = min_t(size_t, len, free[i].length);
+				boffs = free[i].offset;
 			}
 			memcpy(oob, chip->oob_poi + boffs, bytes);
 			oob += bytes;
@@ -1570,6 +1573,7 @@ static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob,
 				  struct mtd_oob_ops *ops)
 {
 	size_t len = ops->ooblen;
+	int i;
 
 	switch(ops->mode) {
 
@@ -1583,20 +1587,21 @@ static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob,
 		uint32_t boffs = 0, woffs = ops->ooboffs;
 		size_t bytes = 0;
 
-		for(; free->length && len; free++, len -= bytes) {
+		for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES &&
+				free[i].length && len; i++, len -= bytes) {
 			/* Write request not from offset 0 ? */
 			if (unlikely(woffs)) {
-				if (woffs >= free->length) {
-					woffs -= free->length;
+				if (woffs >= free[i].length) {
+					woffs -= free[i].length;
 					continue;
 				}
-				boffs = free->offset + woffs;
+				boffs = free[i].offset + woffs;
 				bytes = min_t(size_t, len,
-					      (free->length - woffs));
+					      (free[i].length - woffs));
 				woffs = 0;
 			} else {
-				bytes = min_t(size_t, len, free->length);
-				boffs = free->offset;
+				bytes = min_t(size_t, len, free[i].length);
+				boffs = free[i].offset;
 			}
 			memcpy(chip->oob_poi + boffs, oob, bytes);
 			oob += bytes;
@@ -2525,7 +2530,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 * the out of band area
 	 */
 	chip->ecc.layout->oobavail = 0;
-	for (i = 0; chip->ecc.layout->oobfree[i].length; i++)
+	for (i = 0; i < MTD_MAX_OOBFREE_ENTRIES; i++)
 		chip->ecc.layout->oobavail +=
 			chip->ecc.layout->oobfree[i].length;
 	mtd->oobavail = chip->ecc.layout->oobavail;


--------------050805010906040303060102--
