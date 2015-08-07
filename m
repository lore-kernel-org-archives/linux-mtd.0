Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNnq4-0002b6-CS
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 20:02:01 +0000
Date: 7 Aug 2015 20:01:32 -0000
Message-Id: <fa591fbdbac60d507b54f55e8e5140da94b1f60e.1438977111.git.hramrach@gmail.com>
In-Reply-To: <cover.1438977111.git.hramrach@gmail.com>
References: <cover.1438977111.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 2/6] mtd: m25p80: return amount of data transferred or
 error in read/write
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>, Marek Vasut <marex@denx.de>,
  Ben Hutchings <ben@decadent.org.uk>, Huang Shijie <b32955@freescale.com>,
  Gabor Juhos <juhosg@openwrt.org>, "Bean Huo 霍斌斌" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, ,
  Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add checking of SPI transfer errors and return them from read/write
functions. Also return the amount of data transferred.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b2fafc9..c93bc41 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -83,6 +83,7 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	struct spi_transfer t[2] = {};
 	struct spi_message m;
 	int cmd_sz = m25p_cmdsz(nor);
+	ssize_t ret;
 
 	spi_message_init(&m);
 
@@ -100,10 +101,15 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
-	spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
+	if (ret)
+		return ret;
 
-	*retlen += m.actual_length - cmd_sz;
-	return 0;
+	ret = m.actual_length - cmd_sz;
+	if (ret < 0)
+		return -EIO;
+	*retlen += ret;
+	return ret;
 }
 
 static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
@@ -130,6 +136,7 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 	unsigned int dummy = nor->read_dummy;
+	ssize_t ret;
 
 	/* convert the dummy cycles to the number of bytes */
 	dummy /= 8;
@@ -149,10 +156,15 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
-	spi_sync(spi, &m);
+	ret = spi_sync(spi, &m);
+	if (ret)
+		return ret;
 
-	*retlen = m.actual_length - m25p_cmdsz(nor) - dummy;
-	return 0;
+	ret = m.actual_length - m25p_cmdsz(nor) - dummy;
+	if (ret < 0)
+		return -EIO;
+	*retlen += ret;
+	return ret;
 }
 
 static int m25p80_erase(struct spi_nor *nor, loff_t offset)
@@ -166,9 +178,7 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
 	flash->command[0] = nor->erase_opcode;
 	m25p_addr2cmd(nor, offset, flash->command);
 
-	spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
-
-	return 0;
+	return spi_write(flash->spi, flash->command, m25p_cmdsz(nor));
 }
 
 /*
-- 
2.1.4
