Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C5BC67861
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2024 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yd89E+AlTXW8PLoDoKsSx7Y8f+vaNGvz1RM7MTbpOv4=; b=pWR
	wi3cY4z2CNQYO+gqds/M7F2oLo70Fit64O7BbUBGyK+23Y3Uk1wDaXnnEOQiFBvU4rIphhUp2Ru+W
	FCp6+j3IZRUEWiPSssbG/pgWn1GRK09fpcLkG0wnbtTkFY1+5J6lBaQfNj0kPazopJ6+eqGgBatw/
	ETLzPexWeDlk932HP4BwC2r8MKh9oHYg4izfGp9VQyPEHJEWJqPUJ5X4996bFpGU3e4uSn17w5ckq
	oI7PmrBiaVnXPAxsWe6tU46pbeXns+yNgL9WlNfuJtV/E3pk4DO4Uyh0RUHcAs7050dlU22rzrLZO
	juuiIWobN5oyGdyzIMsfRMK8sk2Yiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkLd-0000000EtPv-0mgr;
	Mon, 08 Apr 2024 08:27:25 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkLY-0000000EtOU-3MGc
	for linux-mtd@lists.infradead.org;
	Mon, 08 Apr 2024 08:27:22 +0000
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-36a0b315926so33729235ab.2
        for <linux-mtd@lists.infradead.org>; Mon, 08 Apr 2024 01:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712564837; x=1713169637;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtFAVUNiPHqphGwlV72BGi0mOagj+maZQ9ahfH0rlT0=;
        b=CML5F3gAV6tiCH410M3QBXPshehkDMjQX0Xk2Akq841nsjnUtHh8g6AAstuLgtSrbm
         EQhCUe3g3ZpVhUvuAzybchxowT4QB/NWXjM8QQUGBAHBu1wzkdPQ7nylJbLqiFbQbQ0J
         zNOjdRCNmojR637qhDs+/UqKcLR4skEhlj6ibbtjfecnXkYRhcHlVRdPMugdSLJ7LtKp
         IMi+0CP+ZAFGTeaRkZMSefKJTpTyYoon/OoCZJ0ay79tE4inzNC6nJlbMd92ez/kyqAW
         dnMrN/JxJ+gIhWFc+nHe3knHUPJuCjjrXT5qCuHsG5wve9Pfn5sN0Y7VKOy3+3hLPdiW
         kQCg==
X-Forwarded-Encrypted: i=1; AJvYcCXYIukrVioImaFAf+qdrPrOPY3lnibg7YWzmoKnrbDWF5iT7w5AM/qFJQwRmF1FMDMXHqqxHzRYD8jQ+/FtgSCp0is64jF0WLUUYwr1EQ==
X-Gm-Message-State: AOJu0YzLTr7xoh8yzFXTnVYuzYI+u85/aWSbgnpmcF5lD9Dj2hiRBwsK
	ikP6B4e99hnAn+QR/cu5IddXrQlQT97ZvLgs8qV0EFINisTs584CpTlLJBiWsyBqrY7KBdF3y1t
	4CbHA5zFThOCzjIb9FDrbN8gpGoPrKCiOT0ZJX0sbLXdR0XaX10lpG2g=
X-Google-Smtp-Source: AGHT+IGVEIWaD+d+7aIjzsYEn9NchKm9EVfzcvKYPPvC7C+AyTgtpFR4I2xSVak5DTDFr7oM+aUa9IJrSE3NAwFA+NTkhvvAGkaD
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3d05:b0:36a:686:bbb5 with SMTP id
 db5-20020a056e023d0500b0036a0686bbb5mr392098ilb.3.1712564836776; Mon, 08 Apr
 2024 01:27:16 -0700 (PDT)
Date: Mon, 08 Apr 2024 01:27:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c04f1806159192e8@google.com>
Subject: [syzbot] [jffs2?] [hfs?] possible deadlock in jffs2_readdir
From: syzbot <syzbot+0ad40f5b85b1d5535d7d@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_012720_872925_A94A0B77 
X-CRM114-Status: UNSURE (   6.65  )
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

HEAD commit:    707081b61156 Merge branch 'for-next/core', remote-tracking..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15576155180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=caeac3f3565b057a
dashboard link: https://syzkaller.appspot.com/bug?extid=0ad40f5b85b1d5535d7d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=153679a1180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6cad68bf7532/disk-707081b6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1a27e5400778/vmlinux-707081b6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/67dfc53755d0/Image-707081b6.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/c57625568dd0/mount_8.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0ad40f5b85b1d5535d7d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.8.0-rc7-syzkaller-g707081b61156 #0 Not tainted
------------------------------------------------------
syz-executor.1/13917 is trying to acquire lock:
ffff0000c7ace190 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x9c/0x124 mm/memory.c:6079

but task is already holding lock:
ffff0000e55ce3c0 (&f->sem){+.+.}-{3:3}, at: jffs2_readdir+0x230/0x42c fs/jffs2/dir.c:135

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&f->sem){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       jffs2_read_folio+0x6c/0xd0 fs/jffs2/file.c:125
       filemap_read_folio+0x14c/0x39c mm/filemap.c:2324
       filemap_fault+0xa9c/0xff4 mm/filemap.c:3337
       __do_fault+0x11c/0x374 mm/memory.c:4396
       do_read_fault mm/memory.c:4758 [inline]
       do_fault mm/memory.c:4888 [inline]
       do_pte_missing mm/memory.c:3745 [inline]
       handle_pte_fault mm/memory.c:5164 [inline]
       __handle_mm_fault mm/memory.c:5305 [inline]
       handle_mm_fault+0x3a80/0x546c mm/memory.c:5470
       __do_page_fault arch/arm64/mm/fault.c:505 [inline]
       do_page_fault+0x4f8/0xa64 arch/arm64/mm/fault.c:620
       do_translation_fault+0x94/0xc8 arch/arm64/mm/fault.c:704
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:840
       el1_abort+0x3c/0x5c arch/arm64/kernel/entry-common.c:432
       el1h_64_sync_handler+0x60/0xac arch/arm64/kernel/entry-common.c:492
       el1h_64_sync+0x64/0x68 arch/arm64/kernel/entry.S:593
       __arch_copy_from_user+0xb8/0x230 arch/arm64/lib/copy_template.S:110
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:871 [inline]
       __se_sys_ioctl fs/ioctl.c:857 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:857
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #1 (mapping.invalidate_lock#3){.+.+}-{3:3}:
       down_read+0x58/0x2fc kernel/locking/rwsem.c:1526
       filemap_invalidate_lock_shared include/linux/fs.h:859 [inline]
       filemap_fault+0x698/0xff4 mm/filemap.c:3252
       __do_fault+0x11c/0x374 mm/memory.c:4396
       do_read_fault mm/memory.c:4758 [inline]
       do_fault mm/memory.c:4888 [inline]
       do_pte_missing mm/memory.c:3745 [inline]
       handle_pte_fault mm/memory.c:5164 [inline]
       __handle_mm_fault mm/memory.c:5305 [inline]
       handle_mm_fault+0x3a80/0x546c mm/memory.c:5470
       __do_page_fault arch/arm64/mm/fault.c:505 [inline]
       do_page_fault+0x4f8/0xa64 arch/arm64/mm/fault.c:620
       do_translation_fault+0x94/0xc8 arch/arm64/mm/fault.c:704
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:840
       el1_abort+0x3c/0x5c arch/arm64/kernel/entry-common.c:432
       el1h_64_sync_handler+0x60/0xac arch/arm64/kernel/entry-common.c:492
       el1h_64_sync+0x64/0x68 arch/arm64/kernel/entry.S:593
       __arch_copy_from_user+0xb8/0x230 arch/arm64/lib/copy_template.S:110
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:871 [inline]
       __se_sys_ioctl fs/ioctl.c:857 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:857
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain kernel/locking/lockdep.c:3869 [inline]
       __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
       lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5754
       __might_fault+0xc4/0x124 mm/memory.c:6080
       filldir64+0x2d4/0x948 fs/readdir.c:375
       dir_emit include/linux/fs.h:3479 [inline]
       jffs2_readdir+0x314/0x42c fs/jffs2/dir.c:152
       iterate_dir+0x3f8/0x580 fs/readdir.c:110
       __do_sys_getdents64 fs/readdir.c:409 [inline]
       __se_sys_getdents64 fs/readdir.c:394 [inline]
       __arm64_sys_getdents64+0x1c4/0x4a0 fs/readdir.c:394
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> mapping.invalidate_lock#3 --> &f->sem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&f->sem);
                               lock(mapping.invalidate_lock#3);
                               lock(&f->sem);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

3 locks held by syz-executor.1/13917:
 #0: ffff0000d94854c8 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x218/0x2a4 fs/file.c:1191
 #1: ffff0000e55ce570 (&type->i_mutex_dir_key#8){++++}-{3:3}, at: iterate_dir+0x340/0x580 fs/readdir.c:103
 #2: ffff0000e55ce3c0 (&f->sem){+.+.}-{3:3}, at: jffs2_readdir+0x230/0x42c fs/jffs2/dir.c:135

stack backtrace:
CPU: 1 PID: 13917 Comm: syz-executor.1 Not tainted 6.8.0-rc7-syzkaller-g707081b61156 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:291
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:298
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 dump_stack+0x1c/0x28 lib/dump_stack.c:113
 print_circular_bug+0x150/0x1b8 kernel/locking/lockdep.c:2060
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain kernel/locking/lockdep.c:3869 [inline]
 __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
 lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5754
 __might_fault+0xc4/0x124 mm/memory.c:6080
 filldir64+0x2d4/0x948 fs/readdir.c:375
 dir_emit include/linux/fs.h:3479 [inline]
 jffs2_readdir+0x314/0x42c fs/jffs2/dir.c:152
 iterate_dir+0x3f8/0x580 fs/readdir.c:110
 __do_sys_getdents64 fs/readdir.c:409 [inline]
 __se_sys_getdents64 fs/readdir.c:394 [inline]
 __arm64_sys_getdents64+0x1c4/0x4a0 fs/readdir.c:394
 __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598


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
