Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjdCV-00045i-HM
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 18:40:16 +0000
Received: by mail-fx0-f214.google.com with SMTP id 6so5097065fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 10:40:11 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 07/15] MTD: nand: make suspend work if device is accessed by
	kernel threads.
Date: Mon, 22 Feb 2010 20:39:34 +0200
Message-Id: <1266863982-5258-8-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Vitaly Wool <vitalywool@gmail.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, stanley.miao@windriver.com,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since all userspace threads are frozen at the time the nand_suspend is called,
they aren't inside any nand function.

We don't call try_to_freeze in nand ether. Thus the only user that can be inside
the nand functions is an non freezeable kernel thread.
Thus we can safely wait for it to finish.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ed62e1e..7442b3a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -773,9 +773,6 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
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
