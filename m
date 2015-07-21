Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9T-0002qt-Hs
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:43:52 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 01/25] fs: introduce a ->s_cdev field into struct super_block
Date: Tue, 21 Jul 2015 16:37:32 +0800
Message-ID: <1437467876-22106-2-git-send-email-yangds.fnst@cn.fujitsu.com>
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

There are some filesystems are running on char devs, such
as ubifs. So we need a field in super_block to hold a
reference to the char device.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 include/linux/fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 35ec87e..2f1d9499 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1284,6 +1284,7 @@ struct super_block {
 	struct hlist_bl_head	s_anon;		/* anonymous dentries for (nfs) exporting */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
 	struct block_device	*s_bdev;
+	struct cdev		*s_cdev;
 	struct backing_dev_info *s_bdi;
 	struct mtd_info		*s_mtd;
 	struct hlist_node	s_instances;
-- 
1.8.4.2
