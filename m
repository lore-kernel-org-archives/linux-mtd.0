Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ONNu6-0002wR-Np
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 10:25:31 +0000
Received: by wyb36 with SMTP id 36so1920712wyb.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 12 Jun 2010 03:25:27 -0700 (PDT)
From: Karl Beldan <karl.beldan@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: denali: add Kconfig dependency
Date: Sat, 12 Jun 2010 12:25:13 +0200
Message-Id: <1276338313-12224-1-git-send-email-karl.beldan@gmail.com>
Cc: Karl Beldan <karl.beldan@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
---
 drivers/mtd/nand/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index ffc3720..8fe82c8 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -61,6 +61,7 @@ config MTD_NAND_DENALI
 config MTD_NAND_DENALI_SCRATCH_REG_ADDR
         hex "Denali NAND size scratch register address"
         default "0xFF108018"
+        depends on MTD_NAND_DENALI
         help
           Some platforms place the NAND chip size in a scratch register
           because (some versions of) the driver aren't able to automatically
-- 
1.7.0.2.323.g0d092
