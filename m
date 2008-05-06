Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JtSNH-00007h-E0
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 18:58:51 +0000
Message-ID: <4820AA58.8030308@users.sourceforge.net>
Date: Tue, 06 May 2008 20:58:32 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH][NOR] cfi_cmdset_0001.c: Max timeouts for erase and write
	operations
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

[NOR] cfi_cmdset_0001.c: Max timeouts for erase and write operations

This patch uses data from the CFI query structure to set
max timeouts for erase and write operations.

Signed-off-by: Anders Grafström <grfstrm@users.sourceforge.net>
---
  drivers/mtd/chips/cfi_cmdset_0001.c |   58 +++++++++++++++++++++++++---------
  include/linux/mtd/flashchip.h       |    4 ++
  2 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index fcd1aec..51f411a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -476,6 +476,27 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
  		else
  			cfi->chips[i].erase_time = 2000000;

+		if (cfi->cfiq->WordWriteTimeoutTyp &&
+		    cfi->cfiq->WordWriteTimeoutMax)
+			cfi->chips[i].word_write_timeout =
+				1<<(cfi->cfiq->WordWriteTimeoutTyp +
+				    cfi->cfiq->WordWriteTimeoutMax);
+		else
+			cfi->chips[i].word_write_timeout = 50000;
+
+		if (cfi->cfiq->BufWriteTimeoutTyp &&
+		    cfi->cfiq->BufWriteTimeoutMax)
+			cfi->chips[i].buffer_write_timeout =
+				1<<(cfi->cfiq->BufWriteTimeoutTyp +
+				    cfi->cfiq->BufWriteTimeoutMax);
+
+		if (cfi->cfiq->BlockEraseTimeoutTyp)
+			cfi->chips[i].erase_timeout =
+				1000<<(cfi->cfiq->BlockEraseTimeoutTyp +
+				       cfi->cfiq->BlockEraseTimeoutMax);
+		else
+			cfi->chips[i].erase_timeout = 2000000;
+
  		cfi->chips[i].ref_point_counter = 0;
  		init_waitqueue_head(&(cfi->chips[i].wq));
  	}
@@ -1010,7 +1031,7 @@ static void __xipram xip_enable(struct map_info *map, struct flchip *chip,

  static int __xipram xip_wait_for_operation(
  		struct map_info *map, struct flchip *chip,
-		unsigned long adr, unsigned int chip_op_time )
+		unsigned long adr, unsigned int chip_op_timeout)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
  	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
@@ -1019,7 +1040,7 @@ static int __xipram xip_wait_for_operation(
  	flstate_t oldstate, newstate;

         	start = xip_currtime();
-	usec = chip_op_time * 8;
+	usec = chip_op_timeout;
  	if (usec == 0)
  		usec = 500000;
  	done = 0;
@@ -1129,8 +1150,8 @@ static int __xipram xip_wait_for_operation(
  #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
  	INVALIDATE_CACHED_RANGE(map, from, size)

-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, usec)
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec, usec_max) \
+	xip_wait_for_operation(map, chip, cmd_adr, usec_max)

  #else

@@ -1142,7 +1163,7 @@ static int __xipram xip_wait_for_operation(
  static int inval_cache_and_wait_for_operation(
  		struct map_info *map, struct flchip *chip,
  		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
-		unsigned int chip_op_time)
+		unsigned int chip_op_time, unsigned int chip_op_timeout)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
  	map_word status, status_OK = CMD(0x80);
@@ -1154,11 +1175,13 @@ static int inval_cache_and_wait_for_operation(
  		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
  	spin_lock(chip->mutex);

-	/* set our timeout to 8 times the expected delay */
-	timeo = chip_op_time * 8;
-	if (!timeo)
+	if (!chip_op_time || !chip_op_timeout) {
  		timeo = 500000;
-	sleep_time = chip_op_time / 2;
+		sleep_time = 0;
+	} else {
+		timeo = chip_op_timeout;
+		sleep_time = chip_op_time / 2;
+	}

  	for (;;) {
  		status = map_read(map, cmd_adr);
@@ -1208,8 +1231,8 @@ static int inval_cache_and_wait_for_operation(

  #endif

-#define WAIT_TIMEOUT(map, chip, adr, udelay) \
-	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay);
+#define WAIT_TIMEOUT(map, chip, adr, udelay, udelay_max) \
+	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay, udelay_max);


  static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
@@ -1443,7 +1466,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,

  	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
  				   adr, map_bankwidth(map),
-				   chip->word_write_time);
+				   chip->word_write_time,
+				   chip->word_write_timeout);
  	if (ret) {
  		xip_enable(map, chip, adr);
  		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
@@ -1614,7 +1638,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,

  	chip->state = FL_WRITING_TO_BUFFER;
  	map_write(map, write_cmd, cmd_adr);
-	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0);
+	ret = WAIT_TIMEOUT(map, chip, cmd_adr, 0, 0);
  	if (ret) {
  		/* Argh. Not ready for write to buffer */
  		map_word Xstatus = map_read(map, cmd_adr);
@@ -1683,7 +1707,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,

  	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
  				   initial_adr, initial_len,
-				   chip->buffer_write_time);
+				   chip->buffer_write_time,
+				   chip->buffer_write_timeout);
  	if (ret) {
  		map_write(map, CMD(0x70), cmd_adr);
  		chip->state = FL_STATUS;
@@ -1818,7 +1843,8 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,

  	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
  				   adr, len,
-				   chip->erase_time);
+				   chip->erase_time,
+				   chip->erase_timeout);
  	if (ret) {
  		map_write(map, CMD(0x70), adr);
  		chip->state = FL_STATUS;
@@ -1997,7 +2023,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
  	 */
  	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;

-	ret = WAIT_TIMEOUT(map, chip, adr, udelay);
+	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay);
  	if (ret) {
  		map_write(map, CMD(0x70), adr);
  		chip->state = FL_STATUS;
diff --git a/include/linux/mtd/flashchip.h b/include/linux/mtd/flashchip.h
index 39e7d2a..0299699 100644
--- a/include/linux/mtd/flashchip.h
+++ b/include/linux/mtd/flashchip.h
@@ -76,6 +76,10 @@ struct flchip {
  	int buffer_write_time;
  	int erase_time;

+	int word_write_timeout;
+	int buffer_write_timeout;
+	int erase_timeout;
+
  	void *priv;
  };

-- 
1.5.4.4
