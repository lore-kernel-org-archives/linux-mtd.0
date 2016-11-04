Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c2bw6-0005U9-B5
 for linux-mtd@lists.infradead.org; Fri, 04 Nov 2016 10:41:29 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 18/22] mtd: nand: cafe: return error code of nand_scan_ident()
 on error
Date: Fri,  4 Nov 2016 19:43:06 +0900
Message-Id: <1478256190-7452-19-git-send-email-yamada.masahiro@socionext.com>
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

The nand_scan_ident() returns an appropriate error value when it
fails.  Use it instead of the fixed error code -ENXIO.
(This driver is already doing so for nand_scan_tail().)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/cafe_nand.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 0b0c937..d40c32d 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -725,10 +725,9 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	usedma = 0;
 
 	/* Scan to find existence of the device */
-	if (nand_scan_ident(mtd, 2, NULL)) {
-		err = -ENXIO;
+	err = nand_scan_ident(mtd, 2, NULL);
+	if (err)
 		goto out_irq;
-	}
 
 	cafe->dmabuf = dma_alloc_coherent(&cafe->pdev->dev,
 				2112 + sizeof(struct nand_buffers) +
-- 
1.9.1
