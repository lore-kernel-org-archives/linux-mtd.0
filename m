Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=VA3EHSOBE010.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTbEC-0002jL-1C
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 15:28:45 +0000
From: Lars-Peter Clausen <lars@metafoo.de>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 06/11] mtd: Remove redundant spi driver bus initialization
Date: Thu, 24 Nov 2011 16:29:16 +0100
Message-ID: <1322148561-25138-6-git-send-email-lars@metafoo.de>
In-Reply-To: <1322148561-25138-1-git-send-email-lars@metafoo.de>
References: <1322148561-25138-1-git-send-email-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In ancient times it was necessary to manually initialize the bus field of an
spi_driver to spi_bus_type. These days this is done in spi_driver_register(),
so we can drop the manual assignment.

The patch was generated using the following coccinelle semantic patch:
// <smpl>
@@
identifier _driver;
@@
struct spi_driver _driver = {
	.driver = {
-		.bus = &spi_bus_type,
	},
};
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/devices/m25p80.c        |    1 -
 drivers/mtd/devices/mtd_dataflash.c |    1 -
 drivers/mtd/devices/sst25l.c        |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 884904d..7c60ddd 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -992,7 +992,6 @@ static int __devexit m25p_remove(struct spi_device *spi)
 static struct spi_driver m25p80_driver = {
 	.driver = {
 		.name	= "m25p80",
-		.bus	= &spi_bus_type,
 		.owner	= THIS_MODULE,
 	},
 	.id_table	= m25p_ids,
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index d75c7af..236057e 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -936,7 +936,6 @@ static int __devexit dataflash_remove(struct spi_device *spi)
 static struct spi_driver dataflash_driver = {
 	.driver = {
 		.name		= "mtd_dataflash",
-		.bus		= &spi_bus_type,
 		.owner		= THIS_MODULE,
 		.of_match_table = dataflash_dt_ids,
 	},
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index d38ef3b..e45f62e 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -444,7 +444,6 @@ static int __devexit sst25l_remove(struct spi_device *spi)
 static struct spi_driver sst25l_driver = {
 	.driver = {
 		.name	= "sst25l",
-		.bus	= &spi_bus_type,
 		.owner	= THIS_MODULE,
 	},
 	.probe		= sst25l_probe,
-- 
1.7.7.1
