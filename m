Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E98A606A31C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ui2Ur+jf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=ZfvOBPU/IQ00/HljuupGC9+i083zXjTk4c1SwlB4TVk=; b=Ui2Ur+jfnApfdwFg8JKXxpNtI5
	s/io6dfeG1yeQz8SW9ZeVZSZXPDefstDVen2VSQl6CUn/hmGLhCs6W15SY97DkC6YB7v//YD7D3ft
	zOI4r4hRY5a+9nIRuMWHXsujCoY0lNnhX4PUwKxVpLOYkUfJ87DjMt5Gdv24KVxJuEIUfNDUWfpPU
	sgM7oBjKiIkXMmwXInHrzbreBNQSozlWwD4hWRhMjYcW41NZjIv76ClG74qBRoueI4QEm2UX0Uiub
	cp88+hA0YI8AAGJgPhPuIoAuYF55jiXPlO1WE9gluoZ/0c1WQbG0wyNNbtk7qaQ1K2fQbYTBS8Un7
	E+ssxB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz9L-000000039IL-39v6;
	Mon, 16 Nov 2026 16:01:43 +0000
Received: from mail-oi1-f197.google.com ([209.85.167.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz9G-000000039H6-0whF
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 16:01:39 +0000
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4fb73e868aaso5101030b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2026 08:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844896; x=1795449696;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0fsvDoYJ24C2TuV55z1+g5mjhQlnh9Oe4NQFcSt5zg=;
        b=UdfPe5ArKp/kTEtLe52dXJwMoyiXzvdc3lqtrTV1wnK2vJ90N1I6lyMjSMvZD5II1L
         nssDofCayyAXJ1yBMcDEc9Tiw1ZakmUxiZOVjxGArlJ5qX6YogjmJM0lUNDB+RAwxrsA
         PqcRkJLUY3wLEXJYHiPjuq0gzTYH5WfR6YX7xdvqK25hNe6Sdni/6/XbreEyJ9dE7OYH
         sOS2UDYPaBr+Zi5a5RDOuGporVbQJepETZLE2I091tA1s3W9yt5bHPKW79klTUsPAbf2
         DLrRsZl3BYIoWKTumd3Zjv+4KSrs22VSH0KTkcZMaBYSjgjeLgfjPWZMSMnVGpZ8TnOI
         5ULQ==
X-Forwarded-Encrypted: i=1; AL+hErFZTNjp2wSLk4LMdGFTmdpEDcqEHpCw+kpFopHXYcXtNcLeNpOaaB9h0Cb5SPxCB7MYK7rtLqMapuI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+TT7F1BMGW1BW7AzYLDAvVnrisfMC1CPPkNVeDu13jP4BYq+bk
	RUX+L+i5etC/rHCFZ2ESEKB/Y2nNc6gh9bNeYlYlejyE1/j6wtf/eSp7DY5xQaU/vCS5V34Ai3C
	EV7jfjO90Mlpo1CNmhJC66yzokM8LYAxMo2f6UFfx0t48xiCI+U0wPHrLiS4=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3383:b0:532:d9f5:1de6 with SMTP id
 5614622812f47-56e6625e9ebmr8324361b6e.65.1794844896482; Mon, 16 Nov 2026
 08:01:36 -0800 (PST)
Date: Mon, 16 Nov 2026 08:01:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afb28e0.d140b701.164b01.0001.GAE@google.com>
Subject: [syzbot] [mtd?] possible deadlock in blktrans_release
From: syzbot <syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_080138_295742_C0890FD0 
X-CRM114-Status: UNSURE (   5.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

syzbot found the following issue on:

HEAD commit:    23c62304dde2 Merge tag 'for-linus-7.4a-rc3-tag' of git://g..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=136febfd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=78b97db96b301702
dashboard link: https://syzkaller.appspot.com/bug?extid=c66e7044aa73c620d862
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-23c62304.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/72fee1819d5c/vmlinux-23c62304.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aee675e8df7d/Image-23c62304.gz.xz

AI-generated root cause summary:
A circular locking dependency (deadlock) occurs between memory reclaim
(fs_reclaim) and MTD block device locks (&dev->lock and &mtdblk->cache_mutex).
During regular block request processing, mtd_queue_rq() in
drivers/mtd/mtd_blkdevs.c acquires &dev->lock (and &mtdblk->cache_mutex for
flushes) within the block I/O dispatch path, shielded by memalloc_noio_save().
However, in blktrans_release(), dev->tr->release() (mtdblock_release()) is
invoked while holding &dev->lock without NOIO protection, locking
&mtdblk->cache_mutex to write dirty cached data via write_cached_data() ->
erase_write() -> mtd_erase(). When operating over an mtdconcat device,
concat_erase() in drivers/mtd/mtdconcat.c executes kmalloc_obj(struct
erase_info) with GFP_KERNEL just to make a synchronous local copy of a 24-byte
struct, acquiring fs_reclaim while holding &dev->lock and &mtdblk->cache_mutex
and creating an ABBA deadlock.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=c66e7044aa73c620d862

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com

mtdblock_release
mtdblock: writing cached data for "0.flash" at 0x40000, size 0x40000
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.3.780/6156 is trying to acquire lock:
ffff8000887b8e80
 (fs_reclaim){+.+.}-{0:0}, at: might_alloc include/linux/sched/mm.h:316 [inline]
 (fs_reclaim){+.+.}-{0:0}, at: slab_pre_alloc_hook mm/slub.c:4673 [inline]
 (fs_reclaim){+.+.}-{0:0}, at: slab_alloc_node mm/slub.c:5011 [inline]
 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc_cache_noprof+0x60/0x680 mm/slub.c:5676

but task is already holding lock:
ffff0000180b1db0
 (&mtdblk->cache_mutex){+.+.}-{4:4}, at: mtdblock_release+0x28/0x1ec drivers/mtd/mtdblock.c:288

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #5 (&mtdblk->cache_mutex){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x2b8/0x3fc kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x14c/0x1000 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       mtdblock_release+0x28/0x1ec drivers/mtd/mtdblock.c:288
       blktrans_release+0x198/0x238 drivers/mtd/mtd_blkdevs.c:246
       blkdev_put_whole+0x98/0xf0 block/bdev.c:766
       bdev_release+0x2a4/0x510 block/bdev.c:1189
       blkdev_release+0x14/0x30 block/fops.c:690
       __fput+0x2d0/0x980 fs/file_table.c:512
       fput_close_sync+0xe0/0x238 fs/file_table.c:618
       filp_close_sync+0x5c/0x98 fs/open.c:1574
       __do_sys_close fs/open.c:1597 [inline]
       __se_sys_close fs/open.c:1584 [inline]
       __arm64_sys_close+0x64/0xc0 fs/open.c:1584
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x74/0x240 arch/arm64/kernel/syscall.c:49
       el0_svc_common.constprop.0+0xac/0x230 arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x40/0x58 arch/arm64/kernel/syscall.c:140
       el0_svc+0x58/0x21c arch/arm64/kernel/entry-common.c:797
       el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:816
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

-> #4 (&new->lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x2b8/0x3fc kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x14c/0x1000 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       mtd_blktrans_work drivers/mtd/mtd_blkdevs.c:152 [inline]
       mtd_queue_rq+0x324/0x1754 drivers/mtd/mtd_blkdevs.c:183
       blk_mq_dispatch_rq_list+0x2e0/0x177c block/blk-mq.c:2141
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xc58/0xe60 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0x7c/0x110 block/blk-mq-sched.c:329
       blk_mq_run_hw_queue+0x204/0x4f4 block/blk-mq.c:2379
       blk_mq_dispatch_list+0x3fc/0xc80 block/blk-mq.c:2942
       blk_mq_flush_plug_list block/blk-mq.c:2990 [inline]
       blk_mq_flush_plug_list+0xf0/0x520 block/blk-mq.c:2962
       __blk_flush_plug+0x210/0x3d0 block/blk-core.c:1274
       blk_finish_plug block/blk-core.c:1301 [inline]
       blk_finish_plug+0x5c/0xa8 block/blk-core.c:1298
       read_pages+0x3f0/0x9f0 mm/readahead.c:187
       page_cache_ra_order+0x4c0/0xd28 mm/readahead.c:541
       page_cache_sync_ra+0x5d4/0x990 mm/readahead.c:649
       filemap_get_pages+0x278/0x1760 mm/filemap.c:2743
       filemap_splice_read+0x3a8/0xb30 mm/filemap.c:3132
       blkdev_splice_read+0x84/0xc0 block/fops.c:912
       do_splice_read fs/splice.c:907 [inline]
       do_splice_read+0x1bc/0x364 fs/splice.c:881
       splice_direct_to_actor+0x21c/0x86c fs/splice.c:1004
       do_splice_direct_actor fs/splice.c:1157 [inline]
       do_splice_direct+0x114/0x1e0 fs/splice.c:1183
       do_sendfile+0x798/0xbd0 fs/read_write.c:1351
       __do_sys_sendfile64 fs/read_write.c:1412 [inline]
       __se_sys_sendfile64 fs/read_write.c:1398 [inline]
       __arm64_sys_sendfile64+0x214/0x260 fs/read_write.c:1398
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x74/0x240 arch/arm64/kernel/syscall.c:49
       el0_svc_common.constprop.0+0xac/0x230 arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x40/0x58 arch/arm64/kernel/syscall.c:140
       el0_svc+0x58/0x21c arch/arm64/kernel/entry-common.c:797
       el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:816
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

-> #3 (set->srcu){.+.+}-{0:0}:
       lock_sync kernel/locking/lockdep.c:5991 [inline]
       lock_sync+0xec/0x17c kernel/locking/lockdep.c:5979
       srcu_lock_sync include/linux/srcu.h:261 [inline]
       __synchronize_srcu+0xa8/0x2c8 kernel/rcu/srcutree.c:1662
       synchronize_srcu_expedited kernel/rcu/srcutree.c:1707 [inline]
       synchronize_srcu+0xb8/0x3a0 kernel/rcu/srcutree.c:1763
       blk_mq_wait_quiesce_done block/blk-mq.c:284 [inline]
       blk_mq_wait_quiesce_done block/blk-mq.c:281 [inline]
       blk_mq_quiesce_queue block/blk-mq.c:304 [inline]
       blk_mq_quiesce_queue+0xf4/0x160 block/blk-mq.c:299
       elevator_switch+0x118/0x430 block/elevator.c:576
       elevator_change+0x294/0x420 block/elevator.c:681
       elevator_set_default+0x210/0x2b8 block/elevator.c:754
       blk_register_queue+0x37c/0x508 block/blk-sysfs.c:992
       __add_disk+0x588/0xc0c block/genhd.c:531
       add_disk_fwnode+0x110/0x3e0 block/genhd.c:600
       device_add_disk+0x14/0x20 block/genhd.c:630
       add_disk include/linux/blkdev.h:799 [inline]
       nbd_dev_add+0x604/0x9a0 drivers/block/nbd.c:2026
       nbd_init+0x184/0x1a4 drivers/block/nbd.c:2743
       do_one_initcall+0x134/0x854 init/main.c:1419
       do_initcall_level init/main.c:1481 [inline]
       do_initcalls init/main.c:1497 [inline]
       do_basic_setup init/main.c:1517 [inline]
       kernel_init_freeable+0x5e8/0x66c init/main.c:1732
       kernel_init+0x2c/0x14c init/main.c:1622
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:870

-> #2 (&q->elevator_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x2b8/0x3fc kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x14c/0x1000 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       queue_requests_store+0x28c/0x4e0 block/blk-sysfs.c:124
       queue_attr_store+0x1f8/0x260 block/blk-sysfs.c:906
       sysfs_kf_write+0xc4/0x10c fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x2a4/0x460 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:575 [inline]
       vfs_write+0x5b0/0xcc8 fs/read_write.c:667
       ksys_write+0xf0/0x1e0 fs/read_write.c:719
       __do_sys_write fs/read_write.c:730 [inline]
       __se_sys_write fs/read_write.c:727 [inline]
       __arm64_sys_write+0x70/0xa0 fs/read_write.c:727
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x74/0x240 arch/arm64/kernel/syscall.c:49
       el0_svc_common.constprop.0+0xac/0x230 arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x40/0x58 arch/arm64/kernel/syscall.c:140
       el0_svc+0x58/0x21c arch/arm64/kernel/entry-common.c:797
       el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:816
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

-> #1 (&q->q_usage_counter(io)#51){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x2b8/0x3fc kernel/locking/lockdep.c:5899
       blk_alloc_queue+0x4e0/0x640 block/blk-core.c:505
       blk_mq_alloc_queue+0x148/0x230 block/blk-mq.c:4468
       __blk_mq_alloc_disk+0x20/0x120 block/blk-mq.c:4515
       null_add_dev+0x9dc/0x17e8 drivers/block/null_blk/main.c:2018
       null_create_dev drivers/block/null_blk/main.c:2115 [inline]
       null_init+0x248/0x2f4 drivers/block/null_blk/main.c:2179
       do_one_initcall+0x134/0x854 init/main.c:1419
       do_initcall_level init/main.c:1481 [inline]
       do_initcalls init/main.c:1497 [inline]
       do_basic_setup init/main.c:1517 [inline]
       kernel_init_freeable+0x5e8/0x66c init/main.c:1732
       kernel_init+0x2c/0x14c init/main.c:1622
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:870

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add+0x110/0xcb4 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1490/0x1af0 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x2b8/0x3fc kernel/locking/lockdep.c:5899
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0x130/0x160 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4673 [inline]
       slab_alloc_node mm/slub.c:5011 [inline]
       __kmalloc_cache_noprof+0x60/0x680 mm/slub.c:5676
       _kmalloc_noprof include/linux/slab.h:991 [inline]
       concat_erase+0xf4/0x734 drivers/mtd/mtdconcat.c:407
       mtd_erase+0x29c/0xb04 drivers/mtd/mtdcore.c:1497
       erase_write+0xb0/0x170 drivers/mtd/mtdblock.c:57
       write_cached_data+0xe0/0x270 drivers/mtd/mtdblock.c:90
       mtdblock_release+0x30/0x1ec drivers/mtd/mtdblock.c:289
       blktrans_release+0x198/0x238 drivers/mtd/mtd_blkdevs.c:246
       blkdev_put_whole+0x98/0xf0 block/bdev.c:766
       bdev_release+0x2a4/0x510 block/bdev.c:1189
       blkdev_release+0x14/0x30 block/fops.c:690
       __fput+0x2d0/0x980 fs/file_table.c:512
       ____fput+0x14/0x20 fs/file_table.c:541
       task_work_run+0x134/0x238 kernel/task_work.c:233
       get_signal+0x9d0/0x1b18 kernel/signal.c:2885
       arch_do_signal_or_restart+0x1a0/0x6f4 arch/arm64/kernel/signal.c:1651
       __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
       exit_to_user_mode_loop+0x13c/0x1c8 kernel/entry/common.c:101
       __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
       syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
       arm64_syscall_exit_to_user_mode arch/arm64/kernel/entry-common.c:147 [inline]
       el0_svc+0x1dc/0x21c arch/arm64/kernel/entry-common.c:798
       el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:816
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> &new->lock --> &mtdblk->cache_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&mtdblk->cache_mutex);
                               lock(&new->lock);
                               lock(&mtdblk->cache_mutex);
  lock(fs_reclaim);

 *** DEADLOCK ***

locks held by syz.3.780/6156: 3, on CPU#1:
 #0: ffff000016ef7350 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_release+0x104/0x510 block/bdev.c:1173
 #1: ffff0000180b1c80 (&new->lock){+.+.}-{4:4}, at: blktrans_release+0x40/0x238 drivers/mtd/mtd_blkdevs.c:237
 #2: ffff0000180b1db0 (&mtdblk->cache_mutex){+.+.}-{4:4}, at: mtdblock_release+0x28/0x1ec drivers/mtd/mtdblock.c:288

stack backtrace:
CPU: 1 UID: 0 PID: 6156 Comm: syz.3.780 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: linux,dummy-virt (DT)
dump_backtrace(regs = 0000000000000000 tsk = 0000000000000000)
Call trace:
 show_stack+0x18/0x24 arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x7c/0xb0 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x23c/0x284 kernel/locking/lockdep.c:2087
 check_noncircular+0x174/0x194 kernel/locking/lockdep.c:2219
 check_prev_add+0x110/0xcb4 kernel/locking/lockdep.c:3209
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1490/0x1af0 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x2b8/0x3fc kernel/locking/lockdep.c:5899
 __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
 fs_reclaim_acquire+0x130/0x160 mm/page_alloc.c:4389
 might_alloc include/linux/sched/mm.h:316 [inline]
 slab_pre_alloc_hook mm/slub.c:4673 [inline]
 slab_alloc_node mm/slub.c:5011 [inline]
 __kmalloc_cache_noprof+0x60/0x680 mm/slub.c:5676
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 concat_erase+0xf4/0x734 drivers/mtd/mtdconcat.c:407
 mtd_erase+0x29c/0xb04 drivers/mtd/mtdcore.c:1497
 erase_write+0xb0/0x170 drivers/mtd/mtdblock.c:57
 write_cached_data+0xe0/0x270 drivers/mtd/mtdblock.c:90
 mtdblock_release+0x30/0x1ec drivers/mtd/mtdblock.c:289
 blktrans_release+0x198/0x238 drivers/mtd/mtd_blkdevs.c:246
 blkdev_put_whole+0x98/0xf0 block/bdev.c:766
 bdev_release+0x2a4/0x510 block/bdev.c:1189
 blkdev_release+0x14/0x30 block/fops.c:690
 __fput+0x2d0/0x980 fs/file_table.c:512
 ____fput+0x14/0x20 fs/file_table.c:541
 task_work_run+0x134/0x238 kernel/task_work.c:233
 get_signal+0x9d0/0x1b18 kernel/signal.c:2885
 arch_do_signal_or_restart+0x1a0/0x6f4 arch/arm64/kernel/signal.c:1651
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x13c/0x1c8 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 arm64_syscall_exit_to_user_mode arch/arm64/kernel/entry-common.c:147 [inline]
 el0_svc+0x1dc/0x21c arch/arm64/kernel/entry-common.c:798
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
ok


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
