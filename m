Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8tZk-0000vt-B2
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 10:40:25 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	nADAeEWR001358 for <linux-mtd@lists.infradead.org>;
	Fri, 13 Nov 2009 03:40:15 -0700 (MST)
Received: from zch01exm26.fsl.freescale.net (zch01exm26.ap.freescale.net
	[10.192.129.221])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id nADAhaeh014128
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Nov 2009 04:43:37 -0600 (CST)
From: Li Yang <leoli@freescale.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd/nand: fix multi-chip suspend problem
Date: Fri, 13 Nov 2009 19:22:33 +0800
Message-Id: <1258111353-21556-1-git-send-email-leoli@freescale.com>
Cc: Jin Qing <b24347@freescale.com>, Li Yang <leoli@freescale.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Symptom:
device_suspend(): mtd_cls_suspend+0x0/0x58 returns -11
PM: Device mtd14 failed to suspend: error -11
PM: Some devices failed to suspend

This patch enables other chips to be suspended if the active chip of
the controller has been suspended.

Signed-off-by: Jin Qing <b24347@freescale.com>
Signed-off-by: Li Yang <leoli@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 2957cc7..6d2f562 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -697,10 +697,16 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
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
-- 
1.6.3.1.6.g4bf1f
