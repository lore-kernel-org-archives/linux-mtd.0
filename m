Received: from mail-qk0-f194.google.com ([209.85.220.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUh6P-0006Et-1x
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 21:52:10 +0000
Received: by mail-qk0-f194.google.com with SMTP id i34so181434qkh.3
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2017 13:51:46 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: cyrille.pitchen@atmel.com,
	marex@denx.de,
	broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH, 1/2] mtd: m25p80: Let m25p80_read() fallback to spi transfer
Date: Fri, 20 Jan 2017 16:50:22 -0500
Message-Id: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
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
to return -EINVAL so that the m25p80_read() uses standard
spi transfer.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd..7b7f2cc 100644
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
+		if (ret != -EINVAL)
 			return ret;
-		return msg.retlen;
 	}
 
 	spi_message_init(&m);
-- 
1.9.1
