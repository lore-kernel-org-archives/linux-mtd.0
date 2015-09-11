Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaD32-0004d7-LA
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 01:22:42 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>,
 <andreas.gruenbacher@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <yangds.fnst@cn.fujitsu.com>,
 <linux-fsdevel@vger.kernel.org>
Subject: [RFC PATCH v3 2/5] UBIFS: ACL: set ACL interfaces in inode_operations
Date: Fri, 11 Sep 2015 09:09:54 +0000
Message-ID: <1441962597-13543-3-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
References: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
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

Set [get|set]_acl interfaces in inode_operations for directory, file,
and symbol link.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/dir.c  | 4 ++++
 fs/ubifs/file.c | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5c27c66..69ccc78 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1188,6 +1188,10 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_FS_POSIX_ACL
+	.get_acl     = ubifs_get_acl,
+	.set_acl     = ubifs_set_acl,
+#endif
 };
 
 const struct file_operations ubifs_dir_operations = {
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a3dfe2a..58298f8 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1557,6 +1557,10 @@ const struct inode_operations ubifs_file_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_FS_POSIX_ACL
+	.get_acl     = ubifs_get_acl,
+	.set_acl     = ubifs_set_acl,
+#endif
 };
 
 const struct inode_operations ubifs_symlink_inode_operations = {
@@ -1568,6 +1572,10 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 	.getxattr    = ubifs_getxattr,
 	.listxattr   = ubifs_listxattr,
 	.removexattr = ubifs_removexattr,
+#ifdef CONFIG_UBIFS_FS_POSIX_ACL
+	.get_acl     = ubifs_get_acl,
+	.set_acl     = ubifs_set_acl,
+#endif
 };
 
 const struct file_operations ubifs_file_operations = {
-- 
1.9.1
