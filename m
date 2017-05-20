Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dCCgA-0007BA-Aw
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 22:16:56 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dhowells@redhat.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Wire-up statx() support
Date: Sun, 21 May 2017 00:16:26 +0200
Message-Id: <20170520221626.8252-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

statx() can report what flags a file has, expose flags that UBIFS
supports. Especially STATX_ATTR_COMPRESSED and STATX_ATTR_ENCRYPTED
can be interesting for userspace.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 566079d9b402..578b6043f308 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1647,6 +1647,21 @@ int ubifs_getattr(const struct path *path, struct kstat *stat,
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
 	mutex_lock(&ui->ui_mutex);
+
+	if (ui->flags & UBIFS_APPEND_FL)
+		stat->attributes |= STATX_ATTR_APPEND;
+	if (ui->flags & UBIFS_COMPR_FL)
+		stat->attributes |= STATX_ATTR_COMPRESSED;
+	if (ui->flags & UBIFS_CRYPT_FL)
+		stat->attributes |= STATX_ATTR_ENCRYPTED;
+	if (ui->flags & UBIFS_IMMUTABLE_FL)
+		stat->attributes |= STATX_ATTR_IMMUTABLE;
+
+	stat->attributes_mask |= (STATX_ATTR_APPEND |
+				STATX_ATTR_COMPRESSED |
+				STATX_ATTR_ENCRYPTED |
+				STATX_ATTR_IMMUTABLE);
+
 	generic_fillattr(inode, stat);
 	stat->blksize = UBIFS_BLOCK_SIZE;
 	stat->size = ui->ui_size;
-- 
2.12.0
