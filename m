Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zljoz-0007Af-VX
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 20:35:50 +0000
Received: by padhy16 with SMTP id hy16so162514532pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 13:35:29 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Han Xu <han.xu@freescale.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/2] mtd: fsl-quadspi: fix printk() format warning for size_t
Date: Mon, 12 Oct 2015 13:35:15 -0700
Message-Id: <1444682116-4708-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Seen when compile-testing on non-32-bit arch:

    CC      drivers/mtd/spi-nor/fsl-quadspi.o
  drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_read':
  drivers/mtd/spi-nor/fsl-quadspi.c:873:2: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t' [-Wformat=]
    dev_dbg(q->dev, "cmd [%x],read from 0x%p, len:%d\n",
    ^

Also drop the '0x' prefixing to the '%p' formatter, since %p already
knows how to format pointers appropriately.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Han Xu <han.xu@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2954f89fc8be..ca259faf4591 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -868,7 +868,7 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
 		}
 	}
 
-	dev_dbg(q->dev, "cmd [%x],read from 0x%p, len:%d\n",
+	dev_dbg(q->dev, "cmd [%x],read from %p, len:%zd\n",
 		cmd, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
 		len);
 
-- 
2.6.0.rc2.230.g3dd15c0
