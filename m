Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MtKWq-0001vm-6a
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 12:13:05 +0000
Date: Thu, 1 Oct 2009 14:12:50 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH, Repost]: NAND: Add panic_write for NAND flashes
Message-ID: <20091001141250.2f2fa9e4@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is a quick and dirty patch to add panic_write for NAND flashes.
The patch seems to work OK on my CRIS board running a 2.6.26 kernel
with a ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit).
Also compile tested on a fresh x86 MTD git clone.

If you find it useful feel free to apply it, otherwise >/dev/null.

Thanks,

Signed-off-by: Edgar E. Iglesias <edgar@axis.com>
Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>

 drivers/mtd/nand/nand_base.c |  129 +++++++++++++++++++++++++++++++++++++++---
 1 files changed, 121 insertions(+), 8 deletions(-)
---

This patch is written by Edgar. I've only rebased it to the 2.6.32-rc1
and tested it on an ARM Kirkwood OpenRD-base board with a "Toshiba NAND
512MiB 3,3V 8-bit" NAND flash.

It works fine when used from mtdoops. (mtdoops itself has some issues
though, but I'll get back on that).

 drivers/mtd/nand/nand_base.c |  129 +++++++++++++++++++++++++++++++++++++++---
 1 files changed, 121 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2211386..3cc3da9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -428,6 +428,28 @@ static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
 	return nand_isbad_bbt(mtd, ofs, allowbbt);
 }
 
+/**
+ * panic_nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
+ * @mtd:	MTD device structure
+ * @timeo:	Timeout
+ *
+ * Helper function for nand_wait_ready used when needing to wait in interrupt
+ * context.
+ */
+static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
+{
+	struct nand_chip *chip = mtd->priv;
+	int i;
+
+	/* Give the device 400 ms to get ready?	 */
+	for (i = 0; i < timeo; i++) {
+		if (chip->dev_ready(mtd))
+			break;
+		touch_softlockup_watchdog();
+		mdelay(1);
+	}
+}
+
 /*
  * Wait for the ready pin, after a command
  * The timeout is catched later.
@@ -437,6 +459,10 @@ void nand_wait_ready(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd->priv;
 	unsigned long timeo = jiffies + 2;
 
+	/* 400ms timeout?  */
+	if (in_interrupt())
+		return panic_nand_wait_ready(mtd, 400);
+
 	led_trigger_event(nand_led_trigger, LED_FULL);
 	/* wait until command is processed or timeout occures */
 	do {
@@ -672,6 +698,23 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 }
 
 /**
+ * panic_nand_get_device - [GENERIC] Get chip for selected access
+ * @chip:	the nand chip descriptor
+ * @mtd:	MTD device structure
+ * @new_state:	the state which is requested
+ *
+ * Used when in panic, no locks are taken.
+ */
+static void
+panic_nand_get_device(struct nand_chip *chip,
+		      struct mtd_info *mtd, int new_state)
+{
+	/* Hardware controller shared among independend devices */
+	chip->controller->active = chip;
+	chip->state = new_state;
+}
+
+/**
  * nand_get_device - [GENERIC] Get chip for selected access
  * @chip:	the nand chip descriptor
  * @mtd:	MTD device structure
@@ -710,6 +753,32 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
 }
 
 /**
+ * panic_nand_wait - [GENERIC]  wait until the command is done
+ * @mtd:	MTD device structure
+ * @chip:	NAND chip structure
+ * @timeo:	Timeout
+ *
+ * Wait for command done. This is a helper function for nand_wait used when
+ * we are in interrupt context. May happen when in panic and trying to write
+ * an oops trough mtdoops.
+ */
+static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
+			    unsigned long timeo)
+{
+	int i;
+	for (i = 0; i < timeo; i++) {
+		if (chip->dev_ready) {
+			if (chip->dev_ready(mtd))
+				break;
+		} else {
+			if (chip->read_byte(mtd) & NAND_STATUS_READY)
+				break;
+		}
+		mdelay(1);
+        }
+}
+
+/**
  * nand_wait - [DEFAULT]  wait until the command is done
  * @mtd:	MTD device structure
  * @chip:	NAND chip structure
@@ -740,15 +809,19 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	else
 		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
 
-	while (time_before(jiffies, timeo)) {
-		if (chip->dev_ready) {
-			if (chip->dev_ready(mtd))
-				break;
-		} else {
-			if (chip->read_byte(mtd) & NAND_STATUS_READY)
-				break;
+	if (in_interrupt())
+		panic_nand_wait(mtd, chip, timeo);
+	else {
+		while (time_before(jiffies, timeo)) {
+			if (chip->dev_ready) {
+				if (chip->dev_ready(mtd))
+					break;
+			} else {
+				if (chip->read_byte(mtd) & NAND_STATUS_READY)
+					break;
+			}
+			cond_resched();
 		}
-		cond_resched();
 	}
 	led_trigger_event(nand_led_trigger, LED_OFF);
 
@@ -1943,6 +2016,45 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 }
 
 /**
+ * panic_nand_write - [MTD Interface] NAND write with ECC
+ * @mtd:	MTD device structure
+ * @to:		offset to write to
+ * @len:	number of bytes to write
+ * @retlen:	pointer to variable to store the number of written bytes
+ * @buf:	the data to write
+ *
+ * NAND write with ECC. Used when performing writes in interrupt context, this
+ * may for example be called by mtdoops when writing an oops while in panic.
+ */
+static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
+			    size_t *retlen, const uint8_t *buf)
+{
+	struct nand_chip *chip = mtd->priv;
+	int ret;
+
+	/* Do not allow reads past end of device */
+	if ((to + len) > mtd->size)
+		return -EINVAL;
+	if (!len)
+		return 0;
+
+	/* Wait for the device to get ready.  */
+	panic_nand_wait(mtd, chip, 400);
+
+	/* Grab the device.  */
+	panic_nand_get_device(chip, mtd, FL_WRITING);
+
+	chip->ops.len = len;
+	chip->ops.datbuf = (uint8_t *)buf;
+	chip->ops.oobbuf = NULL;
+
+	ret = nand_do_write_ops(mtd, to, &chip->ops);
+
+	*retlen = chip->ops.retlen;
+	return ret;
+}
+
+/**
  * nand_write - [MTD Interface] NAND write with ECC
  * @mtd:	MTD device structure
  * @to:		offset to write to
@@ -2871,6 +2983,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->unpoint = NULL;
 	mtd->read = nand_read;
 	mtd->write = nand_write;
+	mtd->panic_write = panic_nand_write;
 	mtd->read_oob = nand_read_oob;
 	mtd->write_oob = nand_write_oob;
 	mtd->sync = nand_sync;
-- 
1.6.0.4
