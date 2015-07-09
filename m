Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD254-0004p9-BA
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 03:00:59 +0000
Received: by igau2 with SMTP id u2so79146073iga.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 20:00:37 -0700 (PDT)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] jffs2:Make the function jffs2_scan_dirty_space void
Date: Wed,  8 Jul 2015 23:00:31 -0400
Message-Id: <1436410831-29257-3-git-send-email-xerofoify@gmail.com>
In-Reply-To: <1436410831-29257-1-git-send-email-xerofoify@gmail.com>
References: <1436410831-29257-1-git-send-email-xerofoify@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This makes the function jffs2_scan_dirty_space have a return type of
void now due to this function only ever returning the kernel value
for success of zero and never signalling its caller with a error
code due to this function always running successfully.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 fs/jffs2/nodelist.c | 6 ++----
 fs/jffs2/nodelist.h | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index 9a5449b..c6f8d82 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -659,11 +659,11 @@ struct jffs2_raw_node_ref *jffs2_link_node_ref(struct jffs2_sb_info *c,
 }
 
 /* No locking, no reservation of 'ref'. Do not use on a live file system */
-int jffs2_scan_dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+void jffs2_scan_dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 			   uint32_t size)
 {
 	if (!size)
-		return 0;
+		return;
 	if (unlikely(size > jeb->free_size)) {
 		pr_crit("Dirty space 0x%x larger then free_size 0x%x (wasted 0x%x)\n",
 			size, jeb->free_size, jeb->wasted_size);
@@ -684,8 +684,6 @@ int jffs2_scan_dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 
 		jffs2_link_node_ref(c, jeb, ofs, size, NULL);
 	}
-
-	return 0;
 }
 
 /* Calculate totlen from surrounding nodes or eraseblock */
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index fa35ff7..bba3614 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -458,7 +458,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c);
 void jffs2_rotate_lists(struct jffs2_sb_info *c);
 struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct jffs2_sb_info *c, uint32_t ino);
 int jffs2_scan_classify_jeb(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
-int jffs2_scan_dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t size);
+void jffs2_scan_dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t size);
 
 /* build.c */
 int jffs2_do_mount_fs(struct jffs2_sb_info *c);
-- 
2.1.4
