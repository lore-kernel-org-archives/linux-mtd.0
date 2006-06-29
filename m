Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fvpbu-000174-QH
	for linux-mtd@lists.infradead.org; Thu, 29 Jun 2006 02:02:51 -0400
Message-ID: <44A36CF6.6010204@ak.jp.nec.com>
Date: Thu, 29 Jun 2006 15:02:30 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2/xattr problems.
References: <1148150486.3875.251.camel@pmac.infradead.org>	<44704CA9.8010604@ak.jp.nec.com>	<448CCEC8.2080903@ak.jp.nec.com>	<1150099418.11159.44.camel@shinybook.infradead.org>	<448D3752.3090605@ak.jp.nec.com>	<1150105995.8184.17.camel@pmac.infradead.org>	<448EBDE2.7090408@kaigai.gr.jp>	<449CD47E.6010002@ak.jp.nec.com>	<1151336716.6394.169.camel@pmac.infradead.org>
	<44A09B53.80908@ak.jp.nec.com>
In-Reply-To: <44A09B53.80908@ak.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------090201040900060600060000"
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
--------------090201040900060600060000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> But I noticed this patch has another problem last night.
> In delete_xattr_ref(), we don't hold c->erase_completion_lock before
> atomic_dec_and_test(), so there is a possibility to release
> a xattr_datum twice.
> I think atomic_dec_and_lock() should be used in delete_xattr_datum().
> If so, we can release it safely with minimum locking pain.
> This behavior may be correct. Please wait a fix.

* jffs2-xattr-v6.2-01-fix-xd_refcnt-race-condition.patch

   Signed-off-by: KaiGai Kohei <kaigai@ak.jp.nec.com>

The attached patch resolves this problem.
When xd->refcnt is checked whether this xdatum should be released
or not, atomic_dec_and_lock() is used to ensure holding the
c->erase_completion_lock.

This fix change a specification of delete_xattr_datum().
Previously, it's only called when xd->refcnt equals zero.
(calling it with positive xd->refcnt cause a BUG())
If you applied this patch, the function checks whether
xd->refcnt is zero or not under the spinlock if necessary.
Then, it marks xd DEAD flahs and links with xattr_dead_list
or releases it immediately when xd->refcnt become zero.

I think it's not appropriate to call this behavior 'delete'.
Thus, I changed the function name 'unrefer_xattr_datum'.
Isn't it superfluous modify?

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------090201040900060600060000
Content-Type: text/plain;
	name="jffs2-xattr-v6.2-01-fix-xd_refcnt-race-condition.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="jffs2-xattr-v6.2-01-fix-xd_refcnt-race-condition.patch"

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 18e66db..25bc1ae 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -50,9 +50,10 @@ #include "nodelist.h"
  *   is used to write xdatum to medium. xd->version will be incremented.
  * create_xattr_datum(c, xprefix, xname, xvalue, xsize)
  *   is used to create new xdatum and write to medium.
- * delete_xattr_datum(c, xd)
- *   is used to delete a xdatum. It marks xd JFFS2_XFLAGS_DEAD, and allows
- *   GC to reclaim those physical nodes.
+ * unrefer_xattr_datum(c, xd)
+ *   is used to delete a xdatum. When nobody refers this xdatum, JFFS2_XFLAGS_DEAD
+ *   is set on xd->flags and chained xattr_dead_list or release it immediately.
+ *   In the first case, the garbage collector release it later.
  * -------------------------------------------------- */
 static uint32_t xattr_datum_hashkey(int xprefix, const char *xname, const char *xvalue, int xsize)
 {
@@ -394,22 +395,24 @@ static struct jffs2_xattr_datum *create_
 	return xd;
 }
 
-static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+static void unrefer_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
 {
 	/* must be called under down_write(xattr_sem) */
-	BUG_ON(atomic_read(&xd->refcnt));
+	if (atomic_dec_and_lock(&xd->refcnt, &c->erase_completion_lock)) {
+		uint32_t xid = xd->xid, version = xd->version;
 
-	unload_xattr_datum(c, xd);
-	xd->flags |= JFFS2_XFLAGS_DEAD;
-	spin_lock(&c->erase_completion_lock);
-	if (xd->node == (void *)xd) {
-		BUG_ON(!(xd->flags & JFFS2_XFLAGS_INVALID));
-		jffs2_free_xattr_datum(xd);
-	} else {
-		list_add(&xd->xindex, &c->xattr_dead_list);
+		unload_xattr_datum(c, xd);
+		xd->flags |= JFFS2_XFLAGS_DEAD;
+		if (xd->node == (void *)xd) {
+			BUG_ON(!(xd->flags & JFFS2_XFLAGS_INVALID));
+			jffs2_free_xattr_datum(xd);
+		} else {
+			list_add(&xd->xindex, &c->xattr_dead_list);
+		}
+		spin_unlock(&c->erase_completion_lock);
+
+		dbg_xattr("xdatum(xid=%u, version=%u) was removed.\n", xid, version);
 	}
-	spin_unlock(&c->erase_completion_lock);
-	dbg_xattr("xdatum(xid=%u, version=%u) was removed.\n", xd->xid, xd->version);
 }
 
 /* -------- xref related functions ------------------
@@ -580,8 +583,7 @@ static void delete_xattr_ref(struct jffs
 	dbg_xattr("xref(ino=%u, xid=%u, xseqno=%u) was removed.\n",
 		  ref->ino, ref->xid, ref->xseqno);
 
-	if (atomic_dec_and_test(&xd->refcnt))
-		delete_xattr_datum(c, xd);
+	unrefer_xattr_datum(c, xd);
 }
 
 void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
@@ -1119,8 +1121,7 @@ int do_jffs2_setxattr(struct inode *inod
 					ref->next = c->xref_dead_list;
 					c->xref_dead_list = ref;
 					spin_unlock(&c->erase_completion_lock);
-					if (atomic_dec_and_test(&xd->refcnt))
-						delete_xattr_datum(c, xd);
+					unrefer_xattr_datum(c, xd);
 				} else {
 					ref->ic = ic;
 					ref->xd = xd;
@@ -1156,8 +1157,7 @@ int do_jffs2_setxattr(struct inode *inod
 	down_write(&c->xattr_sem);
 	if (rc) {
 		JFFS2_WARNING("jffs2_reserve_space()=%d, request=%u\n", rc, request);
-		if (atomic_dec_and_test(&xd->refcnt))
-			delete_xattr_datum(c, xd);
+		unrefer_xattr_datum(c, xd);
 		up_write(&c->xattr_sem);
 		return rc;
 	}
@@ -1170,8 +1170,7 @@ int do_jffs2_setxattr(struct inode *inod
 			ic->xref = ref;
 		}
 		rc = PTR_ERR(newref);
-		if (atomic_dec_and_test(&xd->refcnt))
-			delete_xattr_datum(c, xd);
+		unrefer_xattr_datum(c, xd);
 	} else if (ref) {
 		delete_xattr_ref(c, ref);
 	}

--------------090201040900060600060000--
