Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE89DC4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zgWYs1QzhNG3/bYOy9g/ALbZgpDwqyvFj5A9qKGqGp4=; b=NEO
	JucLqhALTRpghO6ARqH/wBEXtPYkhTt9vdpI6ICncqu4hzpWFxcMc4JKGNGteurcriguB4LXrFJVc
	rfO7fGZ9J034e7nkpAYpqRg1JpsAmx45UE5HqeFjs0lUnJZ85JLKET2IvD7hdbTVAYQaDE3MPiKcH
	pUvRFlorPFjgR8COUAIDkhwzSEmS4jGJ/Cl/dUz72GC2gSU6TpsR0lfU5etFOxIMpweBex4O8JNDh
	owaKcQcIiSTtlZKCr5bMH1ox9vUQGM6VKhT6/zRyx85kAlPmNRe25wIbq72OEyd2Np/wKKqVAbhS6
	RxYKLmxpFLJovNLfRanWN9VqX4jvt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvClx-0000000GGa0-46Sv;
	Fri, 12 Apr 2024 09:00:37 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvClu-0000000GGYf-3PHT
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 09:00:36 +0000
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36a36c04ab4so7122265ab.3
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 02:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712912432; x=1713517232;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2eLb6SWzHPU4Thv2aZRk7fEazck4gWQG7xSVSBwIcg=;
        b=rqACeYW1O4km9he73WAiuFhFaNAkKEFJ2sJFsnbDkHbXsKdxvFrKlGgRWlGQJhmEeS
         UiI65hHzIG5N/ZGqJH38ohemG7gPc6VNNpigOnOc6zj/tZt0TP0RgE7pEQH8cMYRXTCu
         4hFgZKGfWDZvYsjdYTN2cY8WaojbAmcHFMFdx1RDTAoDNIMVUfJrmpmQYsMhG1LtpJan
         hdLN2FgnPqt1fFfbZfVh80476yp+b2qMZuOvSDT08HdYBj1nDqP7LgSMM13rw3zuNlgc
         pHWTbUTDOQu99JR0URJ1iGOTdgDvLmJSj325r5j4KBhs6jD0rkS5xXnMF2kB7c8ObwtR
         YYAg==
X-Forwarded-Encrypted: i=1; AJvYcCWeDLhI4peo+cSoPfqTs6MNKLAxwRiYDpF1edLb0BbJwSGjg4jaT5t/jKu8ajn26FAbmmuC/1wQchDfJ69l1io+3AZyK1bcP3Zq0D3dZQ==
X-Gm-Message-State: AOJu0YwV/1gXPey/vnG7Q3a224cIDd0kIk0WBQZgSI2v08IVAGnbKfqg
	9lbyNDZQMXPJEI6ahTvkEjyFHacbYjqiv047uiNNaTLSJtD98wKTiub5RjXbQQXAyuqH9Y2z9q5
	OYw2+ko3jF89lghzN72u9/i00Z/zUvdYDoBkdtr4P9q/i2JnWC41EmVU=
X-Google-Smtp-Source: AGHT+IFUQrGsvXeelHT3hR2H1+SFhCcmND1ddFgQcrnerRqeGhQD1VgHzz4BUgjNzWevePw42HumUBdRdkmjISGuwLNxYDMrLWxW
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d11:b0:36a:3ee8:b9f9 with SMTP id
 i17-20020a056e021d1100b0036a3ee8b9f9mr163547ila.2.1712912431927; Fri, 12 Apr
 2024 02:00:31 -0700 (PDT)
Date: Fri, 12 Apr 2024 02:00:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000095d320615e2813f@google.com>
Subject: [syzbot] [jffs2?] kernel BUG in jffs2_sum_write_sumnode
From: syzbot <syzbot+badbb16b0a5dd4c2f676@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_020034_877465_62F1FFCA 
X-CRM114-Status: UNSURE (   7.42  )
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

HEAD commit:    00dcf5d862e8 Merge tag 'acpi-6.9-rc4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a98eeb180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c5a8421528fe0176
dashboard link: https://syzkaller.appspot.com/bug?extid=badbb16b0a5dd4c2f676
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-00dcf5d8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/68de786626b3/vmlinux-00dcf5d8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dba6f0189428/bzImage-00dcf5d8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+badbb16b0a5dd4c2f676@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:865!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 3 PID: 5545 Comm: syz-executor.3 Not tainted 6.9.0-rc3-syzkaller-00189-g00dcf5d862e8 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:jffs2_sum_write_sumnode+0x1cf6/0x2220 fs/jffs2/summary.c:865
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e d7 01 00 00 8b b3 c0 05 00 00 48 c7 c2 40 b7 44 8b 48 c7 c7 40 b3 44 8b e8 ab 09 8f fe 90 <0f> 0b e8 23 6b f1 07 e8 6e b6 0a ff e9 d9 e5 ff ff 48 89 cf 48 89
RSP: 0018:ffffc9000ca874d0 EFLAGS: 00010282
RAX: 0000000000000045 RBX: ffff88801fb6a440 RCX: ffffffff816f3829
RDX: 0000000000000000 RSI: ffffffff816fc366 RDI: 0000000000000005
RBP: ffffc9000ca87650 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000003 R12: 0000000000000000
R13: 0000000000000000 R14: ffff88805e196898 R15: ffff888059d1a000
FS:  0000000000000000(0000) GS:ffff88802c500000(0063) knlGS:00000000f5ea1b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000000c001927000 CR3: 000000005fbbe000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 jffs2_do_reserve_space+0xb52/0x1030 fs/jffs2/nodemgmt.c:388
 jffs2_reserve_space+0x62e/0xba0 fs/jffs2/nodemgmt.c:197
 do_jffs2_setxattr+0x1a1/0x16c0 fs/jffs2/xattr.c:1113
 __vfs_setxattr+0x173/0x1e0 fs/xattr.c:200
 __vfs_setxattr_noperm+0x127/0x5e0 fs/xattr.c:234
 __vfs_setxattr_locked+0x182/0x260 fs/xattr.c:295
 vfs_setxattr+0x146/0x350 fs/xattr.c:321
 do_setxattr+0x146/0x170 fs/xattr.c:629
 setxattr+0x15d/0x180 fs/xattr.c:652
 path_setxattr+0x179/0x1e0 fs/xattr.c:671
 __do_sys_lsetxattr fs/xattr.c:694 [inline]
 __se_sys_lsetxattr fs/xattr.c:690 [inline]
 __ia32_sys_lsetxattr+0xbd/0x160 fs/xattr.c:690
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0x75/0x120 arch/x86/entry/common.c:321
 do_fast_syscall_32+0x32/0x80 arch/x86/entry/common.c:346
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf72af579
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000f5ea15ac EFLAGS: 00000292 ORIG_RAX: 00000000000000e3
RAX: ffffffffffffffda RBX: 00000000200001c0 RCX: 00000000200002c0
RDX: 0000000020002040 RSI: 0000000000001009 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_sum_write_sumnode+0x1cf6/0x2220 fs/jffs2/summary.c:865
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e d7 01 00 00 8b b3 c0 05 00 00 48 c7 c2 40 b7 44 8b 48 c7 c7 40 b3 44 8b e8 ab 09 8f fe 90 <0f> 0b e8 23 6b f1 07 e8 6e b6 0a ff e9 d9 e5 ff ff 48 89 cf 48 89
RSP: 0018:ffffc9000ca874d0 EFLAGS: 00010282
RAX: 0000000000000045 RBX: ffff88801fb6a440 RCX: ffffffff816f3829
RDX: 0000000000000000 RSI: ffffffff816fc366 RDI: 0000000000000005
RBP: ffffc9000ca87650 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000003 R12: 0000000000000000
R13: 0000000000000000 R14: ffff88805e196898 R15: ffff888059d1a000
FS:  0000000000000000(0000) GS:ffff88802c500000(0063) knlGS:00000000f5ea1b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000000c001927000 CR3: 000000005fbbe000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 2 bytes skipped:
   0:	10 06                	adc    %al,(%rsi)
   2:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   6:	10 07                	adc    %al,(%rdi)
   8:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   c:	10 08                	adc    %cl,(%rax)
   e:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  1e:	00 51 52             	add    %dl,0x52(%rcx)
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	0f 34                	sysenter
  26:	cd 80                	int    $0x80
* 28:	5d                   	pop    %rbp <-- trapping instruction
  29:	5a                   	pop    %rdx
  2a:	59                   	pop    %rcx
  2b:	c3                   	ret
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop
  30:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  37:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


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
