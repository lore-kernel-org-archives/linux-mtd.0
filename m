Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1cVp-0003Fg-CA
 for linux-mtd@lists.infradead.org; Tue, 01 Nov 2016 17:06:14 +0000
Received: by mail-wm0-x242.google.com with SMTP id u144so4318156wmu.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Nov 2016 10:05:51 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: add sleeping version of
 spi_nor_wait_till_ready for erase ops
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <3591c563-7a90-c060-f6f0-c61d35bbef0e@gmail.com>
Date: Tue, 1 Nov 2016 18:05:36 +0100
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
v2:
- add defines for numeric constants
- Don't introduce a third spi_nor_wait_till_ready_.. function.
- add sanity check to ensure that sleep time <= timeout
---
 drivers/mtd/spi-nor/spi-nor.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..7c793a6 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/math64.h>
 #include <linux/sizes.h>
+#include <linux/delay.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
@@ -37,6 +38,10 @@
  */
 #define CHIP_ERASE_2MB_READY_WAIT_JIFFIES	(40UL * HZ)
 
+#define READY_WAIT_NO_SLEEP			0
+#define SECTOR_ERASE_READY_WAIT_SLEEP_MSECS	2
+#define CHIP_ERASE_READY_WAIT_SLEEP_MSECS	100
+
 #define SPI_NOR_MAX_ID_LEN	6
 #define SPI_NOR_MAX_ADDR_WIDTH	4
 
@@ -252,11 +257,13 @@ static int spi_nor_ready(struct spi_nor *nor)
  * Returns non-zero if error.
  */
 static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
-						unsigned long timeout_jiffies)
+						unsigned long timeout_jiffies,
+						unsigned int sleep_msecs)
 {
 	unsigned long deadline;
 	int timeout = 0, ret;
 
+	sleep_msecs = min(sleep_msecs, jiffies_to_msecs(timeout_jiffies));
 	deadline = jiffies + timeout_jiffies;
 
 	while (!timeout) {
@@ -269,7 +276,13 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
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
@@ -280,7 +293,8 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 static int spi_nor_wait_till_ready(struct spi_nor *nor)
 {
 	return spi_nor_wait_till_ready_with_timeout(nor,
-						    DEFAULT_READY_WAIT_JIFFIES);
+						    DEFAULT_READY_WAIT_JIFFIES,
+						    READY_WAIT_NO_SLEEP);
 }
 
 /*
@@ -387,7 +401,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
 			      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
 			      (unsigned long)(mtd->size / SZ_2M));
-		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
+		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout,
+					CHIP_ERASE_READY_WAIT_SLEEP_MSECS);
 		if (ret)
 			goto erase_err;
 
@@ -408,7 +423,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			addr += mtd->erasesize;
 			len -= mtd->erasesize;
 
-			ret = spi_nor_wait_till_ready(nor);
+			ret = spi_nor_wait_till_ready_with_timeout(nor,
+					DEFAULT_READY_WAIT_JIFFIES,
+					SECTOR_ERASE_READY_WAIT_SLEEP_MSECS);
 			if (ret)
 				goto erase_err;
 		}
-- 
2.10.1
