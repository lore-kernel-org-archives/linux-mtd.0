Message-Id: <200911172245.nAHMjnss001994@imap1.linux-foundation.org>
Subject: [patch 4/4] mtd/nand: fix multi-chip suspend problem
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 17 Nov 2009 14:45:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: b24347@freescale.com, akpm@linux-foundation.org, leoli@freescale.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Li Yang <leoli@freescale.com>

Symptom:
device_suspend(): mtd_cls_suspend+0x0/0x58 returns -11
PM: Device mtd14 failed to suspend: error -11
PM: Some devices failed to suspend

This patch enables other chips to be suspended if the active chip of
the controller has been suspended.

Signed-off-by: Jin Qing <b24347@freescale.com>
Signed-off-by: Li Yang <leoli@freescale.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nand_base.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff -puN drivers/mtd/nand/nand_base.c~mtd-nand-fix-multi-chip-suspend-problem drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c~mtd-nand-fix-multi-chip-suspend-problem
+++ a/drivers/mtd/nand/nand_base.c
@@ -697,10 +697,16 @@ nand_get_device(struct nand_chip *chip, 
 		spin_unlock(lock);
 		return 0;
 	}
-	if (new_state == FL_PM_SUSPENDED) {
-		spin_unlock(lock);
-		return (chip->state == FL_PM_SUSPENDED) ? 0 : -EAGAIN;
-	}
+	if (new_state == FL_PM_SUSPENDED)
+		if (chip->controller->active->state == FL_PM_SUSPENDED) {
+			chip->state = FL_PM_SUSPENDED;
+			spin_unlock(lock);
+			return 0;
+		} else {
+			spin_unlock(lock);
+			return -EAGAIN;
+		}
+
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	add_wait_queue(wq, &wait);
 	spin_unlock(lock);
_
