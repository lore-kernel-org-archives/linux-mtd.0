Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R77nh-0002Ol-7W
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2011 15:36:30 +0000
Received: by eyd9 with SMTP id 9so2821727eyd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Sep 2011 08:36:26 -0700 (PDT)
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/devices/m25p80: add support for at25df321a spi data flash
Date: Fri, 23 Sep 2011 19:36:18 +0400
Message-Id: <1316792178-5592-1-git-send-email-mikhail.kshevetskiy@gmail.com>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 35180e4..12cfce7 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -661,6 +661,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
 
 	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
+	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
 	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
 
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
-- 
1.7.5.4
