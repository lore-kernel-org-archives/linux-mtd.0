Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnp-0006Ib-Ek
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:51 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 29/35] ubifs: free quota space when deleting a file
Date: Thu, 30 Jul 2015 13:48:25 +0800
Message-ID: <1438235311-23788-30-git-send-email-yangds.fnst@cn.fujitsu.com>
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

When we unlink an inode which has only one last reference,
we are going to free the space in this inode. So free
the quota space at the same time.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/journal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 0b9da5b..a6e02f4 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -58,6 +58,8 @@
  * all the nodes.
  */
 
+#include <linux/quotaops.h>
+
 #include "ubifs.h"
 
 /**
@@ -614,6 +616,10 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 			goto out_finish;
 		}
 		ui->del_cmtno = c->cmt_no;
+		if (S_ISREG(inode->i_mode)) {
+			dquot_initialize((struct inode *)inode);
+			dquot_free_space_nodirty((struct inode *)inode, inode->i_size);
+		}
 	}
 
 	err = write_head(c, BASEHD, dent, len, &lnum, &dent_offs, sync);
-- 
1.8.4.2
