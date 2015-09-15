Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmEv-0002nf-4t
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:25 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 10/39] fs: dquot: skip invalidate_bdev if bdev is NULL
Date: Tue, 15 Sep 2015 17:02:05 +0800
Message-ID: <1442307754-13233-11-git-send-email-yangds.fnst@cn.fujitsu.com>
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

There would be a NULL pointer dereference if bdev is NULL

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Reviewed-by: Jan Kara <jack@suse.com>
---
 fs/quota/dquot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index 20d1f74..140397a 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -2208,7 +2208,8 @@ static int vfs_load_quota_inode(struct inode *inode, int type, int format_id,
 		 * of the cache could fail because of other unrelated dirty
 		 * data */
 		sync_filesystem(sb);
-		invalidate_bdev(sb->s_bdev);
+		if (sb->s_bdev)
+			invalidate_bdev(sb->s_bdev);
 	}
 	mutex_lock(&dqopt->dqonoff_mutex);
 	if (sb_has_quota_loaded(sb, type)) {
-- 
1.8.4.2
