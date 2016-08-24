Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcgKD-0004p5-ED
 for linux-mtd@lists.infradead.org; Wed, 24 Aug 2016 22:07:10 +0000
Received: by mail-pf0-x244.google.com with SMTP id y134so1945164pfg.3
 for <linux-mtd@lists.infradead.org>; Wed, 24 Aug 2016 15:06:49 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com,
 yendapally.reddy@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v6,
 5/8] mtd: m25p80: Let m25p80_read() fallback to spi transfer
Date: Wed, 24 Aug 2016 18:04:26 -0400
Message-Id: <1472076269-4731-6-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In m25p80_read() even though spi_flash_read() is supported
by some drivers, under certain circumstances like unaligned
buffer, address or address range limitations on certain SoCs
let it fallback to core spi reads. Such drivers are expected
to return -EAGAIN so that the m25p80_read() uses standard
spi transfer.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd..77c2d2c 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -155,9 +155,16 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 		msg.data_nbits = m25p80_rx_nbits(nor);
 
 		ret = spi_flash_read(spi, &msg);
-		if (ret < 0)
+
+		if (ret >= 0)
+			return msg.retlen;
+
+		/*
+		 * some spi master drivers might need to fallback to
+		 * normal spi transfer
+		 */
+		if (ret != -EAGAIN)
 			return ret;
-		return msg.retlen;
 	}
 
 	spi_message_init(&m);
-- 
1.9.1
