Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwoaT-00015Y-1H
 for linux-mtd@lists.infradead.org; Wed, 19 Oct 2016 10:59:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 richard@nod.at, david@sigma-star.at, stable@vger.kernel.org
Subject: [PATCH] ubifs: Abort readdir upon error
Date: Wed, 19 Oct 2016 12:58:35 +0200
Message-Id: <1476874715-7127-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If UBIFS is facing an error while walking a directory, it reports this
error and ubifs_readdir() returns the error code. But the VFS readdir
logic does not make the getdents system call fail in all cases. When the
readdir cursor indicates that more entries are present, the system call
will just return and the libc wrapper will try again since it also
knows that more entries are present.
This causes the libc wrapper to busy loop for ever when a directory is
corrupted on UBIFS.
A common approach do deal with corrupted directory entries is
skipping them by setting the cursor to the next entry. On UBIFS this
approach is not possible since we cannot compute the next directory
entry cursor position without reading the current entry. So all we can
do is setting the cursor to the "no more entries" position and make
getdents exit.

Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 668ec3b90ea1..bd4a5e8ce441 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -439,7 +439,7 @@ static unsigned int vfs_dent_type(uint8_t type)
  */
 static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 {
-	int err;
+	int err = 0;
 	struct qstr nm;
 	union ubifs_key key;
 	struct ubifs_dent_node *dent;
@@ -541,14 +541,12 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 	kfree(file->private_data);
 	file->private_data = NULL;
 
-	if (err != -ENOENT) {
+	if (err != -ENOENT)
 		ubifs_err(c, "cannot find next direntry, error %d", err);
-		return err;
-	}
 
 	/* 2 is a special value indicating that there are no more direntries */
 	ctx->pos = 2;
-	return 0;
+	return err;
 }
 
 /* Free saved readdir() state when the directory is closed */
-- 
2.7.3
