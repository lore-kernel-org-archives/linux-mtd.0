Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY9uA-0006ru-U9
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 13:22:56 +0000
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
CC: <richard.weinberger@gmail.com>, <boris.brezillon@bootlin.com>,
 <dwmw2@infradead.org>
Subject: [PATCH v2] jffs2: fix invocations of dbg_xattr() for dead
 jffs2_xattr_ref
Date: Sat, 15 Dec 2018 21:25:47 +0800
Message-ID: <20181215132547.27405-1-houtao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When jffs2_xattr_ref is dead, xref->ic or xref->xd will be invalid
because these fields will be reused as xref->ino or xref->xid,
so access xref->ic->ino or xref->xd->xid will lead to oops.

Fix the problem by using two new helper functions to get ino or xid
in xref and checking whether the xref is dead or not in these helpers.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
v2:
  * fix the alignment during line wrapping
  * add two new helper functions to access ino or xid in xref
---
 fs/jffs2/xattr.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index da3e18503c65..e21a1677ad75 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -25,6 +25,17 @@
 #include <linux/posix_acl_xattr.h>
 #include <linux/mtd/mtd.h>
 #include "nodelist.h"
+
+static inline uint32_t xattr_ref_ino(struct jffs2_xattr_ref *ref)
+{
+	return is_xattr_ref_dead(ref) ? ref->ino : ref->ic->ino;
+}
+
+static inline uint32_t xattr_ref_xid(struct jffs2_xattr_ref *ref)
+{
+	return is_xattr_ref_dead(ref) ? ref->xid : ref->xd->xid;
+}
+
 /* -------- xdatum related functions ----------------
  * xattr_datum_hashkey(xprefix, xname, xvalue, xsize)
  *   is used to calcurate xdatum hashkey. The reminder of hashkey into XATTRINDEX_HASHSIZE is
@@ -542,7 +553,8 @@ static int save_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
 	ref->xseqno = xseqno;
 	jffs2_add_physical_node_ref(c, phys_ofs | REF_PRISTINE, PAD(sizeof(rr)), (void *)ref);
 
-	dbg_xattr("success on saving xref (ino=%u, xid=%u)\n", ref->ic->ino, ref->xd->xid);
+	dbg_xattr("success on saving xref (ino=%u, xid=%u)\n",
+		  xattr_ref_ino(ref), xattr_ref_xid(ref));
 
 	return 0;
 }
@@ -1278,7 +1290,8 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
 	rc = save_xattr_ref(c, ref);
 	if (!rc)
 		dbg_xattr("xref (ino=%u, xid=%u) GC'ed from %#08x to %08x\n",
-			  ref->ic->ino, ref->xd->xid, old_ofs, ref_offset(ref->node));
+			  xattr_ref_ino(ref), xattr_ref_xid(ref),
+			  old_ofs, ref_offset(ref->node));
  out:
 	if (!rc)
 		jffs2_mark_node_obsolete(c, raw);
-- 
2.16.2.dirty
