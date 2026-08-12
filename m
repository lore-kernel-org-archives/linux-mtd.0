Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92698C5B567
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 05:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=899ia/M/SLSkbMQZyRUPZEzh72Zyw8qO+P56xtxbL/0=; b=DUG
	oSw1Zjgo87lBI4PEwudp+y1W9dFTnpMEvlNlzXDxybZXOPFoeSgZgEmaGhKSWPcxCM8LhyXm5qyCG
	S+dHjtvK9hUjuCL2hGiV0YrChttpOsx4iUGMU2NCN+Ydg54woYWamyDRdzLr+Y/utGQJyPkJw91xo
	2XUsfFiDkeDFjM+3lrswP8rVUq6/+FVa8UIXBDI/DnqEbZiyFCgowopLgo3Dlhyl7CqqGkfqFQ3/5
	pCgoj9pLR9lYy7yo+qdhjhE+qZvfaAeoSvzGQIuhocQ8oybnXawQT1TmryC77cpYXrWd0KfyxMD5M
	cer+ctM26Sv7QNqZiSZoNUqmJo0IYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu154-0000000FPpa-3Uio;
	Wed, 12 Aug 2026 05:00:46 +0000
Received: from mail-oi1-f205.google.com ([209.85.167.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu151-0000000FPow-2GZP
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 05:00:44 +0000
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-49ce04870f8so485483b6e.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 22:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786510840; x=1787115640;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whulqaPrA6Df/FKHJWt7zjRAPFi92MgfcdZDHlienVk=;
        b=O/4RPnpjz3iACjeWxIc1jDEkA4195+STl4WmyCsJEjJnH/kZTJkdNj9FyLWIyY5snc
         DQ6sMuiNcz52wCFUX3d3w5I8lXh3BT5xsw0E6Xz3KQuUWefiFqYrLLyMcATdaUL/6ZRu
         hXMV3ufvvy23k7cc338dJ0M6Q9Swdi4aRZd5ZMI94I/OgnP5mJe3LEadrZVOWE7O6qF1
         jypuvJBXg5QfBhrKV4rONrfX1TCzNHGj8IBJ8EJv5eM/CcUdTPmS2QdwJKTCiHFtXPlI
         2XclGS28ojgWkKso/5SjW2OPgz4Tw6DFMUv0r+V2eOjhwavkmYLYsw2qYJAdpsbt4NBO
         IvrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG2KcMAqzPdrTDkhodpe2qjZQK3bMrTkSe7a87EK5v/VmlsAUV5ST/OsbTX4A9Ckdl9GZgoTC/tJM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxK/q8tMO6QDDTAOtFCjbi61OKsbL1GuW5J3H6f96RXKNd3hRqK
	LGUuxgZcKjFCJbXdWh+S03eYW+NOxi3m1cF+tBypLMg+CIlv+CcsdIDXUbhADaJO/9jYF+XzIEg
	/u9gIDiKhYqC5vcfSAlVJGmY6UQqMRryVZODMy8Mop3rx0PzOlxy4Kr9qSOk=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0b:b0:486:8a11:6e8b with SMTP id
 5614622812f47-4b21093a9f2mr2298203b6e.2.1786510839962; Tue, 11 Aug 2026
 22:00:39 -0700 (PDT)
Date: Tue, 11 Aug 2026 22:00:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
Subject: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_220043_622657_99B8BF26 
X-CRM114-Status: UNSURE (   8.17  )
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

HEAD commit:    bcc44b6785f2 Merge tag 'drm-fixes-2026-08-08' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=147d7e49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=158601bb8cb292dd
dashboard link: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e4ca3ce763a0/disk-bcc44b67.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/face1dc3e618/vmlinux-bcc44b67.xz
kernel image: https://storage.googleapis.com/syzbot-assets/185a6a3df821/bzImage-bcc44b67.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com

RBP: 00007f5b86286090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007f5b882b6038 R14: 00007f5b882b5fa0 R15: 00007ffe7e6b8828
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
Read of size 4 at addr ffff888029725ee8 by task syz.8.1428/17657

CPU: 0 UID: 0 PID: 17657 Comm: syz.8.1428 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
 jffs2_do_clear_inode+0x58/0x390 fs/jffs2/readinode.c:1418
 evict+0x624/0xb50 fs/inode.c:825
 jffs2_new_inode+0x49c/0xd00 fs/jffs2/fs.c:-1
 jffs2_mkdir+0x192/0xeb0 fs/jffs2/dir.c:485
 vfs_mkdir+0x402/0x620 fs/namei.c:5276
 filename_mkdirat+0x289/0x520 fs/namei.c:5309
 __do_sys_mkdirat fs/namei.c:5330 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5327
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5b8802e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5b86286028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f5b882b5fa0 RCX: 00007f5b8802e0d9
RDX: 0000000000000000 RSI: 0000200000000640 RDI: ffffffffffffff9c
RBP: 00007f5b86286090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007f5b882b6038 R14: 00007f5b882b5fa0 R15: 00007ffe7e6b8828
 </TASK>

Allocated by task 14460:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_noprof+0x355/0x650 mm/slub.c:4931
 jffs2_scan_make_ino_cache+0x89/0x1d0 fs/jffs2/scan.c:978
 jffs2_scan_dirent_node fs/jffs2/scan.c:1099 [inline]
 jffs2_scan_eraseblock fs/jffs2/scan.c:831 [inline]
 jffs2_scan_medium+0x2b58/0x70c0 fs/jffs2/scan.c:151
 jffs2_build_filesystem fs/jffs2/build.c:112 [inline]
 jffs2_do_mount_fs+0x775/0x22c0 fs/jffs2/build.c:416
 jffs2_do_fill_super+0x555/0xc50 fs/jffs2/fs.c:574
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

Freed by task 7915:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kmem_cache_free+0x187/0x6c0 mm/slub.c:6504
 jffs2_free_ino_caches+0xec/0x1c0 fs/jffs2/nodelist.c:497
 jffs2_put_super+0x6c/0x170 fs/jffs2/super.c:335
 generic_shutdown_super+0x13d/0x2d0 fs/super.c:647
 kill_mtd_super+0x23/0x70 drivers/mtd/mtdsuper.c:174
 jffs2_kill_sb+0x96/0xb0 fs/jffs2/super.c:350
 deactivate_locked_super+0xbc/0x130 fs/super.c:477
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1317
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1fa/0x730 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
 do_syscall_64+0x353/0x580 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888029725ec0
 which belongs to the cache jffs2_inode_cache of size 48
The buggy address is located 40 bytes inside of
 freed 48-byte region [ffff888029725ec0, ffff888029725ef0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888029725700 pfn:0x29725
flags: 0x80000000000200(workingset|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000200 ffff888140435280 ffffea000085b790 ffff88801eb7ae88
raw: ffff888029725700 000000080040001c 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5878, tgid 5877 (syz.2.27), ts 110407811516, free_ts 110388090000
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x262a/0x26a0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 kmem_cache_alloc_noprof+0x452/0x650 mm/slub.c:4931
 jffs2_do_new_inode+0x27/0x500 fs/jffs2/write.c:28
 jffs2_new_inode+0x46e/0xd00 fs/jffs2/fs.c:466
 jffs2_create+0x87/0x320 fs/jffs2/dir.c:182
 lookup_open fs/namei.c:4508 [inline]
 open_last_lookups fs/namei.c:4608 [inline]
 path_openat+0x1344/0x3850 fs/namei.c:4860
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 20 tgid 20 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core kernel/rcu/tree.c:2897 [inline]
 rcu_cpu_kthread+0x950/0x1480 kernel/rcu/tree.c:2985
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888029725d80: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff888029725e00: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
>ffff888029725e80: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
                                                          ^
 ffff888029725f00: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff888029725f80: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
==================================================================


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
