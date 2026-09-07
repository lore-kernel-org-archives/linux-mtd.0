Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD2FC79F8C
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 01:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=77v+vTizRFI3uA0bBixQr4HnB+Ls8hmwvJRVh0xe+rk=; b=Hrg
	6Y7w+ibDWtgCHT/T5Y/xWt7BJuqDWZqmvBmBE58xJhsLkYxSio3wjw0Xjg9mND+biUgX0IYUJK9Os
	h8d5DDunjGc7S+xmseydh6BLJAwX8WqNxj5MsZJZfSAULqjspI3hRHLJqOnU/483/d/f5UR2ttu4j
	vfHjXIjT8H/OoHU5TkgG7vhSYX9R31UDqNco8SjJVmx4w7WUBVgGcuH1uV2Nq9AbUhGa7Kq1xUYM/
	Dmvb/AURHVUrRT4oGRRimtMCxrEmjVgtJRhx6mLPbkdgew0iEngmagEfRxF+pDS9z2/vVIlbND1cd
	0lqDY0NTqOjBAjirWAgcVwGMschfkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3OaD-00000005gxN-2cDn;
	Mon, 07 Sep 2026 01:55:41 +0000
Received: from mail-oo2-f11.google.com ([74.125.231.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3OaA-00000005gvt-1H0R
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 01:55:39 +0000
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-6aaf6076546so1588366eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 18:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746133; x=1789350933;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbZ2OnDIqN2FzfMGx2pAG1gARfawZnOqcaUIj2YUYrA=;
        b=dnDIMKu/RyWmYUqD5DU98e0zlVbUgARfglObNM2LZmHOtRvBmrX9Wyj+lKRBAXGua9
         6vm8slaJ+Irm9ORsXl+9ks8Hq0tkQ6f0EJigoI6zItMl35enKj88o6P+pLaBEMiO8hZ7
         scNJRWvUA45wBkSK1aYa5nK9SSf4/ivybEaPmHH4voosqbRmYJFuNpLzNHsbbfqWDOEC
         rHxC+Z4tXbEilrDR6BMG4dJ5qOKhlXREj9EhSDeIXbDto0lrBBexTJBMPVKPJ/Rrjaj0
         eFxFk+WE8J5K/7lqin8pTsaekTqKr0Kxd2qGxzwQBJu443ovYIFtUC39X0wk4qyl+ONk
         F1Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzLOKNjOncr1siOrFOcVX01XV5OrVHLVnLv/svtSKp+h1egIxIQRf8kS58By/UMo9uuK79wQULuwts=@lists.infradead.org
X-Gm-Message-State: AFuF++ncMR7PaUYYS4648IpnHWRmDVRQfZAp7G1JBUoDAeWZ1I0QuOoL
	wcFJfVdVIapiJzXCcu6LERPLy8r2N09aGN5kfUVi0yIBhEYpJQSqvGDKgSnkQer5K169WDbBv38
	7/0fjkKGptk+T4Sse+Fg3t/gaUHO8s9bQwPTxJynXiIB0QjLAHM3UhFaE/Wc=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1501:b0:6b7:83c5:fdea with SMTP id
 006d021491bc7-6b783c60367mr11036533eaf.43.1788746133211; Sun, 06 Sep 2026
 18:55:33 -0700 (PDT)
Date: Sun, 06 Sep 2026 18:55:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e1995.a5e650b3.26d8a.0024.GAE@google.com>
Subject: [syzbot] [jffs2?] possible deadlock in jffs2_xattr_delete_inode
From: syzbot <syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_185538_358688_BFBCF963 
X-CRM114-Status: UNSURE (   6.64  )
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

HEAD commit:    940de590b839 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11d190f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-940de590.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f3f674f98efb/vmlinux-940de590.xz
kernel image: https://storage.googleapis.com/syzbot-assets/132222426e71/bzImage-940de590.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/111 is trying to acquire lock:
ffff8880266529d8 (&c->xattr_sem){++++}-{4:4}, at: jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605

but task is already holding lock:
ffffffff8efc8ce0 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5908 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5865
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
       ovl_do_setxattr fs/overlayfs/overlayfs.h:324 [inline]
       ovl_setxattr fs/overlayfs/overlayfs.h:336 [inline]
       ovl_make_workdir fs/overlayfs/super.c:724 [inline]
       ovl_get_workdir fs/overlayfs/super.c:836 [inline]
       ovl_fill_super_creds fs/overlayfs/super.c:1449 [inline]
       ovl_fill_super+0x1320/0x5ea0 fs/overlayfs/super.c:1561
       vfs_get_super fs/super.c:1405 [inline]
       get_tree_nodev+0xdd/0x190 fs/super.c:1424
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

-> #0 (&c->xattr_sem){++++}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5254
       lock_acquire kernel/locking/lockdep.c:5908 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5865
       down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
       jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
       jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
       evict+0x3c2/0xad0 fs/inode.c:822
       iput_final fs/inode.c:2015 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2064
       iput+0x35/0x40 fs/inode.c:2030
       dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
       dentry_kill+0x25d/0xc20 fs/dcache.c:826
       finish_dput fs/dcache.c:1001 [inline]
       dput.part.0+0xd7/0x240 fs/dcache.c:1042
       dput+0x1f/0x30 fs/dcache.c:1037
       ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:217
       destroy_inode+0xcb/0x1c0 fs/inode.c:387
       evict+0x599/0xad0 fs/inode.c:846
       iput_final fs/inode.c:2015 [inline]
       iput.part.0+0x989/0x1050 fs/inode.c:2064
       iput+0x35/0x40 fs/inode.c:2030
       dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
       dentry_kill+0x25d/0xc20 fs/dcache.c:826
       shrink_kill fs/dcache.c:1275 [inline]
       shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1292
       prune_dcache_sb+0xea/0x150 fs/dcache.c:1374
       super_cache_scan+0x361/0x5c0 fs/super.c:238
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
                               lock(&c->xattr_sem);
                               lock(fs_reclaim);
  lock(&c->xattr_sem);

 *** DEADLOCK ***

locks held by kswapd0/111: 2, last CPU#2:
 #0: ffffffff8efc8ce0 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292
 #1: ffff888025eec0e8 (&type->s_umount_key#56){++++}-{4:4}, at: super_trylock_shared fs/super.c:688 [inline]
 #1: ffff888025eec0e8 (&type->s_umount_key#56){++++}-{4:4}, at: super_cache_scan+0x9b/0x5c0 fs/super.c:213

stack backtrace:
CPU: 2 UID: 0 PID: 111 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2059
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2191
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5254
 lock_acquire kernel/locking/lockdep.c:5908 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5865
 down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
 jffs2_xattr_delete_inode+0x83/0x130 fs/jffs2/xattr.c:605
 jffs2_do_clear_inode+0x50/0x470 fs/jffs2/readinode.c:1418
 evict+0x3c2/0xad0 fs/inode.c:822
 iput_final fs/inode.c:2015 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2064
 iput+0x35/0x40 fs/inode.c:2030
 dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
 dentry_kill+0x25d/0xc20 fs/dcache.c:826
 finish_dput fs/dcache.c:1001 [inline]
 dput.part.0+0xd7/0x240 fs/dcache.c:1042
 dput+0x1f/0x30 fs/dcache.c:1037
 ovl_destroy_inode+0x3e/0x190 fs/overlayfs/super.c:217
 destroy_inode+0xcb/0x1c0 fs/inode.c:387
 evict+0x599/0xad0 fs/inode.c:846
 iput_final fs/inode.c:2015 [inline]
 iput.part.0+0x989/0x1050 fs/inode.c:2064
 iput+0x35/0x40 fs/inode.c:2030
 dentry_unlink_inode+0x284/0x470 fs/dcache.c:479
 dentry_kill+0x25d/0xc20 fs/dcache.c:826
 shrink_kill fs/dcache.c:1275 [inline]
 shrink_dentry_list+0x1e8/0x310 fs/dcache.c:1292
 prune_dcache_sb+0xea/0x150 fs/dcache.c:1374
 super_cache_scan+0x361/0x5c0 fs/super.c:238
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
