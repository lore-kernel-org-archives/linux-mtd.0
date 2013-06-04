Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjgLL-0007Ub-GG
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 01:47:24 +0000
Received: by mail-pb0-f48.google.com with SMTP id md4so6456734pbc.21
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2013 18:47:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] mtd: cfi_cmdset_0002: use msecs_to_jiffies() macro
Date: Mon,  3 Jun 2013 18:46:45 -0700
Message-Id: <1370310406-413-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>
References: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rather than a bunch of calculations based on HZ, which are error-prone
and subject to "+ 1" (to avoid a 0 result), just use the
msecs_to_jiffies() macro. This makes both the intent (to wait some
approximate number of milliseconds) and the calculation clearer.

During the conversion, I noticed two places where we convert from
milliseconds to jiffies to microseconds, to use in a udelay(1) loop; I
dropped this in one place, but I left it in another, where the code
notes that it is "intentionally similar to do_write_oneword()".

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 41 +++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 6c85f61..4e28081 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -754,7 +754,7 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 	struct cfi_pri_amdstd *cfip = (struct cfi_pri_amdstd *)cfi->cmdset_priv;
 
  resettime:
-	timeo = jiffies + HZ;
+	timeo = jiffies + msecs_to_jiffies(1000);
  retry:
 	switch (chip->state) {
 
@@ -1228,15 +1228,14 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo;
 	/*
-	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
-	 * have a max write time of a few hundreds usec). However, we should
-	 * use the maximum timeout value given by the chip at probe time
-	 * instead.  Unfortunately, struct flchip does have a field for
-	 * maximum timeout, only for typical which can be far too short
-	 * depending of the conditions.	 The ' + 1' is to avoid having a
-	 * timeout of 0 jiffies if HZ is smaller than 1000.
+	 * We use a 1ms generic timeout for writes (most devices have a max
+	 * write time of a few hundreds usec). However, we should use the
+	 * maximum timeout value given by the chip at probe time instead.
+	 * Unfortunately, struct flchip does have a field for maximum timeout,
+	 * only for typical which can be far too short depending of the
+	 * conditions.
 	 */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	unsigned long uWriteTimeout = msecs_to_jiffies(1);
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
@@ -1292,7 +1291,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			mutex_unlock(&chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
+			timeo = jiffies + msecs_to_jiffies(500); /* FIXME */
 			mutex_lock(&chip->mutex);
 			continue;
 		}
@@ -1465,8 +1464,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo;
-	/* see comments in do_write_oneword() regarding uWriteTimeo. */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	/* see comments in do_write_oneword() regarding uWriteTimeout */
+	unsigned long uWriteTimeout = msecs_to_jiffies(1);
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
@@ -1535,7 +1534,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			mutex_unlock(&chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
+			timeo = jiffies + msecs_to_jiffies(500); /* FIXME */
 			mutex_lock(&chip->mutex);
 			continue;
 		}
@@ -1687,13 +1686,11 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 	 * is more important to save the messages.
 	 */
 	while (retries > 0) {
-		const unsigned long timeo = (HZ / 1000) + 1;
-
 		/* send the reset command */
 		map_write(map, CMD(0xF0), chip->start);
 
-		/* wait for the chip to become ready */
-		for (i = 0; i < jiffies_to_usecs(timeo); i++) {
+		/* wait for the chip to become ready (approx. 1ms) */
+		for (i = 0; i < 1000; i++) {
 			if (chip_ready(map, adr))
 				return 0;
 
@@ -1719,7 +1716,7 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
 				  unsigned long adr, map_word datum)
 {
-	const unsigned long uWriteTimeout = (HZ / 1000) + 1;
+	const unsigned long uWriteTimeout = msecs_to_jiffies(1);
 	struct cfi_private *cfi = map->fldrv_priv;
 	int retry_cnt = 0;
 	map_word oldd;
@@ -1934,7 +1931,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 				adr, map->size,
 				chip->erase_time*500);
 
-	timeo = jiffies + (HZ*20);
+	timeo = jiffies + msecs_to_jiffies(20000);
 
 	for (;;) {
 		if (chip->state != FL_ERASING) {
@@ -1950,7 +1947,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 		if (chip->erase_suspended) {
 			/* This erase was suspended and resumed.
 			   Adjust the timeout */
-			timeo = jiffies + (HZ*20); /* FIXME */
+			timeo = jiffies + msecs_to_jiffies(20000); /* FIXME */
 			chip->erase_suspended = 0;
 		}
 
@@ -2023,7 +2020,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 				adr, len,
 				chip->erase_time*500);
 
-	timeo = jiffies + (HZ*20);
+	timeo = jiffies + msecs_to_jiffies(20000);
 
 	for (;;) {
 		if (chip->state != FL_ERASING) {
@@ -2039,7 +2036,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 		if (chip->erase_suspended) {
 			/* This erase was suspended and resumed.
 			   Adjust the timeout */
-			timeo = jiffies + (HZ*20); /* FIXME */
+			timeo = jiffies + msecs_to_jiffies(20000); /* FIXME */
 			chip->erase_suspended = 0;
 		}
 
-- 
1.8.2.3
