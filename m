Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWQ1s-0006RA-DI
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2013 12:16:44 +0000
From: Mark Brown <broonie@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 16 Oct 2013 13:16:14 +0100
Message-Id: <1381925774-10301-1-git-send-email-broonie@kernel.org>
Subject: [PATCH] mtd: dataflash: Say if we find a device we don't support
Cc: linaro-kernel@lists.linaro.org, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mark Brown <broonie@linaro.org>

Ensure that the error message if we identify a flash we don't know how to
talk to is displayed on the console in order to aid diagnostics. While
we're at convert the message to use dev_info() rather than our hand rolled
version of it for consistency.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/mtd/devices/mtd_dataflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 1cfbfcf..4a47b02 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -879,7 +879,7 @@ static int dataflash_probe(struct spi_device *spi)
 		break;
 	/* obsolete AT45DB1282 not (yet?) supported */
 	default:
-		pr_debug("%s: unsupported device (%x)\n", dev_name(&spi->dev),
+		dev_info(&spi->dev, "unsupported device (%x)\n",
 				status & 0x3c);
 		status = -ENODEV;
 	}
-- 
1.8.4.rc3
