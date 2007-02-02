Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HD1a2-000488-Jy
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 11:48:25 -0500
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 02 Feb 2007 18:47:29 +0200
Message-Id: <20070202164729.11475.8623.sendpatchset@localhost.localdomain>
Subject: [PATCH] [JFFS2] use MTD_OOB_AUTO
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 31 Jan 2007 11:38:53 +0200
Subject: [PATCH] [JFFS2] use MTD_OOB_AUTO

Nowadays MTD supports an MTD_OOB_AUTO option which allows users
to access free bytes in NAND's OOB as a contiguous buffer, although
it may be highly discontinuous.

This patch teaches JFFS2 to use this nice feature instead of the
old MTD_OOB_PLACE option. This for example caused problems with
OneNAND. Now JFFS2 does not care how are the free bytes situated.

This may change position of the clean marker on some flashes,
but this is not a problem. JFFS2 will just re-erase the empty
eraseblocks and write the new (correct) clean marker (this was
tested).

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/jffs2/jffs2_fs_sb.h |   12 +--
 fs/jffs2/scan.c        |   10 ++-
 fs/jffs2/wbuf.c        |  206 +++++++++++++++++-------------------------------
 3 files changed, 84 insertions(+), 144 deletions(-)

Index: dedekind-mtd-2.6.git/fs/jffs2/jffs2_fs_sb.h
===================================================================
--- dedekind-mtd-2.6.git.orig/fs/jffs2/jffs2_fs_sb.h
+++ dedekind-mtd-2.6.git/fs/jffs2/jffs2_fs_sb.h
@@ -98,20 +98,14 @@ struct jffs2_sb_info {
 	uint32_t wbuf_pagesize; /* 0 for NOR and other flashes with no wbuf */
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
-	/* Write-behind buffer for NAND flash */
-	unsigned char *wbuf;
-	unsigned char *oobbuf;
+	unsigned char *wbuf; /* Write-behind buffer for NAND flash */
 	uint32_t wbuf_ofs;
 	uint32_t wbuf_len;
 	struct jffs2_inodirty *wbuf_inodes;
-
 	struct rw_semaphore wbuf_sem;	/* Protects the write buffer */
 
-	/* Information about out-of-band area usage... */
-	struct nand_ecclayout *ecclayout;
-	uint32_t badblock_pos;
-	uint32_t fsdata_pos;
-	uint32_t fsdata_len;
+	unsigned char *oobbuf;
+	int oobavail; /* How many bytes are available for JFFS2 in OOB */
 #endif
 
 	struct jffs2_summary *summary;		/* Summary information */
Index: dedekind-mtd-2.6.git/fs/jffs2/scan.c
===================================================================
--- dedekind-mtd-2.6.git.orig/fs/jffs2/scan.c
+++ dedekind-mtd-2.6.git/fs/jffs2/scan.c
@@ -450,16 +450,20 @@ static int jffs2_scan_eraseblock (struct
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (jffs2_cleanmarker_oob(c)) {
-		int ret = jffs2_check_nand_cleanmarker(c, jeb);
+		int ret;
+
+		if (c->mtd->block_isbad(c->mtd, jeb->offset))
+			return BLK_STATE_BADBLOCK;
+
+		ret = jffs2_check_nand_cleanmarker(c, jeb);
 		D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker returned %d\n",ret));
+
 		/* Even if it's not found, we still scan to see
 		   if the block is empty. We use this information
 		   to decide whether to erase it or not. */
 		switch (ret) {
 		case 0:		cleanmarkerfound = 1; break;
 		case 1: 	break;
-		case 2: 	return BLK_STATE_BADBLOCK;
-		case 3:		return BLK_STATE_ALLDIRTY; /* Block has failed to erase min. once */
 		default: 	return ret;
 		}
 	}
Index: dedekind-mtd-2.6.git/fs/jffs2/wbuf.c
===================================================================
--- dedekind-mtd-2.6.git.orig/fs/jffs2/wbuf.c
+++ dedekind-mtd-2.6.git/fs/jffs2/wbuf.c
@@ -957,43 +957,48 @@ exit:
 	return ret;
 }
 
-#define NR_OOB_SCAN_PAGES	4
+#define NR_OOB_SCAN_PAGES 4
+
+/* For historical reasons we use only 12 bytes for OOB clean marker */
+#define OOB_CM_SIZE 12
+
+const static struct jffs2_unknown_node oob_cleanmarker =
+{
+	.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK),
+	.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER),
+	.totlen = cpu_to_je32(8)
+};
 
 /*
- * Check, if the out of band area is empty
+ * Check, if the out of band area is empty. This function knows about the clean
+ * marker and if it is present in OOB, treats the OOB as empty anyway.
  */
 int jffs2_check_oob_empty(struct jffs2_sb_info *c,
 			  struct jffs2_eraseblock *jeb, int mode)
 {
-	int i, page, ret;
-	int oobsize = c->mtd->oobsize;
+	int i, ret;
+	int cmlen = min_t(int, c->oobavail, OOB_CM_SIZE);
 	struct mtd_oob_ops ops;
 
-	ops.ooblen = NR_OOB_SCAN_PAGES * oobsize;
+	ops.mode = MTD_OOB_AUTO;
+	ops.ooblen = NR_OOB_SCAN_PAGES * c->oobavail;
 	ops.oobbuf = c->oobbuf;
-	ops.ooboffs = 0;
+	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
 
 	ret = c->mtd->read_oob(c->mtd, jeb->offset, &ops);
-	if (ret) {
-		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB "
-			  "failed %d for block at %08x\n", ret, jeb->offset));
+	if (ret || ops.oobretlen != ops.ooblen) {
+		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %d "
+				"bytes, read %d bytes, error %d\n", jeb->offset,
+				ops.ooblen, ops.oobretlen, ret);
+		if (!ret)
+			ret = -EIO;
 		return ret;
 	}
 
-	if (ops.oobretlen < ops.ooblen) {
-		D1(printk(KERN_WARNING "jffs2_check_oob_empty(): Read OOB "
-			  "returned short read (%zd bytes not %d) for block "
-			  "at %08x\n", ops.oobretlen, ops.ooblen, jeb->offset));
-		return -EIO;
-	}
-
-	/* Special check for first page */
-	for(i = 0; i < oobsize ; i++) {
-		/* Yeah, we know about the cleanmarker. */
-		if (mode && i >= c->fsdata_pos &&
-		    i < c->fsdata_pos + c->fsdata_len)
+	for(i = 0; i < ops.ooblen; i++) {
+		if (mode && i < cmlen)
+			/* Yeah, we know about the cleanmarker */
 			continue;
 
 		if (ops.oobbuf[i] != 0xFF) {
@@ -1003,111 +1008,63 @@ int jffs2_check_oob_empty(struct jffs2_s
 		}
 	}
 
-	/* we know, we are aligned :) */
-	for (page = oobsize; page < ops.ooblen; page += sizeof(long)) {
-		long dat = *(long *)(&ops.oobbuf[page]);
-		if(dat != -1)
-			return 1;
-	}
 	return 0;
 }
 
 /*
- * Scan for a valid cleanmarker and for bad blocks
+ * Check for a valid cleanmarker.
+ * Returns: 0 if a valid cleanmarker was found
+ *          1 if no cleanmarker was found
+ *          negative error code if an error occurred
  */
-int jffs2_check_nand_cleanmarker (struct jffs2_sb_info *c,
-				  struct jffs2_eraseblock *jeb)
+int jffs2_check_nand_cleanmarker(struct jffs2_sb_info *c,
+				 struct jffs2_eraseblock *jeb)
 {
-	struct jffs2_unknown_node n;
 	struct mtd_oob_ops ops;
-	int oobsize = c->mtd->oobsize;
-	unsigned char *p,*b;
-	int i, ret;
-	size_t offset = jeb->offset;
+	int ret, cmlen = min_t(int, c->oobavail, OOB_CM_SIZE);
 
-	/* Check first if the block is bad. */
-	if (c->mtd->block_isbad(c->mtd, offset)) {
-		D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker()"
-			   ": Bad block at %08x\n", jeb->offset));
-		return 2;
-	}
-
-	ops.ooblen = oobsize;
+	ops.mode = MTD_OOB_AUTO;
+	ops.ooblen = cmlen;
 	ops.oobbuf = c->oobbuf;
-	ops.ooboffs = 0;
+	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
 
-	ret = c->mtd->read_oob(c->mtd, offset, &ops);
-	if (ret) {
-		D1 (printk(KERN_WARNING "jffs2_check_nand_cleanmarker(): "
-			   "Read OOB failed %d for block at %08x\n",
-			   ret, jeb->offset));
+	ret = c->mtd->read_oob(c->mtd, jeb->offset, &ops);
+	if (ret || ops.oobretlen != ops.ooblen) {
+		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %d "
+				"bytes, read %d bytes, error %d\n", jeb->offset,
+				ops.ooblen, ops.oobretlen, ret);
+		if (!ret)
+			ret = -EIO;
 		return ret;
 	}
 
-	if (ops.oobretlen < ops.ooblen) {
-		D1 (printk (KERN_WARNING "jffs2_check_nand_cleanmarker(): "
-			    "Read OOB return short read (%zd bytes not %d) "
-			    "for block at %08x\n", ops.oobretlen, ops.ooblen,
-			    jeb->offset));
-		return -EIO;
-	}
-
-	n.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
-	n.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
-	n.totlen = cpu_to_je32 (8);
-	p = (unsigned char *) &n;
-	b = c->oobbuf + c->fsdata_pos;
-
-	for (i = c->fsdata_len; i; i--) {
-		if (*b++ != *p++)
-			ret = 1;
-	}
-
-	D1(if (ret == 1) {
-		printk(KERN_WARNING "jffs2_check_nand_cleanmarker(): "
-		       "Cleanmarker node not detected in block at %08x\n",
-		       offset);
-		printk(KERN_WARNING "OOB at %08zx was ", offset);
-		for (i=0; i < oobsize; i++)
-			printk("%02x ", c->oobbuf[i]);
-		printk("\n");
-	});
-	return ret;
+	return !!memcmp(&oob_cleanmarker, c->oobbuf, cmlen);
 }
 
 int jffs2_write_nand_cleanmarker(struct jffs2_sb_info *c,
 				 struct jffs2_eraseblock *jeb)
 {
-	struct jffs2_unknown_node n;
-	int	ret;
+	int ret;
 	struct mtd_oob_ops ops;
+	int cmlen = min_t(int, c->oobavail, OOB_CM_SIZE);
 
-	n.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
-	n.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
-	n.totlen = cpu_to_je32(8);
-
-	ops.ooblen = c->fsdata_len;
-	ops.oobbuf = (uint8_t *)&n;
-	ops.ooboffs = c->fsdata_pos;
+	ops.mode = MTD_OOB_AUTO;
+	ops.ooblen = cmlen;
+	ops.oobbuf = (uint8_t *)&oob_cleanmarker;
+	ops.len = ops.ooboffs = ops.retlen = ops.oobretlen = 0;
 	ops.datbuf = NULL;
-	ops.mode = MTD_OOB_PLACE;
 
 	ret = c->mtd->write_oob(c->mtd, jeb->offset, &ops);
-
-	if (ret) {
-		D1(printk(KERN_WARNING "jffs2_write_nand_cleanmarker(): "
-			  "Write failed for block at %08x: error %d\n",
-			  jeb->offset, ret));
+	if (ret || ops.oobretlen != ops.ooblen) {
+		printk(KERN_ERR "cannot write OOB for EB at %08x, requested %d "
+				"bytes, read %d bytes, error %d\n", jeb->offset,
+				ops.ooblen, ops.oobretlen, ret);
+		if (!ret)
+			ret = -EIO;
 		return ret;
 	}
-	if (ops.oobretlen != ops.ooblen) {
-		D1(printk(KERN_WARNING "jffs2_write_nand_cleanmarker(): "
-			  "Short write for block at %08x: %zd not %d\n",
-			  jeb->offset, ops.oobretlen, ops.ooblen));
-		return -EIO;
-	}
+
 	return 0;
 }
 
@@ -1140,41 +1097,24 @@ int jffs2_write_nand_badblock(struct jff
 	return 1;
 }
 
-static int jffs2_nand_set_oobinfo(struct jffs2_sb_info *c)
+int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
 {
 	struct nand_ecclayout *oinfo = c->mtd->ecclayout;
 
-	/* Do this only, if we have an oob buffer */
 	if (!c->mtd->oobsize)
 		return 0;
 
 	/* Cleanmarker is out-of-band, so inline size zero */
 	c->cleanmarker_size = 0;
 
-	/* Should we use autoplacement ? */
-	if (!oinfo) {
-		D1(printk(KERN_DEBUG "JFFS2 on NAND. No autoplacment info found\n"));
+	if (!oinfo || oinfo->oobavail == 0) {
+		printk(KERN_ERR "inconsistent device description\n");
 		return -EINVAL;
 	}
 
-	D1(printk(KERN_DEBUG "JFFS2 using autoplace on NAND\n"));
-	/* Get the position of the free bytes */
-	if (!oinfo->oobfree[0].length) {
-		printk (KERN_WARNING "jffs2_nand_set_oobinfo(): Eeep."
-			" Autoplacement selected and no empty space in oob\n");
-		return -ENOSPC;
-	}
-	c->fsdata_pos = oinfo->oobfree[0].offset;
-	c->fsdata_len = oinfo->oobfree[0].length;
-	if (c->fsdata_len > 8)
-		c->fsdata_len = 8;
-
-	return 0;
-}
+	D1(printk(KERN_DEBUG "JFFS2 using OOB on NAND\n"));
 
-int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
-{
-	int res;
+	c->oobavail = oinfo->oobavail;
 
 	/* Initialise write buffer */
 	init_rwsem(&c->wbuf_sem);
@@ -1185,22 +1125,13 @@ int jffs2_nand_flash_setup(struct jffs2_
 	if (!c->wbuf)
 		return -ENOMEM;
 
-	c->oobbuf = kmalloc(NR_OOB_SCAN_PAGES * c->mtd->oobsize, GFP_KERNEL);
-	if (!c->oobbuf)
-		return -ENOMEM;
-
-	res = jffs2_nand_set_oobinfo(c);
-
-#ifdef BREAKME
-	if (!brokenbuf)
-		brokenbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!brokenbuf) {
+	c->oobbuf = kmalloc(NR_OOB_SCAN_PAGES * c->oobavail, GFP_KERNEL);
+	if (!c->oobbuf) {
 		kfree(c->wbuf);
 		return -ENOMEM;
 	}
-	memset(brokenbuf, 0xdb, c->wbuf_pagesize);
-#endif
-	return res;
+
+	return 0;
 }
 
 void jffs2_nand_flash_cleanup(struct jffs2_sb_info *c)
