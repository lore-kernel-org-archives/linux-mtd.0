Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FBDC5DF81
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=c0ToOcmEC6So3/Fn7ErjLR+waWuqRvadw0WTYq5MLkY=; b=C0+
	Q48aWlEhoUD+yghNjQwNMwW+tc1UWyOTCxun5LGyYz9kjmlkXI3poiqyyY69VrNww4ltOaMDLT1+P
	qF/RKxeoPqC8YdWpVKF7/IEWO2jEEJ0XxIO48mHnQmruWzYf+yM2+uS1CJe14ftKjlQOOHcFt+EEn
	b1W9fr5x+5fZaw6J7eEYY3sAJedP0V/tdph9UlSH3HSMKcH8HW5bW46SGEuMsU7ZGXN8vxrJZCqqo
	SPktn+LXv9euFdNiObjVRt/q+b3lUVG5BT+obA0iZevrS//HpbTGUKZkamYGFxw1sjIgR8GaxDBNm
	1B5qg0YAKi4E5jQCMuXVN0YvhxmKrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMrY-00000008NEJ-0CxT;
	Tue, 18 Aug 2026 16:40:32 +0000
Received: from mail-oo2-f10.google.com ([74.125.231.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMrV-00000008NDo-0MYk
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 16:40:31 +0000
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6b13752e134so28946eaf.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 09:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787071227; x=1787676027;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+j7oNKaplwFfuPUwIz8SXaXXOIJlXUft/JIqHX4DqIo=;
        b=AYbKHdQ8RRgJiOgbit07hAqpfEq0BRxpjNg0KowzgocwXMGynJWi8zrmwvCXj7lfX7
         KFhbmOVMFWVk3oL1chiwzyXVQXx9jsdcCJXTjIJvCvWBT+H4UK35SLYF6iZlpPjdYdCQ
         zU5hmHMvblpmyjWy+dVqiNX1gvJq2hTBmXqrXZ4YxxA1vCDXFO640v8q3nqTiviBYw1o
         Rua1isTik7zZ/xUkHiyg48pbnCHlsRl8JDOz+Rwr1+rls6wBg/bIJkt/ipRP7sisNOAi
         nzkf6KWSoTGLy2GdW4RtVMFm7WoE1XpDSvGiYj6TaPxODY70r8WBzJRfSlaFw0fV9j2t
         Os6A==
X-Forwarded-Encrypted: i=1; AHgh+RrxkeNRhqCNyoeP+Tq7RiptGPZhU3npbinw76MCNWNCeJEk3gvN22EnC2IFDwsVDHvJUwMK61GnWUk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjEJlSHeY7BKvlIU4nCqyTljHcxu/5yuU4G6QYCEcAMYKp74VA
	Smll6nCKgjvUWrfXiL3CqE4z0AAG0uD8XGsWXCZwggD1nO4o35cIjCSPdH4FVNj5ZwvecohX5Ro
	PaYhV0XG1KSWhPrEDqJGsA2gGiexYC77TAufWdtfLBolhtg/Tv/EryxzQ/1I=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a290:10b0:6b0:4d2c:1bf1 with SMTP id
 006d021491bc7-6b127a54e7cmr3560278eaf.11.1787071227355; Tue, 18 Aug 2026
 09:40:27 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:40:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a848afb.c8649fcc.3bb87.0005.GAE@google.com>
Subject: [syzbot] [jffs2?] WARNING: bad unlock balance in jffs2_do_create
From: syzbot <syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_094029_134685_713550A7 
X-CRM114-Status: UNSURE (   8.39  )
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

HEAD commit:    2f1baf1fc892 Merge tag 'trace-v7.2-rc7' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13d46279580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ead6a6de2292ff28
dashboard link: https://syzkaller.appspot.com/bug?extid=250fde257a3eebba4426
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-2f1baf1f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3cf4d3de19da/vmlinux-2f1baf1f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2c309c87fcb0/bzImage-2f1baf1f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com

Zero length message leads to an empty skb
jffs2: notice: (5313) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
overlayfs: upper fs does not support tmpfile.
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 1
CPU: 0 UID: 0 PID: 5313 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 fail_dump lib/fault-inject.c:73 [inline]
 should_fail_ex+0x40c/0x560 lib/fault-inject.c:174
 should_failslab+0xa8/0x100 mm/failslab.c:46
 slab_pre_alloc_hook mm/slub.c:4539 [inline]
 slab_alloc_node mm/slub.c:4897 [inline]
 __kmalloc_cache_noprof+0xa8/0x660 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 jffs2_sum_add_kvec+0x858/0x1870 fs/jffs2/summary.c:266
 jffs2_flash_direct_writev+0xaa/0xe0 fs/jffs2/writev.c:22
 jffs2_flash_writev+0x156/0x1550 fs/jffs2/wbuf.c:805
 jffs2_write_dnode+0x485/0xe20 fs/jffs2/write.c:109
 jffs2_do_create+0x18e/0xe00 fs/jffs2/write.c:465
 jffs2_create+0x1c8/0x320 fs/jffs2/dir.c:205
 vfs_create+0x2c4/0x450 fs/namei.c:4202
 ovl_do_create+0x81/0xf0 fs/overlayfs/overlayfs.h:244
 ovl_create_real+0x1a8/0x740 fs/overlayfs/dir.c:180
 ovl_create_temp+0x169/0x240 fs/overlayfs/dir.c:267
 ovl_check_rename_whiteout fs/overlayfs/super.c:575 [inline]
 ovl_make_workdir fs/overlayfs/super.c:713 [inline]
 ovl_get_workdir fs/overlayfs/super.c:836 [inline]
 ovl_fill_super_creds fs/overlayfs/super.c:1449 [inline]
 ovl_fill_super+0x3c9b/0x5d40 fs/overlayfs/super.c:1560
 vfs_get_super fs/super.c:1273 [inline]
 get_tree_nodev+0xbb/0x150 fs/super.c:1292
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
RIP: 0033:0x7fe775d9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe776d50fe8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fe776025fa0 RCX: 00007fe775d9e0d9
RDX: 0000200000000b80 RSI: 0000200000000100 RDI: 0000000000000000
RBP: 00007fe776d51050 R08: 0000200000000240 R09: 0000000000000000
R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fe776026038 R14: 00007fe776025fa0 R15: 00007ffdf4560bd8
 </TASK>
jffs2: warning: (5313) jffs2_sum_add_kvec: MEMORY ALLOCATION ERROR!
jffs2: Write of 68 bytes at 0x0001e218 failed. returned -12, retlen 0
jffs2: Not marking the space at 0x0001e218 as dirty because the flash driver returned retlen zero

=====================================
WARNING: bad unlock balance detected!
syzkaller #0 Not tainted
-------------------------------------
syz.0.0/5313 is trying to release lock (&c->alloc_sem) at:
[<ffffffff833a6ebe>] jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
but there are no more locks to release!

other info that might help us debug this:
3 locks held by syz.0.0/5313:
 #0: ffff8880424140d8 (&type->s_umount_key#52/1){+.+.}-{4:4}, at: alloc_super fs/super.c:345 [inline]
 #0: ffff8880424140d8 (&type->s_umount_key#52/1){+.+.}-{4:4}, at: sget_fc+0x938/0x1900 fs/super.c:766
 #1: ffff888012c72450 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:494
 #2: ffff88801229a880 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1069 [inline]
 #2: ffff88801229a880 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: __start_dirop fs/namei.c:2918 [inline]
 #2: ffff88801229a880 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: start_dirop fs/namei.c:2942 [inline]
 #2: ffff88801229a880 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: start_creating+0xbe/0x100 fs/namei.c:3406

stack backtrace:
CPU: 0 UID: 0 PID: 5313 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5298
 __lock_release kernel/locking/lockdep.c:5537 [inline]
 lock_release+0x248/0x3c0 kernel/locking/lockdep.c:5889
 __mutex_unlock_slowpath+0x88/0x900 kernel/locking/mutex.c:989
 jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
 jffs2_create+0x1c8/0x320 fs/jffs2/dir.c:205
 vfs_create+0x2c4/0x450 fs/namei.c:4202
 ovl_do_create+0x81/0xf0 fs/overlayfs/overlayfs.h:244
 ovl_create_real+0x1a8/0x740 fs/overlayfs/dir.c:180
 ovl_create_temp+0x169/0x240 fs/overlayfs/dir.c:267
 ovl_check_rename_whiteout fs/overlayfs/super.c:575 [inline]
 ovl_make_workdir fs/overlayfs/super.c:713 [inline]
 ovl_get_workdir fs/overlayfs/super.c:836 [inline]
 ovl_fill_super_creds fs/overlayfs/super.c:1449 [inline]
 ovl_fill_super+0x3c9b/0x5d40 fs/overlayfs/super.c:1560
 vfs_get_super fs/super.c:1273 [inline]
 get_tree_nodev+0xbb/0x150 fs/super.c:1292
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
RIP: 0033:0x7fe775d9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe776d50fe8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fe776025fa0 RCX: 00007fe775d9e0d9
RDX: 0000200000000b80 RSI: 0000200000000100 RDI: 0000000000000000
RBP: 00007fe776d51050 R08: 0000200000000240 R09: 0000000000000000
R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fe776026038 R14: 00007fe776025fa0 R15: 00007ffdf4560bd8
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
