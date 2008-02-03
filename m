Received: from [222.73.24.84] (helo=song.cn.fujitsu.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JLW6S-0003HM-RP
	for linux-mtd@lists.infradead.org; Sun, 03 Feb 2008 04:05:19 +0000
Message-ID: <47A521B5.9020007@cn.fujitsu.com>
Date: Sun, 03 Feb 2008 10:06:45 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH] MTD/NAND: fix a compile warning in plat_nand_remove
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With CONFIG_MTD_PARTITIONS not set, got this:
drivers/mtd/nand/plat_nand.c:113: warning: unused variable 'pdata'

Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>
---
 drivers/mtd/nand/plat_nand.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index cd725fc..f6d5c2a 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -110,7 +110,9 @@ out:
 static int __devexit plat_nand_remove(struct platform_device *pdev)
 {
 	struct plat_nand_data *data = platform_get_drvdata(pdev);
+#ifdef CONFIG_MTD_PARTITIONS
 	struct platform_nand_data *pdata = pdev->dev.platform_data;
+#endif
 
 	nand_release(&data->mtd);
 #ifdef CONFIG_MTD_PARTITIONS
-- 
1.5.4.rc3
