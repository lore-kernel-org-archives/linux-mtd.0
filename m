Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnu-0006Ib-Ca
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:56 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 35/35] ubifs: make ubifs to support quota
Date: Thu, 30 Jul 2015 13:48:31 +0800
Message-ID: <1438235311-23788-36-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index acc5d2f..466f8e1 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2349,6 +2349,11 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_op = &ubifs_super_operations;
 	sb->s_xattr = ubifs_xattr_handlers;
 
+#ifdef CONFIG_QUOTA
+	sb->dq_op = &dquot_operations;
+	sb->s_qcop = &dquot_quotactl_ops;
+	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP;
+#endif
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
 	if (err) {
-- 
1.8.4.2
