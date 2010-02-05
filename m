Received: from mail-bw0-f221.google.com ([209.85.218.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdXRW-00040u-JF
	for linux-mtd@lists.infradead.org; Fri, 05 Feb 2010 23:18:37 +0000
Received: by mail-bw0-f221.google.com with SMTP id 21so3708825bwz.4
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Feb 2010 15:18:30 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/7] MTD: nand: make suspend work if device is accessed by
	kernel threads.
Date: Sat,  6 Feb 2010 01:18:06 +0200
Message-Id: <1265411890-9156-4-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1265411890-9156-1-git-send-email-maximlevitsky@gmail.com>
References: <1265411890-9156-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
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

We don't call try_to_freeze in nand ether. Thus the only user that can be insize
the nand functions is an non freezeable kernel thread.
Thus we can safely wait for it to finish.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 64b0f10..2ff9c02 100644
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
