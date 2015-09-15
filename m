Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmFD-0002nf-Fc
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:47 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 37/39] ubifs: implement ubifs_restore_iflags for
 quotactl_operations
Date: Tue, 15 Sep 2015 17:02:32 +0800
Message-ID: <1442307754-13233-38-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We have to implement a ubifs_restore_iflags for quotactl_operations,
because we don't allow dquot mark_inode_dirty() without a budget.
So we need to do it by ourselves in ubifs_restore_iflags.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index d3213a2..01aaa88 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2192,6 +2192,67 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 	return c;
 }
 
+#ifdef CONFIG_QUOTA
+static int ubifs_restore_iflags(struct super_block *sb, struct inode **toputinode,
+					unsigned int *old_flags)
+{
+	int cnt = 0;
+	int err = 0;
+	struct quota_info *dqopt = sb_dqopt(sb);
+	struct ubifs_info *c = sb->s_fs_info;
+
+	for (cnt = 0; cnt < MAXQUOTAS; cnt++)
+		if (toputinode[cnt]) {
+			struct ubifs_inode *ui = ubifs_inode(toputinode[cnt]);
+			struct ubifs_budget_req req = { .dirtied_ino = 1,
+					.dirtied_ino_d = ALIGN(ui->data_len, 8) };
+			int release = 0;
+
+			/* budget for the inode which need to update */
+			err = ubifs_budget_space(c, &req);
+			if (err)
+				return err;
+
+			mutex_lock(&dqopt->dqonoff_mutex);
+			/* If quota was reenabled in the meantime, we have
+			 * nothing to do */
+			if (!sb_has_quota_loaded(sb, cnt)) {
+				mutex_lock(&toputinode[cnt]->i_mutex);
+				toputinode[cnt]->i_flags &= ~(S_IMMUTABLE |
+				  S_NOATIME | S_NOQUOTA);
+				toputinode[cnt]->i_flags |= old_flags[cnt];
+				truncate_inode_pages(&toputinode[cnt]->i_data,
+						     0);
+				mutex_unlock(&toputinode[cnt]->i_mutex);
+
+				mutex_lock(&ui->ui_mutex);
+				release = ui->dirty;
+				mark_inode_dirty_sync(toputinode[cnt]);
+				mutex_unlock(&ui->ui_mutex);
+			} else {
+				release = 1;
+			}
+			mutex_unlock(&dqopt->dqonoff_mutex);
+			/* Release the budget if we don't need to update the inode */
+			if (release)
+				ubifs_release_budget(c, &req);
+		}
+
+	return 0;
+}
+
+static const struct quotactl_ops ubifs_quotactl_ops = {
+	.quota_on	= dquot_quota_on,
+	.quota_off	= dquot_quota_off,
+	.quota_sync	= dquot_quota_sync,
+	.get_state	= dquot_get_state,
+	.set_info	= dquot_set_dqinfo,
+	.get_dqblk	= dquot_get_dqblk,
+	.set_dqblk	= dquot_set_dqblk,
+	.restore_iflags	= ubifs_restore_iflags
+};
+#endif
+
 static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 {
 	struct ubifs_info *c = sb->s_fs_info;
-- 
1.8.4.2
