Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmCvQ-000482-C9
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 03:40:25 +0000
Received: by ykfy204 with SMTP id y204so13560345ykf.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 20:40:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Cc: han.xu@freescale.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH] mtd: fsl-quadspi: Include <linux/sizes.h> to avoid build error
Date: Wed, 14 Oct 2015 00:39:44 -0300
Message-Id: <1444793984-21655-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Building for x86 results in the following build errors:

   drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_init_lut':
>> drivers/mtd/spi-nor/fsl-quadspi.c:355:21: error: 'SZ_16M' undeclared (first use in this function)
     if (q->nor_size <= SZ_16M) {
                        ^
   drivers/mtd/spi-nor/fsl-quadspi.c:355:21: note: each undeclared identifier is reported only once for each function it appears in
   drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_read':
>> drivers/mtd/spi-nor/fsl-quadspi.c:208:27: error: 'SZ_4M' undeclared (first use in this function)
    #define QUADSPI_MIN_IOMAP SZ_4M
                              ^
>> drivers/mtd/spi-nor/fsl-quadspi.c:845:25: note: in expansion of macro 'QUADSPI_MIN_IOMAP'
      q->memmap_len = len > QUADSPI_MIN_IOMAP ? len : QUADSPI_MIN_IOMAP;

Explicitly include <linux/sizes.h> to fix the problem.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2954f89..1af0e1d 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -28,6 +28,7 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 #include <linux/pm_qos.h>
+#include <linux/sizes.h>
 
 /* Controller needs driver to swap endian */
 #define QUADSPI_QUIRK_SWAP_ENDIAN	(1 << 0)
-- 
1.9.1
