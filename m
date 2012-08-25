Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5IJg-0006oh-2X
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 15:30:28 +0000
From: John Crispin <blogic@openwrt.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] MTD: add en25q64 device id
Date: Sat, 25 Aug 2012 17:28:20 +0200
Message-Id: <1345908500-21921-1-git-send-email-blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trivial patch to add device id and sector/size info for en25q64 spi flash.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5d0d68c..8260bb6 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -638,6 +638,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
 	{ "en25q32b", INFO(0x1c3016, 0, 64 * 1024,  64, 0) },
 	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
+	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, 0) },
 
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
-- 
1.7.9.1
