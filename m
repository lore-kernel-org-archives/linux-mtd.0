Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bw6-0005UA-Aq
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:29 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 16/22] mtd: nand: omap2: return error code of
 nand_scan_ident/tail() on error
Date: Fri,  4 Nov 2016 19:43:04 +0900
Message-Id: <1478256190-7452-17-git-send-email-yamada.masahiro@socionext.com>
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

 drivers/mtd/nand/omap2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 5513bfd9..6c985d3 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1895,10 +1895,10 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 	/* scan NAND device connected to chip controller */
 	nand_chip->options |= info->devsize & NAND_BUSWIDTH_16;
-	if (nand_scan_ident(mtd, 1, NULL)) {
+	err = nand_scan_ident(mtd, 1, NULL);
+	if (err) {
 		dev_err(&info->pdev->dev,
 			"scan failed, may be bus-width mismatch\n");
-		err = -ENXIO;
 		goto return_error;
 	}
 
@@ -2154,10 +2154,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 
 scan_tail:
 	/* second phase scan */
-	if (nand_scan_tail(mtd)) {
-		err = -ENXIO;
+	err = nand_scan_tail(mtd);
+	if (err)
 		goto return_error;
-	}
 
 	if (dev->of_node)
 		mtd_device_register(mtd, NULL, 0);
-- 
1.9.1
