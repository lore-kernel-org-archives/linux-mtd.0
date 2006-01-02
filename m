Received: from mgw-ext03.nokia.com ([131.228.20.95])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EtWhW-0007bk-Qy
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2006 15:54:50 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext03.nokia.com (Switch-3.1.7/Switch-3.1.7) with ESMTP id
	k02KoQgO013002
	for <linux-mtd@lists.infradead.org>; Mon, 2 Jan 2006 22:50:26 +0200
Received: from two.research.nokia.com (two.research.nokia.com [172.21.50.14])
	by mgw-int2.ntc.nokia.com (Switch-2.2.8/Switch-2.2.8) with ESMTP id
	k02KsXS13461 for <linux-mtd@lists.infradead.org>;
	Mon, 2 Jan 2006 22:54:33 +0200 (EET)
From: Juha =?ISO-8859-1?Q?Yrj=F6l=E4?= <juha.yrjola@nokia.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-AMbw3+cMLa6JWMZtlW+D"
Date: Mon, 02 Jan 2006 22:54:32 +0200
Message-Id: <1136235272.8963.21.camel@two.research.nokia.com>
Mime-Version: 1.0
Subject: [PATCH] [JFFS2] Make NAND OOB usage more flexible
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-AMbw3+cMLa6JWMZtlW+D
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Many (if not all) OneNAND devices have the free OOB bytes scattered
around the whole OOB area in blocks of 2 or 3 bytes.  To work around
this, the JFFS2 wbuf code needs to consider _all_ the free OOB bytes
specified by the oobfree array.

Cheers,
Juha


--=-AMbw3+cMLa6JWMZtlW+D
Content-Disposition: attachment;
	filename=jffs2-nand-scattered-oob-usage-patch.diff
Content-Type: text/x-patch; name=jffs2-nand-scattered-oob-usage-patch.diff;
	charset=us-ascii
Content-Transfer-Encoding: 8bit

Index: fs/jffs2/wbuf.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/wbuf.c,v
retrieving revision 1.108
diff -u -r1.108 wbuf.c
--- fs/jffs2/wbuf.c	18 Nov 2005 07:27:45 -0000	1.108
+++ fs/jffs2/wbuf.c	2 Jan 2006 20:52:49 -0000
@@ -6,6 +6,7 @@
  *
  * Created by David Woodhouse <dwmw2@infradead.org>
  * Modified debugged and enhanced by Thomas Gleixner <tglx@linutronix.de>
+ * More flexible OOB usage by Juha Yrjölä <juha.yrjola@nokia.com>
  *
  * For licensing information, see the file 'LICENCE' in this directory.
  *
@@ -948,31 +949,51 @@
 	return 0;
 }
 
+static int is_within_clean_marker_area(struct jffs2_sb_info *c, int pos)
+{
+	struct jffs2_nand_oob_info *oinfo;
+	int i;
+
+	oinfo = c->fsdata;
+	for (i = 0; i < c->fsdata_count; i++) {
+		/* Only check entries for the first page */
+		if (oinfo[i].page_nr > 0)
+			break;
+		if (pos < oinfo[i].pos)
+			continue;
+		if (pos >= oinfo[i].pos + oinfo[i].len)
+			continue;
+		return 1;
+	}
+	return 0;
+}
+
 /*
  *	Check, if the out of band area is empty
  */
-
-int jffs2_check_oob_empty( struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t data_len)
+int jffs2_check_oob_empty(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t data_len)
 {
 	size_t offset, retlen;
-	uint32_t i = 0, j, oob_nr;
 	unsigned char *buf;
-	int oob_size, ret;
+	int oob_size, oob_nr, ret, i;
 
 	offset = jeb->offset;
 	oob_size = c->mtd->oobsize;
-	oob_nr = (data_len+c->fsdata_len-1)/c->fsdata_len;
-	if (oob_nr < 4) oob_nr = 4;
+	oob_nr = c->fsdata_page_count;
+	if (oob_nr < 4)
+		oob_nr = 4;
 	buf = kmalloc(oob_size * oob_nr, GFP_KERNEL);
 	ret = c->mtd->read_oob(c->mtd, offset, oob_size * oob_nr, &retlen, buf);
 
-	for (i=0; i<oob_nr; i++) {
-		for (j=0; j<oob_size; j++) {
-			if (data_len && j>=c->fsdata_pos && j<c->fsdata_pos + c->fsdata_len) {
+	for (i = 0; i < oob_nr; i++) {
+		int j;
+
+		for (j = 0; j < oob_size; j++) {
+			if (data_len && is_within_clean_marker_area(c, j)) {
 				data_len--;
 				continue;
 			}
-			if (buf[i*oob_size+j] != 0xFF) {
+			if (buf[i * oob_size + j] != 0xff) {
 				ret = 1;
 				goto out;
 			}
@@ -984,22 +1005,44 @@
 	return ret;
 }
 
+static void jffs2_copy_nand_fsdata(struct jffs2_sb_info *c, u8 *to, const u8 *from,
+				   int len)
+{
+	struct jffs2_nand_oob_info *oinfo;
+
+	oinfo = c->fsdata;
+	while (len) {
+		int cnt, oob_idx;
+
+		BUG_ON(oinfo - c->fsdata >= c->fsdata_count);
+
+		oob_idx = oinfo->page_nr * c->mtd->oobsize + oinfo->pos;
+		cnt = oinfo->len;
+		if (cnt > len)
+			cnt = len;
+		memcpy(to, from + oob_idx, len);
+		to += cnt;
+		len -= cnt;
+		oinfo++;
+	}
+}
+
 /*
 *	Scan for a valid cleanmarker and for bad blocks
 *	For virtual blocks (concatenated physical blocks) check the cleanmarker
 *	only in the first page of the first physical block, but scan for bad blocks in all
 *	physical blocks
 */
-int jffs2_check_nand_cleanmarker_ebh (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t *data_len)
+int jffs2_check_nand_cleanmarker_ebh(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t *data_len)
 {
 	size_t offset, retlen;
 	int oob_size;
 	uint32_t oob_nr, total_len;
-	unsigned char *buf;
+	unsigned char *buf, fsdata[sizeof(struct jffs2_raw_ebh)];
 	int ret;
 	struct jffs2_unknown_node *n;
-	struct jffs2_raw_ebh eh;
-	uint32_t read_in = 0, i = 0, copy_len, node_crc;
+	struct jffs2_raw_ebh *eh;
+	uint32_t node_crc;
 
 	offset = jeb->offset;
 	*data_len = 0;
@@ -1010,25 +1053,26 @@
 	}
 
 	oob_size = c->mtd->oobsize;
-	oob_nr = (sizeof(struct jffs2_raw_ebh)+c->fsdata_len-1)/c->fsdata_len;
+	oob_nr = c->fsdata_page_count;
 	total_len = oob_size * oob_nr;
 
 	buf = kmalloc(total_len, GFP_KERNEL);
-	if (!buf) {
+	if (!buf)
 		return -ENOMEM;
-	}
+
 	ret = c->mtd->read_oob(c->mtd, offset, total_len, &retlen, buf);
 	if (ret) {
 		D1 (printk (KERN_WARNING "jffs2_check_nand_cleanmarker_ebh(): Read OOB failed %d for block at %08x\n", ret, jeb->offset));
 		goto out;
 	}
 	if (retlen < total_len) {
-		 D1 (printk (KERN_WARNING "jffs2_check_nand_cleanmarker_ebh(): Read OOB return short read (%zd bytes not %d) for block at %08x\n", retlen, total_len, jeb->offset));
+		D1 (printk (KERN_WARNING "jffs2_check_nand_cleanmarker_ebh(): Read OOB return short read (%zd bytes not %d) for block at %08x\n", retlen, total_len, jeb->offset));
 		ret = -EIO;
 		goto out;
 	}
 
-	n = (struct jffs2_unknown_node *) &buf[c->fsdata_pos];
+	jffs2_copy_nand_fsdata(c, fsdata, buf, sizeof(fsdata));
+	n = (struct jffs2_unknown_node *) &fsdata;
 	if (je16_to_cpu(n->magic) != JFFS2_MAGIC_BITMASK) {
 		D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker_ebh(): Cleanmarker node not detected in block at %08x\n", jeb->offset));
 		ret = 1;
@@ -1043,28 +1087,21 @@
 			ret = 1;
 		}
 		goto out;
-	}else if (je16_to_cpu(n->nodetype) == JFFS2_NODETYPE_ERASEBLOCK_HEADER) {
-		/* Read the scattered data(in buf[]) into struct jffs2_raw_ebh */
-		while (read_in < sizeof(struct jffs2_raw_ebh)) {
-			copy_len = min_t(uint32_t, c->fsdata_len, sizeof(struct jffs2_raw_ebh) - read_in);
-			memcpy((unsigned char *)&eh + read_in, &buf[oob_size*i + c->fsdata_pos], copy_len);
-			read_in += copy_len;
-			i++;
-		}
-
-		node_crc = crc32(0, &eh, sizeof(struct jffs2_raw_ebh)-8);
-		if (node_crc != je32_to_cpu(eh.node_crc)) {
+	} else if (je16_to_cpu(n->nodetype) == JFFS2_NODETYPE_ERASEBLOCK_HEADER) {
+		eh = (struct jffs2_raw_ebh *) fsdata;
+		node_crc = crc32(0, eh, sizeof(struct jffs2_raw_ebh) - 8);
+		if (node_crc != je32_to_cpu(eh->node_crc)) {
 			ret = 1;
 			goto out;
 		}
 
-		if ((JFFS2_EBH_INCOMPAT_FSET | eh.incompat_fset) != JFFS2_EBH_INCOMPAT_FSET) {
-			printk(KERN_NOTICE "The incompat_fset of fs image EBH %d execeed the incompat_fset \
-				 of JFFS2 module %d. Reject to mount.\n", eh.incompat_fset, JFFS2_EBH_INCOMPAT_FSET);
+		if ((JFFS2_EBH_INCOMPAT_FSET | eh->incompat_fset) != JFFS2_EBH_INCOMPAT_FSET) {
+			printk(KERN_NOTICE "The incompat_fset of fs image EBH %d exceed the incompat_fset \
+				 of JFFS2 module %d. Reject to mount.\n", eh->incompat_fset, JFFS2_EBH_INCOMPAT_FSET);
 			ret = -EINVAL;
 			goto out;
 		}
-		if ((JFFS2_EBH_ROCOMPAT_FSET | eh.rocompat_fset) != JFFS2_EBH_ROCOMPAT_FSET) {
+		if ((JFFS2_EBH_ROCOMPAT_FSET | eh->rocompat_fset) != JFFS2_EBH_ROCOMPAT_FSET) {
 			printk(KERN_NOTICE "Read-only compatible EBH feature found at offset 0x%08x\n ", jeb->offset);
 			if (!(jffs2_is_readonly(c))) {
 				ret = -EROFS;
@@ -1073,9 +1110,8 @@
 		}
 
 		EBFLAGS_SET_EBH(jeb);
-		jeb->erase_count = je32_to_cpu(eh.erase_count);
-		record_erase_count(c, jeb);
-		*data_len = je32_to_cpu(eh.totlen);
+		jeb->erase_count = je32_to_cpu(eh->erase_count);
+		*data_len = je32_to_cpu(eh->totlen);
 		ret = 0;
 	}else {
 		ret = 1;
@@ -1087,9 +1123,10 @@
 
 int jffs2_write_nand_ebh(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
 {
-	uint32_t i = 0, written = 0, write_len = 0;
+	uint32_t written = 0, write_len = 0;
 	int ret;
 	size_t  retlen;
+	struct jffs2_nand_oob_info *oinfo;
 	struct jffs2_raw_ebh ebh = {
 		.magic =        cpu_to_je16(JFFS2_MAGIC_BITMASK),
 		.nodetype =     cpu_to_je16(JFFS2_NODETYPE_ERASEBLOCK_HEADER),
@@ -1106,16 +1143,21 @@
 	ebh.node_crc = cpu_to_je32(crc32(0, (unsigned char *)&ebh + sizeof(struct jffs2_unknown_node) + 4,
 				 sizeof(struct jffs2_raw_ebh) - sizeof(struct jffs2_unknown_node) - 4));
 
+	oinfo = c->fsdata;
 	while (written < sizeof(struct jffs2_raw_ebh)) {
-		write_len = min_t(uint32_t, c->fsdata_len, sizeof(struct jffs2_raw_ebh) - written);
-		ret = jffs2_flash_write_oob(c, jeb->offset + c->mtd->oobblock*i + c->fsdata_pos,
-					    write_len,  &retlen, (unsigned char *)&ebh + written);
+		unsigned int ofs;
+
+		BUG_ON(oinfo - c->fsdata >= c->fsdata_count);
+		write_len = min_t(uint32_t, oinfo->len, sizeof(struct jffs2_raw_ebh) - written);
+		ofs = c->mtd->oobblock * oinfo->page_nr + oinfo->pos;
+		ret = jffs2_flash_write_oob(c, ofs, write_len, &retlen,
+					    (unsigned char *)&ebh + written);
 		if (ret || retlen != write_len) {
 			D1(printk(KERN_WARNING "jffs2_write_nand_ebh(): Write failed for block at %08x: error %d\n", jeb->offset, ret));
 			return ret;
 		}
 		written += write_len;
-		i++;
+		oinfo++;
 	}
 	return 0;
 }
@@ -1149,18 +1191,11 @@
 	return 1;
 }
 
-#define NAND_JFFS2_OOB16_FSDALEN	8
-
-static struct nand_oobinfo jffs2_oobinfo_docecc = {
-	.useecc = MTD_NANDECC_PLACE,
-	.eccbytes = 6,
-	.eccpos = {0,1,2,3,4,5}
-};
-
-
 static int jffs2_nand_set_oobinfo(struct jffs2_sb_info *c)
 {
 	struct nand_oobinfo *oinfo = &c->mtd->oobinfo;
+	struct jffs2_nand_oob_info *jinfo;
+	int i, free, need, oobb_count, page_count;
 
 	/* Do this only, if we have an oob buffer */
 	if (!c->mtd->oobsize)
@@ -1171,46 +1206,54 @@
 	c->ebh_size = 0;
 
 	/* Should we use autoplacement ? */
-	if (oinfo && oinfo->useecc == MTD_NANDECC_AUTOPLACE) {
-		D1(printk(KERN_DEBUG "JFFS2 using autoplace on NAND\n"));
-		/* Get the position of the free bytes */
-		if (!oinfo->oobfree[0][1]) {
-			printk (KERN_WARNING "jffs2_nand_set_oobinfo(): Eeep. Autoplacement selected and no empty space in oob\n");
-			return -ENOSPC;
-		}
-		c->fsdata_pos = oinfo->oobfree[0][0];
-		c->fsdata_len = oinfo->oobfree[0][1];
-	} else {
-		/* This is just a legacy fallback and should go away soon */
-		switch(c->mtd->ecctype) {
-		case MTD_ECC_RS_DiskOnChip:
-			printk(KERN_WARNING "JFFS2 using DiskOnChip hardware ECC without autoplacement. Fix it!\n");
-			c->oobinfo = &jffs2_oobinfo_docecc;
-			c->fsdata_pos = 6;
-			c->fsdata_len = NAND_JFFS2_OOB16_FSDALEN;
-			c->badblock_pos = 15;
-			break;
+	if (oinfo == NULL || oinfo->useecc != MTD_NANDECC_AUTOPLACE) {
+		D1(printk(KERN_DEBUG "JFFS2 on NAND. No autoplacment info found\n"));
+		return -EINVAL;
+	}
 
-		default:
-			D1(printk(KERN_DEBUG "JFFS2 on NAND. No autoplacment info found\n"));
-			return -EINVAL;
-		}
+	D1(printk(KERN_DEBUG "JFFS2 using autoplace on NAND\n"));
+
+	/* Calculate the amount of free OOB bytes in a page. */
+	free = 0;
+	need = sizeof(struct jffs2_raw_ebh);
+	for (i = 0; oinfo->oobfree[i][1] > 0 && free < need; i++)
+		free += oinfo->oobfree[i][1];
+	if (free == 0) {
+		printk (KERN_WARNING "jffs2_nand_set_oobinfo(): Eeep. Autoplacement selected and no empty space in oob\n");
+		return -ENOSPC;
 	}
-	return 0;
-}
+	oobb_count = i;
 
-/* To check if the OOB area has enough space for eraseblock header */
-static int jffs2_nand_check_oobspace_for_ebh(struct jffs2_sb_info *c)
-{
-	uint32_t pages_per_eraseblock, available_oob_space;
+	if (free < need)
+		page_count = (need + free - 1) / free;
+	else
+		page_count = 1;
 
-	pages_per_eraseblock = c->sector_size/c->mtd->oobblock;
-	available_oob_space = c->fsdata_len * pages_per_eraseblock;
-	if (available_oob_space < sizeof(struct jffs2_raw_ebh)) {
-		printk(KERN_NOTICE "The OOB area(%d) is not big enough to hold eraseblock_header(%d), reject to mount.\n",
-			 available_oob_space, sizeof(struct jffs2_raw_ebh));
+	/* Check if the OOB area has enough space for eraseblock header */
+	if (page_count > c->sector_size / c->mtd->oobblock) {
+		printk(KERN_ERR "The OOB area is not big enough to hold eraseblock header (%d), reject to mount.\n",
+		       sizeof(struct jffs2_raw_ebh));
 		return -EINVAL;
 	}
+
+	c->fsdata_count = page_count * oobb_count;
+	c->fsdata = kmalloc(c->fsdata_count * sizeof(*c->fsdata), GFP_KERNEL);
+	if (c->fsdata == NULL)
+		return -ENOMEM;
+	jinfo = c->fsdata;
+	for (i = 0; i < page_count; i++) {
+		int j;
+
+		for (j = 0; j < oobb_count; j++) {
+			jinfo->page_nr = i;
+			jinfo->pos = oinfo->oobfree[j][0];
+			jinfo->len = oinfo->oobfree[j][1];
+			jinfo++;
+		}
+	}
+	c->fsdata_len = page_count * free;
+	c->fsdata_page_count = page_count;
+
 	return 0;
 }
 
@@ -1229,16 +1272,16 @@
 
 	res = jffs2_nand_set_oobinfo(c);
 	if (res) {
+		kfree(c->wbuf);
 		return res;
 	}
 
-	res = jffs2_nand_check_oobspace_for_ebh(c);
-
 #ifdef BREAKME
 	if (!brokenbuf)
 		brokenbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
 	if (!brokenbuf) {
 		kfree(c->wbuf);
+		kfree(c->fsdata);
 		return -ENOMEM;
 	}
 	memset(brokenbuf, 0xdb, c->wbuf_pagesize);
@@ -1249,6 +1292,7 @@
 void jffs2_nand_flash_cleanup(struct jffs2_sb_info *c)
 {
 	kfree(c->wbuf);
+	kfree(c->fsdata);
 }
 
 int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
Index: include/linux/jffs2_fs_sb.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/jffs2_fs_sb.h,v
retrieving revision 1.60
diff -u -r1.60 jffs2_fs_sb.h
--- include/linux/jffs2_fs_sb.h	29 Nov 2005 14:34:37 -0000	1.60
+++ include/linux/jffs2_fs_sb.h	2 Jan 2006 20:52:49 -0000
@@ -33,6 +33,12 @@
 
 struct jffs2_inodirty;
 
+struct jffs2_nand_oob_info {
+	uint8_t page_nr; /* Page number within an erase block */
+	uint8_t pos;
+	uint8_t len;
+};
+
 /* A struct for the overall file system control.  Pointers to
    jffs2_sb_info structs are named `c' in the source code.
    Nee jffs_control
@@ -122,9 +128,11 @@
 
 	/* Information about out-of-band area usage... */
 	struct nand_oobinfo *oobinfo;
-	uint32_t badblock_pos;
-	uint32_t fsdata_pos;
-	uint32_t fsdata_len;
+	uint8_t badblock_pos;
+	struct jffs2_nand_oob_info *fsdata;
+	uint8_t fsdata_count;
+	uint8_t fsdata_page_count;
+	uint8_t fsdata_len;
 #endif
 
 	struct jffs2_summary *summary;		/* Summary information */

--=-AMbw3+cMLa6JWMZtlW+D--
