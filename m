Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ccEL8-00011G-Vo
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 16:46:34 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com,
 david.oberhollenzer@sigma-star.at, Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Fix memory leak in error path in ubifs_mknod
Date: Fri, 10 Feb 2017 17:46:01 +0100
Message-Id: <20170210164601.29218-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When fscrypt_setup_filename() fails we have to free dev.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 528369f3e472..e164782f8bc8 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1068,8 +1068,10 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
-	if (err)
+	if (err) {
+		kfree(dev);
 		goto out_budg;
+	}
 
 	sz_change = CALC_DENT_SIZE(fname_len(&nm));
 
-- 
2.10.2
