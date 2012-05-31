Received: from oproxy5.bluehost.com ([2605:dc00:100:2::a5]
 helo=oproxy5-pub.bluehost.com)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sa7Su-0000it-7T
 for linux-mtd@lists.infradead.org; Thu, 31 May 2012 15:39:09 +0000
From: "ing. Federico Fuga" <fuga@studiofuga.com>
To: 
Subject: [PATCH] MTD: add JEDEC ID for w25q32wd to chip table
Date: Thu, 31 May 2012 17:38:52 +0200
Message-Id: <1338478732-31992-1-git-send-email-fuga@studiofuga.com>
Cc: fuga@studiofuga.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "ing. Federico Fuga" <fuga@studiofuga.com>

Adds JEDEC ID for the 1.8V version of WinBond w25q32

Signed-off-by: Federico Fuga <fuga@studiofuga.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7c60ddd..93ea3c1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -757,6 +757,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "w25q32wd", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
 
-- 
1.7.9.5
