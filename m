Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9X-0002r6-Fn
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:43:56 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 10/25] ubifs: fill ->s_dev in ubifs_fill_super
Date: Tue, 21 Jul 2015 16:37:41 +0800
Message-ID: <1437467876-22106-11-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Some tools in userspace, such as quota-tools, are using
stat() to get the st_dev of a mount point then to find
out the device mounted on this mount point.

So we have to fill ->s_dev here to tell them which device
is mounted on this point.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 27e1739..161b1a6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -36,6 +36,7 @@
 #include <linux/mount.h>
 #include <linux/math64.h>
 #include <linux/writeback.h>
+#include <linux/cdev.h>
 #include "ubifs.h"
 
 /*
@@ -2033,6 +2034,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 
 	sb->s_bdi = &c->bdi;
 	sb->s_cdev = ubi_get_volume_cdev(c->ubi);
+	sb->s_dev = sb->s_cdev->dev;
 	sb->s_fs_info = c;
 	sb->s_magic = UBIFS_SUPER_MAGIC;
 	sb->s_blocksize = UBIFS_BLOCK_SIZE;
-- 
1.8.4.2
