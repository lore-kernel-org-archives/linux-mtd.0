Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1gE-0003od-Ch
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:32:15 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE007109T4MX50@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:31:52 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
In-reply-to: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
Subject: [PATCH V2 3/4] mtd: orion_nand: use dev_err() instead of printk()
Date: Thu, 26 Dec 2013 12:31:52 +0900
Message-id: <009e01cf01eb$048cc370$0da64a50$%han@samsung.com>
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
Change since v1
- Remove the site-specific OOM messages.

 drivers/mtd/nand/orion_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index a6a4a20..dd7fe81 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -100,7 +100,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	io_base = ioremap(res->start, resource_size(res));
 	if (!io_base) {
-		printk(KERN_ERR "orion_nand: ioremap failed\n");
+		dev_err(&pdev->dev, "ioremap failed\n");
 		ret = -EIO;
 		goto no_res;
 	}
-- 
1.7.10.4
