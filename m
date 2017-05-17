Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAuSM-0007Gy-9T
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 08:37:21 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/6] ubifs: Massage debug prints wrt. fscrypt
Date: Wed, 17 May 2017 10:36:48 +0200
Message-Id: <20170517083649.25135-5-richard@nod.at>
In-Reply-To: <20170517083649.25135-1-richard@nod.at>
References: <20170517083649.25135-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If file names are encrypted we can no longer print them.
That's why we have to change these prints or remove them completely.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 10 ----------
 fs/ubifs/tnc.c     |  9 ++++-----
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 7aef413ea2a9..419c79ff377e 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -549,8 +549,6 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	struct ubifs_ino_node *ino;
 	union ubifs_key dent_key, ino_key;
 
-	//dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",
-	//	inode->i_ino, nm->len, nm->name, ui->data_len, dir->i_ino);
 	ubifs_assert(mutex_is_locked(&host_ui->ui_mutex));
 
 	dlen = UBIFS_DENT_NODE_SZ + fname_len(nm) + 1;
@@ -956,9 +954,6 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	int twoparents = (fst_dir != snd_dir);
 	void *p;
 
-	//dbg_jnl("dent '%pd' in dir ino %lu between dent '%pd' in dir ino %lu",
-	//	fst_dentry, fst_dir->i_ino, snd_dentry, snd_dir->i_ino);
-
 	ubifs_assert(ubifs_inode(fst_dir)->data_len == 0);
 	ubifs_assert(ubifs_inode(snd_dir)->data_len == 0);
 	ubifs_assert(mutex_is_locked(&ubifs_inode(fst_dir)->ui_mutex));
@@ -1100,8 +1095,6 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	int move = (old_dir != new_dir);
 	struct ubifs_inode *uninitialized_var(new_ui);
 
-	//dbg_jnl("dent '%pd' in dir ino %lu to dent '%pd' in dir ino %lu",
-	//	old_dentry, old_dir->i_ino, new_dentry, new_dir->i_ino);
 	ubifs_assert(ubifs_inode(old_dir)->data_len == 0);
 	ubifs_assert(ubifs_inode(new_dir)->data_len == 0);
 	ubifs_assert(mutex_is_locked(&ubifs_inode(old_dir)->ui_mutex));
@@ -1493,9 +1486,6 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 	int sync = IS_DIRSYNC(host);
 	struct ubifs_inode *host_ui = ubifs_inode(host);
 
-	//dbg_jnl("host %lu, xattr ino %lu, name '%s', data len %d",
-	//	host->i_ino, inode->i_ino, nm->name,
-	//	ubifs_inode(inode)->data_len);
 	ubifs_assert(inode->i_nlink == 0);
 	ubifs_assert(mutex_is_locked(&host_ui->ui_mutex));
 
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index b4526925fd78..bbaa7ee948b8 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -1812,7 +1812,7 @@ static int do_lookup_nm(struct ubifs_info *c, const union ubifs_key *key,
 	int found, n, err;
 	struct ubifs_znode *znode;
 
-	//dbg_tnck(key, "name '%.*s' key ", nm->len, nm->name);
+	dbg_tnck(key, "key ");
 	mutex_lock(&c->tnc_mutex);
 	found = ubifs_lookup_level0(c, key, &znode, &n);
 	if (!found) {
@@ -2410,8 +2410,7 @@ int ubifs_tnc_add_nm(struct ubifs_info *c, const union ubifs_key *key,
 	struct ubifs_znode *znode;
 
 	mutex_lock(&c->tnc_mutex);
-	//dbg_tnck(key, "LEB %d:%d, name '%.*s', key ",
-	//	 lnum, offs, nm->len, nm->name);
+	dbg_tnck(key, "LEB %d:%d, key ", lnum, offs);
 	found = lookup_level0_dirty(c, key, &znode, &n);
 	if (found < 0) {
 		err = found;
@@ -2645,7 +2644,7 @@ int ubifs_tnc_remove_nm(struct ubifs_info *c, const union ubifs_key *key,
 	struct ubifs_znode *znode;
 
 	mutex_lock(&c->tnc_mutex);
-	//dbg_tnck(key, "%.*s, key ", nm->len, nm->name);
+	dbg_tnck(key, "key ");
 	err = lookup_level0_dirty(c, key, &znode, &n);
 	if (err < 0)
 		goto out_unlock;
@@ -2948,7 +2947,7 @@ struct ubifs_dent_node *ubifs_tnc_next_ent(struct ubifs_info *c,
 	struct ubifs_zbranch *zbr;
 	union ubifs_key *dkey;
 
-	//dbg_tnck(key, "%s ", nm->name ? (char *)nm->name : "(lowest)");
+	dbg_tnck(key, "key ");
 	ubifs_assert(is_hash_key(c, key));
 
 	mutex_lock(&c->tnc_mutex);
-- 
2.12.0
