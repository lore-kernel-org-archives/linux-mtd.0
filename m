Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9k-0002qt-JD
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:10 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 24/25] ubifs: implement ubifs_qctl_operations for quotactl
Date: Tue, 21 Jul 2015 16:37:55 +0800
Message-ID: <1437467876-22106-25-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

To make ubifs support quota, we have to provide a qctl_operations
to quotactl. But we can not use the default operations. The problem
is quota_off function. We have to do a budget at first before
disabling quota.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 60deed2..00451b0 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2278,6 +2278,62 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 	return c;
 }
 
+#ifdef CONFIG_QUOTA
+static int ubifs_quota_off(struct super_block *sb, int type)
+{
+	struct ubifs_budget_req req = {};
+	struct ubifs_info *c = sb->s_fs_info;
+	struct quota_info *dqopt = sb_dqopt(sb);
+	struct inode *inodes[MAXQUOTAS] = {};
+	struct inode *tmp = NULL;
+	struct ubifs_inode *ui = NULL;
+	int ret = 0;
+	int cnt = 0;
+
+	if (type == -1) {
+		for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
+			if (!sb_has_quota_loaded(sb, cnt))
+				continue;
+			req.dirtied_ino += 1;
+			inodes[cnt] = dqopt->files[cnt];
+		}
+	} else {
+		if (sb_has_quota_loaded(sb, type)) {
+			req.dirtied_ino = 1;
+			inodes[cnt] = dqopt->files[type];
+		}
+	}
+
+	if (req.dirtied_ino) {
+		ret = ubifs_budget_space(c, &req);
+		if (ret)
+			return ret;
+	}
+
+	for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
+		tmp = inodes[cnt];
+		if (!tmp)
+			break;
+		ui = ubifs_inode(tmp);
+		mutex_lock(&ui->ui_mutex);
+		ui->budgeted = 1;
+		mutex_unlock(&ui->ui_mutex);
+	}
+
+	return dquot_disable(sb, type, DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED);
+}
+
+static const struct quotactl_ops ubifs_qctl_operations = {
+	.quota_on	= dquot_quota_on,
+	.quota_off	= ubifs_quota_off,
+	.quota_sync     = dquot_quota_sync,
+	.get_state      = dquot_get_state,
+	.set_info       = dquot_set_dqinfo,
+	.get_dqblk      = dquot_get_dqblk,
+	.set_dqblk      = dquot_set_dqblk
+};
+#endif
+
 static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 {
 	struct ubifs_info *c = sb->s_fs_info;
-- 
1.8.4.2
