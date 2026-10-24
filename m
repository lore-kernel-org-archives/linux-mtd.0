Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44631606A31A
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 01:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S2nuG/VC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yHZNrnAuUgkyoai5QsDZZa7VJLL8c/Ih/n0jQg+82Lc=; b=S2nuG/VCa5PWKWHXFf9LjaBYyk
	qajRFzSEJUTa0fuL9acBpkitAPJA453904OQCMPHNE6xmTKdJm9pOHyqv/FL8WtOduwFnUvBPLsQw
	gfuJoJ+d+HlR35kL3ZFJvOLb9DZWfyvjco9uSE0STmxrjexxx0yyDHHAeZvCom1FPlhf/gr0b73T9
	MAZ3EGqZtWcFBfehQc1ojX6MpAiUPX+Navue+/YjEtUjB1qYj2+S9bLZFtkVq9wc+PCC5EdG5d3nH
	2HECr60eU5W+yPasHXyfSr3iD3Yfhz1R4uSZLsgXaL7WxJfIUUy/LRv7KE7/hyBBnvdgznjgf4EE0
	B77MIxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQoZ-0000000HKHt-2kHu;
	Sat, 24 Oct 2026 01:44:55 +0000
Received: from mail-oi1-f198.google.com ([209.85.167.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQoX-0000000HKHU-2IUi
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 01:44:54 +0000
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so1780946b6e.2
        for <linux-mtd@lists.infradead.org>; Fri, 23 Oct 2026 18:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806291; x=1793411091;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mxVb7oQQyhCzXTf8Q6KVBf93tVdrbTHX5eRVTct8tjE=;
        b=NUAGUEFXL73YPZdEmATGKQAnlnMDd/w3Btgk7BT5/dY17dgnGBdDthL/4VmTNZbM+o
         WhK7KL56+Gm2+FFGjJciqzpPdS0sa8VQqMisN3mjcityWCEfnUMroQ3uzyBNbzaxY75p
         h95kwwtv6uj67xi5gwbUQMzhdfoTUdsEUZXuGbSE9cHbsiF0l7Gn2L1Qsbh6/jLdaQ1q
         TeahEq5DOrMsAe8K2j/XXxuko9bOogzalrEn5h3LX1E4u7Cx9CFmbXdlZ/laNkVwq2Ts
         UXRyjVxh96upntIOnlKGSub37dlnKKwSJVoqh/x84dY4Uidh2K9uMMOt3DafV+IWtQZY
         S7Dw==
X-Forwarded-Encrypted: i=1; AKwUvBynZDjD0uU7SkwpGzQQQLVdWJMTE9o42DMcE7ICtya6M5NtoILUhvXTY1e89rJTiNoiE2EFxCBpsYE=@lists.infradead.org
X-Gm-Message-State: AFq9FYLKptMEYOazAxCEzgssgA2dLflrGJeHPr1xTGluhOw7om4/tMB5
	NKs7UFHAvxpLQ0IiONMTMElBB9YE773V3WsURaNVuT6VPg6Unrg1oTSRw+JPqaDTgk0Bnu1bW9f
	RI5FWi5+FN2xGxo1H75Z4ltMzZrD6jTJSdywcaDKBxqCJw0R6upaHUIdom3A=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a6:b0:4c3:ebb:63d6 with SMTP id
 5614622812f47-55c002e9610mr640257b6e.39.1792806291581; Fri, 23 Oct 2026
 18:44:51 -0700 (PDT)
Date: Fri, 23 Oct 2026 18:44:51 -0700
In-Reply-To: <6a9e1995.a5e650b3.26d8a.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adc0d93.4ce6c07b.2dfc0c.0000.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_xattr_delete_inode
From: syzbot <syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_184453_596619_6D84354C 
X-CRM114-Status: UNSURE (   5.38  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

syzbot has found a reproducer for the following issue on:

HEAD commit:    734bef548a96 Merge tag 'net-next-7.4' of git://git.kernel...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=147da38e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2ced4746a89083f5
dashboard link: https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=167da38e580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/116 is trying to acquire lock:
ffff8880143729d8 (&c->xattr_sem){++++}-{4:4}, at: jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605

but task is already holding lock:
ffffffff901caa00 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x243/0x1f00 mm/vmscan.c:7177

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
       jffs2_alloc_xattr_datum+0x1c/0xe0 fs/jffs2/malloc.c:264
       create_xattr_datum fs/jffs2/xattr.c:363 [inline]
       do_jffs2_setxattr+0x6f0/0x1610 fs/jffs2/xattr.c:1175
       __vfs_setxattr+0x175/0x1e0 fs/xattr.c:223
       __vfs_setxattr_noperm+0x127/0x660 fs/xattr.c:257
       __vfs_setxattr_locked+0x127/0x2b0 fs/xattr.c:318
       vfs_setxattr+0x14a/0x390 fs/xattr.c:344
       do_setxattr+0x145/0x180 fs/xattr.c:662
       file_setxattr fs/xattr.c:672 [inline]
       file_setxattr+0x139/0x1b0 fs/xattr.c:666
       path_setxattrat+0x335/0x3b0 fs/xattr.c:732
       __do_sys_fsetxattr fs/xattr.c:782 [inline]
       __se_sys_fsetxattr fs/xattr.c:779 [inline]
       __ia32_sys_fsetxattr+0xc4/0x140 fs/xattr.c:779
       do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
       __do_fast_syscall_32+0x14b/0x8c0 arch/x86/entry/syscall_32.c:282
       do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:307
       entry_SYSENTER_compat_after_hwframe+0x84/0x8e

-> #0 (&c->xattr_sem){++++}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       down_write+0x86/0x1f0 kernel/locking/rwsem.c:1631
       jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
       jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
       evict+0x3c2/0xad0 fs/inode.c:822
       iput_final fs/inode.c:2014 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2063
       iput+0x30/0x40 fs/inode.c:2029
       dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
       dentry_kill+0x25d/0xca0 fs/dcache.c:840
       finish_dput fs/dcache.c:1015 [inline]
       dput.part.0+0xd2/0x240 fs/dcache.c:1056
       dput+0x1f/0x30 fs/dcache.c:1051
       ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:236
       destroy_inode+0xcb/0x1c0 fs/inode.c:387
       evict+0x599/0xad0 fs/inode.c:846
       iput_final fs/inode.c:2014 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2063
       iput+0x30/0x40 fs/inode.c:2029
       dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
       dentry_kill+0x25d/0xca0 fs/dcache.c:840
       shrink_kill fs/dcache.c:1289 [inline]
       shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1306
       prune_dcache_sb+0xea/0x150 fs/dcache.c:1388
       super_cache_scan+0x32b/0x550 fs/super.c:225
       do_shrink_slab+0x411/0x1200 mm/shrinker.c:445
       shrink_slab+0x171/0x12e0 mm/shrinker.c:676
       shrink_one+0x398/0x850 mm/vmscan.c:5119
       shrink_many mm/vmscan.c:5180 [inline]
       lru_gen_shrink_node mm/vmscan.c:5258 [inline]
       shrink_node+0x2b1b/0x4310 mm/vmscan.c:6247
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
                               lock(&c->xattr_sem);
                               lock(fs_reclaim);
  lock(&c->xattr_sem);

 *** DEADLOCK ***

locks held by kswapd0/116: 2, last CPU#0:
 #0: ffffffff901caa00 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x243/0x1f00 mm/vmscan.c:7177
 #1: ffff88804f2ec0e8 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_trylock_shared fs/super.c:670 [inline]
 #1: ffff88804f2ec0e8 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_cache_scan+0x9b/0x550 fs/super.c:200

stack backtrace:
CPU: 0 UID: 0 PID: 116 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
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
 down_write+0x86/0x1f0 kernel/locking/rwsem.c:1631
 jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
 jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
 evict+0x3c2/0xad0 fs/inode.c:822
 iput_final fs/inode.c:2014 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2063
 iput+0x30/0x40 fs/inode.c:2029
 dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
 dentry_kill+0x25d/0xca0 fs/dcache.c:840
 finish_dput fs/dcache.c:1015 [inline]
 dput.part.0+0xd2/0x240 fs/dcache.c:1056
 dput+0x1f/0x30 fs/dcache.c:1051
 ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:236
 destroy_inode+0xcb/0x1c0 fs/inode.c:387
 evict+0x599/0xad0 fs/inode.c:846
 iput_final fs/inode.c:2014 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2063
 iput+0x30/0x40 fs/inode.c:2029
 dentry_unlink_inode+0x403/0x4d0 fs/dcache.c:493
 dentry_kill+0x25d/0xca0 fs/dcache.c:840
 shrink_kill fs/dcache.c:1289 [inline]
 shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1306
 prune_dcache_sb+0xea/0x150 fs/dcache.c:1388
 super_cache_scan+0x32b/0x550 fs/super.c:225
 do_shrink_slab+0x411/0x1200 mm/shrinker.c:445
 shrink_slab+0x171/0x12e0 mm/shrinker.c:676
 shrink_one+0x398/0x850 mm/vmscan.c:5119
 shrink_many mm/vmscan.c:5180 [inline]
 lru_gen_shrink_node mm/vmscan.c:5258 [inline]
 shrink_node+0x2b1b/0x4310 mm/vmscan.c:6247
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
