Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c03vQ-0003XK-Dk
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 09:58:13 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: adrian.hunter@intel.com, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 peda@axentia.se, ralph.sennhauser@gmail.com,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org
Subject: [PATCH] ubifs: Fix regression in ubifs_readdir()
Date: Fri, 28 Oct 2016 11:53:52 +0200
Message-Id: <1477648432-9543-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit c83ed4c9dbb35 ("ubifs: Abort readdir upon error") broke
overlayfs support because the fix exposed an internal error
code to VFS.

Reported-by: Peter Rosin <peda@axentia.se>
Tested-by: Peter Rosin <peda@axentia.se>
Reported-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Fixes: c83ed4c9dbb35 ("ubifs: Abort readdir upon error")
Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index bd4a5e8ce441..ca16c5d7bab1 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -543,6 +543,14 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 
 	if (err != -ENOENT)
 		ubifs_err(c, "cannot find next direntry, error %d", err);
+	else
+		/*
+		 * -ENOENT is a non-fatal error in this context, the TNC uses
+		 * it to indicate that the cursor moved past the current directory
+		 * and readdir() has to stop.
+		 */
+		err = 0;
+
 
 	/* 2 is a special value indicating that there are no more direntries */
 	ctx->pos = 2;
-- 
2.7.3
