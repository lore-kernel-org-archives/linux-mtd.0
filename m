Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B93CD128A
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2024 05:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=R88ruAOkIcgGBGYeF9BEg4E/aD7knDPXVWmVfeH7AFs=; b=Yin
	XSvKmVhu1pNSA9enaglaMtyFMQETuqYIXQzVl/ywNbfDjS7pEIm60qYdBECciEtitvIeNJmdBUx4y
	WnCB6FqaZ8vJpS3llsKzawKNcNsuBqXPmOZnIGdp69Nl4gmoXBVJ76pDmT+R1Mev2q17+Mg6V57Hy
	0pfIZ+6BuP/X+4/vbGfzAfvkJUhEleqohebvDGEg27k4JZQaLDXyrtqQYEDG2JBQaccUD0IjFn0GU
	MlklYuvjpTxby4Dd5rKOi+ovlf5WE2MvrshuV2dVpfyHn2MWsLnUVmkdkFRKYGzItGaEfIsrEP5Jm
	2CUr2kttlnfWbw9ipc4Csec0TKhubug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rthhM-0000000EPjb-1SQC;
	Mon, 08 Apr 2024 05:37:40 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rthhI-0000000EPgc-34yt
	for linux-mtd@lists.infradead.org;
	Mon, 08 Apr 2024 05:37:38 +0000
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7d022d0c76aso413227139f.3
        for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2024 22:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712554653; x=1713159453;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKi95jyAR9UGqqxHndWlLAjt2KjqNn8010J0mQ3K9UQ=;
        b=KzEHG3FqaeyHAGCvHznVdCPa015/bx19q+lqmg1X/yaJG6f21UAEtZdCTVmYZUsyUI
         8VrwLcVSdvDjbZx1exIC6a0u92o7H3vNBMvYj30MYLb4auAZe3eG+RDcJRXa0p7N0P6h
         lvAMVFP0eMl1kmOPM6NajBYyUGtSHubVwNqAnW62UXeEl3DjzO1ylpMn05kbOItS13qm
         UgKC5BZ9tN/EVWVoE0ZHqv9ccVJT87aETBf07gN2qzadCiw7TyajttEG7JgRAf5nQZaZ
         jkd9c7xPpuHYtuU1ubslIv6bVMRH0gyXiKlqXCAaOxaTq40xdBl/AuvkBIq1UMVL8upG
         G2bg==
X-Forwarded-Encrypted: i=1; AJvYcCWmBREE/vKslW/1wDIsg1+5SeJFqVU1blM0g2R74aKwWWo33/yjbkFybq/YsRJ8RuV0eBSXfYab0i0xh2xhqXbMVuDcuZzz/8IWWQFS+A==
X-Gm-Message-State: AOJu0YxVxVkReiZJEfm0CzGiwFOyswAHAkxwnlTaCLH9MRjzFTTDGbXe
	qK8l1Qdde1NtRGdfo1KgB4WBelsyp7mZd65iR7wiO+2wP2VpUizvoO3Wj7p1rDGEMYFNCD8OeV6
	M0ryR/rpHjiafsI4dFxJd7OKz418gYyKe5qIc1DjKztkZSTkWXU9KHhU=
X-Google-Smtp-Source: AGHT+IEHd5mSDwz8qlWZV7v1SpzIfoRT4uHkR2ekY/3S1NCd5xVfIvM29yPrBsNjRfpiszYDQhSnee5q4PhDNc+eJUGeN6trcYFE
MIME-Version: 1.0
X-Received: by 2002:a05:6638:378d:b0:481:2592:4f5a with SMTP id
 w13-20020a056638378d00b0048125924f5amr401258jal.1.1712554653459; Sun, 07 Apr
 2024 22:37:33 -0700 (PDT)
Date: Sun, 07 Apr 2024 22:37:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7345f06158f331a@google.com>
Subject: [syzbot] [jffs2?] kernel BUG in jffs2_start_garbage_collect_thread
From: syzbot <syzbot+61a9d95630970eece39d@syzkaller.appspotmail.com>
To: arnd@arndb.de, dhowells@redhat.com, dwmw2@infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_223736_804324_DE8DC9C1 
X-CRM114-Status: UNSURE (   9.45  )
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

HEAD commit:    fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16f4efc5180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d90a36f0cab495a
dashboard link: https://syzkaller.appspot.com/bug?extid=61a9d95630970eece39d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15ea8f4b180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1754c105180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/72ab73815344/disk-fe46a7dd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2d6d6b0d7071/vmlinux-fe46a7dd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/48e275e5478b/bzImage-fe46a7dd.xz

The issue was bisected to:

commit 9c8ad7a2ff0bfe58f019ec0abc1fb965114dde7d
Author: David Howells <dhowells@redhat.com>
Date:   Thu May 16 11:52:27 2019 +0000

    uapi, x86: Fix the syscall numbering of the mount API syscalls [ver #2]

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=168fca9d180000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=158fca9d180000
console output: https://syzkaller.appspot.com/x/log.txt?x=118fca9d180000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+61a9d95630970eece39d@syzkaller.appspotmail.com
Fixes: 9c8ad7a2ff0b ("uapi, x86: Fix the syscall numbering of the mount API syscalls [ver #2]")

------------[ cut here ]------------
kernel BUG at fs/jffs2/background.c:40!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 PID: 5060 Comm: syz-executor108 Not tainted 6.8.0-syzkaller-08951-gfe46a7dd189e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
RIP: 0010:jffs2_start_garbage_collect_thread+0x1f5/0x200 fs/jffs2/background.c:40
Code: 03 ff e9 1b ff ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 64 ff ff ff 48 89 df e8 76 78 03 ff e9 57 ff ff ff e8 9c 77 a3 fe 90 <0f> 0b 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000422fd00 EFLAGS: 00010293
RAX: ffffffff82f17cb4 RBX: ffff8880240a6018 RCX: ffff8880242b5a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8880240a6000
RBP: 0000000000000000 R08: ffffffff82f1c1c9 R09: 1ffff92000845f94
R10: dffffc0000000000 R11: fffff52000845f95 R12: ffff8880240a6000
R13: dffffc0000000000 R14: ffff8880240a6000 R15: ffff88802e7774f8
FS:  000055559415a380(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f54dacad0d0 CR3: 000000007aeec000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 jffs2_do_remount_fs+0x15b/0x1d0 fs/jffs2/fs.c:415
 reconfigure_super+0x445/0x880 fs/super.c:1071
 vfs_cmd_reconfigure fs/fsopen.c:267 [inline]
 vfs_fsconfig_locked fs/fsopen.c:296 [inline]
 __do_sys_fsconfig fs/fsopen.c:476 [inline]
 __se_sys_fsconfig+0xab5/0xec0 fs/fsopen.c:349
 do_syscall_64+0xfb/0x240
 entry_SYSCALL_64_after_hwframe+0x6d/0x75
RIP: 0033:0x7f54dac35cf9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc9713c8d8 EFLAGS: 00000246 ORIG_RAX: 00000000000001af
RAX: ffffffffffffffda RBX: 0030656c69662f2e RCX: 00007f54dac35cf9
RDX: 0000000000000000 RSI: 0000000000000007 RDI: 0000000000000003
RBP: 0000000000010305 R08: 0000000000000000 R09: 0000000000000006
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc9713c8ec
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_start_garbage_collect_thread+0x1f5/0x200 fs/jffs2/background.c:40
Code: 03 ff e9 1b ff ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 64 ff ff ff 48 89 df e8 76 78 03 ff e9 57 ff ff ff e8 9c 77 a3 fe 90 <0f> 0b 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000422fd00 EFLAGS: 00010293
RAX: ffffffff82f17cb4 RBX: ffff8880240a6018 RCX: ffff8880242b5a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8880240a6000
RBP: 0000000000000000 R08: ffffffff82f1c1c9 R09: 1ffff92000845f94
R10: dffffc0000000000 R11: fffff52000845f95 R12: ffff8880240a6000
R13: dffffc0000000000 R14: ffff8880240a6000 R15: ffff88802e7774f8
FS:  000055559415a380(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc9713c7d8 CR3: 000000007aeec000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
