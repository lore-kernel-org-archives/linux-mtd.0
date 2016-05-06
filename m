Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayThQ-0006LR-SJ
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:32:57 +0000
Received: by mail-pa0-x231.google.com with SMTP id r5so42357925pag.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 17:32:36 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>, Jagan Teki <jteki@openedev.com>,
 "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v7 02/10] mtd: m25p80: return amount of data transferred or
 error in read/write
Date: Thu,  5 May 2016 17:31:48 -0700
Message-Id: <1462494716-95312-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
References: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michal Suchanek <hramrach@gmail.com>

Add checking of SPI transfer errors and return them from read/write
functions. Also return the amount of data transferred.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v6 -> v7:
 * handle the special spi_flash_read() SPI support that has been added recently

 drivers/mtd/devices/m25p80.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3bd75e87ed89..2ef5a6015276 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -81,6 +81,7 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	struct spi_transfer t[2] = {};
 	struct spi_message m;
 	int cmd_sz = m25p_cmdsz(nor);
+	ssize_t ret;
 
 	spi_message_init(&m);
 
@@ -98,10 +99,15 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
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
@@ -128,13 +134,13 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 	unsigned int dummy = nor->read_dummy;
+	ssize_t ret;
 
 	/* convert the dummy cycles to the number of bytes */
 	dummy /= 8;
 
 	if (spi_flash_read_supported(spi)) {
 		struct spi_flash_read_message msg;
-		int ret;
 
 		memset(&msg, 0, sizeof(msg));
 
@@ -151,7 +157,9 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 
 		ret = spi_flash_read(spi, &msg);
 		*retlen = msg.retlen;
-		return ret;
+		if (ret < 0)
+			return ret;
+		return msg.retlen;
 	}
 
 	spi_message_init(&m);
@@ -169,10 +177,15 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
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
 
 /*
-- 
2.8.0.rc3.226.g39d4020
