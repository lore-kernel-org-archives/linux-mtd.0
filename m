Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnjVP-0002xz-0i
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 10:48:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, ralf@linux-mips.org,
 linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, john@phrozen.org,
 linux-spi@vger.kernel.org, hauke.mehrtens@intel.com, linux-spi@vger.kernel.org
Subject: Applied "spi: spi-falcon: drop check of boot select" to the spi tree
In-Reply-To: <20170417192942.32219-4-hauke@hauke-m.de>
Message-Id: <E1dnjTy-0006AD-Ox@debutante>
Date: Fri, 01 Sep 2017 11:47:26 +0100
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch

   spi: spi-falcon: drop check of boot select

has been applied to the spi tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 1a41aa1376df9e24d0c760df1a6f59765316c457 Mon Sep 17 00:00:00 2001
From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Sun, 20 Aug 2017 00:18:10 +0200
Subject: [PATCH] spi: spi-falcon: drop check of boot select

Do not check which flash type the SoC was booted from before
using this driver. Assume that the device tree is correct and use this
driver when it was added to device tree. This also removes a build
dependency to the SoC code.

All device trees I am aware of only have one correct flash device entry
in it. The device tree is anyway bundled with the kernel in all systems
using device tree I know of.

The boot mode can be specified with some pin straps and will select the
flash type the rom code will boot from. One SPI, NOR or NAND flash chip
can be connect to the EBU and used to load the first stage boot loader
from.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-falcon.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/spi/spi-falcon.c b/drivers/spi/spi-falcon.c
index 286b2c81fc6b..f8638e82e5db 100644
--- a/drivers/spi/spi-falcon.c
+++ b/drivers/spi/spi-falcon.c
@@ -395,11 +395,6 @@ static int falcon_sflash_probe(struct platform_device *pdev)
 	struct spi_master *master;
 	int ret;
 
-	if (ltq_boot_select() != BS_SPI) {
-		dev_err(&pdev->dev, "invalid bootstrap options\n");
-		return -ENODEV;
-	}
-
 	master = spi_alloc_master(&pdev->dev, sizeof(*priv));
 	if (!master)
 		return -ENOMEM;
-- 
2.14.1
