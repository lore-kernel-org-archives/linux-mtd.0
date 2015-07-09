Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDITe-0004Lj-Hw
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 20:31:27 +0000
Received: by lbnk3 with SMTP id k3so81553885lbn.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jul 2015 13:31:03 -0700 (PDT)
From: Joachim Eastwood <manabian@gmail.com>
To: computersforpeace@gmail.com,
	dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH RESEND] mtd: spi-nor: s25fl008k and s25fl016k supports
 dual/quad mode
Date: Thu,  9 Jul 2015 22:30:57 +0200
Message-Id: <1436473857-31179-1-git-send-email-manabian@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

s25fl016k can be found on Embedded Artists' LPC4357 Developer's Kit
where is used in quad mode by the LPC4357 SPIFI controller.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---

Hi,

Could this go in for 4.3?

Resend of http://permalink.gmane.org/gmane.linux.drivers.mtd/59189
back in May 29.

 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d78831b4422b..c834bd3004d7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -621,8 +621,8 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
 	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
 	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
-	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K) },
-	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
+	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
 	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
-- 
1.8.0
