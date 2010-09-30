Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1HGX-0004AX-7A
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 11:25:35 +0000
From: David Jander <david.jander@protonic.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: m25p80.c: Add support for S25FL032P spi-nor flash
	devices.
Date: Thu, 30 Sep 2010 13:26:02 +0200
Message-Id: <1285845962-29597-1-git-send-email-david.jander@protonic.nl>
Cc: David Jander <david@protonic.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Jander <david@protonic.nl>

Signed-off-by: David Jander <david@protonic.nl>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 6f512b5..305f1be 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -661,6 +661,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
 	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
 	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
+	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SECT_4K) },
 	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-- 
1.6.3.3
