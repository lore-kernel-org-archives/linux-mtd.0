From: DGE@sixnetio.com (Dave Ellis)
Date: Mon, 24 Feb 2003 13:46:45 -0500
Subject: [PATCH] fix jffs2_get_ino_cache()
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E4BE@NT>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch fixes a kernel oops that happens when a negative
inode number is passed to jffs2_get_ino_cache(). The ino
parameter should be uint32_t, not int since inodes are unsigned.

If the value passed is negative (when viewed as signed) the
cache index is calculated as negative (at least on PowerPC
and x86) and the invalid index causes a kernel oops. I am seeing
this when trying to mount a NAND flash with the header of
an inode node at the last 12 bytes of a page. The following
page with the inode data is still erased, so the inode passed
to jffs2_get_ino_cache is 0xffffffff, which is seen as -1.

When mounting only the crc for the header is checked before
calling jffs2_get_ino_cache(), so the bad inode data is not
detected.

Dave Ellis
<dge@sixnetio.com>

diff -Naur orig/nodelist.c patch/nodelist.c
--- orig/nodelist.c	Mon Feb 24 09:58:07 2003
+++ patch/nodelist.c	Mon Feb 24 13:11:26 2003
@@ -450,7 +450,7 @@
    Rather than introducing special case get_ino_cache functions or 
    callbacks, we just let the caller do the locking itself. */
    
-struct jffs2_inode_cache *jffs2_get_ino_cache(struct jffs2_sb_info *c, int
ino)
+struct jffs2_inode_cache *jffs2_get_ino_cache(struct jffs2_sb_info *c,
uint32_t ino)
 {
 	struct jffs2_inode_cache *ret;
 
diff -Naur orig/nodelist.h patch/nodelist.h
--- orig/nodelist.h	Mon Feb 24 09:58:07 2003
+++ patch/nodelist.h	Mon Feb 24 13:11:56 2003
@@ -292,7 +292,7 @@
 			  uint32_t *highest_version, uint32_t
*latest_mctime,
 			  uint32_t *mctime_ver);
 void jffs2_set_inocache_state(struct jffs2_sb_info *c, struct
jffs2_inode_cache *ic, int state);
-struct jffs2_inode_cache *jffs2_get_ino_cache(struct jffs2_sb_info *c, int
ino);
+struct jffs2_inode_cache *jffs2_get_ino_cache(struct jffs2_sb_info *c,
uint32_t ino);
 void jffs2_add_ino_cache (struct jffs2_sb_info *c, struct jffs2_inode_cache
*new);
 void jffs2_del_ino_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache
*old);
 void jffs2_free_ino_caches(struct jffs2_sb_info *c);
