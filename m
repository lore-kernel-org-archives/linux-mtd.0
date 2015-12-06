Received: from linutronix.de ([2001:470:1f0b:db:abcd:42:0:1]
 helo=Galois.linutronix.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5aE0-00054s-0d
 for linux-mtd@lists.infradead.org; Sun, 06 Dec 2015 14:23:41 +0000
Date: Sun, 6 Dec 2015 15:23:18 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de
Subject: [PATCH v2] mtd: nand: do FIFO processing in nand_get_device()
Message-ID: <20151206142318.GB5816@linutronix.de>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
 <20151123181811.GO17308@twins.programming.kicks-ass.net>
 <20151125173543.GA17151@linutronix.de>
 <20151130161549.GL17308@twins.programming.kicks-ass.net>
 <20151206141757.GA5816@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20151206141757.GA5816@linutronix.de>
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
v1=E2=80=A6v2: drop superfluously locking around list_first_entry()

 drivers/mtd/nand/nand_base.c  | 36 +++++++++++++++++++++++++++++-------
 include/linux/mtd/flashchip.h |  1 +
 include/linux/mtd/nand.h      |  1 +
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ece544efccc3..bd46b75b3540 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -137,8 +137,22 @@ static void nand_release_device(struct mtd_info *mtd)
 	/* Release the controller and the chip */
 	spin_lock(&chip->controller->lock);
 	chip->controller->active =3D NULL;
-	chip->state =3D FL_READY;
-	wake_up(&chip->controller->wq);
+
+	if (waitqueue_active(&chip->controller->wq)) {
+		wait_queue_head_t *q;
+		wait_queue_t *waiter;
+
+		q =3D &chip->controller->wq;
+		chip->state =3D FL_HANDOVER;
+
+		waiter =3D list_first_entry(&q->task_list, wait_queue_t,
+					  task_list);
+
+		chip->controller->handover_waiter =3D waiter;
+		wake_up(q);
+	} else {
+		chip->state =3D FL_READY;
+	}
 	spin_unlock(&chip->controller->lock);
 }
=20
@@ -843,10 +857,18 @@ nand_get_device(struct mtd_info *mtd, int new_state)
 	if (!chip->controller->active)
 		chip->controller->active =3D chip;
=20
-	if (chip->controller->active =3D=3D chip && chip->state =3D=3D FL_READY) {
-		chip->state =3D new_state;
-		spin_unlock(lock);
-		return 0;
+	if (chip->controller->active =3D=3D chip) {
+		if (chip->state =3D=3D FL_READY) {
+			chip->state =3D new_state;
+			spin_unlock(lock);
+			return 0;
+		}
+		if (chip->state =3D=3D FL_HANDOVER &&
+		    chip->controller->handover_waiter =3D=3D &wait) {
+			chip->state =3D new_state;
+			spin_unlock(lock);
+			return 0;
+		}
 	}
 	if (new_state =3D=3D FL_PM_SUSPENDED) {
 		if (chip->controller->active->state =3D=3D FL_PM_SUSPENDED) {
@@ -856,7 +878,7 @@ nand_get_device(struct mtd_info *mtd, int new_state)
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
=20
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
=20
 /**
--=20
2.6.2
