Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4593-0004L1-NS
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 08:19:02 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQQ00BYRPR9WLT0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 17:18:54 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 'Jingoo Han' <jg1.han@samsung.com>
Subject: [PATCH 32/35] mtd: onenand: use dev_get_platdata()
Date: Tue, 30 Jul 2013 17:18:53 +0900
Message-id: <005b01ce8cfd$6de2fcd0$49a8f670$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the wrapper function for retrieving the platform data instead of
accessing dev->platform_data directly.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/onenand/generic.c |    2 +-
 drivers/mtd/onenand/omap2.c   |    2 +-
 drivers/mtd/onenand/samsung.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 42520a3..63699ff 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -38,7 +38,7 @@ struct onenand_info {
 static int generic_onenand_probe(struct platform_device *pdev)
 {
 	struct onenand_info *info;
-	struct onenand_platform_data *pdata = pdev->dev.platform_data;
+	struct onenand_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct resource *res = pdev->resource;
 	unsigned long size = resource_size(res);
 	int err;
diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index cd43cea..558071b 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -639,7 +639,7 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct mtd_part_parser_data ppdata = {};
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	if (pdata == NULL) {
 		dev_err(&pdev->dev, "platform data missing\n");
 		return -ENODEV;
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index cebc48d..df7400d 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -867,7 +867,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	struct resource *r;
 	int size, err;
 
-	pdata = pdev->dev.platform_data;
+	pdata = dev_get_platdata(&pdev->dev);
 	/* No need to check pdata. the platform data is optional */
 
 	size = sizeof(struct mtd_info) + sizeof(struct onenand_chip);
-- 
1.7.10.4
