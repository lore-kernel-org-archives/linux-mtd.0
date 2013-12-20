Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtvKw-0002Ez-EK
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 08:21:35 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY30019MJ6R9860@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 17:20:51 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
In-reply-to: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
Subject: [PATCH 3/4] mtd: orion_nand: use dev_err() instead of printk()
Date: Fri, 20 Dec 2013 17:20:50 +0900
Message-id: <001901cefd5c$644dec50$2ce9c4f0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Andrew Lunn' <andrew@lunn.ch>
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
 drivers/mtd/nand/orion_nand.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index a393a5b..7cd9aed 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -87,7 +87,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
 	if (!nc) {
-		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");
+		dev_err(&pdev->dev, "orion_nand: failed to allocate device structure.\n");
 		ret = -ENOMEM;
 		goto no_res;
 	}
@@ -101,7 +101,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	io_base = ioremap(res->start, resource_size(res));
 	if (!io_base) {
-		printk(KERN_ERR "orion_nand: ioremap failed\n");
+		dev_err(&pdev->dev, "orion_nand: ioremap failed\n");
 		ret = -EIO;
 		goto no_res;
 	}
@@ -110,7 +110,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		board = devm_kzalloc(&pdev->dev, sizeof(struct orion_nand_data),
 					GFP_KERNEL);
 		if (!board) {
-			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");
+			dev_err(&pdev->dev, "orion_nand: failed to allocate board structure.\n");
 			ret = -ENOMEM;
 			goto no_res;
 		}
-- 
1.7.10.4
