Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zg1yg-00022O-No
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 02:46:15 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 <dedekind1@gmail.com>, <richard@nod.at>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] UBIFS: Add freeze support in ubifs
Date: Sun, 27 Sep 2015 10:39:21 +0800
Message-ID: <1443321561-20581-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We need to do nothing in ubifs, as all is already done in vfs.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9547a278..e8f85b5 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1871,6 +1871,11 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 	return 0;
 }
 
+static int ubifs_freeze_fs(struct super_block *sb)
+{
+	return 0;
+}
+
 const struct super_operations ubifs_super_operations = {
 	.alloc_inode   = ubifs_alloc_inode,
 	.destroy_inode = ubifs_destroy_inode,
@@ -1882,6 +1887,7 @@ const struct super_operations ubifs_super_operations = {
 	.remount_fs    = ubifs_remount_fs,
 	.show_options  = ubifs_show_options,
 	.sync_fs       = ubifs_sync_fs,
+	.freeze_fs     = ubifs_freeze_fs,
 };
 
 /**
-- 
1.8.4.2
