Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVC59-0002Mf-M5
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 01:02:00 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] mtd api changed to return bitflips on read operations
Date: Mon, 28 Nov 2011 17:01:17 -0800
Message-Id: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Sukumar Ghorai <s-ghorai@ti.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Proposed mtd api change.

Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
---
 include/linux/mtd/mtd.h |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9f5b312..67f4bbc 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -81,6 +81,9 @@ struct mtd_erase_region_info {
  *		mode = MTD_OPS_PLACE_OOB or MTD_OPS_RAW)
  * @datbuf:	data buffer - if NULL only oob data are read/written
  * @oobbuf:	oob data buffer
+ * @max_bitflips: for read operations, greatest number of bit errors corrected
+ *                on any one minimum i/o unit (e.g., nand page)
+ *                (value returned to caller by the driver)
  *
  * Note, it is allowed to read more than one OOB area at one go, but not write.
  * The interface assumes that the OOB write requests program only one page's
@@ -95,6 +98,7 @@ struct mtd_oob_ops {
 	uint32_t	ooboffs;
 	uint8_t		*datbuf;
 	uint8_t		*oobbuf;
+	unsigned int	max_bitflips;
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
@@ -201,8 +205,13 @@ struct mtd_info {
 	 */
 	struct backing_dev_info *backing_dev_info;
 
+	/*
+	 * max_bitflips returns to caller the greatest number of bit errors
+	 * corrected on any one minimum i/o unit (e.g., nand page)
+	 */
+	int (*read) (struct mtd_info *mtd, loff_t from, size_t len,
+		     size_t *retlen, u_char *buf, unsigned int *max_bitflips);
 
-	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
 	/* In blackbox flight recorder like scenarios we want to make successful
-- 
1.7.3.4
