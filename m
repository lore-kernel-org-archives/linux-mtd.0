Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhVGW-0002pH-7N
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 19:38:28 +0000
Received: by fg-out-1718.google.com with SMTP id 22so3352223fge.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Apr 2008 12:38:26 -0700 (PDT)
Subject: [PATCH] mtd/chips: add missing set_current_state() to
	cfi_{amdstd,staa}_sync()
From: Dmitry Adamushko <dmitry.adamushko@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 03 Apr 2008 21:38:23 +0200
Message-Id: <1207251503.6300.9.camel@earth>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Dmitry Adamushko <dmitry.adamushko@gmail.com>
Subject: [mtd/chips] add missing set_current_state() to cfi_{amdstd,staa}_sync()

cfi_amdstd_sync() and cfi_staa_sync() call schedule() without changing
task's state appropriately.

In case of e.g. chip->state == FL_ERASING, cfi_*_sync() will be busy-looping
either redundantly for a fixed interval of time (for SCHED_NORMAL tasks) or
possibly endlessly (for RT tasks and UP).

Signed-off-by: Dmitry Adamushko <dmitry.adamushko@gmail.com>

---

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d072e87..458d477 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1763,6 +1763,7 @@ static void cfi_amdstd_sync (struct mtd_info *mtd)
 
 		default:
 			/* Not an idle state */
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 
 			spin_unlock(chip->mutex);
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index b344ff8..492e2ab 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -1015,6 +1015,7 @@ static void cfi_staa_sync (struct mtd_info *mtd)
 
 		default:
 			/* Not an idle state */
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 
 			spin_unlock_bh(chip->mutex);
