Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bWU5C-0004ep-EK
 for linux-mtd@lists.infradead.org; Sun, 07 Aug 2016 19:50:03 +0000
Received: by mail-wm0-x242.google.com with SMTP id o80so11993595wme.0
 for <linux-mtd@lists.infradead.org>; Sun, 07 Aug 2016 12:49:43 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/3] mtd: m25p80: consider max message size in m25p80_read
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <d910ea7b-d5a9-b1f1-fc45-5fdc11449f2c@gmail.com>
Date: Sun, 7 Aug 2016 21:48:37 +0200
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

If the spi_master has the max_message_size_flag set, the maximum amount
of data that can be read is the message size limit minus length of the
read command.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd..2925038 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -133,6 +133,7 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 	unsigned int dummy = nor->read_dummy;
+	size_t max_read_len;
 	ssize_t ret;
 
 	/* convert the dummy cycles to the number of bytes */
@@ -170,9 +171,13 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	t[0].len = m25p_cmdsz(nor) + dummy;
 	spi_message_add_tail(&t[0], &m);
 
+	max_read_len = spi_max_transfer_size(spi);
+	if (spi->master->max_message_size_flag)
+		max_read_len -= t[0].len;
+
 	t[1].rx_buf = buf;
 	t[1].rx_nbits = m25p80_rx_nbits(nor);
-	t[1].len = min(len, spi_max_transfer_size(spi));
+	t[1].len = min(len, max_read_len);
 	spi_message_add_tail(&t[1], &m);
 
 	ret = spi_sync(spi, &m);
-- 
2.9.2
