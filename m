Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd3kI-0006Ds-A2
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 22:03:07 +0000
Received: by pacfv12 with SMTP id fv12so62194729pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 15:02:45 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Furquan Shaikh <furquan@google.com>,
 Stephen Barber <smbarber@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH] mtd: spi-nor: scale up timeout for full-chip erase
Date: Fri, 18 Sep 2015 14:59:17 -0700
Message-Id: <1442613557-36838-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Furquan Shaikh <furquan@google.com>

This patch fixes timeout issues seen on large NOR flash (e.g., 16MB
w25q128fw) when using ioctl(MEMERASE) with offset=0 and length=16M. The
input parameters matter because spi_nor_erase() uses a different code
path for full-chip erase, where we use the SPINOR_OP_CHIP_ERASE (0xc7)
opcode.

Fix: use a different timeout for full-chip erase than for other
commands.

While most operations can be expected to perform relatively similarly
across a variety of NOR flash types and sizes (and therefore might as
well use a similar timeout to keep things simple), full-chip erase is
unique, because the time it typically takes to complete:
(1) is much larger than most operations and
(2) scales with the size of the flash.

Let's base our timeout on the original comments stuck here -- that a 2MB
flash requires max 40s to erase.

Small survey of a few flash datasheets I have lying around:

  Chip         Size (MB)   Max chip erase (seconds)
  ----         --------    ------------------------
  w25q32fw     4           50
  w25q64cv     8           30
  w25q64fw     8           100
  w25q128fw    16          200
  s25fl128s    16          ~256
  s25fl256s    32          ~512

>From this data, it seems plenty sufficient to say we need to wait for
40 seconds for each 2MB of flash.

After this change, it might make some sense to decrease the timeout for
everything else, as even the most extreme operations (single block
erase?) shouldn't take more than a handful of seconds. But for safety,
let's leave it as-is. It's only an error case, after all, so we don't
exactly need to optimize it.

Signed-off-by: Furquan Shaikh <furquan@google.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8818d4325d20..7defce09ab9a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -16,6 +16,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/math64.h>
+#include <linux/sizes.h>
 
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
@@ -24,7 +25,18 @@
 #include <linux/mtd/spi-nor.h>
 
 /* Define max times to check status register before we give up. */
-#define	MAX_READY_WAIT_JIFFIES	(40 * HZ) /* M25P16 specs 40s max chip erase */
+
+/*
+ * For everything but full-chip erase; probably could be much smaller, but kept
+ * around for safety for now
+ */
+#define DEFAULT_READY_WAIT_JIFFIES		(40UL * HZ)
+
+/*
+ * For full-chip erase, calibrated to a 2MB flash (M25P16); should be scaled up
+ * for larger flash
+ */
+#define CHIP_ERASE_2MB_READY_WAIT_JIFFIES	(40UL * HZ)
 
 #define SPI_NOR_MAX_ID_LEN	6
 
@@ -233,12 +245,13 @@ static int spi_nor_ready(struct spi_nor *nor)
  * Service routine to read status register until ready, or timeout occurs.
  * Returns non-zero if error.
  */
-static int spi_nor_wait_till_ready(struct spi_nor *nor)
+static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
+						unsigned long timeout_jiffies)
 {
 	unsigned long deadline;
 	int timeout = 0, ret;
 
-	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
+	deadline = jiffies + timeout_jiffies;
 
 	while (!timeout) {
 		if (time_after_eq(jiffies, deadline))
@@ -258,6 +271,12 @@ static int spi_nor_wait_till_ready(struct spi_nor *nor)
 	return -ETIMEDOUT;
 }
 
+static int spi_nor_wait_till_ready(struct spi_nor *nor)
+{
+	return spi_nor_wait_till_ready_with_timeout(nor,
+						    DEFAULT_READY_WAIT_JIFFIES);
+}
+
 /*
  * Erase the whole flash memory
  *
@@ -321,6 +340,8 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 	/* whole-chip erase? */
 	if (len == mtd->size) {
+		unsigned long timeout;
+
 		write_enable(nor);
 
 		if (erase_chip(nor)) {
@@ -328,7 +349,16 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			goto erase_err;
 		}
 
-		ret = spi_nor_wait_till_ready(nor);
+		/*
+		 * Scale the timeout linearly with the size of the flash, with
+		 * a minimum calibrated to an old 2MB flash. We could try to
+		 * pull these from CFI/SFDP, but these values should be good
+		 * enough for now.
+		 */
+		timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
+			      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
+			      (unsigned long)(mtd->size / SZ_2M));
+		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
 		if (ret)
 			goto erase_err;
 
-- 
2.6.0.rc0.131.gf624c3d
