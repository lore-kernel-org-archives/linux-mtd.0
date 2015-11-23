Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0vYd-0000RG-T5
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 18:09:45 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH 1/2] mtd: nand: schedule() after releasing the device
Date: Mon, 23 Nov 2015 19:09:06 +0100
Message-Id: <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
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

To fix this live lock the patch adds a schedule() invocation if the wait
queue for the nand-device lock is not empty so the waiter can grab the
lock and make progress.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nand_base.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ece544efccc3..3dc2dff01802 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -133,13 +133,23 @@ static int check_offs_len(struct mtd_info *mtd,
 static void nand_release_device(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd->priv;
+	bool do_sched = false;
 
 	/* Release the controller and the chip */
 	spin_lock(&chip->controller->lock);
 	chip->controller->active = NULL;
 	chip->state = FL_READY;
+	/*
+	 * Check if we have a waiter. If so we will schedule() right away so the
+	 * waiter can grab the device while it is released and not after _this_
+	 * caller gained the device (again) without leaving the CPU in between.
+	 */
+	if (waitqueue_active(&chip->controller->wq))
+		do_sched = true;
 	wake_up(&chip->controller->wq);
 	spin_unlock(&chip->controller->lock);
+	if (do_sched)
+		schedule();
 }
 
 /**
-- 
2.6.2
