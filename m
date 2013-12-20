Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtvI9-00027f-IZ
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 08:18:42 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300B5QJ2INZ50@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 17:18:18 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
In-reply-to: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
Subject: [PATCH 2/4] mtd: fsmc_nand: use dev_warn() instead of printk()
Date: Fri, 20 Dec 2013 17:18:18 +0900
Message-id: <001801cefd5c$09d42640$1d7c72c0$%han@samsung.com>
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
 drivers/mtd/nand/fsmc_nand.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 8b27522..ee65b98 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1108,8 +1108,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
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
@@ -1124,8 +1124,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
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
