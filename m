Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bw1-0005Os-MU
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:23 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 06/22] mtd: nand: tmio: return error code of nand_scan() on
 error
Date: Fri,  4 Nov 2016 19:42:54 +0900
Message-Id: <1478256190-7452-7-git-send-email-yamada.masahiro@socionext.com>
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
Use it instead of the fixed error code -ENODEV.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/tmio_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 08b3054..fc5e773 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -435,10 +435,10 @@ static int tmio_probe(struct platform_device *dev)
 	nand_chip->waitfunc = tmio_nand_wait;
 
 	/* Scan to find existence of the device */
-	if (nand_scan(mtd, 1)) {
-		retval = -ENODEV;
+	retval = nand_scan(mtd, 1);
+	if (retval)
 		goto err_irq;
-	}
+
 	/* Register the partitions */
 	retval = mtd_device_parse_register(mtd, NULL, NULL,
 					   data ? data->partition : NULL,
-- 
1.9.1
