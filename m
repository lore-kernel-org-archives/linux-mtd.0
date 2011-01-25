Received: from phoenix3.szarvasnet.hu ([87.101.127.16])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Phg0n-0007Pa-HM
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 10:20:34 +0000
From: Gabor Juhos <juhosg@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: m25p80: add support for the EON EN25F32 chip
Date: Tue, 25 Jan 2011 11:20:26 +0100
Message-Id: <1295950826-20255-1-git-send-email-juhosg@openwrt.org>
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
 drivers/mtd/devices/m25p80.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index e4eba6c..8d83a8b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -655,7 +655,8 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
 	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
 
-	/* EON -- en25pxx */
+	/* EON -- en25xxx */
+	{ "en25f32", INFO(0x1c3116, 0, 64 * 1024,  64, SECT_4K) },
 	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
 	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
 
-- 
1.7.2.1
