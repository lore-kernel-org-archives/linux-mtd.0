Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yds4H-0007Fr-HL
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2015 03:14:50 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>
Subject: [PATCH] UBIFS: fix output format of INUM_WATERMARK
Date: Fri, 3 Apr 2015 03:13:42 +0000
Message-ID: <1428030822-51540-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The INUM_WATERMARK is a unsigned 32bit value, `%d' prints it as negatave:
[  103.682255] UBIFS warning (ubi0:0 pid 691): ubifs_new_inode: running out of inode numbers (current 122763, max -256)

Fix it as:
[  154.422940] UBIFS warning (ubi0:0 pid 688): ubifs_new_inode: running out of inode numbers (current 122765, max 4294967040)

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 90fe60c..02d1ee7 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -151,7 +151,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 			iput(inode);
 			return ERR_PTR(-EINVAL);
 		}
-		ubifs_warn(c, "running out of inode numbers (current %lu, max %d)",
+		ubifs_warn(c, "running out of inode numbers (current %lu, max %u)",
 			   (unsigned long)c->highest_inum, INUM_WATERMARK);
 	}
 
-- 
1.8.3.4
