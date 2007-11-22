Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvGXS-0007sq-B6
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 13:12:40 -0500
Message-ID: <4745C686.6030604@users.sourceforge.net>
Date: Thu, 22 Nov 2007 19:12:22 +0100
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: tike64 <tike64@yahoo.com>
Subject: Re: Very slow nor flash write
References: <497747.61534.qm@web59203.mail.re1.yahoo.com>
In-Reply-To: <497747.61534.qm@web59203.mail.re1.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

tike64 wrote:
> Dear List,
> 
> I have an LH7A400 board and there intel 28F160B3T nor flash chip. I managed to configure Linux 2.6.18 to access the chip as an MTD device. However, the write access was very slow, about 40ms per word or 0.00005 MB/s ;-)
> 
> I traced the problem to inval_cache_and_wait_for_operation() in cfi_cmdset_0001.c. In the for-loop, if the write access haven't finished when checked for the first time, a long "msleep(sleep_time/1000);" is triggered. The sleep duration is very long because chip_op_time value is 50000. The value comes from "cfi->chips[i].word_write_time = 50000;" in cfi_cmdset_0001(). That is wrong, I think. I changed it to 200 and now the writing is as fast as expected.
> 
> Now, the question is: How this should be fixed *correctly*? The 200 is the maximum word program time for this particular chip. Maybe it should have different value for different chips.

There is actually a more serious problem in this code area. It is falsely assumed
that chip_op_time * 8 is long enough for the timeout. On aging and failing flash chips
this is not enough. The max value that the datasheet specifies is required. Otherwise
you will get a timeout while the chip is still trying to perform the operation.
After a timeout the mtd driver proceeds like nothing happened and the chip will be
in a different state than the driver expects it to be in and you get lots of errors
when subsequent operations fail.

This patch applies to linux kernel 2.6.18. It might help for your problem and hopefully
gives an idea of the problem I described. It still exists in current git. I had hoped
to update this patch for current git before posting it but haven't had time for it yet.

/Anders


diff -urpN linux-2.6.18.orig/drivers/mtd/chips/cfi_cmdset_0001.c 
linux-2.6.18/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.18.orig/drivers/mtd/chips/cfi_cmdset_0001.c	2006-09-20 05:42:06.000000000 +0200
+++ linux-2.6.18/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-22 18:08:24.000000000 +0100
@@ -401,6 +401,12 @@ struct mtd_info *cfi_cmdset_0001(struct
  		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
  		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
  		cfi->chips[i].erase_time = 1000<<cfi->cfiq->BlockEraseTimeoutTyp;
+		cfi->chips[i].word_write_timeout = 1<<(cfi->cfiq->WordWriteTimeoutTyp +
+		                                       cfi->cfiq->WordWriteTimeoutMax);
+		cfi->chips[i].buffer_write_timeout = 1<<(cfi->cfiq->BufWriteTimeoutTyp +
+		                                         cfi->cfiq->BufWriteTimeoutMax);
+		cfi->chips[i].erase_timeout = 1000<<(cfi->cfiq->BlockEraseTimeoutTyp +
+		                                     cfi->cfiq->BlockEraseTimeoutMax);
  		cfi->chips[i].ref_point_counter = 0;
  		init_waitqueue_head(&(cfi->chips[i].wq));
  	}
@@ -908,7 +914,7 @@ static void __xipram xip_enable(struct m

  static int __xipram xip_wait_for_operation(
  		struct map_info *map, struct flchip *chip,
-		unsigned long adr, unsigned int chip_op_time )
+		unsigned long adr, unsigned int chip_op_time, unsigned int chip_op_timeout)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
  	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
@@ -917,7 +923,7 @@ static int __xipram xip_wait_for_operati
  	flstate_t oldstate, newstate;

         	start = xip_currtime();
-	usec = chip_op_time * 8;
+	usec = chip_op_timeout;
  	if (usec == 0)
  		usec = 500000;
  	done = 0;
@@ -1027,8 +1033,8 @@ static int __xipram xip_wait_for_operati
  #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
  	INVALIDATE_CACHED_RANGE(map, from, size)

-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, usec)
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len, usec, usec_max) \
+	xip_wait_for_operation(map, chip, cmd_adr, usec, usec_max)

  #else

@@ -1040,7 +1046,7 @@ static int __xipram xip_wait_for_operati
  static int inval_cache_and_wait_for_operation(
  		struct map_info *map, struct flchip *chip,
  		unsigned long cmd_adr, unsigned long inval_adr, int inval_len,
-		unsigned int chip_op_time)
+		unsigned int chip_op_time, unsigned int chip_op_timeout)
  {
  	struct cfi_private *cfi = map->fldrv_priv;
  	map_word status, status_OK = CMD(0x80);
@@ -1052,8 +1058,7 @@ static int inval_cache_and_wait_for_oper
  		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
  	spin_lock(chip->mutex);

-	/* set our timeout to 8 times the expected delay */
-	timeo = chip_op_time * 8;
+	timeo = chip_op_timeout;
  	if (!timeo)
  		timeo = 500000;
  	sleep_time = chip_op_time / 2;
@@ -1107,7 +1112,7 @@ static int inval_cache_and_wait_for_oper
  #endif

  #define WAIT_TIMEOUT(map, chip, adr, udelay) \
-	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay);
+	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay, udelay * 8);


  static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
@@ -1331,7 +1336,8 @@ static int __xipram do_write_oneword(str

  	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
  				   adr, map_bankwidth(map),
-				   chip->word_write_time);
+				   chip->word_write_time,
+				   chip->word_write_timeout);
  	if (ret) {
  		xip_enable(map, chip, adr);
  		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
@@ -1568,7 +1574,8 @@ static int __xipram do_write_buffer(stru

  	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
  				   adr, len,
-				   chip->buffer_write_time);
+				   chip->buffer_write_time,
+				   chip->buffer_write_timeout);
  	if (ret) {
  		map_write(map, CMD(0x70), cmd_adr);
  		chip->state = FL_STATUS;
@@ -1703,7 +1710,8 @@ static int __xipram do_erase_oneblock(st

  	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
  				   adr, len,
-				   chip->erase_time);
+				   chip->erase_time,
+				   chip->erase_timeout);
  	if (ret) {
  		map_write(map, CMD(0x70), adr);
  		chip->state = FL_STATUS;
diff -urpN linux-2.6.18.orig/include/linux/mtd/flashchip.h linux-2.6.18/include/linux/mtd/flashchip.h
--- linux-2.6.18.orig/include/linux/mtd/flashchip.h	2006-09-20 05:42:06.000000000 +0200
+++ linux-2.6.18/include/linux/mtd/flashchip.h	2007-09-11 20:46:03.000000000 +0200
@@ -75,6 +75,10 @@ struct flchip {
  	int buffer_write_time;
  	int erase_time;

+	int word_write_timeout;
+	int buffer_write_timeout;
+	int erase_timeout;
+
  	void *priv;
  };
