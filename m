Received: from mail-wg0-x241.google.com ([2a00:1450:400c:c00::241])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmc-00056T-A4
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:39 +0000
Received: by wggx12 with SMTP id x12so8976352wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:12 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 05/60] mtd: devices: m25p80: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:19 +0200
Message-Id: <1433968754-10651-6-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3af137f..dfa6ee0 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -206,6 +206,7 @@ static int m25p_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, flash);
 	flash->mtd.priv = nor;
+	flash->mtd.dev.parent = &spi->dev;
 	flash->spi = spi;
 
 	if (spi->mode & SPI_RX_QUAD)
-- 
2.4.0
