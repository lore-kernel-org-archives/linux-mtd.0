Received: from arrakis.dune.hu ([78.24.191.176])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5YLl-00030O-Br
 for linux-mtd@lists.infradead.org; Sun, 26 Aug 2012 08:37:41 +0000
From: Gabor Juhos <juhosg@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: m25p80: add support for the EON EN25Q64 chip
Date: Sun, 26 Aug 2012 10:37:31 +0200
Message-Id: <1345970251-2029-1-git-send-email-juhosg@openwrt.org>
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
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5d0d68c..d812552 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -638,6 +638,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
 	{ "en25q32b", INFO(0x1c3016, 0, 64 * 1024,  64, 0) },
 	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
+	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
-- 
1.7.10
