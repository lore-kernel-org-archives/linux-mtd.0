Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E82DC02192
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4GbqAWgeg5npWHf1iP7HhVeLOVDjh43ajnHAj9xfwsk=; b=MbI
	icwM61FTcoUVPSHyDHJZaYYRMBPJl2PrYoLHVT4Wdqzgfg1wC+1uFN6B5wHh5Zq9dmztWNgSnzxTB
	KI4kMdKtkohAisv5CG2o40p/whQX4cR5KhoeR/t/UKdx1PO5Ja5tyI6RGCkuVyJF1riQZRR8b371H
	KGnJcKW9aBH2wDBSqtj1lwV4mdA2/lJClmhhBKdFs+qED33lw6/d2slRkmf9nSEASLbQUCmwExmAr
	tXxh7uTvYX9TFvEjma4nvCSfeWiCLzlO6/gQMQDoiBRiUfZAsail9EUB5OblCp0YzASQhucf5SdcJ
	iXQsxjCXwiBJ8vPn7Xjzy54k+0365LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrUv-0000000AjFD-08k7;
	Fri, 31 Jan 2025 13:55:53 +0000
Received: from mail-il1-f205.google.com ([209.85.166.205])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrTT-0000000Aizp-3uaM
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 13:54:25 +0000
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3cfb20d74b5so13175525ab.3
        for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 05:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738331662; x=1738936462;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNAmo4ihhSxy8pLUbp5UzEpnOMNglctNA6lT+shWmDM=;
        b=k8u545YVQ+8HsT9trbxw4i/qDGrvyIALdVBZf6e0/HQLS9dhkr57kPvxJtHMxAkajZ
         /+fFmFf0FblBfmOaLvluyk/eMCbxk/y2Dez14KoDy78dkzTG/wXniP2pLba2jJVyikbT
         9UZQzzvV7iQDlZaLsSTrDDJLIkrhBCqSUGI2S9awNSedknMVpy5cg0vPKQwzRQpGl3AD
         YdHSR9E4mcXdMRXHntQSHgTEcHlP9EmJJaIC80GKh4Yx3mkm7zZZy+9XfKU5VyGtBWay
         5sERyv3hRtXexwMjd5Ylwrh7n1K8r121y01urD8Q+1ujD36SE9e1wG60aF4C54BxZVOZ
         Xeug==
X-Forwarded-Encrypted: i=1; AJvYcCX60/ZZKnxYkWE4BQAJmzO36lottAl/5jwFzkcn45HgXCgUR3oC4ieCNAaE1OIjDNN3Hfb/W7VJI9g=@lists.infradead.org
X-Gm-Message-State: AOJu0YymaZVULp6kCpd673dIur5bo/jJonT2EelYHfiFIaQ0QVN6YDfT
	g07fRA2tS7eaTWZdjiYBTmP8WF04VlDy3VlemFFbvjcdWmR009tT1K+0ZCw3ZFuHKsFkmMdNcol
	hJUvALreI5uAdt/Kmi8NgI8d3Vbv8rciMoNLPgJPaDH4zMqyE7USk4VQ=
X-Google-Smtp-Source: AGHT+IED8ogy78oTUggSAqvhG9GyRfoJE0Y9exge1EETL/shmGrMmp90MM/453diegBzRUwKIFp2Ikf8NU1osuasyBaj8kXXGt2J
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e7:b0:3cf:bb11:a3a7 with SMTP id
 e9e14a558f8ab-3cffe406b35mr88083435ab.17.1738331662366; Fri, 31 Jan 2025
 05:54:22 -0800 (PST)
Date: Fri, 31 Jan 2025 05:54:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
Subject: [syzbot] [mtd?] WARNING in release_mtd_partition
From: syzbot <syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_055423_969709_B5376FC5 
X-CRM114-Status: UNSURE (   8.90  )
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

HEAD commit:    2a9f04bde07a Merge tag 'rtc-6.14' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11fe5ddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=98d83cc1742b7377
dashboard link: https://syzkaller.appspot.com/bug?extid=074732af3fc6c528f8a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14590b24580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fe5ddf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/89ef40be688f/disk-2a9f04bd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7471856a382f/vmlinux-2a9f04bd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d694ab107faf/bzImage-2a9f04bd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com

RDX: 0000000000000008 RSI: 0000000000001269 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00007fff4fe6dbf7 R09: 0000000000000007
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f0fdafc421c
R13: 00007f0fdafc4184 R14: 00007f0fdafc4077 R15: 00007f0fdafef570
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5826 at drivers/mtd/mtdpart.c:37 release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Modules linked in:
CPU: 0 UID: 0 PID: 5826 Comm: syz-executor397 Not tainted 6.13.0-syzkaller-09734-g2a9f04bde07a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:release_mtd_partition+0x71/0x90 drivers/mtd/mtdpart.c:37
Code: 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 1e 48 8b 7b 38 e8 ef 84 cd fb 48 89 df 5b 5d e9 e5 84 cd fb e8 70 4a 75 fb 90 <0f> 0b 90 eb c2 e8 a5 29 d8 fb eb db 48 89 ef e8 9b 29 d8 fb eb a5
RSP: 0018:ffffc90003e1f828 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88802c1d1000 RCX: ffffffff8b417995
RDX: ffff8880310c3c00 RSI: ffffffff86439150 RDI: ffff88802c1d1000
RBP: ffff88802c1d1648 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000004 R11: ffffffff81000130 R12: 0000000000000000
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  000055558b9cd480(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 0000000034aca000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 mtd_release+0xa0/0xd0 drivers/mtd/mtdcore.c:101
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 add_mtd_device+0xbb3/0x1700 drivers/mtd/mtdcore.c:750
 mtd_add_partition+0x300/0x650 drivers/mtd/mtdpart.c:279
 mtdchar_blkpg_ioctl+0x20d/0x250 drivers/mtd/mtdchar.c:562
 mtdchar_ioctl+0xbbe/0x2050 drivers/mtd/mtdchar.c:1216
 mtdchar_unlocked_ioctl+0xb0/0xf0 drivers/mtd/mtdchar.c:1239
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0fdaf83199
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff4fe6de58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fff4fe6de70 RCX: 00007f0fdaf83199
RDX: 0000000000000008 RSI: 0000000000001269 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00007fff4fe6dbf7 R09: 0000000000000007
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f0fdafc421c
R13: 00007f0fdafc4184 R14: 00007f0fdafc4077 R15: 00007f0fdafef570
 </TASK>


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
