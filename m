Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dZnMQ-0005DI-Ss
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 00:06:04 +0000
Received: by mail-pg0-x243.google.com with SMTP id y129so13007186pgy.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2017 17:05:39 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "Mario J . Rugiero" <mrugiero@gmail.com>
Subject: [PATCH] mtd: mtdswap: remove unused variables 'dev' and 'gd'
Date: Mon, 24 Jul 2017 17:05:24 -0700
Message-Id: <20170725000524.116808-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This was changed recently (commit e8e3edb95ce6 ("mtd: create per-device
and module-scope debugfs entries")) and some compilers are complaining:

   drivers//mtd/mtdswap.c: In function 'mtdswap_add_debugfs':
>> drivers//mtd/mtdswap.c:1317: warning: unused variable 'dev'

And once we kill 'dev', 'gd' is also unused.

Cc: Mario J. Rugiero <mrugiero@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdswap.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 6b17932fe557..7d9080e33865 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1313,9 +1313,6 @@ static const struct file_operations mtdswap_fops = {
 
 static int mtdswap_add_debugfs(struct mtdswap_dev *d)
 {
-	struct gendisk *gd = d->mbd_dev->disk;
-	struct device *dev = disk_to_dev(gd);
-
 	struct dentry *root = d->mtd->dbg.dfs_dir;
 	struct dentry *dent;
 
-- 
2.14.0.rc0.284.gd933b75aa4-goog
