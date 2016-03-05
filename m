Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac0tF-0001gQ-22
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 01:20:18 +0000
Received: by mail-pa0-x236.google.com with SMTP id fi3so41646018pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 17:19:56 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Harvey Hunt <harvey.hunt@imgtec.com>,
 Alex Smith <alex.smith@imgtec.com>, Niklas Cassel <niklas.cassel@axis.com>,
 Alex Smith <alex@alex-smith.me.uk>
Subject: [PATCH] mtd: nand: check status before reporting timeout
Date: Fri,  4 Mar 2016 17:19:23 -0800
Message-Id: <1457140763-67571-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In commit b70af9bef49b ("mtd: nand: increase ready wait timeout and
report timeouts"), we increased the likelihood of scheduling during
nand_wait(). This makes us more likely to hit the time_before(...)
condition, since a lot of time may pass before we get scheduled again.

Now, the loop was already buggy, since we don't check if the NAND is
ready after exiting the loop; we simply print out a timeout warning. Fix
this by doing a final status check before printing a timeout message.

This isn't actually a critical bug, since the only effect is a false
warning print. But too many prints never hurt anyone, did they? :)

Side note: perhaps I'm not smart enough, but I'm not sure what the best
policy is for this kind of loop; do we busy loop (i.e., no
cond_resched()) to keep the lowest I/O latency (it's not great if the
resched is delaying Richard's system ~400ms)? Or do we allow
rescheduling, to play nice with the rest of the system (since some
operations can take quite a while)?

Reported-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
Reviewed-by: Harvey Hunt <harvey.hunt@imgtec.com>
---
 drivers/mtd/nand/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f2c8ff398d6c..596a9b0503da 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -566,8 +566,8 @@ void nand_wait_ready(struct mtd_info *mtd)
 		cond_resched();
 	} while (time_before(jiffies, timeo));
 
-	pr_warn_ratelimited(
-		"timeout while waiting for chip to become ready\n");
+	if (!chip->dev_ready(mtd))
+		pr_warn_ratelimited("timeout while waiting for chip to become ready\n");
 out:
 	led_trigger_event(nand_led_trigger, LED_OFF);
 }
-- 
2.7.0.rc3.207.g0ac5344
