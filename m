Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fu1Ae-00073F-Ox
	for linux-mtd@lists.infradead.org; Sat, 24 Jun 2006 01:59:20 -0400
Message-ID: <449CD47E.6010002@ak.jp.nec.com>
Date: Sat, 24 Jun 2006 14:58:22 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2/xattr problems.
References: <1148150486.3875.251.camel@pmac.infradead.org>	<44704CA9.8010604@ak.jp.nec.com>	<448CCEC8.2080903@ak.jp.nec.com>	<1150099418.11159.44.camel@shinybook.infradead.org>	<448D3752.3090605@ak.jp.nec.com>	<1150105995.8184.17.camel@pmac.infradead.org>
	<448EBDE2.7090408@kaigai.gr.jp>
In-Reply-To: <448EBDE2.7090408@kaigai.gr.jp>
Content-Type: multipart/mixed; boundary="------------020700050608050903040608"
Cc: KaiGai Kohei <kaigai@kaigai.gr.jp>, linux-mtd@lists.infradead.org,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020700050608050903040608
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>>I'm looking through your handling of deletion now... I'm not sure that
>>we _need_ the physical deletion node for xdata, do we? Those can go away
>>just because there are no xrefs which link to them, just like our inodes
>>do?
>>
>>Also, the physical deletion node for xrefs is only needed when the xattr
>>is deleted _without_ the inode being deleted. When the inode goes away,
>>again the xref becomes obsolete all by itself, right?
> 
> 
> Indeed, you are right.
> In mounting process, we can certainly detect xdatum no xref linked and
> xref no inode linked. I'll fix its design, so please wait for a while.

I'm sorry to have kept you waiting so long.
The following patches 01-03 modifies its design, and 04 fixes trivial
wrong copyright, 05 enables to use xattr with write buffering support.

Those have been pushed jffs2-xattr-2.6.git yet.

[1/5] jffs2-xattr-v6.1-01-rid-unnecessary-writing-of-delete_marker.patch
   This patch rids writing physical delete marker when we delete xdatum
   and xref with no inode linked. We can certainlly detect those obsolete
   nodes, so those writings are not necessary.

[2/5] jffs2-xattr-v6.1-02-fix-memory-leak-jffs2_xattr_ref.patch
   This patch fixes a problem with memory leak in jffs2_xattr_ref.
   This problem became obvious by the above patch, but it has
   a possibility to cause.

[3/5] jffs2-xattr-v6.1-03-redefine-refcnt-as-atomic_t.patch
   In jffs2_release_xattr_datum(), it refers xd->refcnt to ensure
   whether releasing xd is allowed or not.
   But we can't hold xattr_sem since this function is called under
   spin_lock(&c->erase_completion_lock). Thus we have to refer it
   without any locking.

[4/5] jffs2-xattr-v6.1-04-fix-copyright.patch
   I modified summary.c at 2006, not 2005.

[5/5] jffs2-xattr-v6.1-05-coexistence-between-xattr-and-write-buffering.patch
   drops '&& !JFFS2_FS_WRITEBUFFER' from fs/Kconfig.

Thanks,
--
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------020700050608050903040608
Content-Type: text/plain;
	name="jffs2-xattr-v6.1-01-rid-unnecessary-writing-of-delete_marker.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="jffs2-xattr-v6.1-01-rid-unnecessary-writing-of-delete_marker.patch"

diff-tree 00c6cf2b8998389c8c04a5585b54902227ceb528 (from 0f42cbcf9f12cf3d9379a4c744da583e8809f03a)
Author: KaiGai Kohei <kaigai@ak.jp.nec.com>
Date:   Fri Jun 23 22:34:51 2006 +0900

    [JFFS2][XATTR] rid unnecessary writing of delete marker.
    
    In the followinf situation, an explicit delete marker is not
    necessary, because we can certainlly detect those obsolete
    xattr_datum or xattr_ref on next mounting.
    
    - When to delete xattr_datum node.
    - When to delete xattr_ref node on removing inode.
    - When to delete xattr_ref node on updating xattr.
    
    This patch rids writing delete marker in those situations.
    
    Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 79638f5..2bfdc33 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -332,10 +332,8 @@ static int jffs2_scan_xattr_node(struct 
 	xid = je32_to_cpu(rx->xid);
 	version = je32_to_cpu(rx->version);
 
-	totlen = sizeof(struct jffs2_raw_xattr);
-	if (version != XDATUM_DELETE_MARKER)
-		totlen += rx->name_len + 1 + je16_to_cpu(rx->value_len);
-	totlen = PAD(totlen);
+	totlen = PAD(sizeof(struct jffs2_raw_xattr)
+			+ rx->name_len + 1 + je16_to_cpu(rx->value_len));
 	if (totlen != je32_to_cpu(rx->totlen)) {
 		JFFS2_WARNING("node length mismatch at %#08x, read=%u, calc=%u\n",
 			      ofs, je32_to_cpu(rx->totlen), totlen);
diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 03871ab..7622f79 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -50,12 +50,9 @@ #include "nodelist.h"
  *   is used to write xdatum to medium. xd->version will be incremented.
  * create_xattr_datum(c, xprefix, xname, xvalue, xsize)
  *   is used to create new xdatum and write to medium.
- * delete_xattr_datum_delay(c, xd)
- *   is used to delete a xdatum without 'delete marker'. It has a possibility to detect
- *   orphan xdatum on next mounting.
  * delete_xattr_datum(c, xd)
- *   is used to delete a xdatum with 'delete marker'. Calling jffs2_reserve_space() is
- *   necessary before this function.
+ *   is used to delete a xdatum. It marks xd JFFS2_XFLAGS_DEAD, and allows
+ *   GC to reclaim those physical nodes.
  * -------------------------------------------------- */
 static uint32_t xattr_datum_hashkey(int xprefix, const char *xname, const char *xvalue, int xsize)
 {
@@ -154,10 +151,7 @@ static int do_verify_xattr_datum(struct 
 		xd->flags |= JFFS2_XFLAGS_INVALID;
 		return EIO;
 	}
-	totlen = sizeof(rx);
-	if (xd->version != XDATUM_DELETE_MARKER)
-		totlen += rx.name_len + 1 + je16_to_cpu(rx.value_len);
-	totlen = PAD(totlen);
+	totlen = PAD(sizeof(rx) + rx.name_len + 1 + je16_to_cpu(rx.value_len));
 	if (je16_to_cpu(rx.magic) != JFFS2_MAGIC_BITMASK
 	    || je16_to_cpu(rx.nodetype) != JFFS2_NODETYPE_XATTR
 	    || je32_to_cpu(rx.totlen) != totlen
@@ -268,6 +262,7 @@ static int load_xattr_datum(struct jffs2
 	 */
 	int rc = 0;
 
+	BUG_ON(xd->flags & JFFS2_XFLAGS_DEAD);
 	if (xd->xname)
 		return 0;
 	if (xd->flags & JFFS2_XFLAGS_INVALID)
@@ -285,20 +280,18 @@ static int save_xattr_datum(struct jffs2
 	struct jffs2_raw_xattr rx;
 	struct kvec vecs[2];
 	size_t length;
-	int rc, totlen, nvecs = 1;
+	int rc, totlen;
 	uint32_t phys_ofs = write_ofs(c);
 
-	BUG_ON(is_xattr_datum_dead(xd) || (xd->flags & JFFS2_XFLAGS_INVALID)
-	       ? !!xd->xname : !xd->xname);
+	BUG_ON(!xd->xname);
+	BUG_ON(xd->flags & (JFFS2_XFLAGS_DEAD|JFFS2_XFLAGS_INVALID));
 
 	vecs[0].iov_base = &rx;
-	vecs[0].iov_len = totlen = sizeof(rx);
-	if (!is_xattr_datum_dead(xd) && !(xd->flags & JFFS2_XFLAGS_INVALID)) {
-		nvecs++;
-		vecs[1].iov_base = xd->xname;
-		vecs[1].iov_len = xd->name_len + 1 + xd->value_len;
-		totlen += vecs[1].iov_len;
-	}
+	vecs[0].iov_len = sizeof(rx);
+	vecs[1].iov_base = xd->xname;
+	vecs[1].iov_len = xd->name_len + 1 + xd->value_len;
+	totlen = vecs[0].iov_len + vecs[1].iov_len;
+
 	/* Setup raw-xattr */
 	memset(&rx, 0, sizeof(rx));
 	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
@@ -307,18 +300,14 @@ static int save_xattr_datum(struct jffs2
 	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node) - 4));
 
 	rx.xid = cpu_to_je32(xd->xid);
-	if (!is_xattr_datum_dead(xd) && !(xd->flags & JFFS2_XFLAGS_INVALID)) {
-		rx.version = cpu_to_je32(++xd->version);
-		rx.xprefix = xd->xprefix;
-		rx.name_len = xd->name_len;
-		rx.value_len = cpu_to_je16(xd->value_len);
-		rx.data_crc = cpu_to_je32(crc32(0, vecs[1].iov_base, vecs[1].iov_len));
-	} else {
-		rx.version = cpu_to_je32(XDATUM_DELETE_MARKER);
-	}
+	rx.version = cpu_to_je32(++xd->version);
+	rx.xprefix = xd->xprefix;
+	rx.name_len = xd->name_len;
+	rx.value_len = cpu_to_je16(xd->value_len);
+	rx.data_crc = cpu_to_je32(crc32(0, vecs[1].iov_base, vecs[1].iov_len));
 	rx.node_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_raw_xattr) - 4));
 
-	rc = jffs2_flash_writev(c, vecs, nvecs, phys_ofs, &length, 0);
+	rc = jffs2_flash_writev(c, vecs, 2, phys_ofs, &length, 0);
 	if (rc || totlen != length) {
 		JFFS2_WARNING("jffs2_flash_writev()=%d, req=%u, wrote=%zu, at %#08x\n",
 			      rc, totlen, length, phys_ofs);
@@ -405,53 +394,36 @@ static struct jffs2_xattr_datum *create_
 	return xd;
 }
 
-static void delete_xattr_datum_delay(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
 {
 	/* must be called under down_write(xattr_sem) */
 	BUG_ON(xd->refcnt);
 
 	unload_xattr_datum(c, xd);
-	set_xattr_datum_dead(xd);
+	xd->flags |= JFFS2_XFLAGS_DEAD;
 	spin_lock(&c->erase_completion_lock);
-	list_add(&xd->xindex, &c->xattr_dead_list);
-	spin_unlock(&c->erase_completion_lock);
-	JFFS2_NOTICE("xdatum(xid=%u) was removed without delete marker. "
-		     "An orphan xdatum may be detected on next mounting.\n", xd->xid);
-}
-
-static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
-{
-	/* must be called under jffs2_reserve_space() and down_write(xattr_sem) */
-	int rc;
-	BUG_ON(xd->refcnt);
-
-	unload_xattr_datum(c, xd);
-	set_xattr_datum_dead(xd);	
-	rc = save_xattr_datum(c, xd);
-	if (rc) {
-		JFFS2_NOTICE("xdatum(xid=%u) was removed without delete marker. "
-			     "An orphan xdatum may be detected on next mounting.\n",
-			     xd->xid);
+	if (xd->node == (void *)xd) {
+		BUG_ON(!(xd->flags & JFFS2_XFLAGS_INVALID));
+		jffs2_free_xattr_datum(xd);
+	} else {
+		list_add(&xd->xindex, &c->xattr_dead_list);
 	}
-	spin_lock(&c->erase_completion_lock);
-	list_add(&xd->xindex, &c->xattr_dead_list);
 	spin_unlock(&c->erase_completion_lock);
+	dbg_xattr("xdatum(xid=%u, version=%u) was removed.\n", xd->xid, xd->version);
 }
 
 /* -------- xref related functions ------------------
  * verify_xattr_ref(c, ref)
  *   is used to load xref information from medium. Because summary data does not
  *   contain xid/ino, it's necessary to verify once while mounting process.
- * delete_xattr_ref_node(c, ref)
- *   is used to delete a jffs2 node is dominated by xref. When EBS is enabled,
- *   it overwrites the obsolete node by myself. 
- * delete_xattr_ref(c, ref)
- *   is used to delete jffs2_xattr_ref object. If the reference counter of xdatum
- *   is refered by this xref become 0, delete_xattr_datum() is called later.
  * save_xattr_ref(c, ref)
- *   is used to write xref to medium.
+ *   is used to write xref to medium. If delete marker is marked, it write
+ *   a delete marker of xref into medium.
  * create_xattr_ref(c, ic, xd)
  *   is used to create a new xref and write to medium.
+ * delete_xattr_ref(c, ref)
+ *   is used to delete jffs2_xattr_ref. It marks xref XREF_DELETE_MARKER,
+ *   and allows GC to reclaim those physical nodes.
  * jffs2_xattr_delete_inode(c, ic)
  *   is called to remove xrefs related to obsolete inode when inode is unlinked.
  * jffs2_xattr_free_inode(c, ic)
@@ -591,13 +563,13 @@ static struct jffs2_xattr_ref *create_xa
 	return ref; /* success */
 }
 
-static void delete_xattr_ref_delay(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
 {
 	/* must be called under down_write(xattr_sem) */
 	struct jffs2_xattr_datum *xd;
 
-	set_xattr_ref_dead(ref);
 	xd = ref->xd;
+	ref->xseqno |= XREF_DELETE_MARKER;
 	ref->ino = ref->ic->ino;
 	ref->xid = ref->xd->xid;
 	spin_lock(&c->erase_completion_lock);
@@ -605,102 +577,29 @@ static void delete_xattr_ref_delay(struc
 	c->xref_dead_list = ref;
 	spin_unlock(&c->erase_completion_lock);
 
-	JFFS2_NOTICE("xref(ino=%u, xid=%u) was removed without delete marker. "
-		     "An orphan xref may be detected on next mounting.\n",
-		     ref->ino, ref->xid);
+	dbg_xattr("xref(ino=%u, xid=%u, xseqno=%u) was removed.\n",
+		  ref->ino, ref->xid, ref->xseqno);
 
 	if (!--xd->refcnt)
-		delete_xattr_datum_delay(c, xd);
-}
-
-static int delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref, int enforce)
-{
-	/* must be called under jffs2_reserve_space() and down_write(xattr_sem) */
-	struct jffs2_inode_cache *ic;
-	struct jffs2_xattr_datum *xd;
-	uint32_t length;
-	int rc;
-
-	set_xattr_ref_dead(ref);
-	ic = ref->ic;
-	xd = ref->xd;
-	ref->ino = ic->ino;
-	ref->xid = xd->xid;
-	rc = save_xattr_ref(c, ref);
-	if (rc) {
-		if (!enforce) {
-			clr_xattr_ref_dead(ref);
-			ref->ic = ic;
-			ref->xd = xd;
-			return rc;
-		}
-		JFFS2_WARNING("could not write delete marker of xref(ino=%u, xid=%u). "
-			      "An orphan xref may be detected on next mounting.\n",
-			      ref->ic->ino, ref->xd->xid);
-	}
-	spin_lock(&c->erase_completion_lock);
-	ref->next = c->xref_dead_list;
-	c->xref_dead_list = ref;
-	spin_unlock(&c->erase_completion_lock);
-
-	xd->refcnt--;
-	if (xd->refcnt)
-		return 0;
-
-	/* delete xdatum */
-	unload_xattr_datum(c, xd);
-	up_write(&c->xattr_sem);
-	jffs2_complete_reservation(c);
-
-	rc = jffs2_reserve_space(c, PAD(sizeof(struct jffs2_raw_xattr)), &length,
-				 ALLOC_DELETION, JFFS2_SUMMARY_XATTR_SIZE);
-	if (rc) {
-		down(&c->alloc_sem);
-		down_write(&c->xattr_sem);
-		delete_xattr_datum_delay(c, xd);
-	} else {
-		down_write(&c->xattr_sem);
 		delete_xattr_datum(c, xd);
-	}
-	return 0;
 }
 
 void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
 {
 	/* It's called from jffs2_clear_inode() on inode removing.
 	   When an inode with XATTR is removed, those XATTRs must be removed. */
-	struct jffs2_xattr_ref *ref;
-	uint32_t length;
-	int rc, retry;
+	struct jffs2_xattr_ref *ref, *_ref;
 
 	if (!ic || ic->nlink > 0)
 		return;
 
-	down_read(&c->xattr_sem);
-	if (!ic->xref) {
-		up_read(&c->xattr_sem);
-		return;
-	}
-	up_read(&c->xattr_sem);
- retry:
-	rc = jffs2_reserve_space(c, PAD(sizeof(struct jffs2_raw_xref)), &length,
-				 ALLOC_DELETION, JFFS2_SUMMARY_XREF_SIZE);
 	down_write(&c->xattr_sem);
-	if (ic->xref) {
-		ref = ic->xref;
-		ic->xref = ref->next;
-		if (rc) {
-			delete_xattr_ref_delay(c, ref);
-		} else {
-			delete_xattr_ref(c, ref, 1);
-		}
+	for (ref = ic->xref; ref; ref = _ref) {
+		_ref = ref->next;
+		delete_xattr_ref(c, ref);
 	}
-	retry = ic->xref ? 1 : 0;
+	ic->xref = NULL;
 	up_write(&c->xattr_sem);
-	if (!rc)
-		jffs2_complete_reservation(c);
-	if (retry)
-		goto retry;
 }
 
 void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
@@ -743,7 +642,7 @@ static int check_xattr_ref_inode(struct 
 			rc = load_xattr_datum(c, ref->xd);
 			if (unlikely(rc > 0)) {
 				*pref = ref->next;
-				delete_xattr_ref_delay(c, ref);
+				delete_xattr_ref(c, ref);
 				goto retry;
 			} else if (unlikely(rc < 0))
 				goto out;
@@ -755,7 +654,7 @@ static int check_xattr_ref_inode(struct 
 				ref->xd->flags &= ~JFFS2_XFLAGS_BIND;
 				if (unlikely(rc > 0)) {
 					*pcmp = cmp->next;
-					delete_xattr_ref_delay(c, cmp);
+					delete_xattr_ref(c, cmp);
 					goto retry;
 				} else if (unlikely(rc < 0))
 					goto out;
@@ -764,10 +663,10 @@ static int check_xattr_ref_inode(struct 
 			    && !strcmp(ref->xd->xname, cmp->xd->xname)) {
 				if (ref->xseqno > cmp->xseqno) {
 					*pcmp = cmp->next;
-					delete_xattr_ref_delay(c, cmp);
+					delete_xattr_ref(c, cmp);
 				} else {
 					*pref = ref->next;
-					delete_xattr_ref_delay(c, ref);
+					delete_xattr_ref(c, ref);
 				}
 				goto retry;
 			}
@@ -865,20 +764,11 @@ void jffs2_build_xattr_subsystem(struct 
 	struct jffs2_inode_cache *ic;
 	struct jffs2_raw_node_ref *raw;
 	int i, xdatum_count = 0, xdatum_unchecked_count = 0, xref_count = 0;
+	int xdatum_orphan_count = 0, xref_orphan_count = 0, xref_dead_count = 0;
 
 	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
-	/* Phase.1 : Drop dead xdatum */
-	for (i=0; i < XATTRINDEX_HASHSIZE; i++) {
-		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
-			BUG_ON(xd->node == (void *)xd);
-			if (is_xattr_datum_dead(xd)) {
-				list_del_init(&xd->xindex);
-				list_add(&xd->xindex, &c->xattr_unchecked);
-			}
-		}
-	}
 
-	/* Phase.2 : Merge same xref */
+	/* Phase.1 : Merge same xref */
 	for (i=0; i < XREF_TMPHASH_SIZE; i++)
 		xref_tmphash[i] = NULL;
 	for (ref=c->xref_temp; ref; ref=_ref) {
@@ -919,13 +809,15 @@ void jffs2_build_xattr_subsystem(struct 
 	}
 	c->xref_temp = NULL;
 
-	/* Phase.3 : Bind xref with inode_cache and xattr_datum */
+	/* Phase.2 : Bind xref with inode_cache and xattr_datum */
 	for (i=0; i < XREF_TMPHASH_SIZE; i++) {
 		for (ref=xref_tmphash[i]; ref; ref=_ref) {
+			xref_count++;
 			_ref = ref->next;
 			if (is_xattr_ref_dead(ref)) {
 				ref->next = c->xref_dead_list;
 				c->xref_dead_list = ref;
+				xref_dead_count++;
 				continue;
 			}
 			/* At this point, ref->xid and ref->ino contain XID and inode number.
@@ -933,11 +825,12 @@ void jffs2_build_xattr_subsystem(struct 
 			xd = jffs2_find_xattr_datum(c, ref->xid);
 			ic = jffs2_get_ino_cache(c, ref->ino);
 			if (!xd || !ic) {
-				JFFS2_WARNING("xref(ino=%u, xid=%u, xseqno=%u) is orphan. \n",
-					      ref->ino, ref->xid, ref->xseqno);
-				set_xattr_ref_dead(ref);
+				dbg_xattr("xref(ino=%u, xid=%u, xseqno=%u) is orphan.\n",
+					  ref->ino, ref->xid, ref->xseqno);
+				ref->xseqno |= XREF_DELETE_MARKER;
 				ref->next = c->xref_dead_list;
 				c->xref_dead_list = ref;
+				xref_orphan_count++;
 				continue;
 			}
 			ref->xd = xd;
@@ -945,19 +838,20 @@ void jffs2_build_xattr_subsystem(struct 
 			xd->refcnt++;
 			ref->next = ic->xref;
 			ic->xref = ref;
-			xref_count++;
 		}
 	}
 
-	/* Phase.4 : Link unchecked xdatum to xattr_unchecked list */
+	/* Phase.3 : Link unchecked xdatum to xattr_unchecked list */
 	for (i=0; i < XATTRINDEX_HASHSIZE; i++) {
 		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
+			xdatum_count++;
 			list_del_init(&xd->xindex);
 			if (!xd->refcnt) {
-				JFFS2_WARNING("orphan xdatum(xid=%u, version=%u)\n",
-					      xd->xid, xd->version);
-				set_xattr_datum_dead(xd);
+				dbg_xattr("xdatum(xid=%u, version=%u) is orphan.\n",
+					  xd->xid, xd->version);
+				xd->flags |= JFFS2_XFLAGS_DEAD;
 				list_add(&xd->xindex, &c->xattr_unchecked);
+				xdatum_orphan_count++;
 				continue;
 			}
 			if (is_xattr_datum_unchecked(c, xd)) {
@@ -966,12 +860,14 @@ void jffs2_build_xattr_subsystem(struct 
 				list_add(&xd->xindex, &c->xattr_unchecked);
 				xdatum_unchecked_count++;
 			}
-			xdatum_count++;
 		}
 	}
 	/* build complete */
-	JFFS2_NOTICE("complete building xattr subsystem, %u of xdatum (%u unchecked) and "
-		     "%u of xref found.\n", xdatum_count, xdatum_unchecked_count, xref_count);
+	JFFS2_NOTICE("complete building xattr subsystem, %u of xdatum"
+		     " (%u unchecked, %u orphan) and "
+		     "%u of xref (%u dead, %u orphan) found.\n",
+		     xdatum_count, xdatum_unchecked_count, xdatum_orphan_count,
+		     xref_count, xref_dead_count, xref_orphan_count);
 }
 
 struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct jffs2_sb_info *c,
@@ -1079,7 +975,7 @@ ssize_t jffs2_listxattr(struct dentry *d
 				rc = load_xattr_datum(c, xd);
 				if (unlikely(rc > 0)) {
 					*pref = ref->next;
-					delete_xattr_ref_delay(c, ref);
+					delete_xattr_ref(c, ref);
 					goto retry;
 				} else if (unlikely(rc < 0))
 					goto out;
@@ -1140,7 +1036,7 @@ int do_jffs2_getxattr(struct inode *inod
 				rc = load_xattr_datum(c, xd);
 				if (unlikely(rc > 0)) {
 					*pref = ref->next;
-					delete_xattr_ref_delay(c, ref);
+					delete_xattr_ref(c, ref);
 					goto retry;
 				} else if (unlikely(rc < 0)) {
 					goto out;
@@ -1203,7 +1099,7 @@ int do_jffs2_setxattr(struct inode *inod
 			rc = load_xattr_datum(c, xd);
 			if (unlikely(rc > 0)) {
 				*pref = ref->next;
-				delete_xattr_ref_delay(c, ref);
+				delete_xattr_ref(c, ref);
 				goto retry;
 			} else if (unlikely(rc < 0))
 				goto out;
@@ -1214,8 +1110,23 @@ int do_jffs2_setxattr(struct inode *inod
 				goto out;
 			}
 			if (!buffer) {
-				*pref = ref->next;
-				rc = delete_xattr_ref(c, ref, 0);
+				ref->ino = ic->ino;
+				ref->xid = xd->xid;
+				ref->xseqno |= XREF_DELETE_MARKER;
+				rc = save_xattr_ref(c, ref);
+				if (!rc) {
+					*pref = ref->next;
+					spin_lock(&c->erase_completion_lock);
+					ref->next = c->xref_dead_list;
+					c->xref_dead_list = ref;
+					spin_unlock(&c->erase_completion_lock);
+					if (!--xd->refcnt)
+						delete_xattr_datum(c, xd);
+				} else {
+					ref->ic = ic;
+					ref->xd = xd;
+					ref->xseqno &= ~XREF_DELETE_MARKER;
+				}
 				goto out;
 			}
 			goto found;
@@ -1248,7 +1159,7 @@ int do_jffs2_setxattr(struct inode *inod
 		JFFS2_WARNING("jffs2_reserve_space()=%d, request=%u\n", rc, request);
 		xd->refcnt--;
 		if (!xd->refcnt)
-			delete_xattr_datum_delay(c, xd);
+			delete_xattr_datum(c, xd);
 		up_write(&c->xattr_sem);
 		return rc;
 	}
@@ -1263,21 +1174,9 @@ int do_jffs2_setxattr(struct inode *inod
 		rc = PTR_ERR(newref);
 		xd->refcnt--;
 		if (!xd->refcnt)
-			delete_xattr_datum_delay(c, xd);
+			delete_xattr_datum(c, xd);
 	} else if (ref) {
-		up_write(&c->xattr_sem);
-		jffs2_complete_reservation(c);
-
-		rc = jffs2_reserve_space(c, request, &length,
-					 ALLOC_DELETION, JFFS2_SUMMARY_XREF_SIZE);
-		down_write(&c->xattr_sem);
-		if (rc) {
-			JFFS2_WARNING("jffs2_reserve_space()=%d, request=%u\n", rc, request);
-			delete_xattr_ref_delay(c, ref);
-			up_write(&c->xattr_sem);
-			return 0;
-		}
-		delete_xattr_ref(c, ref, 1);
+		delete_xattr_ref(c, ref);
 	}
  out:
 	up_write(&c->xattr_sem);
@@ -1292,6 +1191,10 @@ int do_jffs2_setxattr(struct inode *inod
  *   is used to move xref into new node.
  * jffs2_verify_xattr(c)
  *   is used to call do_verify_xattr_datum() before garbage collecting.
+ * jffs2_release_xattr_datum(c, xd)
+ *   is used to release an in-memory object of xdatum.
+ * jffs2_release_xattr_ref(c, ref)
+ *   is used to release an in-memory object of xref.
  * -------------------------------------------------- */
 int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd,
 				      struct jffs2_raw_node_ref *raw)
@@ -1302,18 +1205,17 @@ int jffs2_garbage_collect_xattr_datum(st
 	down_write(&c->xattr_sem);
 	if (xd->node != raw)
 		goto out;
-	if (is_xattr_datum_dead(xd) && (raw->next_in_ino == (void *)xd))
+	if (xd->flags & (JFFS2_XFLAGS_DEAD|JFFS2_XFLAGS_INVALID))
 		goto out;
 
-	old_ofs = ref_offset(xd->node);
-	totlen = ref_totlen(c, c->gcblock, xd->node);
-
-	if (!is_xattr_datum_dead(xd)) {
-		rc = load_xattr_datum(c, xd);
-		if (unlikely(rc < 0))
-			goto out;
+	rc = load_xattr_datum(c, xd);
+	if (unlikely(rc)) {
+		rc = (rc > 0) ? 0 : rc;
+		goto out;
 	}
-
+	old_ofs = ref_offset(xd->node);
+	totlen = PAD(sizeof(struct jffs2_raw_xattr)
+			+ xd->name_len + 1 + xd->value_len);
 	rc = jffs2_reserve_space_gc(c, totlen, &length, JFFS2_SUMMARY_XATTR_SIZE);
 	if (rc) {
 		JFFS2_WARNING("jffs2_reserve_space_gc()=%d, request=%u\n", rc, totlen);
@@ -1331,7 +1233,6 @@ int jffs2_garbage_collect_xattr_datum(st
 	return rc;
 }
 
-
 int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref,
 				    struct jffs2_raw_node_ref *raw)
 {
@@ -1392,7 +1293,7 @@ int jffs2_verify_xattr(struct jffs2_sb_i
 			raw->flash_offset = ref_offset(raw)
 				| ((xd->node == (void *)raw) ? REF_PRISTINE : REF_NORMAL);
 		}
-		if (is_xattr_datum_dead(xd))
+		if (xd->flags & JFFS2_XFLAGS_DEAD)
 			list_add(&xd->xindex, &c->xattr_dead_list);
 		spin_unlock(&c->erase_completion_lock);
 	}
@@ -1403,7 +1304,7 @@ int jffs2_verify_xattr(struct jffs2_sb_i
 void jffs2_release_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
 {
 	/* must be called under spin_lock(&c->erase_completion_lock) */
-	if (xd->node != (void *)xd)
+	if (xd->refcnt > 0 || xd->node != (void *)xd)
 		return;
 
 	list_del(&xd->xindex);
@@ -1421,8 +1322,8 @@ void jffs2_release_xattr_ref(struct jffs
 	for (tmp=c->xref_dead_list, ptmp=&c->xref_dead_list; tmp; ptmp=&tmp->next, tmp=tmp->next) {
 		if (ref == tmp) {
 			*ptmp = tmp->next;
-			jffs2_free_xattr_ref(ref);
 			break;
 		}
 	}
+	jffs2_free_xattr_ref(ref);
 }
diff --git a/fs/jffs2/xattr.h b/fs/jffs2/xattr.h
index 06ab7b8..4a10abc 100644
--- a/fs/jffs2/xattr.h
+++ b/fs/jffs2/xattr.h
@@ -16,6 +16,7 @@ #include <linux/list.h>
 
 #define JFFS2_XFLAGS_HOT	(0x01)	/* This datum is HOT */
 #define JFFS2_XFLAGS_BIND	(0x02)	/* This datum is not reclaimed */
+#define JFFS2_XFLAGS_DEAD	(0x40)	/* This datum is already dead */
 #define JFFS2_XFLAGS_INVALID	(0x80)	/* This datum contains crc error */
 
 struct jffs2_xattr_datum
@@ -60,34 +61,12 @@ struct jffs2_xattr_ref
 	struct jffs2_xattr_ref *next;		/* chained from ic->xref_list */
 };
 
-#define XDATUM_DELETE_MARKER	(0xffffffff)
 #define XREF_DELETE_MARKER	(0x00000001)
-static inline int is_xattr_datum_dead(struct jffs2_xattr_datum *xd)
-{
-	return (xd->version == XDATUM_DELETE_MARKER);
-}
-
-static inline void set_xattr_datum_dead(struct jffs2_xattr_datum *xd)
-{
-	xd->version = XDATUM_DELETE_MARKER;
-}
-
 static inline int is_xattr_ref_dead(struct jffs2_xattr_ref *ref)
 {
 	return ((ref->xseqno & XREF_DELETE_MARKER) != 0);
 }
 
-static inline void set_xattr_ref_dead(struct jffs2_xattr_ref *ref)
-{
-	ref->xseqno |= XREF_DELETE_MARKER;
-}
-
-static inline void clr_xattr_ref_dead(struct jffs2_xattr_ref *ref)
-{
-	ref->xseqno &= ~XREF_DELETE_MARKER;
-}
-
-
 #ifdef CONFIG_JFFS2_FS_XATTR
 
 extern void jffs2_init_xattr_subsystem(struct jffs2_sb_info *c);

--------------020700050608050903040608
Content-Type: text/plain;
	name="jffs2-xattr-v6.1-02-fix-memory-leak-jffs2_xattr_ref.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="jffs2-xattr-v6.1-02-fix-memory-leak-jffs2_xattr_ref.patch"

diff-tree d4b20cb8ea783807606c403afbf1d6e9614f3b9e (from 00c6cf2b8998389c8c04a5585b54902227ceb528)
Author: KaiGai Kohei <kaigai@ak.jp.nec.com>
Date:   Fri Jun 23 22:53:27 2006 +0900

    [JFFS2][XATTR] Fix memory leak with jffs2_xattr_ref
    
    If xattr_ref is associated with an orphan inode_cache
    on filesystem mounting, those xattr_refs are not
    released even if this inode_cache is released.
    
    This patch enables to call jffs2_xattr_delete_inode()
    for such a irregular inode_cachde too.
    
    Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 7b6c24b..e8e52db 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -227,8 +227,6 @@ void jffs2_clear_inode (struct inode *in
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 
 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
-
-	jffs2_xattr_delete_inode(c, f->inocache);
 	jffs2_do_clear_inode(c, f);
 }
 
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index f59b147..daff334 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -165,6 +165,7 @@ int jffs2_garbage_collect_pass(struct jf
 			D1(printk(KERN_DEBUG "Skipping check of ino #%d with nlink zero\n",
 				  ic->ino));
 			spin_unlock(&c->inocache_lock);
+			jffs2_xattr_delete_inode(c, ic);
 			continue;
 		}
 		switch(ic->state) {
diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 927dfe4..7675b33 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -906,6 +906,9 @@ void jffs2_del_ino_cache(struct jffs2_sb
 {
 	struct jffs2_inode_cache **prev;
 
+#ifdef CONFIG_JFFS2_FS_XATTR
+	BUG_ON(old->xref);
+#endif
 	dbg_inocache("del %p (ino #%u)\n", old, old->ino);
 	spin_lock(&c->inocache_lock);
 
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index e1acce8..7f64578 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -939,6 +939,7 @@ void jffs2_do_clear_inode(struct jffs2_s
 	struct jffs2_full_dirent *fd, *fds;
 	int deleted;
 
+	jffs2_xattr_delete_inode(c, f->inocache);
 	down(&f->sem);
 	deleted = f->inocache && !f->inocache->nlink;
 

--------------020700050608050903040608
Content-Type: text/plain;
	name="jffs2-xattr-v6.1-03-redefine-refcnt-as-atomic_t.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="jffs2-xattr-v6.1-03-redefine-refcnt-as-atomic_t.patch"

diff-tree 09ed2f92a606bf4db09e293c8112c2a0628656b1 (from d4b20cb8ea783807606c403afbf1d6e9614f3b9e)
Author: KaiGai Kohei <kaigai@ak.jp.nec.com>
Date:   Fri Jun 23 22:58:43 2006 +0900

    [JFFS2][XATTR] Re-define xd->refcnt as atomic_t
    
    In jffs2_release_xattr_datum(), it refers xd->refcnt to ensure
    whether releasing xd is allowed or not.
    But we can't hold xattr_sem since this function is called under
    spin_lock(&c->erase_completion_lock). Thus we have to refer it
    without any locking.
    
    This patch redefine xd->refcnt as atomic_t. It enables to refer
    xd->refcnt without any locking.
    
    Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 7622f79..18e66db 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -345,7 +345,7 @@ static struct jffs2_xattr_datum *create_
 		    && xd->value_len==xsize
 		    && !strcmp(xd->xname, xname)
 		    && !memcmp(xd->xvalue, xvalue, xsize)) {
-			xd->refcnt++;
+			atomic_inc(&xd->refcnt);
 			return xd;
 		}
 	}
@@ -365,7 +365,7 @@ static struct jffs2_xattr_datum *create_
 	strcpy(data, xname);
 	memcpy(data + name_len + 1, xvalue, xsize);
 
-	xd->refcnt = 1;
+	atomic_set(&xd->refcnt, 1);
 	xd->xid = ++c->highest_xid;
 	xd->flags |= JFFS2_XFLAGS_HOT;
 	xd->xprefix = xprefix;
@@ -397,7 +397,7 @@ static struct jffs2_xattr_datum *create_
 static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
 {
 	/* must be called under down_write(xattr_sem) */
-	BUG_ON(xd->refcnt);
+	BUG_ON(atomic_read(&xd->refcnt));
 
 	unload_xattr_datum(c, xd);
 	xd->flags |= JFFS2_XFLAGS_DEAD;
@@ -580,7 +580,7 @@ static void delete_xattr_ref(struct jffs
 	dbg_xattr("xref(ino=%u, xid=%u, xseqno=%u) was removed.\n",
 		  ref->ino, ref->xid, ref->xseqno);
 
-	if (!--xd->refcnt)
+	if (atomic_dec_and_test(&xd->refcnt))
 		delete_xattr_datum(c, xd);
 }
 
@@ -612,8 +612,7 @@ void jffs2_xattr_free_inode(struct jffs2
 	for (ref = ic->xref; ref; ref = _ref) {
 		_ref = ref->next;
 		xd = ref->xd;
-		xd->refcnt--;
-		if (!xd->refcnt) {
+		if (atomic_dec_and_test(&xd->refcnt)) {
 			unload_xattr_datum(c, xd);
 			jffs2_free_xattr_datum(xd);
 		}
@@ -835,7 +834,7 @@ void jffs2_build_xattr_subsystem(struct 
 			}
 			ref->xd = xd;
 			ref->ic = ic;
-			xd->refcnt++;
+			atomic_inc(&xd->refcnt);
 			ref->next = ic->xref;
 			ic->xref = ref;
 		}
@@ -846,7 +845,7 @@ void jffs2_build_xattr_subsystem(struct 
 		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
 			xdatum_count++;
 			list_del_init(&xd->xindex);
-			if (!xd->refcnt) {
+			if (!atomic_read(&xd->refcnt)) {
 				dbg_xattr("xdatum(xid=%u, version=%u) is orphan.\n",
 					  xd->xid, xd->version);
 				xd->flags |= JFFS2_XFLAGS_DEAD;
@@ -1120,7 +1119,7 @@ int do_jffs2_setxattr(struct inode *inod
 					ref->next = c->xref_dead_list;
 					c->xref_dead_list = ref;
 					spin_unlock(&c->erase_completion_lock);
-					if (!--xd->refcnt)
+					if (atomic_dec_and_test(&xd->refcnt))
 						delete_xattr_datum(c, xd);
 				} else {
 					ref->ic = ic;
@@ -1157,8 +1156,7 @@ int do_jffs2_setxattr(struct inode *inod
 	down_write(&c->xattr_sem);
 	if (rc) {
 		JFFS2_WARNING("jffs2_reserve_space()=%d, request=%u\n", rc, request);
-		xd->refcnt--;
-		if (!xd->refcnt)
+		if (atomic_dec_and_test(&xd->refcnt))
 			delete_xattr_datum(c, xd);
 		up_write(&c->xattr_sem);
 		return rc;
@@ -1172,8 +1170,7 @@ int do_jffs2_setxattr(struct inode *inod
 			ic->xref = ref;
 		}
 		rc = PTR_ERR(newref);
-		xd->refcnt--;
-		if (!xd->refcnt)
+		if (atomic_dec_and_test(&xd->refcnt))
 			delete_xattr_datum(c, xd);
 	} else if (ref) {
 		delete_xattr_ref(c, ref);
@@ -1304,7 +1301,7 @@ int jffs2_verify_xattr(struct jffs2_sb_i
 void jffs2_release_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
 {
 	/* must be called under spin_lock(&c->erase_completion_lock) */
-	if (xd->refcnt > 0 || xd->node != (void *)xd)
+	if (atomic_read(&xd->refcnt) || xd->node != (void *)xd)
 		return;
 
 	list_del(&xd->xindex);
diff --git a/fs/jffs2/xattr.h b/fs/jffs2/xattr.h
index 4a10abc..06a5c69 100644
--- a/fs/jffs2/xattr.h
+++ b/fs/jffs2/xattr.h
@@ -28,7 +28,7 @@ struct jffs2_xattr_datum
 	uint16_t xprefix;		/* see JFFS2_XATTR_PREFIX_* */
 
 	struct list_head xindex;	/* chained from c->xattrindex[n] */
-	uint32_t refcnt;		/* # of xattr_ref refers this */
+	atomic_t refcnt;		/* # of xattr_ref refers this */
 	uint32_t xid;
 	uint32_t version;
 

--------------020700050608050903040608
Content-Type: text/plain;
 name="jffs2-xattr-v6.1-04-fix-copyright.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="jffs2-xattr-v6.1-04-fix-copyright.patch"

diff-tree d0fac87b3d2a9fd5c265f6077fc2f6b3b4672f82 (from 09ed2f92a606bf4db09e293c8112c2a0628656b1)
Author: KaiGai Kohei <kaigai@ak.jp.nec.com>
Date:   Fri Jun 23 23:00:19 2006 +0900

    [JFFS2][XATTR] Fix wrong copyrigh.
    
    summary.c was modified at 2006.
    
    Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index d60784a..4c8f381 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -5,7 +5,7 @@
  *                     Zoltan Sogor <weth@inf.u-szeged.hu>,
  *                     Patrik Kluba <pajko@halom.u-szeged.hu>,
  *                     University of Szeged, Hungary
- *               2005  KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *               2006  KaiGai Kohei <kaigai@ak.jp.nec.com>
  *
  * For licensing information, see the file 'LICENCE' in this directory.
  *

--------------020700050608050903040608
Content-Type: text/plain;
	name="jffs2-xattr-v6.1-05-coexistence-between-xattr-and-write-buffering.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="jffs2-xattr-v6.1-05-coexistence-between-xattr-and-write-buffering.patch"

diff-tree c3c4bdbb068b0cf93951ca71261bf4aa8e3fa830 (from 486b70a7e4298b53aa3046b8574a1e431e4143ba)
Author: KaiGai Kohei <kaigai@ak.jp.nec.com>
Date:   Fri Jun 23 23:10:44 2006 +0900

    [JFFS2][XATTR] coexistence between xattr and write buffering support.
    
    Drop '&& !JFFS2_FS_WRITEBUFFER' from fs/Kconfig.
    The series of previous patches enables to use those
    functionality at same time.
    
    Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

diff --git a/fs/Kconfig b/fs/Kconfig
index 20f9b55..e2643ee 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -1115,7 +1115,7 @@ config JFFS2_SUMMARY
 
 config JFFS2_FS_XATTR
 	bool "JFFS2 XATTR support (EXPERIMENTAL)"
-	depends on JFFS2_FS && EXPERIMENTAL && !JFFS2_FS_WRITEBUFFER
+	depends on JFFS2_FS && EXPERIMENTAL
 	default n
 	help
 	  Extended attributes are name:value pairs associated with inodes by

--------------020700050608050903040608--
