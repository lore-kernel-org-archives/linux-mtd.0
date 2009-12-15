Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKZc2-0003DF-68
	for linux-mtd@lists.infradead.org; Tue, 15 Dec 2009 15:47:03 +0000
Received: by bwz4 with SMTP id 4so2975249bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Dec 2009 07:46:55 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 15 Dec 2009 21:16:35 +0530
Message-ID: <ce9ab5790912150746t29be1640g817ab883b16860a3@mail.gmail.com>
Subject: [PATCH] OMAP: NAND: Adding config option to enable/disable HW ECC
	mode
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OMAP NAND driver got HW ECC implemented.

>From d5e28c9fdbc6b0a95c1259fac7add207f9c294d7 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Tue, 15 Dec 2009 21:10:54 +0530
Subject: [PATCH] OMAP: NAND: Adding config option to enable/disable HW ECC mode

This patch adds config option to select/deselect HW ECC feature
on OMAP NAND driver. This is a feature provided by OMAP GPMC for
NAND devices.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 drivers/mtd/nand/Kconfig |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 34598e9..6c4b27c 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -97,6 +97,16 @@ config MTD_NAND_OMAP_PREFETCH_DMA
 	 or in DMA interrupt mode.
 	 Say y for DMA mode or MPU mode will be used

+config MTD_NAND_OMAP_HWECC
+	bool "The Hardware ECC support"
+	depends on MTD_NAND && MTD_NAND_OMAP2
+	default n
+	help
+	 The ECC compuatation for the data to be written/read can be either by
+	 software or omap has Hw ecc engine which calculates it.
+	 MTD_NAND_OMAP_HWECC = y which enables the hw ecc
+	 MTD_NAND_OMAP_HWECC = n enables software ecc
+
 config MTD_NAND_TS7250
 	tristate "NAND Flash device on TS-7250 board"
 	depends on MACH_TS72XX
-- 
1.5.5
