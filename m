Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1da1ym-0002f5-Qn
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 15:42:38 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, Mario Rugiero <mrugiero@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Geliang Tang <geliangtang@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: remove unused variable in mtdswap
Date: Tue, 25 Jul 2017 17:41:58 +0200
Message-Id: <20170725154208.355381-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The only user of this variable was removed, leading to a
new harmless warning:

drivers/mtd/mtdswap.c: In function 'mtdswap_add_debugfs':
drivers/mtd/mtdswap.c:1317:17: error: unused variable 'dev' [-Werror=unused-variable]

This removes the variable as well.

Fixes: e8e3edb95ce6 ("mtd: create per-device and module-scope debugfs entries")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
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
2.9.0
