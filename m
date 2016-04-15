Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar9qb-00055A-33
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 19:56:09 +0000
Received: by mail-wm0-x22c.google.com with SMTP id n3so46880521wmn.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 12:55:48 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 09/12] mtd: nand: fsmc: validate ECC setup by checking
 algorithm directly
Date: Fri, 15 Apr 2016 21:54:09 +0200
Message-Id: <1460750052-16285-10-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND core sets ECC algorithm in algo field now and it should be
preferred over the mode field. This also prepares driver for dropping
NAND_ECC_SOFT_BCH.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/fsmc_nand.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1372040..0f8c63f 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -958,9 +958,12 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 			nand->ecc.strength = 1;
 			break;
 
+		case NAND_ECC_SOFT:
 		case NAND_ECC_SOFT_BCH:
-			dev_info(&pdev->dev, "Using 4-bit SW BCH ECC scheme\n");
-			break;
+			if (nand->ecc.algo == NAND_ECC_BCH) {
+				dev_info(&pdev->dev, "Using 4-bit SW BCH ECC scheme\n");
+				break;
+			}
 
 		default:
 			dev_err(&pdev->dev, "Unsupported ECC mode!\n");
-- 
1.8.4.5
