Received: from quartz.orcorp.ca ([184.70.90.242])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TKCh3-0001Dj-Qc
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 18:32:16 +0000
Date: Fri, 5 Oct 2012 12:32:02 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] Adjust the NOR CFI flash timeouts to round better
Message-ID: <20121005183202.GA11385@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using jiffies for timeout could have significant rounding, ie if we
start at jiffie 1.9 and timeout at 2 then we may only get .1 jiffies
of timeout, which is not nearly enough. With a Hz of 250 I've seen
random bogus timeouts from this code.

Add a +1 to the HZ calculations to ensure a guaranteed minimum
timeout period.

This also increases the write_buffer timeout to 1.5us since I have
flashes in use that have a datasheet max of over 1 us.

Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 22d0493..46a1dde 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1150,10 +1150,10 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 * use the maximum timeout value given by the chip at probe time
 	 * instead.  Unfortunately, struct flchip does have a field for
 	 * maximum timeout, only for typical which can be far too short
-	 * depending of the conditions.	 The ' + 1' is to avoid having a
-	 * timeout of 0 jiffies if HZ is smaller than 1000.
+	 * depending of the conditions.	 The ' + 2' is to ensure we get
+	 * *at least* 1000us of timeout.
 	 */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	unsigned long uWriteTimeout = (HZ / 1000) + 2;
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
@@ -1382,8 +1382,11 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
-	/* see comments in do_write_oneword() regarding uWriteTimeo. */
-	unsigned long uWriteTimeout = ( HZ / 1000 ) + 1;
+	/* see comments in do_write_oneword() regarding uWriteTimeo.
+	   Note: write_buffer commands take longer so we use a higher
+	   time. The AMD 29LV256M for instance has a datasheet max
+	   of 1.2ms for page and 600us for byte */
+	unsigned long uWriteTimeout = (HZ / 1500) + 2;
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
-- 
1.7.5.4
