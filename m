Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMxBd-0001Il-6A
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 06:58:22 +0000
Received: by pzk28 with SMTP id 28so1240799pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 May 2011 23:58:19 -0700 (PDT)
Message-ID: <4DD4BF87.6030107@mvista.com>
Date: Thu, 19 May 2011 15:58:15 +0900
From: Tadashi Abe <tabe@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: mtd: fix hang-up in cfi erase and read contention
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: Tadashi Abe <tabe@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cfi erase command hangs up when erase and read contention occurs.
If read runs at the same address as erase operation, read issues
Erase-Suspend via get_chip() and the erase goes into sleep in wait queue.
But in this case, read operation exits by time-out without waking it up.

I think the other variants (0001, 0020 and lpddr) have the same problem too.
Tested and verified the patch only on CFI-0002 flash, though.

Signed-off-by: Tadashi Abe <tabe@mvista.com>

---
 drivers/mtd/chips/cfi_cmdset_0001.c |    9 +++------
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 +---
 drivers/mtd/chips/cfi_cmdset_0020.c |    1 +
 drivers/mtd/lpddr/lpddr_cmds.c      |    7 +------
 4 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 09cb7c8..121be02 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -812,12 +812,9 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
 			        break;
 
 			if (time_after(jiffies, timeo)) {
-				/* Urgh. Resume and pretend we weren't here.  */
-				map_write(map, CMD(0xd0), adr);
-				/* Make sure we're in 'read status' mode if it had finished */
-				map_write(map, CMD(0x70), adr);
-				chip->state = FL_ERASING;
-				chip->oldstate = FL_READY;
+				/* Urgh. Resume and pretend we weren't here.
+				 * Make sure we're in 'read status' mode if it had finished */
+				put_chip(map, chip, adr);
 				printk(KERN_ERR "%s: Chip not ready after erase "
 				       "suspended: status = 0x%lx\n", map->name, status.x[0]);
 				return -EIO;
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 0b49266..e97e697 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -710,9 +710,7 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 				 * there was an error (so leave the erase
 				 * routine to recover from it) or we trying to
 				 * use the erase-in-progress sector. */
-				map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);
-				chip->state = FL_ERASING;
-				chip->oldstate = FL_READY;
+				put_chip(map, chip, adr);
 				printk(KERN_ERR "MTD %s(): chip not ready after erase suspend\n", __func__);
 				return -EIO;
 			}
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index ed56ad3..179814a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -296,6 +296,7 @@ static inline int do_read_onechip(struct map_info *map, struct flchip *chip, lof
 				/* make sure we're in 'read status' mode */
 				map_write(map, CMD(0x70), cmd_addr);
 				chip->state = FL_ERASING;
+				wake_up(&chip->wq);
 				mutex_unlock(&chip->mutex);
 				printk(KERN_ERR "Chip not ready after erase "
 				       "suspended: status = 0x%lx\n", status.x[0]);
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 1267992..16dcd1c 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -313,12 +313,7 @@ static int chip_ready(struct map_info *map, struct flchip *chip, int mode)
 		if (ret) {
 			/* Oops. something got wrong. */
 			/* Resume and pretend we weren't here.  */
-			map_write(map, CMD(LPDDR_RESUME),
-				map->pfow_base + PFOW_COMMAND_CODE);
-			map_write(map, CMD(LPDDR_START_EXECUTION),
-				map->pfow_base + PFOW_COMMAND_EXECUTE);
-			chip->state = FL_ERASING;
-			chip->oldstate = FL_READY;
+			put_chip(map, chip);
 			printk(KERN_ERR "%s: suspend operation failed."
 					"State may be wrong \n", map->name);
 			return -EIO;
-- 
1.7.4.4
