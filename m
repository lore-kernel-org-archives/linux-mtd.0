Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1dzC-0000iS-Gy
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2015 17:36:07 +0000
Date: Wed, 25 Nov 2015 18:35:43 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
Subject: [PATCH] mtd: nand: do FIFO processing in nand_get_device()
Message-ID: <20151125173543.GA17151@linutronix.de>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
 <20151123181811.GO17308@twins.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20151123181811.GO17308@twins.programming.kicks-ass.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have here a live lock in UBI doing
  ensure_wear_leveling() -> wear_leveling_worker() -> ubi_eba_copy_leb()
  MOVE_RETRY -> schedule_erase() -> ensure_wear_leveling()

on the same PEB over and over again. The reason for MOVE_RETRY is that
the LEB-Lock owner is stucked in nand_get_device() and does not get the
device lock. The PEB-lock owner is only scheduled on the CPU while the UBI
thread is idle during erase or read while (again) owning the device-lock
so the LEB-lock owner makes no progress.

To fix this live lock I ensure that there FIFO processing in
nand_get_device(). On release the first waiter is marked as the new
owner. If someone asks for the device and is not the waiter to which
nand device has been handed over then it will put itself on the
waitqueue.
The FIFO processing was suggested by Peter Zijlstra.

As a small optimization I use add_wait_queue_exclusive() instead
add_wait_queue() to make sure that only _one_ waiter is woken up and not
all of them.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Would a stable be considered as reasonable?

 drivers/mtd/nand/nand_base.c  | 39 ++++++++++++++++++++++++++++++++-------
 include/linux/mtd/flashchip.h |  1 +
 include/linux/mtd/nand.h      |  1 +
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ece544efccc3..e2896af488c0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -137,8 +137,25 @@ static void nand_release_device(struct mtd_info *mtd)
 	/* Release the controller and the chip */
 	spin_lock(&chip->controller->lock);
 	chip->controller->active = NULL;
-	chip->state = FL_READY;
-	wake_up(&chip->controller->wq);
+
+	if (waitqueue_active(&chip->controller->wq)) {
+		wait_queue_head_t *q;
+		wait_queue_t *waiter;
+		unsigned long flags;
+
+		q = &chip->controller->wq;
+		chip->state = FL_HANDOVER;
+
+		spin_lock_irqsave(&q->lock, flags);
+		waiter = list_first_entry(&q->task_list, wait_queue_t,
+					  task_list);
+		spin_unlock_irqrestore(&q->lock, flags);
+
+		chip->controller->handover_waiter = waiter;
+		wake_up(q);
+	} else {
+		chip->state = FL_READY;
+	}
 	spin_unlock(&chip->controller->lock);
 }
 
@@ -843,10 +860,18 @@ nand_get_device(struct mtd_info *mtd, int new_state)
 	if (!chip->controller->active)
 		chip->controller->active = chip;
 
-	if (chip->controller->active == chip && chip->state == FL_READY) {
-		chip->state = new_state;
-		spin_unlock(lock);
-		return 0;
+	if (chip->controller->active == chip) {
+		if (chip->state == FL_READY) {
+			chip->state = new_state;
+			spin_unlock(lock);
+			return 0;
+		}
+		if (chip->state == FL_HANDOVER &&
+		    chip->controller->handover_waiter == &wait) {
+			chip->state = new_state;
+			spin_unlock(lock);
+			return 0;
+		}
 	}
 	if (new_state == FL_PM_SUSPENDED) {
 		if (chip->controller->active->state == FL_PM_SUSPENDED) {
@@ -856,7 +881,7 @@ nand_get_device(struct mtd_info *mtd, int new_state)
 		}
 	}
 	set_current_state(TASK_UNINTERRUPTIBLE);
-	add_wait_queue(wq, &wait);
+	add_wait_queue_exclusive(wq, &wait);
 	spin_unlock(lock);
 	schedule();
 	remove_wait_queue(wq, &wait);
diff --git a/include/linux/mtd/flashchip.h b/include/linux/mtd/flashchip.h
index b63fa457febd..c855f4fd51b8 100644
--- a/include/linux/mtd/flashchip.h
+++ b/include/linux/mtd/flashchip.h
@@ -58,6 +58,7 @@ typedef enum {
 	FL_OTPING,
 	FL_PREPARING_ERASE,
 	FL_VERIFYING_ERASE,
+	FL_HANDOVER,
 
 	FL_UNKNOWN
 } flstate_t;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5a9d1d4c2487..2686dc5dd51b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -439,6 +439,7 @@ struct nand_hw_control {
 	spinlock_t lock;
 	struct nand_chip *active;
 	wait_queue_head_t wq;
+	wait_queue_t *handover_waiter;
 };
 
 /**
-- 
2.6.2
