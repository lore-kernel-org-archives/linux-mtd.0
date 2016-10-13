Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bul5a-0006mC-Ua
 for linux-mtd@lists.infradead.org; Thu, 13 Oct 2016 18:50:48 +0000
Received: by mail-lf0-x242.google.com with SMTP id b75so13940750lfg.3
 for <linux-mtd@lists.infradead.org>; Thu, 13 Oct 2016 11:50:26 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 RESEND 2/3] mtd: m25p80: consider max message size in
 m25p80_read
To: Brian Norris <computersforpeace@gmail.com>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
Cc: Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <e084ae6e-2d89-7d96-0ccf-da23cef00043@gmail.com>
Date: Thu, 13 Oct 2016 20:50:09 +0200
MIME-Version: 1.0
In-Reply-To: <20160816164204.GV9347@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Consider a message size limit when calculating the maximum amount
of data that can be read.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- use the new function spi_max_message_size
---
 drivers/mtd/devices/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd..16a7df2 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -172,7 +172,8 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 
 	t[1].rx_buf = buf;
 	t[1].rx_nbits = m25p80_rx_nbits(nor);
-	t[1].len = min(len, spi_max_transfer_size(spi));
+	t[1].len = min3(len, spi_max_transfer_size(spi),
+			spi_max_message_size(spi) - t[0].len);
 	spi_message_add_tail(&t[1], &m);
 
 	ret = spi_sync(spi, &m);
-- 
2.9.2
