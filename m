Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSJxT-0000cG-6d
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 07:08:19 +0000
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
 Mark Brown <broonie@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 03/18] mtd: dataflash: Export OF module alias information
Date: Thu, 20 Aug 2015 09:07:16 +0200
Message-Id: <1440054451-1223-4-git-send-email-javier@osg.samsung.com>
In-Reply-To: <1440054451-1223-1-git-send-email-javier@osg.samsung.com>
References: <1440054451-1223-1-git-send-email-javier@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The SPI core always reports the MODALIAS uevent as "spi:<modalias>"
regardless of the mechanism that was used to register the device
(i.e: OF or board code) and the table that is used later to match
the driver with the device (i.e: SPI id table or OF match table).

So drivers needs to export the SPI id table and this be built into
the module or udev won't have the necessary information to autoload
the needed driver module when the device is added.

But this means that OF-only drivers needs to have both OF and SPI id
tables that have to be kept in sync and also the dev node compatible
manufacturer prefix is stripped when reporting the MODALIAS. Which can
lead to issues if two vendors use the same SPI device name for example.

To avoid the above, the SPI core behavior may be changed in the future
to not require an SPI device table for OF-only drivers and report the
OF module alias. So, it's better to also export the OF table even when
is unused now to prevent breaking module loading when the core changes.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/mtd/devices/mtd_dataflash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 0099aba72a8b..df6f61137376 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -102,6 +102,7 @@ static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,dataflash", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, dataflash_dt_ids);
 #endif
 
 /* ......................................................................... */
-- 
2.4.3
