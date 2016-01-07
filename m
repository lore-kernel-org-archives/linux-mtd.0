Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHFyQ-0000cf-Ps
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 19:11:51 +0000
Received: by mail-pa0-x235.google.com with SMTP id yy13so172976119pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 11:11:29 -0800 (PST)
From: tim.gardner@canonical.com
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tim Gardner <tim.gardner@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v4.4-rc8] jffs2: xattr: Silence frame size warning
Date: Thu,  7 Jan 2016 12:11:08 -0700
Message-Id: <1452193868-15816-1-git-send-email-tim.gardner@canonical.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Tim Gardner <tim.gardner@canonical.com>

fs/jffs2/xattr.c: In function 'jffs2_build_xattr_subsystem':
fs/jffs2/xattr.c:887:1: warning: the frame size of 1128 bytes is larger than 1024 bytes [-Wframe-larger-than=]
 }

gcc version 5.3.1 20151219 (Ubuntu 5.3.1-4ubuntu1)

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 fs/jffs2/xattr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 4c2c036..160ddcd 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -775,7 +775,7 @@ void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c)
 void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
 {
 	struct jffs2_xattr_ref *ref, *_ref;
-	struct jffs2_xattr_ref *xref_tmphash[XREF_TMPHASH_SIZE];
+	struct jffs2_xattr_ref **xref_tmphash;
 	struct jffs2_xattr_datum *xd, *_xd;
 	struct jffs2_inode_cache *ic;
 	struct jffs2_raw_node_ref *raw;
@@ -784,9 +784,14 @@ void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
 
 	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
 
+	xref_tmphash = kcalloc(XREF_TMPHASH_SIZE, sizeof(*xref_tmphash),
+		GFP_KERNEL);
+	if (!xref_tmphash) {
+		JFFS2_WARNING("kcalloc failure\n");
+		return;
+	}
+
 	/* Phase.1 : Merge same xref */
-	for (i=0; i < XREF_TMPHASH_SIZE; i++)
-		xref_tmphash[i] = NULL;
 	for (ref=c->xref_temp; ref; ref=_ref) {
 		struct jffs2_xattr_ref *tmp;
 
@@ -884,6 +889,7 @@ void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
 		     "%u of xref (%u dead, %u orphan) found.\n",
 		     xdatum_count, xdatum_unchecked_count, xdatum_orphan_count,
 		     xref_count, xref_dead_count, xref_orphan_count);
+	kfree(xref_tmphash);
 }
 
 struct jffs2_xattr_datum *jffs2_setup_xattr_datum(struct jffs2_sb_info *c,
-- 
1.9.1
