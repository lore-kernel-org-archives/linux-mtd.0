Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgng-0006IZ-L3
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:43 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 19/35] ubifs: budget for inode in ubifs_dirty_inode if
 necessary
Date: Thu, 30 Jul 2015 13:48:15 +0800
Message-ID: <1438235311-23788-20-git-send-email-yangds.fnst@cn.fujitsu.com>
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

In ubifs, we have to do a budget for inode before marking
it as dirty. But sometimes, we would call dirty_inode in vfs
which will not do a budget for inode. In this case, we have
to do a budget in ubifs_dirty_inode() by ourselvies.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 2491fff..bc57685 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -383,15 +383,38 @@ done:
 	clear_inode(inode);
 }
 
+/*
+ * In theory, ubifs should take the full control of dirty<->clean
+ * of an inode with ui->ui_mutex. But there are callers of
+ * ubifs_dirty_inode in vfs without holding ui->ui_mutex and
+ * budgeting. So when we found the ui_mutex is not locked, we have
+ * to lock ui->ui_mutex by itself and do a budget by itself.
+ */
 static void ubifs_dirty_inode(struct inode *inode, int flags)
 {
         struct ubifs_inode *ui = ubifs_inode(inode);
+	int locked = mutex_is_locked(&ui->ui_mutex);
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	int ret = 0;
+
+	if (!locked)
+		mutex_lock(&ui->ui_mutex);
 
-	ubifs_assert(mutex_is_locked(&ui->ui_mutex));
 	if (!ui->dirty) {
+		if (!locked) {
+			struct ubifs_budget_req req = { .dirtied_ino = 1,
+				   .dirtied_ino_d = ALIGN(ui->data_len, 8) };
+			ret = ubifs_budget_space(c, &req);
+			if (ret)
+				goto out;
+		}
 		ui->dirty = 1;
 		dbg_gen("inode %lu",  inode->i_ino);
 	}
+out:
+	if (!locked)
+		mutex_unlock(&ui->ui_mutex);
+	return;
 }
 
 static int ubifs_statfs(struct dentry *dentry, struct kstatfs *buf)
-- 
1.8.4.2
