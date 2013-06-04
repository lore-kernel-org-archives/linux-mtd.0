Received: from mail-pd0-f170.google.com ([209.85.192.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjgLM-0007Ud-R6
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2013 01:47:25 +0000
Received: by mail-pd0-f170.google.com with SMTP id x10so6485995pdj.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2013 18:47:03 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/3] mtd: cfi_cmdset_0002: increase do_write_buffer() timeout
Date: Mon,  3 Jun 2013 18:46:46 -0700
Message-Id: <1370310406-413-3-git-send-email-computersforpeace@gmail.com>
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

I have seen various failures like this while doing a simple reboot +
mount UBIFS test:

  UBIFS: recovery needed
  MTD do_write_buffer(): software timeout
  UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 365:43648, written 192 bytes

(This message doens't exactly match the message in the current head of
tree, as Huang edited the timeout message.)

I'm using a 64Mbyte Spansion S29GL512 NOR flash. I've also seen reports
of the same failure on Micron 128Mbyte NOR flash AM29EWLD.

After various tests, it seems simply that the timeout is not long enough
for my system; increasing it by a few jiffies prevented all failures
(testing for 12+ hours). There is no harm in increasing the timeout, but
there is harm in having it too short, as evidenced here.

This patch increases the timeout value in 3 locations, as they all are
referencing the do_write_oneword function. I have only ever seen the
timeout in do_write_buffer().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 4e28081..45de025 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1228,14 +1228,11 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo;
 	/*
-	 * We use a 1ms generic timeout for writes (most devices have a max
-	 * write time of a few hundreds usec). However, we should use the
-	 * maximum timeout value given by the chip at probe time instead.
-	 * Unfortunately, struct flchip does have a field for maximum timeout,
-	 * only for typical which can be far too short depending of the
-	 * conditions.
+	 * We use a 10ms generic timeout for writes. Most devices have a max
+	 * write time of a few hundreds usec, but timeouts have been seen with
+	 * too few jiffies.
 	 */
-	unsigned long uWriteTimeout = msecs_to_jiffies(1);
+	unsigned long uWriteTimeout = msecs_to_jiffies(10);
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
@@ -1465,7 +1462,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo;
 	/* see comments in do_write_oneword() regarding uWriteTimeout */
-	unsigned long uWriteTimeout = msecs_to_jiffies(1);
+	unsigned long uWriteTimeout = msecs_to_jiffies(10);
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
@@ -1716,7 +1713,7 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
 				  unsigned long adr, map_word datum)
 {
-	const unsigned long uWriteTimeout = msecs_to_jiffies(1);
+	const unsigned long uWriteTimeout = msecs_to_jiffies(10);
 	struct cfi_private *cfi = map->fldrv_priv;
 	int retry_cnt = 0;
 	map_word oldd;
-- 
1.8.2.3
