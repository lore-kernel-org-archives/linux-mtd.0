Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1fo-0003nQ-CH
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:31:49 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE008819SE3X40@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:31:26 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
In-reply-to: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
Subject: [PATCH V2 2/4] mtd: fsmc_nand: use dev_warn() instead of printk()
Date: Thu, 26 Dec 2013 12:31:25 +0900
Message-id: <009d01cf01ea$f4ef4410$decdcc30$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Linus Walleij' <linus.walleij@linaro.org>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use dev_warn() instead of printk() to provide a better message
to userspace.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
No changes since v1.

 drivers/mtd/nand/fsmc_nand.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index a5915f1..1550692 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1104,8 +1104,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 			host->ecc_place = &fsmc_ecc4_lp_place;
 			break;
 		default:
-			printk(KERN_WARNING "No oob scheme defined for "
-			       "oobsize %d\n", mtd->oobsize);
+			dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
+				 mtd->oobsize);
 			BUG();
 		}
 	} else {
@@ -1120,8 +1120,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 			nand->ecc.layout = &fsmc_ecc1_128_layout;
 			break;
 		default:
-			printk(KERN_WARNING "No oob scheme defined for "
-			       "oobsize %d\n", mtd->oobsize);
+			dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
+				 mtd->oobsize);
 			BUG();
 		}
 	}
-- 
1.7.10.4
