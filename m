Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8iYd-0006K3-12
 for linux-mtd@lists.infradead.org; Sat, 06 Oct 2018 09:07:32 +0000
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <dwmw2@infradead.org>, <stable@kernel.org>
Subject: [PATCH] jffs2: free jffs2_sb_info through jffs2_kill_sb()
Date: Sat, 6 Oct 2018 17:09:35 +0800
Message-ID: <20181006090935.41714-1-houtao1@huawei.com>
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

When an invalid mount option is passed to jffs2, jffs2_parse_options()
will fail and jffs2_sb_info will be freed, but then jffs2_sb_info will
be used (use-after-free) and freeed (double-free) in jffs2_kill_sb().

Fix it by removing the buggy invocation of kfree() when getting invalid
mount options.

Cc: stable@kernel.org
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/super.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 87bdf0f4cba1..902a7dd10e5c 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -285,10 +285,8 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
 	sb->s_fs_info = c;
 
 	ret = jffs2_parse_options(c, data);
-	if (ret) {
-		kfree(c);
+	if (ret)
 		return -EINVAL;
-	}
 
 	/* Initialize JFFS2 superblock locks, the further initialization will
 	 * be done later */
-- 
2.16.2.dirty
