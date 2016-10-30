Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0mUG-0007u7-Tg
 for linux-mtd@lists.infradead.org; Sun, 30 Oct 2016 09:33:09 +0000
Received: by mail-wm0-x243.google.com with SMTP id 68so7224605wmz.2
 for <linux-mtd@lists.infradead.org>; Sun, 30 Oct 2016 02:32:47 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: add sleeping version of spi_nor_wait_till_ready
 for erase ops
Message-ID: <eaa526ca-f0b4-4fde-d334-2ca6af72c32d@gmail.com>
Date: Sun, 30 Oct 2016 10:32:38 +0100
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

Currently spi_nor_wait_till_ready in the poll loop permanently checks
for the WIP flag to be reset. Erase ops typically take >100ms for
sector erase and >10s for chip erase. Permanently polling for such
longer time periods puts unnecessary load on the SPI subsystem
(especially on systems w/o SPI DMA support or systems using bitbanging).

Relax this by sleeping for a reasonable time between checking the
WIP flag.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..808ea4c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/math64.h>
 #include <linux/sizes.h>
+#include <linux/delay.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
@@ -252,7 +253,8 @@ static int spi_nor_ready(struct spi_nor *nor)
  * Returns non-zero if error.
  */
 static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
-						unsigned long timeout_jiffies)
+						unsigned long timeout_jiffies,
+						unsigned int sleep_msecs)
 {
 	unsigned long deadline;
 	int timeout = 0, ret;
@@ -269,7 +271,13 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 		if (ret)
 			return 0;
 
-		cond_resched();
+		if (!sleep_msecs)
+			cond_resched();
+		else if (sleep_msecs < 50)
+			usleep_range(sleep_msecs * 1000 - 100,
+				     sleep_msecs * 1000);
+		else
+			msleep(sleep_msecs);
 	}
 
 	dev_err(nor->dev, "flash operation timed out\n");
@@ -277,10 +285,17 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 	return -ETIMEDOUT;
 }
 
-static int spi_nor_wait_till_ready(struct spi_nor *nor)
+static inline int spi_nor_wait_till_ready_sleep(struct spi_nor *nor,
+						unsigned int sleep_msecs)
 {
 	return spi_nor_wait_till_ready_with_timeout(nor,
-						    DEFAULT_READY_WAIT_JIFFIES);
+						    DEFAULT_READY_WAIT_JIFFIES,
+						    sleep_msecs);
+}
+
+static inline int spi_nor_wait_till_ready(struct spi_nor *nor)
+{
+	return spi_nor_wait_till_ready_sleep(nor, 0);
 }
 
 /*
@@ -387,7 +402,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
 			      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
 			      (unsigned long)(mtd->size / SZ_2M));
-		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
+		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout, 100);
 		if (ret)
 			goto erase_err;
 
@@ -408,7 +423,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			addr += mtd->erasesize;
 			len -= mtd->erasesize;
 
-			ret = spi_nor_wait_till_ready(nor);
+			ret = spi_nor_wait_till_ready_sleep(nor, 2);
 			if (ret)
 				goto erase_err;
 		}
-- 
2.10.1
