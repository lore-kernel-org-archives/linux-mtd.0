Received: from smtprelay01.ispgateway.de ([80.67.18.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q31sO-0006xO-EO
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 07:56:09 +0000
Received: from [89.246.71.91] (helo=mail6.tqsc.de)
	by smtprelay01.ispgateway.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1Q31sM-0004ZU-L9
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 08:56:06 +0100
Received: from sc0810201.tqsc.de ([192.168.80.70] helo=[127.0.0.1])
	by mail6.tqsc.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <list-09_linux_mtd@tqsc.de>)
	id 1Q31sN-0008Jp-6t
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2011 08:56:07 +0100
Message-ID: <4D8C4A94.3030309@tqsc.de>
Date: Fri, 25 Mar 2011 08:56:04 +0100
From: Markus Niebel <list-09_linux_mtd@tqsc.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2.6.34 2/2] cfi_cmdset_0002.c: Use maxtimeouts for erase and
	program instead of hardcoded values
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: list-09_linux_mtd@tqsc.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maximum timeouts are read from the CFI query structure and stored in the
chips structure table. Use the timeouts for erase and program instead of
fixed values.

Signed-off-by: Markus Niebel <markus.niebel@tqs.de>
---

  drivers/mtd/chips/cfi_cmdset_0002.c |   47 
+++++++++++++++++------------------
  1 files changed, 23 insertions(+), 24 deletions(-)


diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c 
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1eb8bfa..d64939f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1074,17 +1074,13 @@ static int cfi_amdstd_secsi_read (struct 
mtd_info *mtd, loff_t from, size_t len,
  static int __xipram do_write_oneword(struct map_info *map, struct 
flchip *chip, unsigned long adr, map_word datum)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/*
-	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
-	 * have a max write time of a few hundreds usec). However, we should
-	 * use the maximum timeout value given by the chip at probe time
-	 * instead.  Unfortunately, struct flchip does have a field for
-	 * maximum timeout, only for typical which can be far too short
-	 * depending of the conditions.	 The ' + 1' is to avoid having a
-	 * timeout of 0 jiffies if HZ is smaller than 1000.
+	unsigned long timeo;
+
+	/* use the max timeout read from cfi, increase by one to make sure it's
+	 * not zero
  	 */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	unsigned long write_timeout = 
usecs_to_jiffies(chip->word_write_time_max) + 1;
+
  	int ret = 0;
  	map_word oldd;
  	int retry_cnt = 0;
@@ -1129,7 +1125,7 @@ static int __xipram do_write_oneword(struct 
map_info *map, struct flchip *chip,
  				chip->word_write_time);

  	/* See comment above for timeout value. */
-	timeo = jiffies + uWriteTimeout;
+	timeo = jiffies + write_timeout;
  	for (;;) {
  		if (chip->state != FL_WRITING) {
  			/* Someone's suspended the write. Sleep */
@@ -1140,7 +1136,7 @@ static int __xipram do_write_oneword(struct 
map_info *map, struct flchip *chip,
  			spin_unlock(chip->mutex);
  			schedule();
  			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
+			timeo = jiffies + write_timeout;
  			spin_lock(chip->mutex);
  			continue;
  		}
@@ -1329,9 +1325,9 @@ static int __xipram do_write_buffer(struct 
map_info *map, struct flchip *chip,
  				    int len)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/* see comments in do_write_oneword() regarding uWriteTimeo. */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	unsigned long timeo;
+	/* see comments in do_write_oneword() regarding write_timeout. */
+	unsigned long write_timeout = 
usecs_to_jiffies(chip->buffer_write_time_max) + 1;
  	int ret = -EIO;
  	unsigned long cmd_adr;
  	int z, words;
@@ -1387,9 +1383,9 @@ static int __xipram do_write_buffer(struct 
map_info *map, struct flchip *chip,

  	INVALIDATE_CACHE_UDELAY(map, chip,
  				adr, map_bankwidth(map),
-				chip->word_write_time);
+				chip->buffer_write_time);

-	timeo = jiffies + uWriteTimeout;
+	timeo = jiffies + write_timeout;

  	for (;;) {
  		if (chip->state != FL_WRITING) {
@@ -1401,7 +1397,7 @@ static int __xipram do_write_buffer(struct 
map_info *map, struct flchip *chip,
  			spin_unlock(chip->mutex);
  			schedule();
  			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
+			timeo = jiffies + write_timeout;
  			spin_lock(chip->mutex);
  			continue;
  		}
@@ -1523,7 +1519,8 @@ static int cfi_amdstd_write_buffers(struct 
mtd_info *mtd, loff_t to, size_t len,
  static int __xipram do_erase_chip(struct map_info *map, struct flchip 
*chip)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long wait_time = msecs_to_jiffies(chip->erase_time_max) + 1;
+	unsigned long timeo;
  	unsigned long int adr;
  	DECLARE_WAITQUEUE(wait, current);
  	int ret = 0;
@@ -1559,7 +1556,7 @@ static int __xipram do_erase_chip(struct map_info 
*map, struct flchip *chip)
  				adr, map->size,
  				chip->erase_time*500);

-	timeo = jiffies + (HZ*20);
+	timeo = jiffies + wait_time;

  	for (;;) {
  		if (chip->state != FL_ERASING) {
@@ -1575,7 +1572,7 @@ static int __xipram do_erase_chip(struct map_info 
*map, struct flchip *chip)
  		if (chip->erase_suspended) {
  			/* This erase was suspended and resumed.
  			   Adjust the timeout */
-			timeo = jiffies + (HZ*20); /* FIXME */
+			timeo = jiffies + wait_time;
  			chip->erase_suspended = 0;
  		}

@@ -1613,7 +1610,8 @@ static int __xipram do_erase_chip(struct map_info 
*map, struct flchip *chip)
  static int __xipram do_erase_oneblock(struct map_info *map, struct 
flchip *chip, unsigned long adr, int len, void *thunk)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long timeo;
+	unsigned long wait_time = msecs_to_jiffies(chip->erase_time_max) + 1;
  	DECLARE_WAITQUEUE(wait, current);
  	int ret = 0;

@@ -1644,11 +1642,12 @@ static int __xipram do_erase_oneblock(struct 
map_info *map, struct flchip *chip,
  	chip->erase_suspended = 0;
  	chip->in_progress_block_addr = adr;

+	/* FIXME: erase time is in msec, so timeout is half of the typical 
erase time? */
  	INVALIDATE_CACHE_UDELAY(map, chip,
  				adr, len,
  				chip->erase_time*500);

-	timeo = jiffies + (HZ*20);
+	timeo = jiffies + wait_time;

  	for (;;) {
  		if (chip->state != FL_ERASING) {
@@ -1664,7 +1663,7 @@ static int __xipram do_erase_oneblock(struct 
map_info *map, struct flchip *chip,
  		if (chip->erase_suspended) {
  			/* This erase was suspended and resumed.
  			   Adjust the timeout */
-			timeo = jiffies + (HZ*20); /* FIXME */
+			timeo = jiffies + wait_time;
  			chip->erase_suspended = 0;
  		}
  		if (time_after(jiffies, timeo) && !chip_good(map, adr, 
map_word_ff(map))) {
