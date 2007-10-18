Date: Thu, 18 Oct 2007 15:15:34 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org, Nico@cam.org
Subject: [PATCH]CFI fix of kernel deadlock caused by get_chip recursion
Message-ID: <Pine.LNX.4.64.0710181501270.32655@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch solves kernel deadlock issue seen on JFFF2 simultaneous operations. 
Detailed investigation of the issue showed that the kernel deadlock is caused bytons of recursive get_chip calls.

MTD:CFI: This fix removes recursion in get_chip function to avoid possible deadlock situation.

Signed-off-by: Alexey Korolev <akorolev at infradead.org>
---
diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-09-25 14:51:06.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-10-18 17:57:35.000000000 +0400
@@ -85,6 +85,7 @@
  static void cfi_intelext_unpoint (struct mtd_info *mtd, u_char *addr, loff_t from,
  			size_t len);

+static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long adr, int mode);
  static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode);
  static void put_chip(struct map_info *map, struct flchip *chip, unsigned long adr);
  #include "fwh_lock.h"
@@ -641,73 +642,14 @@
  /*
   *  *********** CHIP ACCESS FUNCTIONS ***********
   */
-
-static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
+static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
  {
+
  	DECLARE_WAITQUEUE(wait, current);
  	struct cfi_private *cfi = map->fldrv_priv;
  	map_word status, status_OK = CMD(0x80), status_PWS = CMD(0x01);
-	unsigned long timeo;
  	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
-
- resettime:
-	timeo = jiffies + HZ;
- retry:
-	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING || mode == FL_OTP_WRITE)) {
-		/*
-		 * OK. We have possibility for contension on the write/erase
-		 * operations which are global to the real chip and not per
-		 * partition.  So let's fight it over in the partition which
-		 * currently has authority on the operation.
-		 *
-		 * The rules are as follows:
-		 *
-		 * - any write operation must own shared->writing.
-		 *
-		 * - any erase operation must own _both_ shared->writing and
-		 *   shared->erasing.
-		 *
-		 * - contension arbitration is handled in the owner's context.
-		 *
-		 * The 'shared' struct can be read and/or written only when
-		 * its lock is taken.
-		 */
-		struct flchip_shared *shared = chip->priv;
-		struct flchip *contender;
-		spin_lock(&shared->lock);
-		contender = shared->writing;
-		if (contender && contender != chip) {
-			/*
-			 * The engine to perform desired operation on this
-			 * partition is already in use by someone else.
-			 * Let's fight over it in the context of the chip
-			 * currently using it.  If it is possible to suspend,
-			 * that other partition will do just that, otherwise
-			 * it'll happily send us to sleep.  In any case, when
-			 * get_chip returns success we're clear to go ahead.
-			 */
-			int ret = spin_trylock(contender->mutex);
-			spin_unlock(&shared->lock);
-			if (!ret)
-				goto retry;
-			spin_unlock(chip->mutex);
-			ret = get_chip(map, contender, contender->start, mode);
-			spin_lock(chip->mutex);
-			if (ret) {
-				spin_unlock(contender->mutex);
-				return ret;
-			}
-			timeo = jiffies + HZ;
-			spin_lock(&shared->lock);
-			spin_unlock(contender->mutex);
-		}
-
-		/* We now own it */
-		shared->writing = chip;
-		if (mode == FL_ERASING)
-			shared->erasing = chip;
-		spin_unlock(&shared->lock);
-	}
+	unsigned long timeo = jiffies + HZ;

  	switch (chip->state) {

@@ -722,16 +664,11 @@
  			if (chip->priv && map_word_andequal(map, status, status_PWS, status_PWS))
  				break;

-			if (time_after(jiffies, timeo)) {
-				printk(KERN_ERR "%s: Waiting for chip to be ready timed out. Status %lx\n",
-				       map->name, status.x[0]);
-				return -EIO;
-			}
  			spin_unlock(chip->mutex);
  			cfi_udelay(1);
  			spin_lock(chip->mutex);
  			/* Someone else might have been playing with it. */
-			goto retry;
+			return -EAGAIN;
  		}

  	case FL_READY:
@@ -806,8 +743,81 @@
  		schedule();
  		remove_wait_queue(&chip->wq, &wait);
  		spin_lock(chip->mutex);
-		goto resettime;
+		return -EAGAIN;
+	}
+}
+
+static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
+{
+	int ret;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+ retry:
+	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING || mode == FL_OTP_WRITE)) {
+		/*
+		 * OK. We have possibility for contension on the write/erase
+		 * operations which are global to the real chip and not per
+		 * partition.  So let's fight it over in the partition which
+		 * currently has authority on the operation.
+		 *
+		 * The rules are as follows:
+		 *
+		 * - any write operation must own shared->writing.
+		 *
+		 * - any erase operation must own _both_ shared->writing and
+		 *   shared->erasing.
+		 *
+		 * - contension arbitration is handled in the owner's context.
+		 *
+		 * The 'shared' struct can be read and/or written only when
+		 * its lock is taken.
+		 */
+		struct flchip_shared *shared = chip->priv;
+		struct flchip *contender;
+		spin_lock(&shared->lock);
+		contender = shared->writing;
+		if (contender && contender != chip) {
+			/*
+			 * The engine to perform desired operation on this
+			 * partition is already in use by someone else.
+			 * Let's fight over it in the context of the chip
+			 * currently using it.  If it is possible to suspend,
+			 * that other partition will do just that, otherwise
+			 * it'll happily send us to sleep.  In any case, when
+			 * get_chip returns success we're clear to go ahead.
+			 */
+			ret = spin_trylock(contender->mutex);
+			spin_unlock(&shared->lock);
+			if (!ret)
+				goto retry;
+			spin_unlock(chip->mutex);
+			ret = chip_ready(map, contender, contender->start, mode);
+			spin_lock(chip->mutex);
+
+			if (ret == -EAGAIN) {
+				spin_unlock(contender->mutex);
+				goto retry;
+			}
+			if (ret) {
+				spin_unlock(contender->mutex);
+				return ret;
+			}
+			spin_lock(&shared->lock);
+			spin_unlock(contender->mutex);
+		}
+
+		/* We now own it */
+		shared->writing = chip;
+		if (mode == FL_ERASING)
+			shared->erasing = chip;
+		spin_unlock(&shared->lock);
  	}
+
+	ret = chip_ready(map, chip, adr, mode);
+	if (ret == -EAGAIN)
+		goto retry;
+
+	return ret;
  }

  static void put_chip(struct map_info *map, struct flchip *chip, unsigned long adr)

Thanks,
Alexey
