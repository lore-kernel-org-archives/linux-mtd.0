Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWriA-0002wE-Re
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:19 +0000
Received: by pacfv12 with SMTP id fv12so5914871pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:58:58 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 03/10] mtd: spi-nor: add SPI NOR manufacturer IDs
Date: Tue,  1 Sep 2015 12:57:08 -0700
Message-Id: <1441137435-52862-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These are often similar for CFI (parallel NOR) and for SPI NOR, but they
aren't always the same, for various reasons (different namespaces,
company acquisitions and renames, etc.). And some don't have CFI_MFR_*
entries at all.

So let's make a proper place to list the SPI NOR IDs, with all the SPI
NOR specific assumptions and comments.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/spi-nor.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 321a055bc266..8558793cc0f7 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -11,6 +11,21 @@
 #define __LINUX_MTD_SPI_NOR_H
 
 #include <linux/bitops.h>
+#include <linux/mtd/cfi.h>
+
+/*
+ * Manufacturer IDs
+ *
+ * The first byte returned from the flash after sending opcode SPINOR_OP_RDID.
+ * Sometimes these are the same as CFI IDs, but sometimes they aren't.
+ */
+#define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
+#define SNOR_MFR_INTEL		CFI_MFR_INTEL
+#define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
+#define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
+#define SNOR_MFR_SPANSION	CFI_MFR_AMD
+#define SNOR_MFR_SST		CFI_MFR_SST
+#define SNOR_MFR_WINBOND	0xef
 
 /*
  * Note on opcode nomenclature: some opcodes have a format like
-- 
2.5.0.457.gab17608
