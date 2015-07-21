Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9j-0002qj-FS
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:09 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 23/25] ubifs: transfer quota information in changing owner or
 group
Date: Tue, 21 Jul 2015 16:37:54 +0800
Message-ID: <1437467876-22106-24-git-send-email-yangds.fnst@cn.fujitsu.com>
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

When we change the owner or group of a file, we need to transfer
the quota information at the same time.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index aac10bd..e9844ef 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1304,6 +1304,15 @@ int ubifs_setattr(struct dentry *dentry, struct iattr *attr)
 	if (err)
 		return err;
 
+	if (is_quota_modification(inode, attr))
+		dquot_initialize(inode);
+	if ((attr->ia_valid & ATTR_UID && !uid_eq(attr->ia_uid, inode->i_uid)) ||
+	    (attr->ia_valid & ATTR_GID && !gid_eq(attr->ia_gid, inode->i_gid))) {
+		err = dquot_transfer(inode, attr);
+		if (err)
+			return err;
+	}
+
 	if ((attr->ia_valid & ATTR_SIZE) && attr->ia_size < inode->i_size)
 		/* Truncation to a smaller size */
 		err = do_truncation(c, inode, attr);
-- 
1.8.4.2
