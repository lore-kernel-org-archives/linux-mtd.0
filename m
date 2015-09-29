Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZglbG-00077M-IU
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 03:29:08 +0000
From: <fangwei1@huawei.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Wei Fang <fangwei1@huawei.com>
Subject: [PATCH] jffs2: fix a memleak in read_direntry()
Date: Tue, 29 Sep 2015 11:23:55 +0800
Message-ID: <1443497035-25220-1-git-send-email-fangwei1@huawei.com>
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

From: Wei Fang <fangwei1@huawei.com>

Need to free the memory allocated for 'fd' if failed to read all
of the remainder name.

Signed-off-by: Wei Fang <fangwei1@huawei.com>
---
 fs/jffs2/readinode.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 28e0aab..bfebbf1 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -660,8 +660,12 @@ static inline int read_direntry(struct jffs2_sb_info *c, struct jffs2_raw_node_r
 
 		err = jffs2_flash_read(c, (ref_offset(ref)) + read,
 				rd->nsize - already, &read, &fd->name[already]);
-		if (unlikely(read != rd->nsize - already) && likely(!err))
+		if (unlikely(read != rd->nsize - already) && likely(!err)) {
+			jffs2_free_full_dirent(fd);
+			JFFS2_ERROR("short read: wanted %d bytes, got %zd\n",
+				    rd->nsize - already, read);
 			return -EIO;
+		}
 
 		if (unlikely(err)) {
 			JFFS2_ERROR("read remainder of name: error %d\n", err);
-- 
1.7.1
