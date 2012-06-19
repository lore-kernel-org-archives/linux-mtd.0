Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SgocV-0007G3-DD
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2012 02:56:44 +0000
From: Chunhe Lan <Chunhe.Lan@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: m25p80: Add support for Atmel at45db081d
Date: Tue, 19 Jun 2012 10:55:08 +0800
Message-ID: <1340074508-4393-1-git-send-email-Chunhe.Lan@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dwmw2@infradead.org, Chunhe Lan <Chunhe.Lan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Chunhe Lan <Chunhe.Lan@freescale.com>
---
 drivers/mtd/devices/m25p80.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5d0d68c..6bfb0f8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -633,6 +633,8 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
 	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
 
+	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
+
 	/* EON -- en25xxx */
 	{ "en25f32", INFO(0x1c3116, 0, 64 * 1024,  64, SECT_4K) },
 	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
-- 
1.5.6.5
