Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D52AC9832A
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Sep 2026 02:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GerMCFCovlhYhn7zJ+L7N6fzAEVgAB4LDkvu3+8njGQ=; b=3tRj6dnFekHCF8
	eDR6p3OI1aDIrmXJikLgtVrX9Y5FfNKzLHn9jIPxdNL2ZVAbJ+2714QHOVyh1m0J1zc4UBUHwO5a7
	xpJhHBPb1c9e+wyB+JkMbXrV4PgDz39y5uiP+TQMy4kM+iowLdli+WsLymYeMkOWDoXVn9UYQp5Dh
	vmK3NxOi0npbyEN5yzg7pCuufgIgqV+i3roRZPBAj05F4UfQVkCKID8eZfsPKeKZCerYnbw4zQpsh
	udxkXEvTYBE9xv6Hbs1NBk1pQmyNdySkI4dAcrgC9YgB8h7EKE56wsCoMWEaRAc2/KYKWl9fLo77q
	rJ+Aj91B5E7CvOdBX97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAeXG-0000000FwTh-0OMZ;
	Sun, 27 Sep 2026 02:22:38 +0000
Received: from mail-dy1-f199.google.com ([74.125.82.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAeXA-0000000FwTK-2rUO
	for linux-mtd@lists.infradead.org;
	Sun, 27 Sep 2026 02:22:34 +0000
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so357359eec.1
        for <linux-mtd@lists.infradead.org>; Sat, 26 Sep 2026 19:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790475752; x=1791080552;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JVvyfRdZzZXGWfCHa8xWpQZCMkGUrRnfRBX6R0hOcjE=;
        b=c4nvlWtBtmU6Sj8t83BXquI/eRvzGdK8wcDXsJ5KinD3WCzAIS7+2hzo4vx/lHkgjM
         pVZHXk41GOX3/NJtFhr0LJcY8E+K0WOv0W0me65QoEfh0UMi3Ty8aH9BxfUdLDPCHxHb
         6FHiXckfjQAmD6/8MzlM9MEmzI5cMXwqpgwqtx1UiD0OSNojefW9jOl+aF87bP4hosug
         nHEVqaH+ZmgicUMeLt7XNqjsc7lRZuSXB5tQ8B5HqniWBfi1ke2tNxPANCld9lfINxNj
         mGOVRSAMvitw7mZS68X+sYeiI31XqrtcWtitW1o1ypUjyccHypR/D+PHX7t/5olPdoUX
         J8wA==
X-Forwarded-Encrypted: i=1; AKwUvBy69/7twiDEjyPL8Uv7r/uJnfCPzl36iT3gkZAAmC8XeHHcz2wEiivWjsn7vvd+YDDTqqHaS5HWynI=@lists.infradead.org
X-Gm-Message-State: AFuF++nUz+77b8eyglq+LGPb87RUFjG8sMszMK8VTEAAGmY0Ys6Rc/Ei
	ybw783X6zcrDSqrcMxFYhCcAWB01LZlDxKE2QYGNPeG7xvF5oQgp5pO/NmC/2V+dyOrpG8BZ5Ph
	RXV9l47EfJYGmj7AYnmKb8IBjHKHVdlnosc1cVzw3sYei8uVa+Kon0cX73yo=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1919:b0:4d6:9153:2963 with SMTP id
 5614622812f47-4d72b733900mr12165050b6e.52.1790475276885; Sat, 26 Sep 2026
 19:14:36 -0700 (PDT)
Date: Sat, 26 Sep 2026 19:14:36 -0700
In-Reply-To: <6a8af6b0.ae6ddae5.3da009.0066.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab87c0c.dc2998a4.2261f5.005c.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: invalid-free in jffs2_free_inode
From: syzbot <syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, kartikey406@gmail.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_192232_750144_DEB39092 
X-CRM114-Status: UNSURE (   6.92  )
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

HEAD commit:    f5f84daefcd9 Add linux-next specific files for 20260925
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10f35a05580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be00179930e43a43
dashboard link: https://syzkaller.appspot.com/bug?extid=675e84fdf3dde67b4946
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b49315580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e12605580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e42cbc7060af/disk-f5f84dae.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e80a7ee494ac/vmlinux-f5f84dae.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f41cc55a1308/bzImage-f5f84dae.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com

RSP: 002b:00007ffed613c038 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007fa9e1225fa0 RCX: 00007fa9e0f9e159
RDX: 0000200000000080 RSI: ffffffffffffff9c RDI: 0000200000000000
RBP: 00007ffed613c0a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fa9e1225fac R14: 00007fa9e1225fa0 R15: 00007fa9e1225fa0
 </TASK>
==================================================================
BUG: KASAN: double-free in jffs2_free_inode+0x41/0x60 fs/jffs2/super.c:52
Free of addr ffff8880216a6380 by task syz.0.224/6314

CPU: 0 UID: 0 PID: 6314 Comm: syz.0.224 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report_invalid_free+0xea/0x110 mm/kasan/report.c:557
 check_slab_allocation mm/kasan/common.c:-1 [inline]
 __kasan_slab_pre_free+0x104/0x120 mm/kasan/common.c:272
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2725 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x173/0x650 mm/slub.c:6923
 jffs2_free_inode+0x41/0x60 fs/jffs2/super.c:52
 i_callback fs/inode.c:318 [inline]
 alloc_inode+0x17c/0x1b0 fs/inode.c:353
 iget_locked+0x12c/0x690 fs/inode.c:1473
 jffs2_iget+0xac/0xcc0 fs/jffs2/fs.c:265
 jffs2_lookup+0x377/0x430 fs/jffs2/dir.c:114
 lookup_one_qstr_excl+0x12d/0x360 fs/namei.c:1810
 __start_dirop fs/namei.c:2920 [inline]
 start_dirop fs/namei.c:2942 [inline]
 filename_create+0x20e/0x370 fs/namei.c:5101
 filename_symlinkat+0xf7/0x410 fs/namei.c:5824
 __do_sys_symlinkat fs/namei.c:5850 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5845
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa9e0f9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffed613c038 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007fa9e1225fa0 RCX: 00007fa9e0f9e159
RDX: 0000200000000080 RSI: ffffffffffffff9c RDI: 0000200000000000
RBP: 00007ffed613c0a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fa9e1225fac R14: 00007fa9e1225fa0 R15: 00007fa9e1225fa0
 </TASK>

Allocated by task 6042:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5531 [inline]
 __kmalloc_noprof+0x366/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 jffs2_do_read_inode_internal+0x4d11/0x6790 fs/jffs2/readinode.c:1271
 jffs2_do_read_inode+0x4b4/0x6a0 fs/jffs2/readinode.c:1389
 jffs2_iget+0x228/0xcc0 fs/jffs2/fs.c:277
 jffs2_lookup+0x377/0x430 fs/jffs2/dir.c:114
 lookup_one_qstr_excl+0x12d/0x360 fs/namei.c:1810
 __start_dirop fs/namei.c:2920 [inline]
 start_dirop fs/namei.c:2942 [inline]
 filename_create+0x20e/0x370 fs/namei.c:5101
 filename_symlinkat+0xf7/0x410 fs/namei.c:5824
 __do_sys_symlinkat fs/namei.c:5850 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5845
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 15:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 jffs2_free_inode+0x41/0x60 fs/jffs2/super.c:52
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x926/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x223/0x840 kernel/softirq.c:645
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1099
 smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880216a6380
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes inside of
 8-byte region [ffff8880216a6380, ffff8880216a6388)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880216a6a60 pfn:0x216a6
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88813ff24500 ffffea0000adf290 ffffea0000adaf50
raw: ffff8880216a6a60 000000000080004e 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 3479526280
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1854
 prep_new_page mm/page_alloc.c:1862 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3933
 __alloc_frozen_pages_noprof+0x1fc/0x400 mm/page_alloc.c:5441
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_noprof+0x476/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 acpi_ex_allocate_name_string+0x79/0x290 drivers/acpi/acpica/exnames.c:66
 acpi_ex_get_name_string+0x488/0xa90 drivers/acpi/acpica/exnames.c:367
 acpi_ds_create_operand+0x5c7/0xbe0 drivers/acpi/acpica/dsutils.c:446
 acpi_ds_evaluate_name_path+0x1a5/0x460 drivers/acpi/acpica/dsutils.c:778
 acpi_ds_exec_end_op+0x28b/0x1b00 drivers/acpi/acpica/dswexec.c:374
 acpi_ps_parse_loop+0xfa3/0x23f0 drivers/acpi/acpica/psloop.c:553
 acpi_ps_parse_aml+0x388/0x1020 drivers/acpi/acpica/psparse.c:489
 acpi_ps_execute_method+0x89d/0xa70 drivers/acpi/acpica/psxface.c:190
 acpi_ns_evaluate+0xd05/0x1320 drivers/acpi/acpica/nseval.c:205
page last free pid 1 tgid 1 ts 3320811456 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2952
 __slab_free+0x269/0x2c0 mm/slub.c:5926
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_remove_cache+0x35d/0x380 mm/kasan/quarantine.c:388
 kmem_cache_shrink+0xd/0x20 mm/slab_common.c:611
 acpi_os_purge_cache+0x15/0x20 drivers/acpi/osl.c:1622
 acpi_purge_cached_objects+0xac/0x100 drivers/acpi/acpica/utxface.c:239
 acpi_initialize_objects+0x2e/0xb0 drivers/acpi/acpica/utxfinit.c:250
 acpi_bus_init+0xa8/0x360 drivers/acpi/bus.c:1397
 acpi_init+0xa1/0x1f0 drivers/acpi/bus.c:1486
 do_one_initcall+0x250/0x870 init/main.c:1360
 do_initcall_level+0x10a/0x1a0 init/main.c:1422
 do_initcalls+0x59/0xa0 init/main.c:1438
 kernel_init_freeable+0x29d/0x3e0 init/main.c:1673
 kernel_init+0x22/0x1d0 init/main.c:1563
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158

Memory state around the buggy address:
 ffff8880216a6280: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
 ffff8880216a6300: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
>ffff8880216a6380: fa fc fc fc fa fc fc fc fa fc fc fc fa fc fc fc
                   ^
 ffff8880216a6400: fa fc fc fc fa fc fc fc 05 fc fc fc 05 fc fc fc
 ffff8880216a6480: 05 fc fc fc 05 fc fc fc 06 fc fc fc 06 fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
