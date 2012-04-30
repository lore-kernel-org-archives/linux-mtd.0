Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOuk3-0005fz-BR
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 17:50:31 +0000
From: John Crispin <blogic@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/4] MTD: add m25p80 id for mx25l2005a
Date: Mon, 30 Apr 2012 19:30:45 +0200
Message-Id: <1335807048-24032-1-git-send-email-blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the id and sector mappings for mx25l2005a flash chips.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 1924d24..fcd52ef 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -645,6 +645,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
 
 	/* Macronix */
+	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
 	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
 	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-- 
1.7.9.1
