Received: from [167.98.27.226] (helo=rainbowdash.ducie.codethink.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3Rg1-0001jj-Mn
 for linux-mtd@lists.infradead.org; Wed, 26 Apr 2017 18:28:35 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/1] mtd: mtdblock: avoid __might_sleep warnings in mtd_erase
Date: Wed, 26 Apr 2017 18:46:09 +0100
Message-Id: <20170426174609.29433-2-ben.dooks@codethink.co.uk>
In-Reply-To: <20170426174609.29433-1-ben.dooks@codethink.co.uk>
References: <20170426174609.29433-1-ben.dooks@codethink.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_erase() call can hit code that will trigger warnings
from __might_sleep(), such as the do_erase_oneblock() function
on the cfi_cmdset_0002.c file.

This is due to some of the erase functions doing the work in the
thread they are called in, which means that the erase_write()
should only go into TASK_INTERRUPTIBLE once the mtd_erase call
has returned.

Note, this still does not check if the erase->state is not set
to an error.

This should stop the following warning being produced:

] WARNING: CPU: 0 PID: 23 at kernel/sched/core.c:7588 __might_sleep+0x84/0x9c()
] do not call blocking ops when !TASK_RUNNING; state=1 set at [<8029c724>] erase_write+0x0/0x178
] Modules linked in:
] CPU: 0 PID: 23 Comm: kworker/0:1 Tainted: G        W       4.4.62-dev-ic-9Feb2017-47164-g95b1e7c09ff3 #855
] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
] Workqueue: mtdblock9 mtd_blktrans_work
] [<8001eddc>] (unwind_backtrace) from [<8001b2fc>] (show_stack+0x10/0x14)
] [<8001b2fc>] (show_stack) from [<80213948>] (dump_stack+0x80/0x9c)
] [<80213948>] (dump_stack) from [<800287d8>] (warn_slowpath_common+0x80/0xac)
] [<800287d8>] (warn_slowpath_common) from [<80028830>] (warn_slowpath_fmt+0x2c/0x3c)
] [<80028830>] (warn_slowpath_fmt) from [<800448ec>] (__might_sleep+0x84/0x9c)
] [<800448ec>] (__might_sleep) from [<8047a714>] (mutex_lock+0x18/0x3c)
] [<8047a714>] (mutex_lock) from [<802a22dc>] (do_erase_oneblock+0x64/0x3b8)
] [<802a22dc>] (do_erase_oneblock) from [<8029d628>] (cfi_varsize_frob+0x144/0x1dc)
] [<8029d628>] (cfi_varsize_frob) from [<8029e930>] (cfi_amdstd_erase_varsize+0x28/0x50)
] [<8029e930>] (cfi_amdstd_erase_varsize) from [<80299370>] (part_erase+0x2c/0x74)
] [<80299370>] (part_erase) from [<8029c7e0>] (erase_write+0xbc/0x178)
] [<8029c7e0>] (erase_write) from [<8029c8c4>] (write_cached_data+0x28/0x3c)
] [<8029c8c4>] (write_cached_data) from [<8029cc70>] (mtdblock_writesect+0x178/0x1bc)
] [<8029cc70>] (mtdblock_writesect) from [<8029bf68>] (mtd_blktrans_work+0x2ec/0x360)
] [<8029bf68>] (mtd_blktrans_work) from [<8003b314>] (process_one_work+0x19c/0x310)
] [<8003b314>] (process_one_work) from [<8003c174>] (worker_thread+0x2e8/0x3d4)
] [<8003c174>] (worker_thread) from [<800403d0>] (kthread+0xe4/0xf8)
] [<800403d0>] (kthread) from [<80017478>] (ret_from_fork+0x14/0x3c)
] ---[ end trace ca8c94fad04126d2 ]---

[ben.hutchings@codethink.co.uk: suggest use of wait_woken()]
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/mtd/mtdblock.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index bb4c14f83c75..4b1cd464f919 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -68,6 +68,7 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 	DECLARE_WAITQUEUE(wait, current);
 	wait_queue_head_t wait_q;
 	size_t retlen;
+	long timeout = 1;
 	int ret;
 
 	/*
@@ -81,12 +82,10 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 	erase.len = len;
 	erase.priv = (u_long)&wait_q;
 
-	set_current_state(TASK_INTERRUPTIBLE);
 	add_wait_queue(&wait_q, &wait);
 
 	ret = mtd_erase(mtd, &erase);
 	if (ret) {
-		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&wait_q, &wait);
 		printk (KERN_WARNING "mtdblock: erase of region [0x%lx, 0x%x] "
 				     "on \"%s\" failed\n",
@@ -94,8 +93,18 @@ static int erase_write (struct mtd_info *mtd, unsigned long pos,
 		return ret;
 	}
 
-	schedule();  /* Wait for erase to finish. */
+	if (erase->state != MTD_ERASE_DONE &&
+	    erase->state != MTD_ERASE_FAILED)
+		timeout = wait_woken(&wait, TASK_INTERRUPTIBLE,
+				     MAX_SCHEDULE_TIMEOUT);
+
 	remove_wait_queue(&wait_q, &wait);
+	if (timeout == 0) {
+		printk (KERN_WARNING "mtdblock: erase of region [0x%lx, 0x%x] "
+				     "on \"%s\" failed\n",
+			pos, len, mtd->name);
+		return -ETIMEDOUT;
+	}
 
 	/*
 	 * Next, write the data to flash.
-- 
2.11.0
