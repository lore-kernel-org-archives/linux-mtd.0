Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKNlZ-0002vm-9R
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 06:53:54 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK900GON9TGKDM0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 15:53:48 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
References: <000f01ce29ee$90692c10$b13b8430$%han@samsung.com>
In-reply-to: <000f01ce29ee$90692c10$b13b8430$%han@samsung.com>
Subject: [PATCH 2/3] mtd: fsmc_nand: add CONFIG_PM_SLEEP to suspend/resume
 functions
Date: Tue, 26 Mar 2013 15:53:48 +0900
Message-id: <001001ce29ee$aad1e240$0075a6c0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add CONFIG_PM_SLEEP to suspend/resume functions to fix the following
build warning when CONFIG_PM_SLEEP is not selected. This is because
sleep PM callbacks defined by SIMPLE_DEV_PM_OPS are only used when
the CONFIG_PM_SLEEP is enabled. Also, unnecessary CONFIG_PM ifdefs
are removed.

drivers/mtd/nand/fsmc_nand.c:1194:12: warning: 'fsmc_nand_suspend' defined but not used [-Wunused-function]
drivers/mtd/nand/fsmc_nand.c:1202:12: warning: 'fsmc_nand_resume' defined but not used [-Wunused-function]

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/fsmc_nand.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 911e243..0e5a1d9 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1190,7 +1190,7 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 static int fsmc_nand_suspend(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
@@ -1210,9 +1210,9 @@ static int fsmc_nand_resume(struct device *dev)
 	}
 	return 0;
 }
+#endif
 
 static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
-#endif
 
 #ifdef CONFIG_OF
 static const struct of_device_id fsmc_nand_id_table[] = {
@@ -1229,9 +1229,7 @@ static struct platform_driver fsmc_nand_driver = {
 		.owner = THIS_MODULE,
 		.name = "fsmc-nand",
 		.of_match_table = of_match_ptr(fsmc_nand_id_table),
-#ifdef CONFIG_PM
 		.pm = &fsmc_nand_pm_ops,
-#endif
 	},
 };
 
-- 
1.7.2.5
