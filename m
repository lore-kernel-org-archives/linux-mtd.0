Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7C5C88E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 00:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6Ad9wAtWNycaWEqn3tfCLLIAG7eOWhV+tM7wlHtz0Vo=; b=SMJn/nDSiECsO+
	at/dcxPyeJhB588+0f8mzkQaaLhHX8Y2pPKWSFLKxNz9R4KVbH5NuMPTtErcQlgJ3onXj5ZtSfudK
	gAc19h4QMOp79t30noqu9GwL+Xhnqu0cZ+hPitEYNkt8EFX7T3vXB5y9uCN7nRiKbaF8EDsGvSJF1
	vaeQlcOjKFF5IEBMv6WqwyebNEJyU+JC3ioJa684ub7jCWfsyq3Uqs7K/3zQmdpr0h8rhSn3/8Tuv
	yviL2pLiT9J1LxtIM+EOnZAh0FD/bxkNUBTAlBEi6lLbrhDGdoYL78f5dXgYDwmlu9KreUtiqQnRR
	9bewtfx9GDtyqWbGa+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4pa4-0000000FeDx-34MT;
	Fri, 11 Sep 2026 00:57:28 +0000
Received: from mail-oo2-f8.google.com ([74.125.231.136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4pa1-0000000FeD9-3Txk
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 00:57:27 +0000
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6b12d30261cso133833eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 17:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088244; x=1789693044;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a4O61vwT858MfHLIWbfEORPBBAynu4EIXTC714u5D4U=;
        b=Ze7NSbubi4FQGnlAVcJ8c2QFSSojK/x9eUa3gQFpFaRT4jFCCHYLcRufBih6Xrv8NC
         QfxENZSHyN4OvCrVKX1dT4sxWYCfryjH+0OejKKAkculn9ehl6dDUT9dZnfiZcfbZ4ll
         aDYYbqhdyxqbNvVBYbsiegyqu6SmQFXJxYs0q+8mEQnR5mqBGmo9/yf4o0ldbR/+NtGv
         v1KGHnVhMwj+bZiFevKHUwTzLVBHadCt2KZJ04TAHDREwLVRC0W9s8uApbpEGbwyrdHp
         YQSL/zctyDLNoh+PmmlDmyN4oEoLF+bPqLAslsp/zGdO9db/bdvUNFZcQpe4wO0NBvuZ
         xu4A==
X-Forwarded-Encrypted: i=1; AKwUvByIRdplqVS6BouBjLSCdbNiEyc2w/WSZajkw6GfWVXECWtuTouB/J5DcO+jWx+aNI7pwsbMkfSxyvI=@lists.infradead.org
X-Gm-Message-State: AFuF++l+PT1t6yTsymm7pPIIvQqmw7Cm1xMm2MV0aS4KBWLR+xiwj3C6
	5xErVwQTt4//iVxHNmhFngDh2AEyQnEfRlQvT1pJVR3vp1mO7UEuHZTA3WdeX4zVBlnCvxRJyXg
	A/qcWM6AkeNXjBJbunCnxqeHPjnylS7db2TkQLCY8GW5dIs3/h/1kRZQ0Ie8=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:806:b0:6a1:4507:3544 with SMTP id
 006d021491bc7-6c0bb3fd453mr1134957eaf.28.1789088244056; Thu, 10 Sep 2026
 17:57:24 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:57:24 -0700
In-Reply-To: <6a752024.b50370da.49fe0.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa351f4.6e6c5f9e.28f11f.003b.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
From: syzbot <syzbot+743079a09058321247d8@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_175725_908286_1EFB5693 
X-CRM114-Status: UNSURE (   6.12  )
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=152c679e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=743079a09058321247d8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ec21f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16715ef9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-50d05c7c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/303a0ade8f9e/vmlinux-50d05c7c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/70b8ca71442b/bzImage-50d05c7c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+743079a09058321247d8@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/113 is trying to acquire lock:
ffff888013732c60 (&f->sem){+.+.}-{4:4}, at: jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419

but task is already holding lock:
ffffffff8efc9a20 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0xc4/0x100 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4636 [inline]
       slab_alloc_node mm/slub.c:4974 [inline]
       kmem_cache_alloc_noprof+0x63/0x6a0 mm/slub.c:5010
       jffs2_do_read_inode+0x307/0x520 fs/jffs2/readinode.c:1372
       jffs2_iget+0x32b/0xe30 fs/jffs2/fs.c:277
       jffs2_do_fill_super+0x44b/0xa50 fs/jffs2/fs.c:578
       jffs2_fill_super+0x283/0x370 fs/jffs2/super.c:290
       mtd_get_sb+0x2f0/0x4c0 drivers/mtd/mtdsuper.c:57
       mtd_get_sb_by_nr drivers/mtd/mtdsuper.c:88 [inline]
       get_tree_mtd+0x6f9/0x8a0 drivers/mtd/mtdsuper.c:141
       vfs_get_tree+0x92/0x320 fs/super.c:1947
       fc_mount fs/namespace.c:1198 [inline]
       do_new_mount_fc fs/namespace.c:3772 [inline]
       do_new_mount fs/namespace.c:3848 [inline]
       path_mount+0x7d0/0x24c0 fs/namespace.c:4168
       do_mount fs/namespace.c:4181 [inline]
       __do_sys_mount fs/namespace.c:4397 [inline]
       __se_sys_mount fs/namespace.c:4374 [inline]
       __ia32_sys_mount+0x292/0x310 fs/namespace.c:4374
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
       __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

-> #0 (&f->sem){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419
       evict+0x3c2/0xad0 fs/inode.c:822
       dispose_list+0x117/0x1e0 fs/inode.c:864
       prune_icache_sb+0xea/0x150 fs/inode.c:1011
       super_cache_scan+0x3ac/0x5c0 fs/super.c:240
       do_shrink_slab+0x416/0x1200 mm/shrinker.c:443
       shrink_slab_memcg mm/shrinker.c:560 [inline]
       shrink_slab+0xa82/0x12e0 mm/shrinker.c:638
       shrink_one+0x398/0x850 mm/vmscan.c:5119
       shrink_many mm/vmscan.c:5180 [inline]
       lru_gen_shrink_node mm/vmscan.c:5258 [inline]
       shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
       kswapd_shrink_node mm/vmscan.c:7101 [inline]
       balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
       kswapd+0x556/0xb50 mm/vmscan.c:7555
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&f->sem);
                               lock(fs_reclaim);
  lock(&f->sem);

 *** DEADLOCK ***

locks held by kswapd0/113: 2, last CPU#0:
 #0: ffffffff8efc9a20 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292
 #1: ffff88802553c0e8 (&type->s_umount_key#58){++++}-{4:4}, at: super_trylock_shared fs/super.c:688 [inline]
 #1: ffff88802553c0e8 (&type->s_umount_key#58){++++}-{4:4}, at: super_cache_scan+0x9b/0x5c0 fs/super.c:213

stack backtrace:
CPU: 0 UID: 0 PID: 113 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2087
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2219
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419
 evict+0x3c2/0xad0 fs/inode.c:822
 dispose_list+0x117/0x1e0 fs/inode.c:864
 prune_icache_sb+0xea/0x150 fs/inode.c:1011
 super_cache_scan+0x3ac/0x5c0 fs/super.c:240
 do_shrink_slab+0x416/0x1200 mm/shrinker.c:443
 shrink_slab_memcg mm/shrinker.c:560 [inline]
 shrink_slab+0xa82/0x12e0 mm/shrinker.c:638
 shrink_one+0x398/0x850 mm/vmscan.c:5119
 shrink_many mm/vmscan.c:5180 [inline]
 lru_gen_shrink_node mm/vmscan.c:5258 [inline]
 shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
 kswapd_shrink_node mm/vmscan.c:7101 [inline]
 balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
 kswapd+0x556/0xb50 mm/vmscan.c:7555
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
