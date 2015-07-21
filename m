Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9l-0002r6-Br
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:10 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 25/25] ubifs: make ubifs to support quota
Date: Tue, 21 Jul 2015 16:37:56 +0800
Message-ID: <1437467876-22106-26-git-send-email-yangds.fnst@cn.fujitsu.com>
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

This commit release the quota supporting in ubifs

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 00451b0..d7be860 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2382,7 +2382,11 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
 	sb->s_xattr = ubifs_xattr_handlers;
-
+#ifdef CONFIG_QUOTA
+	sb->dq_op = &dquot_operations;
+	sb->s_qcop = &ubifs_qctl_operations;
+	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP;
+#endif
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
 	if (err) {
-- 
1.8.4.2
