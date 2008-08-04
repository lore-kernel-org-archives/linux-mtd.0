Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ80Z-0006Bc-Dy
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 21:54:28 +0000
Message-ID: <48977822.4040401@users.sourceforge.net>
Date: Mon, 04 Aug 2008 23:44:02 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] cfi_cmdset_0001: Timeouts for erase,
	write and unlock operations
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Timeouts are currently given by the typical operation time times 8.
It works in the general well-behaved case but not when an erase block is
failing. For erase operations, it seems that a failing erase block will
keep the device state machine in erasing state until the vendor
specified maximum timeout period has passed. By this time the driver
would have long since timed out, left erasing state and attempted
further operations which all fail. This patch implements timeouts using
values from the CFI Query structure when available.
The patch also sets a longer timeout for locking operations. The current
value used for locking/unlocking given by 1000000/HZ microseconds is too
short for devices like J3 and J5 Strataflash which have a typical clear
lock-bits time of 0.5 seconds.

Signed-off-by: Anders Grafström <grfstrm@users.sourceforge.net>
---
  drivers/mtd/chips/cfi_cmdset_0001.c |   52 +++++++++++++++++++++++++---------
  include/linux/mtd/flashchip.h       |    4 +++
  2 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index d49cbe2..5157e3c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -478,6 +478,28 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
  		else
  			cfi->chips[i].erase_time = 2000000;

+		if (cfi->cfiq->WordWriteTimeoutTyp &&
+		    cfi->cfiq->WordWriteTimeoutMax)
+			cfi->chips[i].word_write_time_max =
+				1<<(cfi->cfiq->WordWriteTimeoutTyp +
+				    cfi->cfiq->WordWriteTimeoutMax);
+		else
+			cfi->chips[i].word_write_time_max = 50000 * 8;
+
+		if (cfi->cfiq->BufWriteTimeoutTyp &&
+		    cfi->cfiq->BufWriteTimeoutMax)
+			cfi->chips[i].buffer_write_time_max =
+				1<<(cfi->cfiq->BufWriteTimeoutTyp +
+				    cfi->cfiq->BufWriteTimeoutMax);
+
+		if (cfi->cfiq->BlockEraseTimeoutTyp &&
+		    cfi->cfiq->BlockEraseTimeoutMax)
+			cfi->chips[i].erase_time_max =
+				1000<<(cfi->cfiq->BlockEraseTimeoutTyp +
+				       cfi->cfiq->BlockEraseTimeoutMax);
+		else
+			cfi->chips[i].erase_time_max = 2000000 * 8;
+
  		cfi->chips[i].ref_point_counter = 0;
  		init_waitqueue_head(&(cfi->chips[i].wq));
  	}
@@ -1012,7 +1034,7 @@ static void __xipram xip_enable(struct map_info *map, struct flchip *chip,

  static int __xipram xip_wait_for_operation(
  		struct map_info *map, struct flchip *chip,
-		unsigned long adr, unsigned int chip_op_time )
+		unsigned long adr, unsigned int chip_op_time_max)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
  	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
@@ -1021,7 +1043,7 @@ static int __xipram xip_wait_for_operation(
  	flstate_t oldstate, newstate;

         	start = xip_currtime();
-	usec = chip_op_time * 8;
+	usec = chip_op_time_max;
  	if (usec == 0)
  		usec = 500000;
  	done = 0;
@@ -1131,8 +1153,8 @@ static int __xipram xip_wait_for_operation(
  #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
  	INVALIDATE_CACHED_RANGE(map, from, size)

-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, usec)
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec, usec_max) \
+	xip_wait_for_operation(map, chip, cmd_adr, usec_max)

  #else

@@ -1144,7 +1166,7 @@ static int __xipram xip_wait_for_operation(
  static int inval_cache_and_wait_for_operation(
  		struct map_info *map, struct flchip *chip,
  		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
-		unsigned int chip_op_time)
+		unsigned int chip_op_time, unsigned int chip_op_time_max)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
  	map_word status, status_OK = CMD(0x80);
@@ -1156,8 +1178,7 @@ static int inval_cache_and_wait_for_operation(
  		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
  	spin_lock(chip->mutex);

-	/* set our timeout to 8 times the expected delay */
-	timeo = chip_op_time * 8;
+	timeo = chip_op_time_max;
  	if (!timeo)
  		timeo = 500000;
  	reset_timeo = timeo;
@@ -1217,8 +1238,8 @@ static int inval_cache_and_wait_for_operation(

  #endif

-#define WAIT_TIMEOUT(map, chip, adr, udelay) \
-	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay);
+#define WAIT_TIMEOUT(map, chip, adr, udelay, udelay_max) \
+	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay, udelay_max);


  static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
@@ -1452,7 +1473,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,

  	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
  				   adr, map_bankwidth(map),
-				   chip->word_write_time);
+				   chip->word_write_time,
+				   chip->word_write_time_max);
  	if (ret) {
  		xip_enable(map, chip, adr);
  		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
@@ -1623,7 +1645,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,

  	chip->state = FL_WRITING_TO_BUFFER;
  	map_write(map, write_cmd, cmd_adr);
-	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0);
+	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0, 0);
  	if (ret) {
  		/* Argh. Not ready for write to buffer */
  		map_word Xstatus = map_read(map, cmd_adr);
@@ -1692,7 +1714,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,

  	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
  				   initial_adr, initial_len,
-				   chip->buffer_write_time);
+				   chip->buffer_write_time,
+				   chip->buffer_write_time_max);
  	if (ret) {
  		map_write(map, CMD(0x70), cmd_adr);
  		chip->state = FL_STATUS;
@@ -1827,7 +1850,8 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,

  	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
  				   adr, len,
-				   chip->erase_time);
+				   chip->erase_time,
+				   chip->erase_time_max);
  	if (ret) {
  		map_write(map, CMD(0x70), adr);
  		chip->state = FL_STATUS;
@@ -2006,7 +2030,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
  	 */
  	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;

-	ret = WAIT_TIMEOUT(map, chip, adr, udelay);
+	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
  	if (ret) {
  		map_write(map, CMD(0x70), adr);
  		chip->state = FL_STATUS;
diff --git a/include/linux/mtd/flashchip.h b/include/linux/mtd/flashchip.h
index 08dd131..d4f38c5 100644
--- a/include/linux/mtd/flashchip.h
+++ b/include/linux/mtd/flashchip.h
@@ -73,6 +73,10 @@ struct flchip {
  	int buffer_write_time;
  	int erase_time;

+	int word_write_time_max;
+	int buffer_write_time_max;
+	int erase_time_max;
+
  	void *priv;
  };

-- 
1.5.6.3
