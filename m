Received: from phoenix3.szarvasnet.hu ([87.101.127.16])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgjQB-00078C-Lt
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 19:14:36 +0000
From: Gabor Juhos <juhosg@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/3] mtd: m25p80: add support for the EON EN25P{32,
	64} SPI flash chips
Date: Wed,  4 Aug 2010 21:14:25 +0200
Message-Id: <1280949267-18154-1-git-send-email-juhosg@openwrt.org>
Cc: Gabor Juhos <juhosg@openwrt.org>, linux-mtd@lists.infradead.org
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
 drivers/mtd/devices/m25p80.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 48bf325..21d866c 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -641,6 +641,10 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
 	{ "at26df321",  INFO(0x1f4701, 0, 64 * 1024, 64, SECT_4K) },
 
+	/* EON -- en25pxx */
+	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
+	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
+
 	/* Macronix */
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
-- 
1.5.3.2
