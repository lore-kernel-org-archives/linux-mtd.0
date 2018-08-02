Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flF3j-00045S-TM
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2018 14:58:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Mark Brown <broonie@kernel.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com, richard@nod.at, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, frieder.schrempf@exceet.de, pp@emlix.com,
 Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Applied "spi: spi-mem: Fix a typo in the documentation of struct
 spi_mem" to the spi tree
In-Reply-To: <1533214434-28761-2-git-send-email-frieder.schrempf@exceet.de>
Message-Id: <20180802145826.BC5CB1121BE5@debutante.sirena.org.uk>
Date: Thu,  2 Aug 2018 15:58:26 +0100 (BST)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch

   spi: spi-mem: Fix a typo in the documentation of struct spi_mem

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

>From 06bcb5168d7d49aa3ed449ff13a6d13c30afc3f0 Mon Sep 17 00:00:00 2001
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Date: Thu, 2 Aug 2018 14:53:52 +0200
Subject: [PATCH] spi: spi-mem: Fix a typo in the documentation of struct
 spi_mem

Fix a typo in the @drvpriv description.

Signed-off-by: Frieder Schrempf <frieder.schrempf@exceet.de>
Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/spi/spi-mem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index bb4bd15ae1f6..951a2e949d5f 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -122,7 +122,7 @@ struct spi_mem_op {
 /**
  * struct spi_mem - describes a SPI memory device
  * @spi: the underlying SPI device
- * @drvpriv: spi_mem_drviver private data
+ * @drvpriv: spi_mem_driver private data
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
-- 
2.18.0
