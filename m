Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtvMB-0002HQ-6q
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 08:22:53 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300IJ8J9AXC50@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 17:22:22 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
In-reply-to: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
Subject: [PATCH 4/4] mtd: sharpsl: use dev_err() instead of printk()
Date: Fri, 20 Dec 2013 17:22:21 +0900
Message-id: <001a01cefd5c$9ae80ac0$d0b82040$%han@samsung.com>
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

Use dev_err() instead of printk() to provide a better message
to userspace.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/sharpsl.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 87908d7..8522f33 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -122,7 +122,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Allocate memory for MTD device structure and private data */
 	sharpsl = kzalloc(sizeof(struct sharpsl_nand), GFP_KERNEL);
 	if (!sharpsl) {
-		printk("Unable to allocate SharpSL NAND MTD device structure.\n");
+		dev_err(&pdev->dev, "Unable to allocate SharpSL NAND MTD device structure.\n");
 		return -ENOMEM;
 	}
 
@@ -136,7 +136,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* map physical address */
 	sharpsl->io = ioremap(r->start, resource_size(r));
 	if (!sharpsl->io) {
-		printk("ioremap to access Sharp SL NAND chip failed\n");
+		dev_err(&pdev->dev, "ioremap to access Sharp SL NAND chip failed\n");
 		err = -EIO;
 		goto err_ioremap;
 	}
-- 
1.7.10.4
