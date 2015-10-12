Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlkKC-0005Av-LZ
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 21:08:05 +0000
Received: by padhy16 with SMTP id hy16so163106413pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 14:07:43 -0700 (PDT)
Date: Mon, 12 Oct 2015 14:07:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 2/2] mtd: pxa3xx_nand: switch to device PM
Message-ID: <20151012210741.GN107187@google.com>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <1444681992-4208-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444681992-4208-2-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 12, 2015 at 01:33:12PM -0700, Brian Norris wrote:
> The old PM model is deprecated. This is equivalent.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Sorry, this patch was garbage. Below is the correct one:

---

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index cce5a32eef60..51b67ae5ac1c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1889,21 +1889,21 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
+static int pxa3xx_nand_suspend(struct device *dev)
 {
-	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info = dev_get_drvdata(dev);
 
 	if (info->state) {
-		dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
+		dev_err(dev, "driver busy, state = %d\n", info->state);
 		return -EAGAIN;
 	}
 
 	return 0;
 }
 
-static int pxa3xx_nand_resume(struct platform_device *pdev)
+static int pxa3xx_nand_resume(struct device *dev)
 {
-	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info = dev_get_drvdata(dev);
 
 	/* We don't want to handle interrupt without calling mtd routine */
 	disable_int(info, NDCR_INT_MASK);
@@ -1930,15 +1930,19 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
 #define pxa3xx_nand_resume	NULL
 #endif
 
+static const struct dev_pm_ops pxa3xx_nand_pm_ops = {
+	.suspend	= pxa3xx_nand_suspend,
+	.resume		= pxa3xx_nand_resume,
+};
+
 static struct platform_driver pxa3xx_nand_driver = {
 	.driver = {
 		.name	= "pxa3xx-nand",
 		.of_match_table = pxa3xx_nand_dt_ids,
+		.pm	= &pxa3xx_nand_pm_ops,
 	},
 	.probe		= pxa3xx_nand_probe,
 	.remove		= pxa3xx_nand_remove,
-	.suspend	= pxa3xx_nand_suspend,
-	.resume		= pxa3xx_nand_resume,
 };
 
 module_platform_driver(pxa3xx_nand_driver);
-- 
2.6.0.rc2.230.g3dd15c0
