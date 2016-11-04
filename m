Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bwQ-000634-Cg
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:48 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 09/22] mtd: nand: plat_nand: return error code of nand_scan()
 on error
Date: Fri,  4 Nov 2016 19:42:57 +0900
Message-Id: <1478256190-7452-10-git-send-email-yamada.masahiro@socionext.com>
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

The nand_scan() returns an appropriate error value when it fails.
Use it instead of the fixed error code -ENXIO.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/plat_nand.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 415a53a..791de3e 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -86,10 +86,9 @@ static int plat_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Scan to find existence of the device */
-	if (nand_scan(mtd, pdata->chip.nr_chips)) {
-		err = -ENXIO;
+	err = nand_scan(mtd, pdata->chip.nr_chips);
+	if (err)
 		goto out;
-	}
 
 	part_types = pdata->chip.part_probe_types;
 
-- 
1.9.1
