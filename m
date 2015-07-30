Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnq-0006IZ-AQ
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:52 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 30/35] ubifs: adapt quota space informatin in do_setattr
Date: Thu, 30 Jul 2015 13:48:26 +0800
Message-ID: <1438235311-23788-31-git-send-email-yangds.fnst@cn.fujitsu.com>
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

In do_setattr, there is a possibility to change the size of
a file. In this case, we have to notify the changed size to
quota subsystem.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 1e8ee41..24af30c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1250,6 +1250,17 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
+		if (S_ISREG(inode->i_mode)) {
+			if (new_size > inode->i_size) {
+				err = dquot_alloc_space_nodirty(inode, new_size - inode->i_size);
+				if (err) {
+					ubifs_release_budget(c, &req);
+					return err;
+				}
+			} else {
+				dquot_free_space_nodirty(inode, inode->i_size - new_size);
+			}
+		}
 		truncate_setsize(inode, new_size);
 	}
 
-- 
1.8.4.2
