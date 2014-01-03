Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyuKj-0005Ij-2f
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 02:17:57 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYS00DCJZP6BSB0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 11:17:30 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH v2] mtd: plat_nand: Remove unnecessary OOM messages
Date: Fri, 03 Jan 2014 11:17:29 +0900
Message-id: <000801cf0829$f3a48300$daed8900$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Vitaly Wool' <vitalywool@gmail.com>
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
Change since v1
- Re-based on the newer version of the patch "mtd: plat_nand:
  Use devm_*() functions".

 drivers/mtd/nand/plat_nand.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index d00e3a7..4ebed72 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -55,10 +55,8 @@ static int plat_nand_probe(struct platform_device *pdev)
 	/* Allocate memory for the device structure (and zero it) */
 	data = devm_kzalloc(&pdev->dev, sizeof(struct plat_nand_data),
 			    GFP_KERNEL);
-	if (!data) {
-		dev_err(&pdev->dev, "failed to allocate device structure.\n");
+	if (!data)
 		return -ENOMEM;
-	}
 
 	data->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(data->io_base))
-- 
1.7.10.4
