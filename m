Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnb-0006If-S6
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:37 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 11/35] fs: quota: make quota support fs which is running on
 char dev
Date: Thu, 30 Jul 2015 13:48:07 +0800
Message-ID: <1438235311-23788-12-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

So far, we have done all preparation. Then let's add some
code to support char dev fs in quotactl.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/quota/quota.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 86ded73..3f9acea 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -17,6 +17,7 @@
 #include <linux/quotaops.h>
 #include <linux/types.h>
 #include <linux/writeback.h>
+#include <linux/cdev.h>
 
 static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
 				     qid_t id)
@@ -726,29 +727,40 @@ static int quotactl_cmd_write(int cmd)
  */
 static struct super_block *quotactl_block(const char __user *special, int cmd)
 {
+	struct super_block *sb = NULL;
+	struct filename *tmp = getname(special);
+	struct cdev *cdev = NULL;
+
 #ifdef CONFIG_BLOCK
 	struct block_device *bdev;
-	struct super_block *sb;
-	struct filename *tmp = getname(special);
 
 	if (IS_ERR(tmp))
 		return ERR_CAST(tmp);
 	bdev = lookup_bdev(tmp->name);
-	putname(tmp);
 	if (IS_ERR(bdev))
-		return ERR_CAST(bdev);
+		goto not_block;
 	if (quotactl_cmd_write(cmd))
 		sb = get_super_thawed(bdev);
 	else
 		sb = get_super(bdev);
 	bdput(bdev);
-	if (!sb)
-		return ERR_PTR(-ENODEV);
+	goto out;
 
-	return sb;
-#else
-	return ERR_PTR(-ENODEV);
+not_block:
 #endif
+	cdev = lookup_cdev(tmp->name);
+	if (IS_ERR(cdev))
+		goto out;
+	if (quotactl_cmd_write(cmd))
+		sb = get_super_cdev_thawed(cdev);
+	else
+		sb = get_super_cdev(cdev);
+	cdev_put(cdev);
+out:
+	putname(tmp);
+	if (sb)
+		return sb;
+	return ERR_PTR(-ENODEV);
 }
 
 /*
-- 
1.8.4.2
