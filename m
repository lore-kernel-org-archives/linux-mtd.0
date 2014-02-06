Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBIFm-0003db-3h
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:16:03 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K00LHI9E3M630@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:15:39 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
In-reply-to: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Subject: [PATCH 6/8] mtd: onenand: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:15:38 +0900
Message-id: <000801cf2302$db0ef110$912cd330$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |    7 +------
 drivers/mtd/onenand/samsung.c      |    4 +---
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 531ccbc..e886d7a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3994,11 +3994,8 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	/* Allocate buffers, if necessary */
 	if (!this->page_buf) {
 		this->page_buf = kzalloc(mtd->writesize, GFP_KERNEL);
-		if (!this->page_buf) {
-			printk(KERN_ERR "%s: Can't allocate page_buf\n",
-				__func__);
+		if (!this->page_buf)
 			return -ENOMEM;
-		}
 #ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
 		this->verify_buf = kzalloc(mtd->writesize, GFP_KERNEL);
 		if (!this->verify_buf) {
@@ -4011,8 +4008,6 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	if (!this->oob_buf) {
 		this->oob_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
 		if (!this->oob_buf) {
-			printk(KERN_ERR "%s: Can't allocate oob_buf\n",
-				__func__);
 			if (this->options & ONENAND_PAGEBUF_ALLOC) {
 				this->options &= ~ONENAND_PAGEBUF_ALLOC;
 				kfree(this->page_buf);
diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index df7400d..b1a792f 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -872,10 +872,8 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 
 	size = sizeof(struct mtd_info) + sizeof(struct onenand_chip);
 	mtd = kzalloc(size, GFP_KERNEL);
-	if (!mtd) {
-		dev_err(&pdev->dev, "failed to allocate memory\n");
+	if (!mtd)
 		return -ENOMEM;
-	}
 
 	onenand = kzalloc(sizeof(struct s3c_onenand), GFP_KERNEL);
 	if (!onenand) {
-- 
1.7.10.4
