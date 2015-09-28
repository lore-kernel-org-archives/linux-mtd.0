Received: from m12-12.163.com ([220.181.12.12])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgZHK-0006J6-2y
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 14:19:46 +0000
From: Yaowei Bai <bywxiaobai@163.com>
To: viro@zeniv.linux.org.uk,
	dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 10/17] fs/jffs2: remove unnecessary new_valid_dev check
Date: Mon, 28 Sep 2015 22:15:38 +0800
Message-Id: <1443449738-5424-1-git-send-email-bywxiaobai@163.com>
In-Reply-To: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As new_valid_dev always returns 1, so !new_valid_dev check is not
needed, remove it.

Signed-off-by: Yaowei Bai <bywxiaobai@163.com>
---
 fs/jffs2/dir.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 8118002..d211b8e 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -621,9 +621,6 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	uint32_t alloclen;
 	int ret;
 
-	if (!new_valid_dev(rdev))
-		return -EINVAL;
-
 	ri = jffs2_alloc_raw_inode();
 	if (!ri)
 		return -ENOMEM;
-- 
1.9.1
