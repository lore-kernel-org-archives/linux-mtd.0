Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F802C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 00:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bSGlgIPzWNl0H9E0HzPXYTC85Y63svc+BkW3HtZQbSI=; b=If2
	fgDe8M0cFI4HMgJur2RcLGpUv219zNJVMN0MbQUHYvvTek/rIEzI42OsmbhVV18sJslHSlHDOOSrB
	eQys36rIn8p+q2nhmH8Ft841wmQT5U9IRYwtz1sg6vfbGqvNl28QR/NqnoJIdWFyGljvr8nC2NBHZ
	cR7IVFaWlLf/zfefbhjWEKfyNUn537gi9p3Y417Bhvp24UHI1qwKsfozMmavgRyhce8QgZleYhWMI
	daHZjXTL2/eCwGiCkEtlTyl03T5C9RSWhmULIgWdUGj7mI/rVWjahOjgrZWXorj4jZzx/1uh3h7Wu
	bX5k6FKGDJDhESE/T376kweSfT4n6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws80w-00000006sg5-17oS;
	Fri, 07 Aug 2026 00:00:42 +0000
Received: from mail-oo1-f80.google.com ([209.85.161.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws80t-00000006sfk-1CCQ
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 00:00:40 +0000
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6a0f261aeb6so2861003eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2026 17:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060836; x=1786665636;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FfT0Ioz8+5OeqZZBrCAL63Jhjf2P0sNGrjKTKSwJQ4=;
        b=dwYNpuDWsHRYjQFK+I8BLNKbJ1AfiaB86rucWAmoc8EuqRFsisXlUtm5AOKcdm+KQi
         ZhizrNRkd/VR3c8s5RxoUkodzGBSUtA4xcFSQ64ZiImC8ToifL2G4WMBvJ5AVZtl8bxr
         PiA8iFf1pqjb1jjhCCRw7Z2PixvQ1vWllPJtQp0eaZ97LIQb9Is9Ay7Doj6coGsM8xLZ
         S0ABatPxnQVp6ss+/RmRVvtSE7/4SxhAxvQkjbpUyGwUnVsRetdGifxMunfUPcuCJ6zz
         rqdOVMMQSg7xFAcFVGAQ7Dj/8eYhYDbSyCs5j4vHGoDlPgZavKFalfMM1AzS9z4Fdvmw
         RraA==
X-Forwarded-Encrypted: i=1; AHgh+RolBCfd876YMtcksXVdykI05OGuYnWdoaXNzNdlY4f1wBV3qPrkbTMGc9ilQAPrUoZVeQmMQeXYIfQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDRr7uw/IRis4alzBKQpGQSHnVR0LUYgaA1T862+biKNFgg/BP
	sapBbg9BLrPAMgfSBpDdNHYTr6SEM2Nc+eTFs3Q+nLS1/4MOpTgU/s6tTfSCqoN5VkQ7ZmQwv2w
	P7hHeQ2fdI4VGyZ6ZcCpvKHROhZTTiHrZcDSGvbBA6FbTrtDRiWPUeVDJCa4=
MIME-Version: 1.0
X-Received: by 2002:a4a:ee19:0:b0:6ae:5250:dd1c with SMTP id
 006d021491bc7-6ae96fa79f3mr9802445eaf.29.1786060836172; Thu, 06 Aug 2026
 17:00:36 -0700 (PDT)
Date: Thu, 06 Aug 2026 17:00:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a752024.b50370da.49fe0.0017.GAE@google.com>
Subject: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
From: syzbot <syzbot+743079a09058321247d8@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_170039_364326_C1CFCCCD 
X-CRM114-Status: UNSURE (   6.59  )
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

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a07e32580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e38b15c29e6a1d9
dashboard link: https://syzkaller.appspot.com/bug?extid=743079a09058321247d8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bf3ffd710de/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/770c0a63a80c/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c54f9393cb03/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+743079a09058321247d8@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G                 N 
------------------------------------------------------
syz.3.73/6195 is trying to acquire lock:
ffff88805432b1e0 (&f->sem){+.+.}-{4:4}, at: jffs2_do_clear_inode+0x62/0x390 fs/jffs2/readinode.c:1419

but task is already holding lock:
ffffffff8ec848e0 (fs_reclaim){+.+.}-{0:0}, at: __perform_reclaim mm/page_alloc.c:4402 [inline]
ffffffff8ec848e0 (fs_reclaim){+.+.}-{0:0}, at: __alloc_pages_direct_reclaim+0xbd/0x310 mm/page_alloc.c:4427

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4329 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4343
       might_alloc include/linux/sched/mm.h:317 [inline]
       slab_pre_alloc_hook mm/slub.c:4537 [inline]
       slab_alloc_node mm/slub.c:4897 [inline]
       kmem_cache_alloc_noprof+0x64/0x5f0 mm/slub.c:4931
       jffs2_do_read_inode+0x33f/0x6a0 fs/jffs2/readinode.c:1372
       jffs2_iget+0x228/0xcc0 fs/jffs2/fs.c:277
       jffs2_do_fill_super+0x59d/0xc50 fs/jffs2/fs.c:578
       mtd_get_sb+0x18a/0x410 drivers/mtd/mtdsuper.c:57
       mtd_get_sb_by_nr drivers/mtd/mtdsuper.c:88 [inline]
       get_tree_mtd+0x4bd/0x7d0 drivers/mtd/mtdsuper.c:158
       vfs_get_tree+0x92/0x2a0 fs/super.c:1700
       fc_mount fs/namespace.c:1198 [inline]
       do_new_mount_fc fs/namespace.c:3765 [inline]
       do_new_mount+0x319/0xdc0 fs/namespace.c:3841
       do_mount fs/namespace.c:4174 [inline]
       __do_sys_mount fs/namespace.c:4390 [inline]
       __se_sys_mount+0x31d/0x420 fs/namespace.c:4367
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&f->sem){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x1520/0x2cf0 kernel/locking/lockdep.c:5237
       lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
       jffs2_do_clear_inode+0x62/0x390 fs/jffs2/readinode.c:1419
       evict+0x624/0xb50 fs/inode.c:825
       dispose_list fs/inode.c:867 [inline]
       prune_icache_sb+0x223/0x2d0 fs/inode.c:1014
       super_cache_scan+0x38d/0x4a0 fs/super.c:225
       do_shrink_slab+0x6d0/0x10e0 mm/shrinker.c:443
       shrink_slab_memcg mm/shrinker.c:560 [inline]
       shrink_slab+0x838/0x1220 mm/shrinker.c:638
       shrink_one+0x2a2/0x730 mm/vmscan.c:5026
       shrink_many mm/vmscan.c:5087 [inline]
       lru_gen_shrink_node mm/vmscan.c:5165 [inline]
       shrink_node+0x3303/0x3b60 mm/vmscan.c:6154
       shrink_zones mm/vmscan.c:6410 [inline]
       do_try_to_free_pages+0x6a3/0x1990 mm/vmscan.c:6472
       try_to_free_pages+0x90a/0xe50 mm/vmscan.c:6711
       __perform_reclaim mm/page_alloc.c:4405 [inline]
       __alloc_pages_direct_reclaim+0x148/0x310 mm/page_alloc.c:4427
       __alloc_pages_slowpath+0x59d/0xcc0 mm/page_alloc.c:4876
       __alloc_frozen_pages_noprof+0x31f/0x380 mm/page_alloc.c:5317
       alloc_pages_mpol+0x212/0x380 mm/mempolicy.c:2490
       alloc_frozen_pages_noprof mm/mempolicy.c:2561 [inline]
       alloc_pages_noprof+0xac/0x2a0 mm/mempolicy.c:2581
       alloc_image_page+0x23/0x130 kernel/power/snapshot.c:231
       preallocate_image_pages kernel/power/snapshot.c:1654 [inline]
       preallocate_image_memory+0x76/0x140 kernel/power/snapshot.c:1681
       hibernate_preallocate_memory+0x43c/0x750 kernel/power/snapshot.c:1960
       hibernation_snapshot+0x126/0x3d0 kernel/power/hibernate.c:430
       hibernate+0x28f/0x680 kernel/power/hibernate.c:811
       state_store+0x234/0x290 kernel/power/main.c:821
       kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x612/0xba0 fs/read_write.c:687
       ksys_write+0x150/0x270 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&f->sem);
                               lock(fs_reclaim);
  lock(&f->sem);

 *** DEADLOCK ***

9 locks held by syz.3.73/6195:
 #0: ffff88807a0a70b0 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x246/0x320 fs/file.c:1259
 #1: ffff888034304450 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2733 [inline]
 #1: ffff888034304450 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #2: ffff88805386dc80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #3: ffff88801f28d968 (kn->active#59){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #3: ffff88801f28d968 (kn->active#59){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x22b/0x540 fs/kernfs/file.c:337
 #4: ffffffff8ea02160 (system_transition_mutex){+.+.}-{4:4}, at: lock_system_sleep+0x49/0x70 kernel/power/main.c:71
 #5: ffffffff8f5e45e0 (device_hotplug_lock){+.+.}-{4:4}, at: hibernate+0x25b/0x680 kernel/power/hibernate.c:805
 #6: ffffffff8f3d5240 (acpi_scan_lock){+.+.}-{4:4}, at: acpi_pm_start drivers/acpi/sleep.c:533 [inline]
 #6: ffffffff8f3d5240 (acpi_scan_lock){+.+.}-{4:4}, at: acpi_hibernation_begin+0xc8/0x110 drivers/acpi/sleep.c:945
 #7: ffffffff8ec848e0 (fs_reclaim){+.+.}-{0:0}, at: __perform_reclaim mm/page_alloc.c:4402 [inline]
 #7: ffffffff8ec848e0 (fs_reclaim){+.+.}-{0:0}, at: __alloc_pages_direct_reclaim+0xbd/0x310 mm/page_alloc.c:4427
 #8: ffff8880358a40d8 (&type->s_umount_key#83){.+.+}-{4:4}, at: super_trylock_shared fs/super.c:566 [inline]
 #8: ffff8880358a40d8 (&type->s_umount_key#83){.+.+}-{4:4}, at: super_cache_scan+0x91/0x4a0 fs/super.c:198

stack backtrace:
CPU: 0 UID: 0 PID: 6195 Comm: syz.3.73 Tainted: G                 N  syzkaller #0 PREEMPT(full) 
Tainted: [N]=TEST
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x1520/0x2cf0 kernel/locking/lockdep.c:5237
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
 jffs2_do_clear_inode+0x62/0x390 fs/jffs2/readinode.c:1419
 evict+0x624/0xb50 fs/inode.c:825
 dispose_list fs/inode.c:867 [inline]
 prune_icache_sb+0x223/0x2d0 fs/inode.c:1014
 super_cache_scan+0x38d/0x4a0 fs/super.c:225
 do_shrink_slab+0x6d0/0x10e0 mm/shrinker.c:443
 shrink_slab_memcg mm/shrinker.c:560 [inline]
 shrink_slab+0x838/0x1220 mm/shrinker.c:638
 shrink_one+0x2a2/0x730 mm/vmscan.c:5026
 shrink_many mm/vmscan.c:5087 [inline]
 lru_gen_shrink_node mm/vmscan.c:5165 [inline]
 shrink_node+0x3303/0x3b60 mm/vmscan.c:6154
 shrink_zones mm/vmscan.c:6410 [inline]
 do_try_to_free_pages+0x6a3/0x1990 mm/vmscan.c:6472
 try_to_free_pages+0x90a/0xe50 mm/vmscan.c:6711
 __perform_reclaim mm/page_alloc.c:4405 [inline]
 __alloc_pages_direct_reclaim+0x148/0x310 mm/page_alloc.c:4427
 __alloc_pages_slowpath+0x59d/0xcc0 mm/page_alloc.c:4876
 __alloc_frozen_pages_noprof+0x31f/0x380 mm/page_alloc.c:5317
 alloc_pages_mpol+0x212/0x380 mm/mempolicy.c:2490
 alloc_frozen_pages_noprof mm/mempolicy.c:2561 [inline]
 alloc_pages_noprof+0xac/0x2a0 mm/mempolicy.c:2581
 alloc_image_page+0x23/0x130 kernel/power/snapshot.c:231
 preallocate_image_pages kernel/power/snapshot.c:1654 [inline]
 preallocate_image_memory+0x76/0x140 kernel/power/snapshot.c:1681
 hibernate_preallocate_memory+0x43c/0x750 kernel/power/snapshot.c:1960
 hibernation_snapshot+0x126/0x3d0 kernel/power/hibernate.c:430
 hibernate+0x28f/0x680 kernel/power/hibernate.c:811
 state_store+0x234/0x290 kernel/power/main.c:821
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb3bdd9e019
Code: Unable to access opcode bytes at 0x7fb3bdd9dfef.
RSP: 002b:00007fb3beb8f028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fb3be025fa0 RCX: 00007fb3bdd9e019
RDX: 0000000000000004 RSI: 0000200000000100 RDI: 0000000000000003
RBP: 00007fb3bde3500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb3be026038 R14: 00007fb3be025fa0 R15: 00007ffecece6378
 </TASK>
PM: hibernation: Allocated 724545 pages for snapshot
PM: hibernation: Allocated 2898180 kbytes in 41.10 seconds (70.51 MB/s)
printk: Suspending console(s) (use no_console_suspend to debug)


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
