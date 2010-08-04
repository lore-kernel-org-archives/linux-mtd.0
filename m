Received: from phoenix3.szarvasnet.hu ([87.101.127.16])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgjQE-0007A2-4l
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 19:14:38 +0000
From: Gabor Juhos <juhosg@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/3] mtd: m25p80: add support for the Winbond W25Q32 SPI flash
	chip
Date: Wed,  4 Aug 2010 21:14:27 +0200
Message-Id: <1280949267-18154-3-git-send-email-juhosg@openwrt.org>
In-Reply-To: <1280949267-18154-1-git-send-email-juhosg@openwrt.org>
References: <1280949267-18154-1-git-send-email-juhosg@openwrt.org>
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
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 57fec6d..8d4ac1b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -716,6 +716,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
-- 
1.5.3.2
