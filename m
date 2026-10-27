Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FD6606A31B
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 01:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ndosIzk8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=VfunUDfC6p/tJdMnYYwRF1o3KcuWpBPh6htXj76j3OM=; b=ndosIzk85DqRa1XGuP3/H7BmYm
	WuqJiwLVlUlE4ZC3cPCQZpy0DrVPjS+flAlJyxWyxK6LasbGtzW1Ytt7d7hBG8cUouKcfAZ7z9qx+
	W41UhXYsfRbiIoXKxARZLPSK5n7UQ2v39koNCT+Qdfh4gJ9SVmJh9a31XTy1mrCUNw2BLjn8uTZ1H
	jP4C4SxCs0l7r81VQ+gZz7b/93jWpJmsrR8aVxHqgxSmlRbepDPUnLJ4KoDWf8ONcd0nP+Pml9IXa
	ouI3fVU+WNXcxVIGWt1Bs5L5Eaow4SLHj7kxnoEWaq+dxKGxcAVqcOmfm1crTg7++/QA1M7Z0g0k8
	fsXVs8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLW5H-00000003b97-0Yaz;
	Tue, 27 Oct 2026 01:34:39 +0000
Received: from mail-ot1-f69.google.com ([209.85.210.69])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLW5D-00000003b8P-3tMM
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 01:34:37 +0000
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-815f2b1ecc3so8903981a34.2
        for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2026 18:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064873; x=1793669673;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOsZVBn4b4LzfHznAaYs4t6qNeqkDZnQmy54g818oX0=;
        b=OlIfuncAM7Li2Y5rT7U+2qO+1TpZ/jgq66ATeYAMFYbWXi+6SUonaLUEnN2mfqZBYE
         QYhehAEH9gTwoK7xlNd8PgIQ6fGoH3qcWC45ONb3EfcT69fRq+gxgaY/tZ3+50soioLh
         Q9T5CfZ2yy7UNS4l2zJpYVk0Fnzv+O7fdhUNvH7+nfWzx+AEVlGewL029W63/7FqTObD
         nkv5qSLlkv+dVeXKqKz3KglbBNubYHxmQE6WYIit4cDLq49zzXeqYoclYpoCO0JwnpQO
         gYg3TCBbWhOQB7Qc7kpGlUyYP27UR8gnBUPaOt5ocZRU7q2YOhmciATHXvuLe1xNGqy9
         r+1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6m1xYaqyX8n0+Q8ZLW///ziPJiNYmfJ4MT7U3JKvZjaGxzDKnu+tyqH+hawMFAY1DRd6r3M7iUzc=@lists.infradead.org
X-Gm-Message-State: AFq9FYLeVgXK2ULjULpOWJv+1aAqI3R1T4/irUZAuvIWl/1szEdCYsFt
	MliJZk1+x9trrAP1UCdt2f71SH6kMtH0yqSKfuH6le/jK3vDsm+xyrC1KLnI9oZZRdjQuJlQ2Zt
	snTC0rjqLC5PXEI+ciL2i0hvdlLAOinS6M17zv4Q/hitgccPzNLtXslzE690=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1c2:b0:4f7:8bdd:b74 with SMTP id
 5614622812f47-55c00353e23mr5669489b6e.51.1793064873598; Mon, 26 Oct 2026
 18:34:33 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:34:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfffa9.6200f071.51519.0f0e.GAE@google.com>
Subject: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in
 jffs2_erase_pending_blocks (2)
From: syzbot <syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_183435_985858_F6A604DB 
X-CRM114-Status: UNSURE (   6.89  )
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

Hello,

syzbot found the following issue on:

HEAD commit:    734bef548a96 Merge tag 'net-next-7.4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13aa8195580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7ad42626b3d97dc5
dashboard link: https://syzkaller.appspot.com/bug?extid=49c659b5564b2a44083c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6c95be5ca2c8/disk-734bef54.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/975644b166ab/vmlinux-734bef54.xz
kernel image: https://storage.googleapis.com/syzbot-assets/131e7835977a/bzImage-734bef54.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in list_empty include/linux/list.h:419 [inline]
BUG: KASAN: slab-use-after-free in jffs2_erase_pending_blocks+0x217/0x2400 fs/jffs2/erase.c:108
Read of size 8 at addr ffff88803c752228 by task jffs2_gcd_mtd0/8922

CPU: 1 UID: 0 PID: 8922 Comm: jffs2_gcd_mtd0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 list_empty include/linux/list.h:419 [inline]
 jffs2_erase_pending_blocks+0x217/0x2400 fs/jffs2/erase.c:108
 jffs2_garbage_collect_pass+0x6cc/0x2170 fs/jffs2/gc.c:253
 jffs2_garbage_collect_thread+0x693/0x720 fs/jffs2/background.c:155
 kthread+0x38b/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 8839:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d0/0x670 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 jffs2_init_fs_context+0x4f/0xc0 fs/jffs2/super.c:314
 alloc_fs_context+0x99e/0xd00 fs/fs_context.c:295
 do_new_mount+0x177/0xb00 fs/namespace.c:3966
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4565 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4542
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 7208:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6509 [inline]
 kfree+0x1c5/0x6d0 mm/slub.c:6802
 deactivate_locked_super+0xbe/0x110 fs/super.c:586
 cleanup_mnt+0x204/0x2a0 fs/namespace.c:1396
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x328/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88803c752000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 552 bytes inside of
 freed 4096-byte region [ffff88803c752000, ffff88803c753000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3c750
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ff11140 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ff11140 dead000000000100 dead000000000122
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0080000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5254, tgid 5254 (dhcpcd), ts 52755560116
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2591/0x2600 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x230/0x5c0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7418
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x339/0x690 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __do_kmalloc_node mm/slub.c:5413 [inline]
 __kmalloc_node_track_caller_noprof+0x619/0x7b0 mm/slub.c:5545
 kmalloc_reserve net/core/skbuff.c:638 [inline]
 __alloc_skb+0x2c1/0x7a0 net/core/skbuff.c:716
 alloc_skb include/linux/skbuff.h:1390 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 ctrl_build_family_msg net/netlink/genetlink.c:1387 [inline]
 ctrl_getfamily+0x3d0/0x5c0 net/netlink/genetlink.c:1467
 genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
 genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
 genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2576
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1335 [inline]
 netlink_unicast+0x90c/0xac0 net/netlink/af_netlink.c:1361
 netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1920
 sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
page last free pid 5254 tgid 5254 ts 52751440575 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xf8e/0x1070 mm/page_alloc.c:2962
 skb_release_all net/core/skbuff.c:1188 [inline]
 __kfree_skb+0x5d/0x210 net/core/skbuff.c:1202
 netlink_recvmsg+0x5ce/0xa70 net/netlink/af_netlink.c:1998
 sock_recvmsg_nosec net/socket.c:1154 [inline]
 sock_recvmsg+0x196/0x1e0 net/socket.c:1176
 ____sys_recvmsg+0x1f6/0x510 net/socket.c:2935
 ___sys_recvmsg+0x213/0x5a0 net/socket.c:2977
 __sys_recvmsg net/socket.c:3010 [inline]
 __do_sys_recvmsg net/socket.c:3016 [inline]
 __se_sys_recvmsg net/socket.c:3013 [inline]
 __x64_sys_recvmsg+0x1b4/0x290 net/socket.c:3013
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803c752100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803c752180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803c752200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff88803c752280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803c752300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
