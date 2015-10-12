Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlklQ-0007Ce-G5
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 21:36:13 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] UBIFS: Fix possible memory leak in ubifs_readdir()
Date: Mon, 12 Oct 2015 23:35:36 +0200
Message-Id: <1444685736-29878-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If ubifs_tnc_next_ent() returns something else than -ENOENT
we leak file->private_data.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5c27c66..cb88ea3 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -449,13 +449,14 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 	}
 
 out:
+	kfree(file->private_data);
+	file->private_data = NULL;
+
 	if (err != -ENOENT) {
 		ubifs_err(c, "cannot find next direntry, error %d", err);
 		return err;
 	}
 
-	kfree(file->private_data);
-	file->private_data = NULL;
 	/* 2 is a special value indicating that there are no more direntries */
 	ctx->pos = 2;
 	return 0;
-- 
2.5.0
