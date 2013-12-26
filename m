Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1gv-0003rU-5X
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:32:58 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE003IE9U7J840@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:32:31 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
In-reply-to: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
Subject: [PATCH V2 4/4] mtd: sharpsl: use dev_err() instead of printk()
Date: Thu, 26 Dec 2013 12:32:29 +0900
Message-id: <009f01cf01eb$1af59c40$50e0d4c0$%han@samsung.com>
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
Change since v1
- Remove the site-specific OOM messages.

 drivers/mtd/nand/sharpsl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 61a85ab..e81059b 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -134,7 +134,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
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
