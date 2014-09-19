Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUuoa-0004Pg-HP
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 09:49:21 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 1/2] UBIFS: Remove bogus assert
Date: Fri, 19 Sep 2014 11:48:46 +0200
Message-Id: <1411120127-18787-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This assertion was only correct before UBIFS had xattr support.
Now with xattr support also a directory node can carry data
and can act as host node.

Suggested-by: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 0e045e7..fb166e2 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -546,15 +546,14 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	int aligned_dlen, aligned_ilen, sync = IS_DIRSYNC(dir);
 	int last_reference = !!(deletion && inode->i_nlink == 0);
 	struct ubifs_inode *ui = ubifs_inode(inode);
-	struct ubifs_inode *dir_ui = ubifs_inode(dir);
+	struct ubifs_inode *host_ui = ubifs_inode(dir);
 	struct ubifs_dent_node *dent;
 	struct ubifs_ino_node *ino;
 	union ubifs_key dent_key, ino_key;
 
 	dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",
 		inode->i_ino, nm->len, nm->name, ui->data_len, dir->i_ino);
-	ubifs_assert(dir_ui->data_len == 0);
-	ubifs_assert(mutex_is_locked(&dir_ui->ui_mutex));
+	ubifs_assert(mutex_is_locked(&host_ui->ui_mutex));
 
 	dlen = UBIFS_DENT_NODE_SZ + nm->len + 1;
 	ilen = UBIFS_INO_NODE_SZ;
@@ -658,7 +657,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	ui->synced_i_size = ui->ui_size;
 	spin_unlock(&ui->ui_lock);
 	mark_inode_clean(c, ui);
-	mark_inode_clean(c, dir_ui);
+	mark_inode_clean(c, host_ui);
 	return 0;
 
 out_finish:
-- 
1.8.4.5
