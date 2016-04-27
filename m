Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avWD6-0001BQ-Pg
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 20:37:25 +0000
Received: by mail-wm0-x22e.google.com with SMTP id g17so9148843wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 13:37:03 -0700 (PDT)
To: Brian Norris <computersforpeace@gmail.com>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mtd: m25p80: add message if mmap flash read is supported
Message-ID: <9111b023-d1e5-3084-4320-acf727e828f4@gmail.com>
Date: Wed, 27 Apr 2016 22:36:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As a follow-up to commit 08922f644878c9 "mtd: devices: m25p80: add support for
mmap read request" add an info to syslog if mmap flash read is supported for a
device.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9d68544..433b100 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -233,6 +233,9 @@ static int m25p_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	if (spi_flash_read_supported(spi))
+		dev_info(&spi->dev, "memory-mapped flash read supported\n");
+
 	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
 				   data ? data->nr_parts : 0);
 }
-- 
2.8.0
