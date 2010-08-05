Received: from phoenix3.szarvasnet.hu ([87.101.127.16])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh1uN-00041o-Ce
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 14:58:59 +0000
From: Gabor Juhos <juhosg@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 2/3] mtd: m25p80: add support for the Intel/Numonyx {16, 32,
	64}0S33B SPI flash chips
Date: Thu,  5 Aug 2010 16:58:36 +0200
Message-Id: <1281020316-20393-1-git-send-email-juhosg@openwrt.org>
Cc: Gabor Juhos <juhosg@openwrt.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
---
Changes since v1:
  - fix number of erase sectors

 drivers/mtd/devices/m25p80.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 21d866c..8120cf3 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -645,6 +645,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
 	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
 
+	/* Intel/Numonyx -- xxxs33b */
+	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
+	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
+	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
+
 	/* Macronix */
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
@@ -834,11 +839,12 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	dev_set_drvdata(&spi->dev, flash);
 
 	/*
-	 * Atmel and SST serial flash tend to power
+	 * Atmel, SST and Intel/Numonyx serial flash tend to power
 	 * up with the software protection bits set
 	 */
 
 	if (info->jedec_id >> 16 == 0x1f ||
+	    info->jedec_id >> 16 == 0x89 ||
 	    info->jedec_id >> 16 == 0xbf) {
 		write_enable(flash);
 		write_sr(flash, 0);
-- 
1.7.2.1
