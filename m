Subject: RE: [PATCH] [JFFS2] Fix csize integer overflow issue due to truncation
From: David Woodhouse <dwmw2@infradead.org>
To: Victor Gallardo <vgallardo@amcc.com>
In-Reply-To: <0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
References: <25217471.1985431251223831787.JavaMail.nabble@isper.nabble.com>
	<0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
Content-Type: text/plain
Date: Sat, 19 Sep 2009 13:40:41 -0700
Message-Id: <1253392841.6317.37.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Prodyut Hazarika <phazarika@amcc.com>, linux-mtd@lists.infradead.org,
	Feng Kan <fkan@amcc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-27 at 16:37 -0700, Victor Gallardo wrote:
> 
> Hi David and Josh,
>  
> Sorry if I am bothering you guys. I know you guys are busy or might
> be on vacation (it was August).
>  
> Usually how long does it take for patches on the linux-mtd mailing
> list for JFFS2 patches to get ACKed or NACKed. Or get an email
> response from the MAINTAINER.
>  
> I submitted the following patch and need to monitor it until it gets
> applied.
>  
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/027005.html
> http://patchwork.ozlabs.org/patch/31854/

Apologies for the delay. I'm slightly concerned that your patch
increases the size of the 'struct jffs2_tmp_dnode_info', and we've
previously taken care to _shrink_ that structure. We have _lots_ of
these.

Can you test this alternative approach instead, please?

diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 67f36c3..cc3aca9 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -231,9 +231,15 @@ struct jffs2_tmp_dnode_info
 	uint32_t version;
 	uint32_t data_crc;
 	uint32_t partial_crc;
-	uint32_t csize;
-	uint16_t overlapped;
+	uint32_t __csize; /* We abuse the top bit for the overlap flag */
 };
+#define TN_OVERLAP (1<<31)
+
+#define tn_set_overlapped(tn)	((tn)->__csize |= TN_OVERLAP)
+#define tn_clear_overlapped(tn)	((tn)->__csize &= ~TN_OVERLAP)
+
+#define tn_overlapped(tn)	(!!(((tn)->__csize) & TN_OVERLAP))
+#define tn_csize(tn)		((tn)->__csize & !TN_OVERLAP)
 
 /* Temporary data structure used during readinode. */
 struct jffs2_readinode_info
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1a80301..a80cf02 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -35,20 +35,20 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 	uint32_t crc, ofs, len;
 	size_t retlen;
 
-	BUG_ON(tn->csize == 0);
+	BUG_ON(tn_csize(tn) == 0);
 
 	/* Calculate how many bytes were already checked */
 	ofs = ref_offset(ref) + sizeof(struct jffs2_raw_inode);
-	len = tn->csize;
+	len = tn_csize(tn);
 
 	if (jffs2_is_writebuffered(c)) {
 		int adj = ofs % c->wbuf_pagesize;
 		if (likely(adj))
 			adj = c->wbuf_pagesize - adj;
 
-		if (adj >= tn->csize) {
+		if (adj >= tn_csize(tn)) {
 			dbg_readinode("no need to check node at %#08x, data length %u, data starts at %#08x - it has already been checked.\n",
-				      ref_offset(ref), tn->csize, ofs);
+				      ref_offset(ref), tn_csize(tn), ofs);
 			goto adj_acc;
 		}
 
@@ -57,7 +57,7 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 	}
 
 	dbg_readinode("check node at %#08x, data length %u, partial CRC %#08x, correct CRC %#08x, data starts at %#08x, start checking from %#08x - %u bytes.\n",
-		ref_offset(ref), tn->csize, tn->partial_crc, tn->data_crc, ofs - len, ofs, len);
+		ref_offset(ref), tn_csize(tn), tn->partial_crc, tn->data_crc, ofs - len, ofs, len);
 
 #ifndef __ECOS
 	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
@@ -66,7 +66,7 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 		err = c->mtd->point(c->mtd, ofs, len, &retlen,
 				    (void **)&buffer, NULL);
 		if (!err && retlen < len) {
-			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
+			JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn_csize(tn));
 			c->mtd->unpoint(c->mtd, ofs, retlen);
 		} else if (err)
 			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
@@ -251,14 +251,14 @@ static int jffs2_add_tn_to_tree(struct jffs2_sb_info *c,
 	if (this) {
 		/* If the node is coincident with another at a lower address,
 		   back up until the other node is found. It may be relevant */
-		while (this->overlapped) {
+		while (tn_overlapped(this)) {
 			ptn = tn_prev(this);
 			if (!ptn) {
 				/*
 				 * We killed a node which set the overlapped
 				 * flags during the scan. Fix it up.
 				 */
-				this->overlapped = 0;
+				tn_clear_overlapped(this);
 				break;
 			}
 			this = ptn;
@@ -362,10 +362,10 @@ static int jffs2_add_tn_to_tree(struct jffs2_sb_info *c,
 				dbg_readinode("Node is overlapped by %p (v %d, 0x%x-0x%x)\n",
 					      this, this->version, this->fn->ofs,
 					      this->fn->ofs+this->fn->size);
-				tn->overlapped = 1;
+				tn_set_overlapped(tn);
 				break;
 			}
-			if (!this->overlapped)
+			if (!tn_overlapped(this))
 				break;
 
 			ptn = tn_prev(this);
@@ -374,7 +374,7 @@ static int jffs2_add_tn_to_tree(struct jffs2_sb_info *c,
 				 * We killed a node which set the overlapped
 				 * flags during the scan. Fix it up.
 				 */
-				this->overlapped = 0;
+				tn_clear_overlapped(this);
 				break;
 			}
 			this = ptn;
@@ -384,7 +384,7 @@ static int jffs2_add_tn_to_tree(struct jffs2_sb_info *c,
 	/* If the new node overlaps anything ahead, note it */
 	this = tn_next(tn);
 	while (this && this->fn->ofs < fn_end) {
-		this->overlapped = 1;
+		tn_set_overlapped(this);
 		dbg_readinode("Node ver %d, 0x%x-0x%x is overlapped\n",
 			      this->version, this->fn->ofs,
 			      this->fn->ofs+this->fn->size);
@@ -462,7 +462,7 @@ static int jffs2_build_inode_fragtree(struct jffs2_sb_info *c,
 	this = tn_last(&rii->tn_root);
 	while (this) {
 		dbg_readinode("tn %p ver %d range 0x%x-0x%x ov %d\n", this, this->version, this->fn->ofs,
-			      this->fn->ofs+this->fn->size, this->overlapped);
+			      this->fn->ofs+this->fn->size, tn_overlapped(this));
 		this = tn_prev(this);
 	}
 #endif
@@ -473,14 +473,14 @@ static int jffs2_build_inode_fragtree(struct jffs2_sb_info *c,
 		eat_last(&rii->tn_root, &last->rb);
 		ver_insert(&ver_root, last);
 
-		if (unlikely(last->overlapped)) {
+		if (unlikely(tn_overlapped(last))) {
 			if (pen)
 				continue;
 			/*
 			 * We killed a node which set the overlapped
 			 * flags during the scan. Fix it up.
 			 */
-			last->overlapped = 0;
+			tn_clear_overlapped(last);
 		}
 
 		/* Now we have a bunch of nodes in reverse version
@@ -510,7 +510,7 @@ static int jffs2_build_inode_fragtree(struct jffs2_sb_info *c,
 				}
 				dbg_readinode("Add %p (v %d, 0x%x-0x%x, ov %d) to fragtree\n",
 					     this, this->version, this->fn->ofs,
-					     this->fn->ofs+this->fn->size, this->overlapped);
+					     this->fn->ofs+this->fn->size, tn_overlapped(this));
 
 				ret = jffs2_add_full_dnode_to_inode(c, f, this->fn);
 				if (ret) {
@@ -836,9 +836,8 @@ static inline int read_dnode(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 	tn->version = je32_to_cpu(rd->version);
 	tn->fn->ofs = je32_to_cpu(rd->offset);
 	tn->data_crc = je32_to_cpu(rd->data_crc);
-	tn->csize = csize;
+	tn->__csize = csize;
 	tn->fn->raw = ref;
-	tn->overlapped = 0;
 
 	if (tn->version > rii->highest_version)
 		rii->highest_version = tn->version;
@@ -868,7 +867,7 @@ static inline int read_dnode(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 	while (tn) {
 		dbg_readinode2("%p: v %d r 0x%x-0x%x ov %d\n",
 			       tn, tn->version, tn->fn->ofs,
-			       tn->fn->ofs+tn->fn->size, tn->overlapped);
+			       tn->fn->ofs+tn->fn->size, tn_overlapped(tn));
 		tn = tn_next(tn);
 	}
 #endif


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
