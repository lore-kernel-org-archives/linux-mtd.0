Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3j9-0005hD-E7
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 10:57:57 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [RFC PATCH 5/5] mtd: rawnand: Simplify the locking
Date: Tue, 20 Nov 2018 11:57:20 +0100
Message-Id: <20181120105720.23081-6-boris.brezillon@bootlin.com>
In-Reply-To: <20181120105720.23081-1-boris.brezillon@bootlin.com>
References: <20181120105720.23081-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_get_device() was complex for apparently no good reason. Let's
replace this locking scheme with 2 mutexes: one attached to the
controller and another one attached to the chip.

Every time the core calls nand_get_device(), it will first lock the
chip and if the chip is not suspended, will then lock the controller.
nand_release_device() will release both lock in the reverse order.

nand_get_device() can sleep, just like the previous implementation,
which means you should never call that from an atomic context.

We also get rid of

- the chip->state field, since all it was used for was flagging the
  chip as suspended. We replace it by a field called chip->suspended
  and directly set it from nand_suspend/resume()
- the controller->wq and controller->active fields which are no longer
  needed since the new controller->lock (now a mutex) guarantees that
  all operations are serialized at the controller level
- panic_nand_get_device() which would anyway be a no-op. Talking about
  panic write, I keep thinking the rawnand implementation is unsafe
  because there's not negotiation with the controller to know when it's
  actually done with it's previous operation. I don't intend to fix
  that here, but that's probably something we should look at, or maybe
  we should consider dropping the ->_panic_write() implementation

Last important change to mention: we now return -EBUSY when someone
tries to access a device that as been suspended, and propagate this
error to the upper layer.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 111 +++++++++++++------------------
 include/linux/mtd/rawnand.h      |  24 +++----
 2 files changed, 54 insertions(+), 81 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6c8ab83f8cd3..b0a1d2825079 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -278,11 +278,8 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
 static void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
-	spin_lock(&chip->controller->lock);
-	chip->controller->active = NULL;
-	chip->state = FL_READY;
-	wake_up(&chip->controller->wq);
-	spin_unlock(&chip->controller->lock);
+	mutex_unlock(&chip->controller->lock);
+	mutex_unlock(&chip->lock);
 }
 
 /**
@@ -330,58 +327,24 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 	return nand_block_bad(chip, ofs);
 }
 
-/**
- * panic_nand_get_device - [GENERIC] Get chip for selected access
- * @chip: the nand chip descriptor
- * @new_state: the state which is requested
- *
- * Used when in panic, no locks are taken.
- */
-static void panic_nand_get_device(struct nand_chip *chip, int new_state)
-{
-	/* Hardware controller shared among independent devices */
-	chip->controller->active = chip;
-	chip->state = new_state;
-}
-
 /**
  * nand_get_device - [GENERIC] Get chip for selected access
  * @chip: NAND chip structure
- * @new_state: the state which is requested
  *
- * Get the device and lock it for exclusive access
+ * Lock the device and its controller for exclusive access
+ *
+ * Return: -EBUSY if the chip has been suspended, 0 otherwise
  */
-static int
-nand_get_device(struct nand_chip *chip, int new_state)
+static int nand_get_device(struct nand_chip *chip)
 {
-	spinlock_t *lock = &chip->controller->lock;
-	wait_queue_head_t *wq = &chip->controller->wq;
-	DECLARE_WAITQUEUE(wait, current);
-retry:
-	spin_lock(lock);
-
-	/* Hardware controller shared among independent devices */
-	if (!chip->controller->active)
-		chip->controller->active = chip;
-
-	if (chip->controller->active == chip && chip->state == FL_READY) {
-		chip->state = new_state;
-		spin_unlock(lock);
-		return 0;
+	mutex_lock(&chip->lock);
+	if (chip->suspended) {
+		mutex_unlock(&chip->lock);
+		return -EBUSY;
 	}
-	if (new_state == FL_PM_SUSPENDED) {
-		if (chip->controller->active->state == FL_PM_SUSPENDED) {
-			chip->state = FL_PM_SUSPENDED;
-			spin_unlock(lock);
-			return 0;
-		}
-	}
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	add_wait_queue(wq, &wait);
-	spin_unlock(lock);
-	schedule();
-	remove_wait_queue(wq, &wait);
-	goto retry;
+	mutex_lock(&chip->controller->lock);
+
+	return 0;
 }
 
 /**
@@ -602,7 +565,10 @@ static int nand_block_markbad_lowlevel(struct nand_chip *chip, loff_t ofs)
 		nand_erase_nand(chip, &einfo, 0);
 
 		/* Write bad block marker to OOB */
-		nand_get_device(chip, FL_WRITING);
+		ret = nand_get_device(chip);
+		if (ret)
+			return ret;
+
 		ret = nand_markbad_bbm(chip, ofs);
 		nand_release_device(chip);
 	}
@@ -3580,7 +3546,9 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	    ops->mode != MTD_OPS_RAW)
 		return -ENOTSUPP;
 
-	nand_get_device(chip, FL_READING);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	if (!ops->datbuf)
 		ret = nand_do_read_oob(chip, from, ops);
@@ -4099,9 +4067,6 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	/* Grab the device */
-	panic_nand_get_device(chip, FL_WRITING);
-
 	nand_select_target(chip, chipnr);
 
 	/* Wait for the device to get ready */
@@ -4132,7 +4097,9 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	ops->retlen = 0;
 
-	nand_get_device(chip, FL_WRITING);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -4205,7 +4172,9 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		return -EINVAL;
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip, FL_ERASING);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -4298,7 +4267,7 @@ static void nand_sync(struct mtd_info *mtd)
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip, FL_SYNCING);
+	WARN_ON(nand_get_device(chip));
 	/* Release it and go back */
 	nand_release_device(chip);
 }
@@ -4315,7 +4284,10 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int ret;
 
 	/* Select the NAND device */
-	nand_get_device(chip, FL_READING);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
+
 	nand_select_target(chip, chipnr);
 
 	ret = nand_block_checkbad(chip, offs, 0);
@@ -4388,7 +4360,13 @@ static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
  */
 static int nand_suspend(struct mtd_info *mtd)
 {
-	return nand_get_device(mtd_to_nand(mtd), FL_PM_SUSPENDED);
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	mutex_lock(&chip->lock);
+	chip->suspended = 1;
+	mutex_unlock(&chip->lock);
+
+	return 0;
 }
 
 /**
@@ -4399,11 +4377,13 @@ static void nand_resume(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	if (chip->state == FL_PM_SUSPENDED)
-		nand_release_device(chip);
+	mutex_lock(&chip->lock);
+	if (chip->suspended)
+		chip->suspended = 0;
 	else
 		pr_err("%s called for a chip which is not in suspended state\n",
 			__func__);
+	mutex_unlock(&chip->lock);
 }
 
 /**
@@ -4413,7 +4393,7 @@ static void nand_resume(struct mtd_info *mtd)
  */
 static void nand_shutdown(struct mtd_info *mtd)
 {
-	nand_get_device(mtd_to_nand(mtd), FL_PM_SUSPENDED);
+	nand_suspend(mtd);
 }
 
 /* Set default functions */
@@ -5017,6 +4997,8 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	/* Assume all dies are deselected when we enter nand_scan_ident(). */
 	chip->cur_cs = -1;
 
+	mutex_init(&chip->lock);
+
 	/* Enforce the right timings for reset/detection */
 	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
 
@@ -5716,9 +5698,6 @@ static int nand_scan_tail(struct nand_chip *chip)
 	}
 	chip->subpagesize = mtd->writesize >> mtd->subpage_sft;
 
-	/* Initialize state */
-	chip->state = FL_READY;
-
 	/* Invalidate the pagebuffer reference */
 	chip->pagebuf = -1;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 33e240acdc6d..17d2d9ae33bf 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -16,13 +16,12 @@
 #ifndef __LINUX_MTD_RAWNAND_H
 #define __LINUX_MTD_RAWNAND_H
 
-#include <linux/wait.h>
-#include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/bbm.h>
 #include <linux/mtd/jedec.h>
 #include <linux/mtd/onfi.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
 
@@ -897,25 +896,17 @@ struct nand_controller_ops {
 /**
  * struct nand_controller - Structure used to describe a NAND controller
  *
- * @lock:               protection lock
- * @active:		the mtd device which holds the controller currently
- * @wq:			wait queue to sleep on if a NAND operation is in
- *			progress used instead of the per chip wait queue
- *			when a hw controller is available.
+ * @lock:		lock used to serialize accesses to the NAND controller
  * @ops:		NAND controller operations.
  */
 struct nand_controller {
-	spinlock_t lock;
-	struct nand_chip *active;
-	wait_queue_head_t wq;
+	struct mutex lock;
 	const struct nand_controller_ops *ops;
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
 {
-	nfc->active = NULL;
-	spin_lock_init(&nfc->lock);
-	init_waitqueue_head(&nfc->wq);
+	mutex_init(&nfc->lock);
 }
 
 /**
@@ -983,7 +974,6 @@ struct nand_legacy {
  *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buf_align:		minimum buffer alignment required by a platform
- * @state:		[INTERN] the current state of the NAND device
  * @oob_poi:		"poison value buffer," used for laying out OOB data
  *			before writing
  * @page_shift:		[INTERN] number of address bits in a page (column
@@ -1034,6 +1024,9 @@ struct nand_legacy {
  *			cur_cs < numchips. NAND Controller drivers should not
  *			modify this value, but they're allowed to read it.
  * @read_retries:	[INTERN] the number of read retry modes supported
+ * @lock:		lock protecting the suspended field. Also used to
+ *			serialize accesses to the NAND device.
+ * @suspended:		set to 1 when the device is suspended, 0 when it's not.
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
@@ -1088,7 +1081,8 @@ struct nand_chip {
 
 	int read_retries;
 
-	flstate_t state;
+	struct mutex lock;
+	unsigned int suspended : 1;
 
 	uint8_t *oob_poi;
 	struct nand_controller *controller;
-- 
2.17.1
