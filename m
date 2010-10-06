Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3b6S-0002Sy-Bp
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2010 21:00:45 +0000
Received: from aamtaout01-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout02-winn.ispmail.ntl.com
	(InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
	<20101006210038.ZUHT7723.mtaout02-winn.ispmail.ntl.com@aamtaout01-winn.ispmail.ntl.com>
	for <linux-mtd@lists.infradead.org>; Wed, 6 Oct 2010 22:00:38 +0100
Received: from zog.reactivated.net ([86.14.215.141])
	by aamtaout01-winn.ispmail.ntl.com
	(InterMail vG.3.00.04.00 201-2196-133-20080908) with ESMTP id
	<20101006210038.ZDFG16999.aamtaout01-winn.ispmail.ntl.com@zog.reactivated.net>
	for <linux-mtd@lists.infradead.org>; Wed, 6 Oct 2010 22:00:38 +0100
From: Daniel Drake <dsd@laptop.org>
To: linux-mtd@lists.infradead.org
Subject: [doesn't work] JFFS2: Dynamically choose inocache hash size
Message-Id: <20101006210036.92C229D401B@zog.reactivated.net>
Date: Wed,  6 Oct 2010 22:00:36 +0100 (BST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to upstream an old OLPC patch which greatly speeds up mounting
of large jffs2 volumes.
Took a stab at a suggestion from David (shown here) but it crashes badly.
Causes lots of WARNINGs to be triggered from __mark_inode_dirty.

I'm not going to spend any more time on this for the time being,
just archiving the patch here, just in case someone has interest in
finishing it off.



When JFFS2 is used for large volumes, the mount times are quite long.
Increasing the hash size provides a significant speed boost on the OLPC
XO-1 laptop.

Add logic that dynamically selects a hash size based on the size of
the medium. A 64mb medium will result in a hash size of 128, and a 512mb
medium will result in a hash size of 1024.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 fs/jffs2/build.c       |    2 +-
 fs/jffs2/fs.c          |   22 +++++++++++++++++++++-
 fs/jffs2/jffs2_fs_sb.h |    1 +
 fs/jffs2/nodelist.c    |    8 ++++----
 fs/jffs2/nodelist.h    |    3 ++-
 5 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index a906f53..85c6be2 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -23,7 +23,7 @@ static void jffs2_build_remove_unlinked_inode(struct jffs2_sb_info *,
 static inline struct jffs2_inode_cache *
 first_inode_chain(int *i, struct jffs2_sb_info *c)
 {
-	for (; *i < INOCACHE_HASHSIZE; (*i)++) {
+	for (; *i < c->inocache_hashsize; (*i)++) {
 		if (c->inocache_list[*i])
 			return c->inocache_list[*i];
 	}
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 6b2964a..2701b37 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -478,6 +478,25 @@ struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_i
 	return inode;
 }
 
+static int calculate_inocache_hashsize(uint32_t flash_size)
+{
+	/*
+	 * Pick a inocache hash size based on the size of the medium.
+	 * Count how many megabytes we're dealing with, apply a hashsize twice
+	 * that size, but rounding down to the usual big powers of 2. And keep
+	 * to sensible bounds.
+	 */
+
+	int size_mb = flash_size / 1024 / 1024;
+	int hashsize = (size_mb * 2) & ~0x3f;
+
+	if (hashsize < INOCACHE_HASHSIZE_MIN)
+		return INOCACHE_HASHSIZE_MIN;
+	if (hashsize > INOCACHE_HASHSIZE_MAX)
+		return INOCACHE_HASHSIZE_MAX;
+
+	return hashsize;
+}
 
 int jffs2_do_fill_super(struct super_block *sb, void *data, int silent)
 {
@@ -524,7 +543,8 @@ int jffs2_do_fill_super(struct super_block *sb, void *data, int silent)
 	if (ret)
 		return ret;
 
-	c->inocache_list = kcalloc(INOCACHE_HASHSIZE, sizeof(struct jffs2_inode_cache *), GFP_KERNEL);
+	c->inocache_hashsize = calculate_inocache_hashsize(c->flash_size);
+	c->inocache_list = kcalloc(c->inocache_hashsize, sizeof(struct jffs2_inode_cache *), GFP_KERNEL);
 	if (!c->inocache_list) {
 		ret = -ENOMEM;
 		goto out_wbuf;
diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 6784bc8..f864005 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -100,6 +100,7 @@ struct jffs2_sb_info {
 	wait_queue_head_t erase_wait;		/* For waiting for erases to complete */
 
 	wait_queue_head_t inocache_wq;
+	int inocache_hashsize;
 	struct jffs2_inode_cache **inocache_list;
 	spinlock_t inocache_lock;
 
diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index af02bd1..5e03233 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -420,7 +420,7 @@ struct jffs2_inode_cache *jffs2_get_ino_cache(struct jffs2_sb_info *c, uint32_t
 {
 	struct jffs2_inode_cache *ret;
 
-	ret = c->inocache_list[ino % INOCACHE_HASHSIZE];
+	ret = c->inocache_list[ino % c->inocache_hashsize];
 	while (ret && ret->ino < ino) {
 		ret = ret->next;
 	}
@@ -441,7 +441,7 @@ void jffs2_add_ino_cache (struct jffs2_sb_info *c, struct jffs2_inode_cache *new
 
 	dbg_inocache("add %p (ino #%u)\n", new, new->ino);
 
-	prev = &c->inocache_list[new->ino % INOCACHE_HASHSIZE];
+	prev = &c->inocache_list[new->ino % c->inocache_hashsize];
 
 	while ((*prev) && (*prev)->ino < new->ino) {
 		prev = &(*prev)->next;
@@ -462,7 +462,7 @@ void jffs2_del_ino_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *old)
 	dbg_inocache("del %p (ino #%u)\n", old, old->ino);
 	spin_lock(&c->inocache_lock);
 
-	prev = &c->inocache_list[old->ino % INOCACHE_HASHSIZE];
+	prev = &c->inocache_list[old->ino % c->inocache_hashsize];
 
 	while ((*prev) && (*prev)->ino < old->ino) {
 		prev = &(*prev)->next;
@@ -487,7 +487,7 @@ void jffs2_free_ino_caches(struct jffs2_sb_info *c)
 	int i;
 	struct jffs2_inode_cache *this, *next;
 
-	for (i=0; i<INOCACHE_HASHSIZE; i++) {
+	for (i=0; i < c->inocache_hashsize; i++) {
 		this = c->inocache_list[i];
 		while (this) {
 			next = this->next;
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 523a916..5a53d9b 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -199,7 +199,8 @@ struct jffs2_inode_cache {
 #define RAWNODE_CLASS_XATTR_DATUM	1
 #define RAWNODE_CLASS_XATTR_REF		2
 
-#define INOCACHE_HASHSIZE 128
+#define INOCACHE_HASHSIZE_MIN 128
+#define INOCACHE_HASHSIZE_MAX 1024
 
 #define write_ofs(c) ((c)->nextblock->offset + (c)->sector_size - (c)->nextblock->free_size)
 
-- 
1.7.2.3
