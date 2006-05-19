From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Content-Type: text/plain
Date: Fri, 19 May 2006 21:23:26 +0100
Message-Id: <1148070206.3875.219.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Summary improvement
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any comments before I pull this into the main tree? Could someone test
it on NOR flash with and without ->point() (i.e. XIP-style reads)? Would
be interesting to know (a) if it works, and (b) how much of a difference
it makes...

From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 19 May 2006 20:15:08 +0000 (+0100)
Subject: [JFFS2] Optimise reading of eraseblock summary nodes
X-Git-Url: http://git.infradead.org/?p=users/dwmw2/jffs2-play-2.6.git;a=commitdiff;h=13364d291299216beccc8fe9d838c1945b0e8292

[JFFS2] Optimise reading of eraseblock summary nodes

This improves the time to mount 512MiB of NAND flash on my OLPC prototype
by about 4%. We used to read the last page of the eraseblock twice -- once
to find the offset of the summary node, and again to actually _read_ the
summary node. Now we read the last page only once, and read more only if
we need to.

We also don't allocate a new buffer just for the summary code -- we use
the buffer which was already allocated for the scan. Better still, if the
'buffer' for the scan is actually just a pointer directly into NOR flash,
we use that too, avoiding the memcpy() which we used to do.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
---

--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -306,11 +306,12 @@ int jffs2_scan_classify_jeb(struct jffs2
 		return BLK_STATE_ALLDIRTY;
 }
 
+/* Called with 'buf_size == 0' if buf is in fact a pointer _directly_ into
+   the flash, XIP-style */
 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
-				unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s) {
+				  unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s) {
 	struct jffs2_unknown_node *node;
 	struct jffs2_unknown_node crcnode;
-	struct jffs2_sum_marker *sm;
 	uint32_t ofs, prevofs;
 	uint32_t hdr_crc, buf_ofs, buf_len;
 	int err;
@@ -344,32 +345,69 @@ static int jffs2_scan_eraseblock (struct
 #endif
 
 	if (jffs2_sum_active()) {
-		sm = kmalloc(sizeof(struct jffs2_sum_marker), GFP_KERNEL);
-		if (!sm) {
-			return -ENOMEM;
-		}
+		struct jffs2_sum_marker *sm;
+		void *sumptr = NULL;
+		uint32_t sumlen;
+	      
+		if (!buf_size) {
+			/* XIP case. Just look, point at the summary if it's there */
+			sm = (void *)buf + jeb->offset - sizeof(*sm);
+			if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC) {
+				sumptr = buf + je32_to_cpu(sm->offset);
+				sumlen = c->sector_size - je32_to_cpu(sm->offset);
+			}
+		} else {
+			/* If NAND flash, read a whole page of it. Else just the end */
+			if (c->wbuf_pagesize)
+				buf_len = c->wbuf_pagesize;
+			else
+				buf_len = sizeof(*sm);
+
+			/* Read as much as we want into the _end_ of the preallocated buffer */
+			err = jffs2_fill_scan_buf(c, buf + buf_size - buf_len, 
+						  jeb->offset + c->sector_size - buf_len,
+						  buf_len);				
+			if (err)
+				return err;
+
+			sm = (void *)buf + buf_size - sizeof(*sm);
+			if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC) {
+				sumlen = c->sector_size - je32_to_cpu(sm->offset);
+				sumptr = buf + buf_size - sumlen;
+
+				/* Now, make sure the summary itself is available */
+				if (sumlen > buf_size) {
+					/* Need to kmalloc for this. */
+					sumptr = kmalloc(sumlen, GFP_KERNEL);
+					if (!sumptr)
+						return -ENOMEM;
+					memcpy(sumptr + sumlen - buf_len, buf + buf_size - buf_len, buf_len);
+				}
+				if (buf_len < sumlen) {
+					/* Need to read more so that the entire summary node is present */
+					err = jffs2_fill_scan_buf(c, sumptr, 
+								  jeb->offset + c->sector_size - sumlen,
+								  sumlen - buf_len);				
+					if (err)
+						return err;
+				}
+			}
 
-		err = jffs2_fill_scan_buf(c, (unsigned char *) sm, jeb->offset + c->sector_size -
-					sizeof(struct jffs2_sum_marker), sizeof(struct jffs2_sum_marker));
-		if (err) {
-			kfree(sm);
-			return err;
 		}
 
-		if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC ) {
-			err = jffs2_sum_scan_sumnode(c, jeb, je32_to_cpu(sm->offset), &pseudo_random);
-			if (err) {
-				kfree(sm);
+		if (sumptr) {
+			err = jffs2_sum_scan_sumnode(c, jeb, sumptr, sumlen, &pseudo_random);
+			if (err)
 				return err;
-			}
+			if (buf_size && sumlen > buf_size)
+				kfree(sumptr);
 		}
-
-		kfree(sm);
 	}
 
 	buf_ofs = jeb->offset;
 
 	if (!buf_size) {
+		/* This is the XIP case -- we're reading _directly_ from the flash chip */
 		buf_len = c->sector_size;
 	} else {
 		buf_len = EMPTY_SCAN_SIZE(c->sector_size);
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -417,39 +417,23 @@ static int jffs2_sum_process_sum_data(st
 		}
 	}
 
-	kfree(summary);
 	return 0;
 }
 
 /* Process the summary node - called from jffs2_scan_eraseblock() */
-
 int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
-				uint32_t ofs, uint32_t *pseudo_random)
+			   struct jffs2_raw_summary *summary, uint32_t sumsize,
+			   uint32_t *pseudo_random)
 {
 	struct jffs2_unknown_node crcnode;
 	struct jffs2_raw_node_ref *cache_ref;
-	struct jffs2_raw_summary *summary;
-	int ret, sumsize;
+	int ret, ofs;
 	uint32_t crc;
 
-	sumsize = c->sector_size - ofs;
-	ofs += jeb->offset;
+	ofs = jeb->offset + c->sector_size - sumsize;
 
 	dbg_summary("summary found for 0x%08x at 0x%08x (0x%x bytes)\n",
-				jeb->offset, ofs, sumsize);
-
-	summary = kmalloc(sumsize, GFP_KERNEL);
-
-	if (!summary) {
-		return -ENOMEM;
-	}
-
-	ret = jffs2_fill_scan_buf(c, (unsigned char *)summary, ofs, sumsize);
-
-	if (ret) {
-		kfree(summary);
-		return ret;
-	}
+		    jeb->offset, ofs, sumsize);
 
 	/* OK, now check for node validity and CRC */
 	crcnode.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
@@ -499,7 +483,6 @@ int jffs2_sum_scan_sumnode(struct jffs2_
 
 			if (!marker_ref) {
 				JFFS2_NOTICE("Failed to allocate node ref for clean marker\n");
-				kfree(summary);
 				return -ENOMEM;
 			}
 
--- a/fs/jffs2/summary.h
+++ b/fs/jffs2/summary.h
@@ -160,7 +160,8 @@ int jffs2_sum_add_padding_mem(struct jff
 int jffs2_sum_add_inode_mem(struct jffs2_summary *s, struct jffs2_raw_inode *ri, uint32_t ofs);
 int jffs2_sum_add_dirent_mem(struct jffs2_summary *s, struct jffs2_raw_dirent *rd, uint32_t ofs);
 int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
-			uint32_t ofs, uint32_t *pseudo_random);
+			   struct jffs2_raw_summary *summary, uint32_t sumlen,
+			   uint32_t *pseudo_random);
 
 #else				/* SUMMARY DISABLED */
 

-- 
dwmw2
