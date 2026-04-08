Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D1D1073C8B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wE0H7nEqjVse32PoRaCoHZ3YIzEW5R8opVW5skHeEyY=; b=vcdU044BT8keb5
	Tm3n3Gl+FBATJyjVHtUlNRetJ216Ynet5h0nf5McgIwwaD0bSvinuzEnRHf5ERwLVnxO615DEDFnM
	KUzMAltnz0AO64GPvwx3L3C9qq+ymayOv1nr2fntVPFe1MQi4Yci4SvEuuK2inqj7S0ur+t4h52Qr
	kiMx0Bcg0jRzx2/2nz0SgXj9ss72L6QBZ+endKzJdXv0GBED7eN7/Y8vFt7REUi6PCGiNJyZ/ykI1
	rMPUr2kDRfFcFFT27y5Wx00GFTn4RrPyyPwvCB5YK+eWb3zaMw28W02cW5TLUnHh8SsrKcADzc1x9
	d06PYQAXSVjR+Oig73oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQCY-00000008gkm-3e8H;
	Wed, 08 Apr 2026 10:32:02 +0000
Received: from mx2.cyberprotect.ru ([176.10.93.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQCV-00000008gjy-1yaQ
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 10:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=68jUZvXWunVeoQkkWi7hSN7won0FQkNVFRmyntCsBik=; b=lTkRcwFf+sCVdHbpJtec8fE06e
	oa9g4pnFmuucwBGGsRyLryAYssspJltQ+xrwHyf00GPx7uyx+PUOHDX8qyl6gmBI+WarmS7SK3xMp
	UAm14+pgbHbEEblBfyHTsQEmSoUq7POufCVWDEcUHoQbeZ0CIi6aILk5+f3ilrQKEWDJSxw2lnFsl
	VkK868zJi7rJ+O0RA3sehSkkBSF+tOImDXNjuIp4s1tR3q1S8EYdSdprXOQWlG5ifqQIKkVwBJiMX
	yTFtLb8YyAEmSgelTISFvsUMoINVLjaZoE6XXno0CMEZcyecivxfMte/29QC4gc3eUm7BZNsVkUf9
	cYu1p4qQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=68jUZvXWunVeoQkkWi7hSN7won0FQkNVFRmyntCsBik=; b=TthtbO/fR9kjj40hq1L5bVe2rA
	bY2BuvhSTRPjlz8k+xhTj0TAfuCvxvP3xAfEXCmWVIjjDb8iyfJWMkERIYDw==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: David Woodhouse <dwmw2@infradead.org>
CC: Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2] jffs2: fix use-after-free in jffs2_garbage_collect_thread()
Date: Wed, 8 Apr 2026 13:31:27 +0300
Message-ID: <20260408103127.22218-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Originating-IP: [10.80.0.30]
X-ClientProxiedBy: AIP-EXCH-2.aip.ooo (10.77.28.102) To AIP-EXCH-2.aip.ooo
 (10.77.28.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_033200_015929_AD120921 
X-CRM114-Status: GOOD (  15.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

During fuzz testing, the following issue was discovered.

BUG: KASAN: use-after-free in __lock_acquire+0x3f22/0x53c0 kernel/locking/lockdep.c:4825
Read of size 8 at addr ffff888053cfa098 by task jffs2_gcd_mtd0/11093

CPU: 1 PID: 11093 Comm: jffs2_gcd_mtd0 Not tainted 5.10.232-syzkaller #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x167 lib/dump_stack.c:118
 print_address_description.constprop.0+0x1c/0x220 mm/kasan/report.c:377
 __kasan_report mm/kasan/report.c:537 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:554
 __lock_acquire+0x3f22/0x53c0 kernel/locking/lockdep.c:4825
 lock_acquire kernel/locking/lockdep.c:5566 [inline]
 lock_acquire+0x197/0x480 kernel/locking/lockdep.c:5531
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x36/0x60 kernel/locking/spinlock.c:159
 complete+0x13/0x60 kernel/sched/completion.c:32
 complete_and_exit+0x20/0x40 kernel/exit.c:943
 jffs2_garbage_collect_thread+0x554/0x750 fs/jffs2/background.c:164
 kthread+0x3a9/0x490 kernel/kthread.c:328
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298

Allocated by task 11091:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc.constprop.0+0xc9/0xd0 mm/kasan/common.c:461
 kmalloc include/linux/slab.h:552 [inline]
 kzalloc include/linux/slab.h:664 [inline]
 jffs2_init_fs_context+0x41/0xd0 fs/jffs2/super.c:314
 alloc_fs_context+0x4f9/0x840 fs/fs_context.c:267
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0xb99/0x2140 fs/namespace.c:3247
 do_mount fs/namespace.c:3260 [inline]
 __do_sys_mount fs/namespace.c:3468 [inline]
 __se_sys_mount fs/namespace.c:3445 [inline]
 __x64_sys_mount+0x283/0x300 fs/namespace.c:3445
 do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x67/0xd1

Freed by task 28546:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:56
 kasan_set_free_info+0x1b/0x30 mm/kasan/generic.c:355
 __kasan_slab_free+0x112/0x170 mm/kasan/common.c:422
 slab_free_hook mm/slub.c:1542 [inline]
 slab_free_freelist_hook+0xb8/0x1b0 mm/slub.c:1576
 slab_free mm/slub.c:3149 [inline]
 kfree+0xd9/0x360 mm/slub.c:4125
 deactivate_locked_super+0x96/0x170 fs/super.c:335
 deactivate_super+0xb2/0xd0 fs/super.c:366
 cleanup_mnt+0x3a3/0x530 fs/namespace.c:1118
 task_work_run+0xdf/0x1a0 kernel/task_work.c:185
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:172 [inline]
 exit_to_user_mode_prepare+0x1de/0x1f0 kernel/entry/common.c:199
 syscall_exit_to_user_mode+0x38/0x1e0 kernel/entry/common.c:274

In jffs2_garbage_collect_thread() gc_task is set to NULL and then
kthread_complete_and_exit() calls complete() on gc_thread_exit. These
operations are not atomic: stop path can see gc_task == NULL, skip
wait_for_completion(), and the caller frees jffs2_sb_info while the GC
thread still accesses gc_thread_exit in complete().

Moreover, spin_unlock() itself accesses c after complete() has woken the
stop path:

jffs2_kill_sb                    jffs2_garbage_collect_thread
    jffs2_stop_garbage_collect_thread
      spin_lock
      send_sig(SIGKILL)
      wait = 1
      spin_unlock
                                     goto die
                                     spin_lock
                                     c->gc_task = NULL
                                     spin_unlock
                                     kthread_complete_and_exit()
                                       complete(&c->gc_thread_exit)
      wait_for_completion()
    kfree(c)

Fix by adding a gc_thread_started flag that is set when the GC thread is 
successfully started. Use this flag instead of gc_task to decide whether 
to wait. The flag is never cleared by the GC thread, so 
wait_for_completion() is always called when start() succeeded, regardless 
of the current value of gc_task.
                                   
Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: e2d48b1a98bb ("[JFFS2] Fix cleanup in case of GC-Task not started")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
v1->v2: Use gc_thread_started flag as a reliable indicator instead
    of gc_task. Drop complete() under erase_completion_lock 
    (thanks, Zhihao Cheng).

 fs/jffs2/background.c  | 7 ++++---
 fs/jffs2/jffs2_fs_sb.h | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index bb0ee1a59e71..5e5ed9053326 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -52,6 +52,7 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
 		/* Wait for it... */
 		jffs2_dbg(1, "Garbage collect thread is pid %d\n", tsk->pid);
 		wait_for_completion(&c->gc_thread_start);
+		c->gc_thread_started = true;
 		ret = tsk->pid;
 	}
 
@@ -60,16 +61,16 @@ int jffs2_start_garbage_collect_thread(struct jffs2_sb_info *c)
 
 void jffs2_stop_garbage_collect_thread(struct jffs2_sb_info *c)
 {
-	int wait = 0;
 	spin_lock(&c->erase_completion_lock);
 	if (c->gc_task) {
 		jffs2_dbg(1, "Killing GC task %d\n", c->gc_task->pid);
 		send_sig(SIGKILL, c->gc_task, 1);
-		wait = 1;
 	}
 	spin_unlock(&c->erase_completion_lock);
-	if (wait)
+	if (c->gc_thread_started) {
 		wait_for_completion(&c->gc_thread_exit);
+		c->gc_thread_started = false;
+	}
 }
 
 static int jffs2_garbage_collect_thread(void *_c)
diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 5a7091746f68..4c833e0ff03c 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -55,6 +55,7 @@ struct jffs2_sb_info {
 	unsigned int flags;
 
 	struct task_struct *gc_task;	/* GC task struct */
+	bool gc_thread_started;         /* GC thread was successfully started */
 	struct completion gc_thread_start; /* GC thread start completion */
 	struct completion gc_thread_exit; /* GC thread exit completion port */
 
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
