Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420C8C5DF8C
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2026 13:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0pVwfeU0bOB2czjWoywo62RS7hKGhAzlPLryesrV1GI=; b=mSz
	+hNkZw0pwEOIYBTYxYYTPuCqlv0nTtj2NWRgFXK9BTdm5hbVnIfv4zf2FuW0m77jx6mUFz7U1p9wt
	Nhv8WUTrOxgacTDjUqQTDmR/kj74mEE9YtU+JaOVVFYIdDMfFxZ+2+NRe13azlkY96UUmpvgTD7Zg
	Ni7jUkAdaVdQQCu58Deef1diT5otCi88Q856k//8+be5H7mnVigjAoxrAhdm4pt4XuGV98bFTXDQb
	75hw0pp+OUDmt9238m+wwLz9Ae6n6R4C/znK3buNV63EfvYfDaPCLFtks8aCkWQGONANCe0hDh9iC
	oEY58QjYmeJ1LkalkJeZa5PBcdJtoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy8KT-0000000FOik-1PJ9;
	Sun, 23 Aug 2026 13:33:41 +0000
Received: from mail-oi2-f10.google.com ([74.125.231.202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy8KR-0000000FOiN-00IU
	for linux-mtd@lists.infradead.org;
	Sun, 23 Aug 2026 13:33:40 +0000
Received: by mail-oi2-f10.google.com with SMTP id 46e09a7af769-7e9fdad388fso897974a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 23 Aug 2026 06:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787492017; x=1788096817;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NXlMhiJOY0y67pIO5GNV4cvxw19Ogx5ulxSDhBcSdo=;
        b=Eph66mSYUDgmvL08qRzTBHEbRrdC+uCN8Q8beMSFFt186RxYXTY26DyATqO/sQFgfM
         cEYvD911xt57/CTJeXWQoCzyQnqNf10yT1xVRGmOQz4mk/ezuFyWA7V5aERh009Rbkay
         eqBlYIpZ05JL3wNXeR2eG7S1b7XFXCy56pCd70r3btBFhEdzJq2FwGcAU/3LGVa7ZpwJ
         k/7hHDjzjLhla/gYWmI4kpftfSz9ua/8VZp7GShOwbH4juTXKFGonJMmmyZH7TDOZt4e
         bU45VpZNW/BzU27B8HW9EZ7mko6X1MrmecZziSSsAoNHDM/+HLiNxUommXUvLa0Vk5tI
         SkiA==
X-Forwarded-Encrypted: i=1; AHgh+RrZ7xqHNPWZjOO9SMhXiPt5duYnwFf9SSd4WBAitqHZzIv8FIofe9YJ7oKNcbOj/WwzvckLoG1dc64=@lists.infradead.org
X-Gm-Message-State: AFuF++llodUE5IoGtelGwARb22g8Z34XS3bjK+Xe5orGsj9gOa6XmS9W
	SzFCBZ1ADA5LsyU1l7y2M0jf9NkSa43AHgMqEUUgthb3wWsucdHQqK11ajCDgRL3ZhFCD1zKX8W
	BpyL9rQ2U20iwsAJrOQgG2HAVE0jq4ZWbRkLMpR57bux495X1TaCoLpAnfzw=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1826:b0:4b2:e95f:37cf with SMTP id
 5614622812f47-4b309a6198emr12870209b6e.8.1787492016945; Sun, 23 Aug 2026
 06:33:36 -0700 (PDT)
Date: Sun, 23 Aug 2026 06:33:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8af6b0.ae6ddae5.3da009.0066.GAE@google.com>
Subject: [syzbot] [jffs2?] KASAN: invalid-free in jffs2_free_inode
From: syzbot <syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_063339_058623_E754B038 
X-CRM114-Status: UNSURE (   8.12  )
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

HEAD commit:    b126f6f5940f Merge tag 'x86_mm_for_7.3-rc1' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15ae2549580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90b2fd087b14b23e
dashboard link: https://syzkaller.appspot.com/bug?extid=675e84fdf3dde67b4946
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136c3a25580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-b126f6f5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c8d6c4cd1182/vmlinux-b126f6f5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/559693826b5b/bzImage-b126f6f5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com

R13: 00007f2c55825fac R14: 00007f2c55825fa0 R15: 00007f2c55825fa0
 </TASK>
==================================================================
BUG: KASAN: double-free in jffs2_free_inode+0x39/0x60 fs/jffs2/super.c:52
Free of addr ffff8880371e2200 by task syz.0.345/6450

CPU: 0 UID: 0 PID: 6450 Comm: syz.0.345 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report_invalid_free+0xb8/0x190 mm/kasan/report.c:557
 check_slab_allocation+0xc3/0xf0 mm/kasan/common.c:235
 kasan_slab_pre_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:2622 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1b6/0x6c0 mm/slub.c:6692
 jffs2_free_inode+0x39/0x60 fs/jffs2/super.c:52
 i_callback fs/inode.c:317 [inline]
 alloc_inode+0x153/0x250 fs/inode.c:352
 iget_locked+0x1d9/0x6d0 fs/inode.c:1473
 jffs2_iget+0xb5/0xe30 fs/jffs2/fs.c:265
 jffs2_lookup+0x353/0x410 fs/jffs2/dir.c:114
 lookup_one_qstr_excl+0x1cd/0x250 fs/namei.c:1810
 __start_dirop fs/namei.c:2920 [inline]
 start_dirop fs/namei.c:2942 [inline]
 filename_create+0x1cf/0x400 fs/namei.c:5092
 filename_symlinkat+0xe1/0x560 fs/namei.c:5813
 __do_sys_symlink fs/namei.c:5846 [inline]
 __se_sys_symlink fs/namei.c:5842 [inline]
 __x64_sys_symlink+0x79/0xb0 fs/namei.c:5842
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2c5559e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc968200b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 00007f2c55825fa0 RCX: 00007f2c5559e0d9
RDX: 0000000000000000 RSI: 0000200000000800 RDI: 0000200000000540
RBP: 00007ffc96820120 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f2c55825fac R14: 00007f2c55825fa0 R15: 00007f2c55825fa0
 </TASK>

Allocated by task 6382:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_noprof+0x324/0x820 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kmalloc_array_noprof include/linux/slab.h:1208 [inline]
 security_inode_init_security+0x113/0x370 security/security.c:1347
 shmem_symlink+0x163/0xa00 mm/shmem.c:4044
 vfs_symlink fs/namei.c:5794 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5773
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5819
 __do_sys_symlinkat fs/namei.c:5839 [inline]
 __se_sys_symlinkat fs/namei.c:5834 [inline]
 __x64_sys_symlinkat+0x9c/0xe0 fs/namei.c:5834
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6382:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 security_inode_init_security+0x2bf/0x370 security/security.c:1374
 shmem_symlink+0x163/0xa00 mm/shmem.c:4044
 vfs_symlink fs/namei.c:5794 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5773
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5819
 __do_sys_symlinkat fs/namei.c:5839 [inline]
 __se_sys_symlinkat fs/namei.c:5834 [inline]
 __x64_sys_symlinkat+0x9c/0xe0 fs/namei.c:5834
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880371e2200
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 0 bytes inside of
 256-byte region [ffff8880371e2200, ffff8880371e2300)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880371e2200 pfn:0x371e2
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801c042b40 ffffea0000e86f90 ffffea0000f41010
raw: ffff8880371e2200 000000080010000e 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801c042b40 ffffea0000e86f90 ffffea0000f41010
head: ffff8880371e2200 000000080010000e 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5784, tgid 5784 (syz-executor), ts 57239645098, free_ts 56961973186
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf46/0x3500 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x660 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x372/0x680 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0x66b/0x820 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 _kmalloc_array_noprof include/linux/slab.h:1208 [inline]
 security_inode_init_security+0x113/0x370 security/security.c:1347
 shmem_mknod+0x2ce/0x480 mm/shmem.c:3814
 shmem_mkdir+0x31/0x80 mm/shmem.c:3869
 vfs_mkdir+0x364/0x850 fs/namei.c:5410
 filename_mkdirat+0x48b/0x5e0 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat fs/namei.c:5461 [inline]
 __x64_sys_mkdirat+0x89/0xc0 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5777 tgid 5777 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 kmem_cache_alloc_noprof+0x26b/0x6a0 mm/slub.c:4931
 anon_vma_chain_alloc mm/rmap.c:142 [inline]
 __anon_vma_prepare+0xae/0x5e0 mm/rmap.c:194
 __vmf_anon_prepare+0x11f/0x250 mm/memory.c:3829
 vmf_anon_prepare mm/internal.h:494 [inline]
 do_anonymous_page+0x51b/0x2080 mm/memory.c:5338
 do_pte_missing mm/memory.c:4564 [inline]
 handle_pte_fault mm/memory.c:6379 [inline]
 __handle_mm_fault+0x1d2c/0x2a00 mm/memory.c:6517
 handle_mm_fault+0x37b/0xa30 mm/memory.c:6686
 do_user_addr_fault+0x59c/0x12f0 arch/x86/mm/fault.c:1343
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6f/0xd0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595

Memory state around the buggy address:
 ffff8880371e2100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880371e2180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880371e2200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff8880371e2280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880371e2300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

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
