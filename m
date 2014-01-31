Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W9DNp-0006v1-C6
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2014 12:39:46 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH] nand,flctl: Add dependency on HAS_IOMEM and HAS_DMA
Date: Fri, 31 Jan 2014 13:39:07 +0100
Message-Id: <1391171947-17638-1-git-send-email-richard@nod.at>
Cc: jussi.kivilinna@iki.fi, shc_work@mail.ru, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, acourbot@nvidia.com, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, Richard Weinberger <richard@nod.at>,
 ivan.khoronzhuk@ti.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On archs like S390 or um this driver cannot build nor work.
Make it depend on HAS_IOMEM and HAS_DMA to bypass build failures.

drivers/built-in.o: In function `flctl_probe':
drivers/mtd/nand/sh_flctl.c:1097: undefined reference to `devm_ioremap_resource'
drivers/built-in.o: In function `flctl_dma_fifo0_transfer':
drivers/mtd/nand/sh_flctl.c:368: undefined reference to `dma_map_single'
drivers/mtd/nand/sh_flctl.c:407: undefined reference to `dma_unmap_single'

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 90ff447..a5bb738 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -459,6 +459,8 @@ config MTD_NAND_MXC
 config MTD_NAND_SH_FLCTL
 	tristate "Support for NAND on Renesas SuperH FLCTL"
 	depends on SUPERH || ARCH_SHMOBILE || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on HAS_DMA
 	help
 	  Several Renesas SuperH CPU has FLCTL. This option enables support
 	  for NAND Flash using FLCTL.
-- 
1.8.1.4
