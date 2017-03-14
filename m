Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnuDo-0002BW-Nf
 for linux-mtd@lists.infradead.org; Tue, 14 Mar 2017 21:43:15 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Arnd Bergmann <arnd@arndb.de>, Michal Suchanek <hramrach@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] mtd: spi-nor: don't include linux/mtd/cfi.h from header
Date: Tue, 14 Mar 2017 22:42:18 +0100
Message-Id: <20170314214239.3921342-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The newly added broadcom qspi driver in drivers/spi produces a build
warning when CONFIG_MTD is disabled:

include/linux/mtd/cfi.h:76:2: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]

Since drivers like this one don't actually need the cfi.h header,
we can just remove it from the spi-nor.h file and add it to
the only place that actually needs it.

Fixes: fa236a7ef240 ("spi: bcm-qspi: Add Broadcom MSPI driver")
Link: https://patchwork.kernel.org/patch/9334097/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: move definitions as suggested by Ezequiel
---
 drivers/mtd/spi-nor/spi-nor.c | 16 ++++++++++++++++
 include/linux/mtd/spi-nor.h   | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 747645c74134..7d7ad84f739f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -21,8 +21,24 @@
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
 #include <linux/spi/flash.h>
+#include <linux/mtd/cfi.h>
 #include <linux/mtd/spi-nor.h>
 
+/*
+ * Manufacturer IDs
+ *
+ * The first byte returned from the flash after sending opcode SPINOR_OP_RDID.
+ * Sometimes these are the same as CFI IDs, but sometimes they aren't.
+ */
+#define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
+#define SNOR_MFR_GIGADEVICE	0xc8
+#define SNOR_MFR_INTEL		CFI_MFR_INTEL
+#define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
+#define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
+#define SNOR_MFR_SPANSION	CFI_MFR_AMD
+#define SNOR_MFR_SST		CFI_MFR_SST
+#define SNOR_MFR_WINBOND	0xef /* Also used by some Spansion */
+
 /* Define max times to check status register before we give up. */
 
 /*
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f2a718030476..716a8f79784e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -11,25 +11,9 @@
 #define __LINUX_MTD_SPI_NOR_H
 
 #include <linux/bitops.h>
-#include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 
 /*
- * Manufacturer IDs
- *
- * The first byte returned from the flash after sending opcode SPINOR_OP_RDID.
- * Sometimes these are the same as CFI IDs, but sometimes they aren't.
- */
-#define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
-#define SNOR_MFR_GIGADEVICE	0xc8
-#define SNOR_MFR_INTEL		CFI_MFR_INTEL
-#define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
-#define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
-#define SNOR_MFR_SPANSION	CFI_MFR_AMD
-#define SNOR_MFR_SST		CFI_MFR_SST
-#define SNOR_MFR_WINBOND	0xef /* Also used by some Spansion */
-
-/*
  * Note on opcode nomenclature: some opcodes have a format like
  * SPINOR_OP_FUNCTION{4,}_x_y_z. The numbers x, y, and z stand for the number
  * of I/O lines used for the opcode, address, and data (respectively). The
-- 
2.9.0
