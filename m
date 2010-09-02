Received: from ussvlmgty03.spansion.com ([12.151.36.115])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OrC1C-0003Ic-Sb
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 15:48:04 +0000
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
To: dedekind1@gmail.com,
 linux-mtd@lists.infradead.org
Subject: Re: Re: [PATCH] m25p80: Add support for two new Spansion SPI devices
	(S25FL-K)
In-Reply-To: <1283421228.1748.7.camel@brekeke>
Date: Thu, 2 Sep 2010 17:27:20 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <201009021727.20453.Gernot.Hoyler@spansion.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for Spansion S25FL016K and S25FL064K SPI flash.
It has been tested with physical devices. Note that both parts exhibit
a Winbond manufacturer ID so they might also be added to that section.

Signed-off-by: Gernot Hoyler <Gernot.Hoyler@spansion.com>
---
 drivers/mtd/devices/m25p80.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6f512b5..1f0f703 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -666,6 +666,8 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
+	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
+	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K) },
-- 
1.6.2.2
