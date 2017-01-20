Received: from mail-qk0-f196.google.com ([209.85.220.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUh6e-0006It-04
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 21:52:25 +0000
Received: by mail-qk0-f196.google.com with SMTP id 11so2761075qkl.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2017 13:52:02 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: cyrille.pitchen@atmel.com,
	marex@denx.de,
	broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH, 2/2] spi: bcm-qspi: Fix return code from bcm_qspi_flash_read()
Date: Fri, 20 Jan 2017 16:50:23 -0500
Message-Id: <1484949023-2085-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To properly fallback to normal mspi reads return appropriate return code to
m25p80_read() function. Changed return code to -EINVAL from -EAGAIN to match
what is expected by the m25p80 driver.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/spi/spi-bcm-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
index 14f9dea..3e37b6b 100644
--- a/drivers/spi/spi-bcm-qspi.c
+++ b/drivers/spi/spi-bcm-qspi.c
@@ -919,7 +919,7 @@ static int bcm_qspi_flash_read(struct spi_device *spi,
 
 	if (mspi_read)
 		/* this will make the m25p80 read to fallback to mspi read */
-		return -EAGAIN;
+		return -EINVAL;
 
 	io_width = msg->data_nbits ? msg->data_nbits : SPI_NBITS_SINGLE;
 	addrlen = msg->addr_width;
-- 
1.9.1
