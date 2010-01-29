Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NasC5-0000yr-14
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 14:51:37 +0000
Received: by mail-bw0-f212.google.com with SMTP id 4so1893103bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 06:51:32 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/16] MTD: nand: make suspend work if device is accessed by
	kernel threads
Date: Fri, 29 Jan 2010 16:50:58 +0200
Message-Id: <1264776663-7042-12-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1264776663-7042-1-git-send-email-maximlevitsky@gmail.com>
References: <1264776663-7042-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since all userspace threads are frozen when nand_suspend is called
 this means they aren't inside any nand function.
We don't call try_to_freeze in nand ether. Thus only user tha can be insize
the nand functions is an non freezeable kernel thread.
Thus we just wait till it finish the access to the device.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 29e986e..961c98f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -744,9 +744,6 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
 			chip->state = FL_PM_SUSPENDED;
 			spin_unlock(lock);
 			return 0;
-		} else {
-			spin_unlock(lock);
-			return -EAGAIN;
 		}
 	}
 	set_current_state(TASK_UNINTERRUPTIBLE);
-- 
1.6.3.3
