Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bwR-00036Z-8E
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:49 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Josh Wu <rainyfeeling@outlook.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 10/22] mtd: nand: atmel: return error code of
 nand_scan_ident/tail() on error
Date: Fri,  4 Nov 2016 19:42:58 +0900
Message-Id: <1478256190-7452-11-git-send-email-yamada.masahiro@socionext.com>
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

 drivers/mtd/nand/atmel_nand.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 68b9160..9ebd5ec 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2267,10 +2267,9 @@ static int atmel_nand_probe(struct platform_device *pdev)
 		dev_info(host->dev, "No DMA support for NAND access.\n");
 
 	/* first scan to find the device and get the page size */
-	if (nand_scan_ident(mtd, 1, NULL)) {
-		res = -ENXIO;
+	res = nand_scan_ident(mtd, 1, NULL);
+	if (res)
 		goto err_scan_ident;
-	}
 
 	if (host->board.on_flash_bbt || on_flash_bbt)
 		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
@@ -2304,10 +2303,9 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	}
 
 	/* second phase scan */
-	if (nand_scan_tail(mtd)) {
-		res = -ENXIO;
+	res = nand_scan_tail(mtd);
+	if (res)
 		goto err_scan_tail;
-	}
 
 	mtd->name = "atmel_nand";
 	res = mtd_device_register(mtd, host->board.parts,
-- 
1.9.1
