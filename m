Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bwQ-000635-CQ
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:48 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 12/22] mtd: nand: fsmc: return error code of
 nand_scan_ident/tail() on error
Date: Fri,  4 Nov 2016 19:43:00 +0900
Message-Id: <1478256190-7452-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_scan_ident/tail() returns an appropriate error value when
it fails.  Use it instead of the fixed error code -ENXIO.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/fsmc_nand.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index d4f454a..4924b43 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -926,8 +926,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	/*
 	 * Scan to find existence of the device
 	 */
-	if (nand_scan_ident(mtd, 1, NULL)) {
-		ret = -ENXIO;
+	ret = nand_scan_ident(mtd, 1, NULL);
+	if (ret) {
 		dev_err(&pdev->dev, "No NAND Device found!\n");
 		goto err_scan_ident;
 	}
@@ -992,10 +992,9 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Second stage of scan to fill MTD data-structures */
-	if (nand_scan_tail(mtd)) {
-		ret = -ENXIO;
+	ret = nand_scan_tail(mtd);
+	if (ret)
 		goto err_probe;
-	}
 
 	/*
 	 * The partition information can is accessed by (in the same precedence)
-- 
1.9.1
