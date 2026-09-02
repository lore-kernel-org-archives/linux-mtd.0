Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB4FC61DD6
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=uMwXn4AQb052NISIvuFZeRKI7Nmdoymtz37KbMjCmgE=; b=AWj
	bkIeJLztW86u7d+cx7iojg16Ufz3FF4n/WpkS28xdmYvIo9sg7BYZkoxnCZ8SR6c+7T7CpGuu5P6t
	hPoOEdA0sz7iwN2Ftj6aHkxqPPZ4mUprXfFxhpbyRU5sThlMpwnFhRGFbSXgUnVFs4jpN9BxKABZY
	Me++P81QgFZ7UHFyvPHI1eDfpQ4rCLgaknhMmI7pTq+79WWccP5qyL+GBPeWHMn3dTczPOuVYrnm1
	o3nR4K0fZNd7HbipKO+mJHXG4H41ZTaMX54wrIvY+3dZngmx2J4NuumrClMIIPEsR7n+1m+u68SZR
	OuNRd0wtRa41/R9RlZqyl4NYKzkVWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1s2i-0000000Fts4-2OHG;
	Wed, 02 Sep 2026 20:58:48 +0000
Received: from mail-oa2-f8.google.com ([74.125.231.72])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1s2f-0000000Ftrf-4Afh
	for linux-mtd@lists.infradead.org;
	Wed, 02 Sep 2026 20:58:47 +0000
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-46683b030d9so520325fac.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2026 13:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382724; x=1788987524;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4xf6SGf5Dw7zSqon+8qknaaazPDfHXGyeR7C4/i2k8=;
        b=oUkYYuYbDGPlDYX9d3tEtQHe6KEkkwnH13WwMLmU0W+lAeGse8Ukd1ebNinZjmuw+n
         BUpWjhBAcliD+YO40D66xGyhXD6KNlCxB+it9vTLu+a6xFTsM958/ZMHdYdesgwJHo04
         ZlUWD/Rwi1YbXBdkOuxRLtXeeGKTyk2vtk3R5+7Cj6Oa5JXSv7xQEtim4c+L/Sw/7tg/
         +7TVvTfLUBbxA3wp3h4pAY1aFy+CDfEJTpyAbCBd/Y8K+7sTnETcis/ydqRR1UScm+ex
         edYP2KWqMzbjmFbzLUH1thK8EthrWGCK+R6Jz6XdGwBO9A1QgdIn7zODw6fmzQdhdVEY
         RKhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpX+eUOiQ8QjU1WTjeBc0DCbMHQI3OzGpEVSwQ6gV+nfUsN9I03qoACBpPg/fbarKv9wQ+VbwJH9eQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mplubHs2SMtsxO00Y+0x3Er7hH+t4PChjHFCPaKox9ayL83e13
	9SS8DPEpQIHS+kaG2MaDfnnMFQbClzjTB94x5H2CHIDl7/R8Mdtzf+WJIiXgUjl9bzsMA3Xg/ED
	Yp3BOP9gS1Lv9WvyjcXVf0Kyn42XY+TBG4CJyFI5wHt3hp5iNNn2EFwpVYFo=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1789:b0:6b1:b23c:2142 with SMTP id
 006d021491bc7-6b47bcc15a6mr6859158eaf.1.1788382724074; Wed, 02 Sep 2026
 13:58:44 -0700 (PDT)
Date: Wed, 02 Sep 2026 13:58:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a988e04.e163c37b.143a1.000c.GAE@google.com>
Subject: [syzbot] [mtd?] possible deadlock in mtd_queue_rq
From: syzbot <syzbot+e08e0a15269eefa87790@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_135846_055776_45123A1C 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
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

Hello,

syzbot found the following issue on:

HEAD commit:    45c13f3f9e3b Merge tag 'hwlock-v7.3' of git://git.kernel.o..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=14f0ee25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6a4e008e57a0e64
dashboard link: https://syzkaller.appspot.com/bug?extid=e08e0a15269eefa87790
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-45c13f3f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f88d9fecef79/vmlinux-45c13f3f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/87ae79a5d86d/zImage-45c13f3f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e08e0a15269eefa87790@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G        W    L     
------------------------------------------------------
kworker/0:0H/11 is trying to acquire lock:
ffff800087b74020 (fs_reclaim){+.+.}-{0:0}, at: might_alloc include/linux/sched/mm.h:316 [inline]
ffff800087b74020 (fs_reclaim){+.+.}-{0:0}, at: slab_pre_alloc_hook mm/slub.c:4636 [inline]
ffff800087b74020 (fs_reclaim){+.+.}-{0:0}, at: slab_alloc_node mm/slub.c:4974 [inline]
ffff800087b74020 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc_cache_node_noprof+0x6c/0x634 mm/slub.c:5578

but task is already holding lock:
ffff000014f95080 (&new->lock){+.+.}-{4:4}, at: mtd_blktrans_work drivers/mtd/mtd_blkdevs.c:151 [inline]
ffff000014f95080 (&new->lock){+.+.}-{4:4}, at: mtd_queue_rq+0x2a4/0x1694 drivers/mtd/mtd_blkdevs.c:179

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&new->lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x3d0/0x44c kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x150/0x1530 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       mtd_blktrans_work drivers/mtd/mtd_blkdevs.c:151 [inline]
       mtd_queue_rq+0x2a4/0x1694 drivers/mtd/mtd_blkdevs.c:179
       blk_mq_dispatch_rq_list+0x2e0/0x177c block/blk-mq.c:2117
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0x830/0xe60 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0x7c/0x114 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0xf0/0x278 block/blk-mq.c:2531
       process_one_work+0x830/0x1c00 kernel/workqueue.c:3387
       process_scheduled_works kernel/workqueue.c:3470 [inline]
       worker_thread+0x42c/0xc90 kernel/workqueue.c:3551
       kthread+0x2ec/0x384 kernel/kthread.c:436
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #3 (set->srcu){.+.+}-{0:0}:
       lock_sync+0xf0/0x16c kernel/locking/lockdep.c:5934
       srcu_lock_sync include/linux/srcu.h:210 [inline]
       __synchronize_srcu+0xa8/0x280 kernel/rcu/srcutree.c:1462
       synchronize_srcu_expedited kernel/rcu/srcutree.c:1502 [inline]
       synchronize_srcu+0x168/0x7d0 kernel/rcu/srcutree.c:1558
       blk_mq_wait_quiesce_done block/blk-mq.c:284 [inline]
       blk_mq_wait_quiesce_done block/blk-mq.c:281 [inline]
       blk_mq_quiesce_queue block/blk-mq.c:304 [inline]
       blk_mq_quiesce_queue+0xf4/0x160 block/blk-mq.c:299
       elevator_switch+0x118/0x430 block/elevator.c:576
       elevator_change+0x294/0x420 block/elevator.c:681
       elevator_set_default+0x210/0x2b8 block/elevator.c:754
       blk_register_queue+0x36c/0x500 block/blk-sysfs.c:992
       __add_disk+0x510/0xb48 block/genhd.c:524
       add_disk_fwnode+0x110/0x3e0 block/genhd.c:593
       device_add_disk+0x14/0x20 block/genhd.c:623
       add_disk include/linux/blkdev.h:798 [inline]
       nbd_dev_add+0x5f8/0x9b4 drivers/block/nbd.c:2026
       nbd_init+0x190/0x1b0 drivers/block/nbd.c:2743
       do_one_initcall+0x134/0xb20 init/main.c:1357
       do_initcall_level init/main.c:1419 [inline]
       do_initcalls init/main.c:1435 [inline]
       do_basic_setup init/main.c:1455 [inline]
       kernel_init_freeable+0x5ec/0x670 init/main.c:1670
       kernel_init+0x2c/0x14c init/main.c:1560
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #2 (&q->elevator_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x3d0/0x44c kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x150/0x1530 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       elevator_change+0x188/0x420 block/elevator.c:679
       elevator_set_none+0x90/0xec block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5102 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5147 [inline]
       blk_mq_update_nr_hw_queues+0x3c0/0x1020 block/blk-mq.c:5212
       nbd_start_device+0x128/0xa28 drivers/block/nbd.c:1530
       nbd_genl_connect+0xb50/0x1394 drivers/block/nbd.c:2310
       genl_family_rcv_msg_doit+0x1c0/0x28c net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x3f8/0x60c net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x1ac/0x360 net/netlink/af_netlink.c:2556
       genl_rcv+0x38/0x54 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
       netlink_unicast+0x418/0x6e0 net/netlink/af_netlink.c:1345
       netlink_sendmsg+0x638/0xa4c net/netlink/af_netlink.c:1900
       sock_sendmsg_nosec net/socket.c:800 [inline]
       __sock_sendmsg+0xc8/0x1a4 net/socket.c:815
       ____sys_sendmsg+0x52c/0x76c net/socket.c:2713
       ___sys_sendmsg+0x124/0x1a4 net/socket.c:2767
       __sys_sendmsg+0x10c/0x198 net/socket.c:2799
       __compat_sys_sendmsg net/compat.c:345 [inline]
       __do_compat_sys_sendmsg net/compat.c:352 [inline]
       __se_compat_sys_sendmsg net/compat.c:349 [inline]
       __arm64_compat_sys_sendmsg+0x74/0xa4 net/compat.c:349
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x74/0x240 arch/arm64/kernel/syscall.c:49
       el0_svc_common.constprop.0+0xac/0x230 arch/arm64/kernel/syscall.c:121
       do_el0_svc_compat+0x40/0x58 arch/arm64/kernel/syscall.c:146
       el0_svc_compat+0x54/0x264 arch/arm64/kernel/entry-common.c:909
       el0t_32_sync_handler+0x88/0xac arch/arm64/kernel/entry-common.c:927
       el0t_32_sync+0x19c/0x1a0 arch/arm64/kernel/entry.S:595

-> #1 (&q->q_usage_counter(io)#33){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x3d0/0x44c kernel/locking/lockdep.c:5843
       blk_alloc_queue+0x4e0/0x640 block/blk-core.c:504
       blk_mq_alloc_queue+0x148/0x224 block/blk-mq.c:4420
       __blk_mq_alloc_disk+0x20/0x120 block/blk-mq.c:4467
       nbd_dev_add+0x3d0/0x9b4 drivers/block/nbd.c:1996
       nbd_init+0x190/0x1b0 drivers/block/nbd.c:2743
       do_one_initcall+0x134/0xb20 init/main.c:1357
       do_initcall_level init/main.c:1419 [inline]
       do_initcalls init/main.c:1435 [inline]
       do_basic_setup init/main.c:1455 [inline]
       kernel_init_freeable+0x5ec/0x670 init/main.c:1670
       kernel_init+0x2c/0x14c init/main.c:1560
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add+0x114/0xca0 kernel/locking/lockdep.c:3181
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x13f4/0x1a5c kernel/locking/lockdep.c:5253
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x3d0/0x44c kernel/locking/lockdep.c:5843
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0x130/0x158 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4636 [inline]
       slab_alloc_node mm/slub.c:4974 [inline]
       __kmalloc_cache_node_noprof+0x6c/0x634 mm/slub.c:5578
       _kmalloc_node_noprof include/linux/slab.h:1196 [inline]
       __get_vm_area_node+0x118/0x2ec mm/vmalloc.c:3238
       __vmalloc_node_range_noprof+0x198/0x1024 mm/vmalloc.c:4065
       __vmalloc_node_noprof+0xe4/0x14c mm/vmalloc.c:4166
       vmalloc_noprof+0x24/0x30 mm/vmalloc.c:4201
       mtdblock_writesect+0x41c/0x5b8 drivers/mtd/mtdblock.c:242
       do_blktrans_request drivers/mtd/mtd_blkdevs.c:88 [inline]
       mtd_blktrans_work drivers/mtd/mtd_blkdevs.c:152 [inline]
       mtd_queue_rq+0x744/0x1694 drivers/mtd/mtd_blkdevs.c:179
       blk_mq_dispatch_rq_list+0x2e0/0x177c block/blk-mq.c:2117
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0x830/0xe60 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0x7c/0x114 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0xf0/0x278 block/blk-mq.c:2531
       process_one_work+0x830/0x1c00 kernel/workqueue.c:3387
       process_scheduled_works kernel/workqueue.c:3470 [inline]
       worker_thread+0x42c/0xc90 kernel/workqueue.c:3551
       kthread+0x2ec/0x384 kernel/kthread.c:436
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> set->srcu --> &new->lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&new->lock);
                               lock(set->srcu);
                               lock(&new->lock);
  lock(fs_reclaim);

 *** DEADLOCK ***

locks held by kworker/0:0H/11: 4, last CPU#0:
 #0: ffff00000ed7c140 ((wq_completion)kblockd){+.+.}-{0:0}, at: process_one_work+0x12ec/0x1c00 kernel/workqueue.c:3362
 #1: ffff80008dc97c70 ((work_completion)(&(&hctx->run_work)->work)){+.+.}-{0:0}, at: process_one_work+0x780/0x1c00 kernel/workqueue.c:3361
 #2: ffff000014cce818 (set->srcu){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:304 [inline]
 #2: ffff000014cce818 (set->srcu){.+.+}-{0:0}, at: blk_mq_run_work_fn+0xc8/0x278 block/blk-mq.c:2531
 #3: ffff000014f95080 (&new->lock){+.+.}-{4:4}, at: mtd_blktrans_work drivers/mtd/mtd_blkdevs.c:151 [inline]
 #3: ffff000014f95080 (&new->lock){+.+.}-{4:4}, at: mtd_queue_rq+0x2a4/0x1694 drivers/mtd/mtd_blkdevs.c:179

stack backtrace:
CPU: 0 UID: 0 PID: 11 Comm: kworker/0:0H Tainted: G        W    L      syzkaller #0 PREEMPT 
Tainted: [W]=WARN, [L]=SOFTLOCKUP
Hardware name: linux,dummy-virt (DT)
Workqueue: kblockd blk_mq_run_work_fn
Call trace:
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x7c/0xb0 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x23c/0x284 kernel/locking/lockdep.c:2059
 check_noncircular+0x174/0x194 kernel/locking/lockdep.c:2191
 check_prev_add+0x114/0xca0 kernel/locking/lockdep.c:3181
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x13f4/0x1a5c kernel/locking/lockdep.c:5253
 lock_acquire kernel/locking/lockdep.c:5886 [inline]
 lock_acquire+0x3d0/0x44c kernel/locking/lockdep.c:5843
 __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
 fs_reclaim_acquire+0x130/0x158 mm/page_alloc.c:4389
 might_alloc include/linux/sched/mm.h:316 [inline]
 slab_pre_alloc_hook mm/slub.c:4636 [inline]
 slab_alloc_node mm/slub.c:4974 [inline]
 __kmalloc_cache_node_noprof+0x6c/0x634 mm/slub.c:5578
 _kmalloc_node_noprof include/linux/slab.h:1196 [inline]
 __get_vm_area_node+0x118/0x2ec mm/vmalloc.c:3238
 __vmalloc_node_range_noprof+0x198/0x1024 mm/vmalloc.c:4065
 __vmalloc_node_noprof+0xe4/0x14c mm/vmalloc.c:4166
 vmalloc_noprof+0x24/0x30 mm/vmalloc.c:4201
 mtdblock_writesect+0x41c/0x5b8 drivers/mtd/mtdblock.c:242
 do_blktrans_request drivers/mtd/mtd_blkdevs.c:88 [inline]
 mtd_blktrans_work drivers/mtd/mtd_blkdevs.c:152 [inline]
 mtd_queue_rq+0x744/0x1694 drivers/mtd/mtd_blkdevs.c:179
 blk_mq_dispatch_rq_list+0x2e0/0x177c block/blk-mq.c:2117
 __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
 blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
 __blk_mq_sched_dispatch_requests+0x830/0xe60 block/blk-mq-sched.c:307
 blk_mq_sched_dispatch_requests+0x7c/0x114 block/blk-mq-sched.c:329
 blk_mq_run_work_fn+0xf0/0x278 block/blk-mq.c:2531
 process_one_work+0x830/0x1c00 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x42c/0xc90 kernel/workqueue.c:3551
 kthread+0x2ec/0x384 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
