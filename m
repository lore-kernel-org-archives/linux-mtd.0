Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bTG2h-0006cI-5o
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 22:14:07 +0000
Received: by mail-pf0-x241.google.com with SMTP id i6so6066708pfe.0
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2016 15:13:46 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: broonie@kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v5 4/8] mtd: m25p80: Let m25p80_read() fallback to spi transfer
Date: Fri, 29 Jul 2016 18:13:09 -0400
Message-Id: <1469830393-13295-5-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
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
 drivers/mtd/devices/m25p80.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9d68544..3f90542 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -149,8 +149,11 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 		msg.data_nbits = m25p80_rx_nbits(nor);
 
 		ret = spi_flash_read(spi, &msg);
-		*retlen = msg.retlen;
-		return ret;
+		/* some drivers might need to fallback to spi transfer */
+		if (ret != -EAGAIN) {
+			*retlen = msg.retlen;
+			return ret;
+		}
 	}
 
 	spi_message_init(&m);
-- 
1.9.1
