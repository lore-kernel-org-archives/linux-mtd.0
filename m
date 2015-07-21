Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9i-0002qt-Lz
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:08 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 22/25] ubifs: adapt quota space informatin in do_setattr
Date: Tue, 21 Jul 2015 16:37:53 +0800
Message-ID: <1437467876-22106-23-git-send-email-yangds.fnst@cn.fujitsu.com>
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

In do_setattr, there is a possibility to change the size of
a file. In this case, we have to notify the changed size to
quota subsystem.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b907f197..aac10bd 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1249,6 +1249,13 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
+		if (new_size > inode->i_size) {
+			err = dquot_alloc_space_nodirty(inode, new_size - inode->i_size);
+			if (err)
+				return err;
+		} else {
+			dquot_free_space_nodirty(inode, inode->i_size - new_size);
+		}
 		truncate_setsize(inode, new_size);
 	}
 
-- 
1.8.4.2
