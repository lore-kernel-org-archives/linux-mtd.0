Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmFA-0002kO-6a
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:41 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 31/39] ubifs: free quota space in do_truncation
Date: Tue, 15 Sep 2015 17:02:26 +0800
Message-ID: <1442307754-13233-32-git-send-email-yangds.fnst@cn.fujitsu.com>
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

In truncation, we have to tell quota subsystem
to update the quota information of the space changing.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 64ca91c..59b2098 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1136,6 +1136,7 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	int err;
 	struct ubifs_budget_req req;
 	loff_t old_size = inode->i_size, new_size = attr->ia_size;
+	loff_t quota_size = (old_size - new_size);
 	int offset = new_size & (UBIFS_BLOCK_SIZE - 1), budgeted = 1;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
@@ -1215,6 +1216,10 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	do_attr_changes(inode, attr);
 	err = ubifs_jnl_truncate(c, inode, old_size, new_size);
 	mutex_unlock(&ui->ui_mutex);
+	if (quota_size < 0)
+		quota_size = 0;
+	if (S_ISREG(inode->i_mode))
+		dquot_free_space_nodirty(inode, quota_size);
 
 out_budg:
 	if (budgeted)
-- 
1.8.4.2
