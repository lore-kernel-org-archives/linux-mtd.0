Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9b-0002qj-P7
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:01 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 15/25] ubifs: disable quota in ubifs_put_super
Date: Tue, 21 Jul 2015 16:37:46 +0800
Message-ID: <1437467876-22106-16-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We need to disable quota in umounting ubifs. So we have to
disable quota in ubifs_put_super(). But quota disable will
write quota file, and we have to budget for it.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 4e60330..e53cd40 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2003,6 +2003,34 @@ static void ubifs_put_super(struct super_block *sb)
 
 	ubifs_msg(c, "un-mount UBI device %d", c->vi.ubi_num);
 
+	if (!c->ro_mount) {
+		struct quota_info *dqopt = sb_dqopt(sb);
+		struct inode *inodes[MAXQUOTAS] = {};
+		struct inode *tmp = NULL;
+		struct ubifs_inode *ui = NULL;
+		struct ubifs_budget_req req = {};
+		int cnt = 0;
+		int index = 0;
+
+		for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
+			if (!sb_has_quota_loaded(sb, cnt))
+				continue;
+			req.dirtied_ino += 1;
+			inodes[index++] = dqopt->files[cnt];
+		}
+		ubifs_budget_space(c, &req);
+
+		for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
+			tmp = inodes[cnt];
+			if (!tmp)
+				break;
+			ui = ubifs_inode(tmp);
+			mutex_lock(&ui->ui_mutex);
+			ui->budgeted = 1;
+			mutex_unlock(&ui->ui_mutex);
+		}
+		dquot_disable(sb, -1, DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED);
+	}
 	/*
 	 * The following asserts are only valid if there has not been a failure
 	 * of the media. For example, there will be dirty inodes if we failed
-- 
1.8.4.2
