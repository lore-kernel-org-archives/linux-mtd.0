Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZnhI-0004HD-V6
 for linux-mtd@lists.infradead.org; Sat, 27 Feb 2016 22:50:50 +0000
Received: by mail-wm0-x244.google.com with SMTP id w11so361927wmd.2
 for <linux-mtd@lists.infradead.org>; Sat, 27 Feb 2016 14:50:26 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 1/2] mtd: m25p80: fix retlen usage in m25p80_read and
 propagate errors
To: Brian Norris <computersforpeace@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <56D227B7.5010902@gmail.com>
Date: Sat, 27 Feb 2016 23:48:23 +0100
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

So far retlen usage in m25p80_read is different from retlen usage in other
places on the mtd subsystem. Usually bytes read are added to the current
value of *retlen, here the current value is ignored.
As a prerequisite for using m25p80_read in a loop if the transfer size is
limited we have to fix this.
Also propagate the return code of spi_sync.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c9c3b7f..c2d1f65 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -126,10 +126,9 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct spi_device *spi = flash->spi;
 	struct spi_transfer t[2];
 	struct spi_message m;
-	unsigned int dummy = nor->read_dummy;
-
 	/* convert the dummy cycles to the number of bytes */
-	dummy /= 8;
+	unsigned int cmdlen = m25p_cmdsz(nor) + nor->read_dummy / 8;
+	int ret;
 
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
@@ -138,7 +137,7 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	m25p_addr2cmd(nor, from, flash->command);
 
 	t[0].tx_buf = flash->command;
-	t[0].len = m25p_cmdsz(nor) + dummy;
+	t[0].len = cmdlen;
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
@@ -146,10 +145,12 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
-	spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
 
-	*retlen = m.actual_length - m25p_cmdsz(nor) - dummy;
-	return 0;
+	if (m.actual_length > cmdlen)
+		*retlen += m.actual_length - cmdlen;
+
+	return ret;
 }
 
 /*
-- 
2.7.1
