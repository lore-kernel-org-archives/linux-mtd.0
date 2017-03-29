Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctFHd-0003yn-LC
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 15:13:23 +0000
Date: Wed, 29 Mar 2017 17:12:48 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: Don't block RENAME_WHITEOUT flag in rename
Message-ID: <20170329151248.GA29118@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The test does not allow the valid flag RENAME_WHITEOUT
and in fact, the calling function of do_rename already tests
the flags, so the test is unnecessary, allowing us to drop
it completely.

With this patch RENAME_WHITEOUT for overlayfs on ubifs works
as intended.

Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
 fs/ubifs/dir.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 30825d88..01ab543 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1316,9 +1316,6 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	unsigned int uninitialized_var(saved_nlink);
 	struct fscrypt_name old_nm, new_nm;
 
-	if (flags & ~RENAME_NOREPLACE)
-		return -EINVAL;
-
 	/*
 	 * Budget request settings: deletion direntry, new direntry, removing
 	 * the old inode, and changing old and new parent directory inodes.
-- 
2.1.4


/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
