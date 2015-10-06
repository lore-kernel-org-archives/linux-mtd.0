Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjXT6-00021q-FS
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 19:00:09 +0000
Received: by wiclk2 with SMTP id lk2so172865963wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2015 11:59:45 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mtd: m25p80: add error handling to m25p80_read
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <561410EC.9050107@gmail.com>
Date: Tue, 6 Oct 2015 20:20:28 +0200
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

So far m25p80_read ignored errors returned by spi_sync and always reported
success to the upper layers. Change this and also fix retlen calculation
for the corner case that not even the command was transferred completely.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4b5d7a4..634b0c4 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -126,10 +126,11 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct spi_device *spi = flash->spi;
 	struct spi_transfer t[2];
 	struct spi_message m;
-	unsigned int dummy = nor->read_dummy;
+	unsigned int cmd_len;
+	int ret;
 
 	/* convert the dummy cycles to the number of bytes */
-	dummy /= 8;
+	cmd_len = m25p_cmdsz(nor) + nor->read_dummy / 8;
 
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
@@ -138,7 +139,7 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	m25p_addr2cmd(nor, from, flash->command);
 
 	t[0].tx_buf = flash->command;
-	t[0].len = m25p_cmdsz(nor) + dummy;
+	t[0].len = cmd_len;
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
@@ -146,10 +147,17 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
-	spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
 
-	*retlen = m.actual_length - m25p_cmdsz(nor) - dummy;
-	return 0;
+	if (m.actual_length >= cmd_len)
+		*retlen = m.actual_length - cmd_len;
+	else
+		/* not even the command may have been
+		 * transferred completely
+		 */
+		*retlen = 0;
+
+	return ret;
 }
 
 static int m25p80_erase(struct spi_nor *nor, loff_t offset)
-- 
2.6.0
