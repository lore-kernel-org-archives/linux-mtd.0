Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E96CA5FDD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dhBGfCKJz3n2EaO0Ql/YK56hJrdBjBckOfvJAQGXImo=; b=Yj9nBpiTMfdhKc
	ccUyqF4Vnc3FlzyMSoOgB2cGGzgfKErzH8imSThpr1xQBE3uIJNpJHpRTP+G6K5NzI0nPSs2ynYZD
	MSFjLCeMtVZqnoA3ilkGEZLRRxkjHKd/DmKOggrEZGjyh8c5BE+CB3/bvxjCl5lKfGor5F+XPM6f4
	T89+fPTCXZGSbn3NJennKZcBbJPnaYsPJ/LJHctWyDdQg+dtsvTt0LSajLO5ysMPJoEGo7jsZsYUG
	Tjv8kb1k8wUb6TBu/yTLWTz3HZ7sm2YqwtvpH86w3W7dDwb0Ad/8+8ZmdGRnfaygJM+z7JDsIka+q
	oVhCZxNl2AQO6blgfjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeoR-0000000Br7i-20A9;
	Fri, 02 Oct 2026 15:04:39 +0000
Received: from mail-oi1-f200.google.com ([209.85.167.200])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeoO-0000000Br79-2EMf
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 15:04:38 +0000
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso12241787b6e.2
        for <linux-mtd@lists.infradead.org>; Fri, 02 Oct 2026 08:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953474; x=1791558274;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+CF/iWFUmI+2f6XnWx36o3ZGO2oTXKXYroPY6WHn34=;
        b=uanjfklx7l68lRWeI9ZslYxWPDkit3oLPbXVeIOb+vpxFqs8hDoF/uMh+dmEIOEzCJ
         aLeYCjMqLA/08hgoLgtJZ4iTRvf0jNeBH66t2CTkBba9gwGUMEeZ8+/seaoHjWWjUqBs
         kV9XURLxqhpyw8r+XeRDv2zNcu16loU+f7DlkvTGUtoxtM/kPVVrYpVu8o4ll4Gh3Yxb
         SDfFFFDn3LzxmxM0lxER3/2BtRV3Z+ZzuN2gqL5jkKd6UUbEg/p38BfEwOlc1DoAZrTb
         S/Gi1aqnP0dv1gPnJm4NHkhqOBEH20JFjzwRr53xKMcIELajQLVLUHwW6UCLb5vQxXVj
         Y4pw==
X-Forwarded-Encrypted: i=1; AKwUvByLkuvsVDUGxUEqRaH7magRgAEf5dtyjcGnzp0dkyuuV+v+41l1m8QL64DHuAaZmw8LwYwE1W/uABE=@lists.infradead.org
X-Gm-Message-State: AFuF++nE1Skdu2mQOYYYty63bIfpuPsNPxHpmVs9sgwyhAGnMqSOuGN6
	J+gjAAYPbzFwr+fKPdr+2eKQk/1sIStPAR0x9GGR7htq5S+NrV6zGH4SG++flwDZa+aA3dS1KZg
	Q7gKkGSC++NmmX3QU1hLMdKvD1sxaJCxnlxqPFc6smQL7ZeTPxvYzAIf+32w=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f8f:b0:4c3:7695:d30 with SMTP id
 5614622812f47-4f528de2df0mr1934942b6e.14.1790953474490; Fri, 02 Oct 2026
 08:04:34 -0700 (PDT)
Date: Fri, 02 Oct 2026 08:04:34 -0700
In-Reply-To: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfc802.f32479dd.202a09.000a.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, luquijeffrey@gmail.com, richard@nod.at, 
	sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080436_654596_357D4AC8 
X-CRM114-Status: UNSURE (   7.23  )
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

HEAD commit:    6474fa070f2b Add linux-next specific files for 20260929
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11ef6035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3477d5a04d788556
dashboard link: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144b6725580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0b184b600605/disk-6474fa07.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/71aa06781faf/vmlinux-6474fa07.xz
kernel image: https://storage.googleapis.com/syzbot-assets/250dcdc25f2b/bzImage-6474fa07.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com

RDX: 00000000000001ff RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007f74b6c3506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f74b6e26038 R14: 00007f74b6e25fa0 R15: 00007fff61b089a8
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
Read of size 4 at addr ffff8880325b21a8 by task syz.0.310/6721

CPU: 1 UID: 0 PID: 6721 Comm: syz.0.310 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 jffs2_xattr_delete_inode+0x2c8/0x2d0 fs/jffs2/xattr.c:602
 jffs2_do_clear_inode+0x58/0x390 fs/jffs2/readinode.c:1418
 evict+0x624/0xb50 fs/inode.c:823
 jffs2_new_inode+0x48a/0xd20 fs/jffs2/fs.c:-1
 jffs2_mkdir+0x189/0xec0 fs/jffs2/dir.c:483
 vfs_mkdir+0x40e/0x630 fs/namei.c:5423
 filename_mkdirat+0x285/0x510 fs/namei.c:5456
 __do_sys_mkdirat fs/namei.c:5477 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5474
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f74b6b9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f74b79b6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007f74b6e25fa0 RCX: 00007f74b6b9e159
RDX: 00000000000001ff RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007f74b6c3506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f74b6e26038 R14: 00007f74b6e25fa0 R15: 00007fff61b089a8
 </TASK>

Allocated by task 6703:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:351 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:377
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 kmem_cache_alloc_noprof+0x2b4/0x600 mm/slub.c:5047
 jffs2_scan_make_ino_cache+0x89/0x1d0 fs/jffs2/scan.c:978
 jffs2_scan_inode_node fs/jffs2/scan.c:1025 [inline]
 jffs2_scan_eraseblock fs/jffs2/scan.c:814 [inline]
 jffs2_scan_medium+0x35ac/0x7240 fs/jffs2/scan.c:151
 jffs2_build_filesystem fs/jffs2/build.c:112 [inline]
 jffs2_do_mount_fs+0x775/0x22b0 fs/jffs2/build.c:416
 jffs2_do_fill_super+0x555/0xc50 fs/jffs2/fs.c:574
 mtd_get_sb+0x192/0x420 drivers/mtd/mtdsuper.c:59
 get_tree_mtd+0x597/0x7d0 drivers/mtd/mtdsuper.c:143
 vfs_get_tree+0x92/0x2a0 fs/super.c:1943
 fc_mount fs/namespace.c:1209 [inline]
 do_new_mount_fc fs/namespace.c:3785 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3861
 do_mount fs/namespace.c:4194 [inline]
 __do_sys_mount fs/namespace.c:4407 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4384
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5744:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kmem_cache_free+0x182/0x650 mm/slub.c:6757
 jffs2_free_ino_caches+0xec/0x1c0 fs/jffs2/nodelist.c:497
 jffs2_put_super+0x6c/0x170 fs/jffs2/super.c:335
 generic_shutdown_super+0x13d/0x2d0 fs/super.c:751
 kill_mtd_super+0x23/0x70 drivers/mtd/mtdsuper.c:176
 jffs2_kill_sb+0x96/0xb0 fs/jffs2/super.c:350
 deactivate_locked_super+0xbe/0x110 fs/super.c:586
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1329
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880325b2180
 which belongs to the cache jffs2_inode_cache of size 48
The buggy address is located 40 bytes inside of
 freed 48-byte region [ffff8880325b2180, ffff8880325b21b0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x325b2
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801e748b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000200400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5830, tgid 5828 (syz.0.17), ts 89085743032
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x220f/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5441
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 kmem_cache_alloc_noprof+0x394/0x600 mm/slub.c:5047
 jffs2_do_read_inode+0x33f/0x6a0 fs/jffs2/readinode.c:1372
 jffs2_iget+0x228/0xcc0 fs/jffs2/fs.c:277
 jffs2_do_fill_super+0x59d/0xc50 fs/jffs2/fs.c:578
 mtd_get_sb+0x192/0x420 drivers/mtd/mtdsuper.c:59
 get_tree_mtd+0x597/0x7d0 drivers/mtd/mtdsuper.c:143
 vfs_get_tree+0x92/0x2a0 fs/super.c:1943
 fc_mount fs/namespace.c:1209 [inline]
 do_new_mount_fc fs/namespace.c:3785 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3861
 do_mount fs/namespace.c:4194 [inline]
 __do_sys_mount fs/namespace.c:4407 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4384
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
page last free pid 15 tgid 15 ts 88711812410 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 __free_frozen_pages+0xc97/0xd90 mm/page_alloc.c:2952
 __tlb_remove_table_free mm/mmu_gather.c:226 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:287
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x926/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x223/0x840 kernel/softirq.c:645
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1099
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880325b2080: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff8880325b2100: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
>ffff8880325b2180: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
                                  ^
 ffff8880325b2200: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
 ffff8880325b2280: fa fb fb fb fb fb fc fc fa fb fb fb fb fb fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
