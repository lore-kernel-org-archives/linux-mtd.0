Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1496EC01A9
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2026 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6OzMSc/x9rzDe2QCuKlpQmY05U2ypcuk+JKMq3TzTlo=; b=F05aj2MJOmy1Wx
	jdwnvzOjm2y4nVOV+KFxe5mAEE2ccTiXX5WcYk5y/vQ2l8PyrctnEI+VkNF4BjRgH7Vl+Gd8tJXev
	NZRJB5OZbzGBY0QsN9GwnMzk45Qs/ylwbOd3+tN3eGCkjbHznjkVPloCg0yE54zPiR9N9/6ISZRCQ
	s6nlFv4axiEogIcMLGcYrpTmGx0vtDNhp+Rb5HJ/7ewYf0S1jLvQl6XFI5JlOAoT9PWspaA24ixDw
	G8sgeRLYHB1Mz5wBbZisUyYi4dfwl+hYT8HF/AeiLRMw1ia6Q5DTGNSjUwpU3eLQY6nngTe4T8R6u
	Pfugyw7LN1VX+Jps3mYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bUT-0000000GN0D-071x;
	Mon, 23 Mar 2026 09:22:29 +0000
Received: from mx2.cyberprotect.ru ([176.10.93.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bUP-0000000GMzR-3LdP
	for linux-mtd@lists.infradead.org;
	Mon, 23 Mar 2026 09:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=NOaRPSDC4hvOaKwBBZyyruA+Hbtj/kUSKaD2sInZ+tw=; b=d3aNjm/tHXxGtTmRiZ3AaBhrHP
	OzNSJXT/5mDIvqEylm3qt0+2UXRLPtWUpfmCl8E4ZYTfhJyupaC9vo0RNZhRFf+vkzuRxfhppqTIA
	VLmCS0e+iqtJxeyN4R9/KQc6R9auPTBFvgpo4GaSdtQf6YwWdizc+BySfmn4O2jSVoBjy4FurngQm
	2/XpX71RnfxfOPxQ/1ESll/G67xQapn2TO2aD4nn/ZewQuBntynK7aoJHLcpLa1S9vQhcR7ijt6ue
	5mIjjxka4R+RW5l8adKwbDTfFXyI2cMSGewpFylufIIrVdzXp5f1jxGT5OpNyeoW/M4E6SAAZvXoy
	cp8pBOZw==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=NOaRPSDC4hvOaKwBBZyyruA+Hbtj/kUSKaD2sInZ+tw=; b=zE/pLUgDUXBX4OxpntXEU+z4RV
	WAI3wY5/gNmVvSRFdv9YJk6CPu7XGcDgXU58c9Rrg9sZKiiBqfW05HdPbRBw==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: David Woodhouse <dwmw2@infradead.org>
CC: Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] jffs2: fix use-after-free in jffs2_garbage_collect_thread()
Date: Mon, 23 Mar 2026 12:21:42 +0300
Message-ID: <20260323092142.15241-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Originating-IP: [10.80.0.30]
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-2.aip.ooo
 (10.77.28.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_022226_339487_DB1EAD8E 
X-CRM114-Status: GOOD (  11.12  )
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
kthread_complete_and_exit() calls complete() on gc_thread_exit. These operations
are not atomic: stop path can see gc_task == NULL, skip wait_for_completion(),
and the caller frees jffs2_sb_info while the GC thread still accesses
gc_thread_exit in complete().

Fix moving complete() under erase_completion_lock together with gc_task =
NULL, and replacing kthread_complete_and_exit() with kthread_exit(). The
conditional wait in stop path is preserved as it is needed when
jffs2_do_fill_super() fails before start().

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: e2d48b1a98bb ("[JFFS2] Fix cleanup in case of GC-Task not started")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 fs/jffs2/background.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index bb0ee1a59e71..abf0572dfd3c 100644
--- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -160,6 +160,7 @@ static int jffs2_garbage_collect_thread(void *_c)
  die:
 	spin_lock(&c->erase_completion_lock);
 	c->gc_task = NULL;
+	complete(&c->gc_thread_exit);
 	spin_unlock(&c->erase_completion_lock);
-	kthread_complete_and_exit(&c->gc_thread_exit, 0);
+	kthread_exit(0);
 }
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
