Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb0Oi-0000Fh-8w
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2017 07:41:12 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>, <dedekind1@gmail.com>
CC: <shengyong1@huawei.com>
Subject: [PATCH] ubifs: return ENOSPC if running out of inode number
Date: Tue, 7 Feb 2017 15:28:08 +0800
Message-ID: <20170207072808.17816-1-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 528369f..00517dc 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -164,7 +164,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 			ubifs_err(c, "out of inode numbers");
 			make_bad_inode(inode);
 			iput(inode);
-			return ERR_PTR(-EINVAL);
+			return ERR_PTR(-ENOSPC);
 		}
 		ubifs_warn(c, "running out of inode numbers (current %lu, max %u)",
 			   (unsigned long)c->highest_inum, INUM_WATERMARK);
-- 
2.10.1
