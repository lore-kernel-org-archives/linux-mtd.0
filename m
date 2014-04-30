Received: from mail-bn1lp0145.outbound.protection.outlook.com
 ([207.46.163.145] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfMVd-0002uA-Ga
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 04:52:41 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 2/2] mtd: show the partition's flags in the the /proc/mtd
Date: Wed, 30 Apr 2014 11:53:30 +0800
Message-ID: <1398830010-3628-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1398830010-3628-1-git-send-email-b32955@freescale.com>
References: <1398830010-3628-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the flags information when we use the "cat /proc/mtd".

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/mtdcore.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9cdc154..c62ee70 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1132,12 +1132,12 @@ static int mtd_proc_show(struct seq_file *m, void *v)
 {
 	struct mtd_info *mtd;
 
-	seq_puts(m, "dev:    size   erasesize  name\n");
+	seq_puts(m, "dev:    size   erasesize   flags   name\n");
 	mutex_lock(&mtd_table_mutex);
 	mtd_for_each_device(mtd) {
-		seq_printf(m, "mtd%d: %8.8llx %8.8x \"%s\"\n",
+		seq_printf(m, "mtd%d: %8.8llx %8.8x  %8.8x \"%s\"\n",
 			   mtd->index, (unsigned long long)mtd->size,
-			   mtd->erasesize, mtd->name);
+			   mtd->erasesize, mtd->flags, mtd->name);
 	}
 	mutex_unlock(&mtd_table_mutex);
 	return 0;
-- 
1.7.2.rc3
