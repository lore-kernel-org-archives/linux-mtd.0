Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DEFCD1288
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2024 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=I+I7aNjKUfYwRnngcwIwo7tJQx6bUL25cndfOaPkKrg=; b=YjJ
	OsNi5XB+kDJrcW/R+yccw2ZH8NHmZOxJvnWMEb9DRBmQJ2WhsgXXvWasQu6tzBW9JbBmoS/Cq59Di
	NK7ZfwuN4zFNjrIAv3oytnHGh6TLaIChwJnPCgUxmWapKMlSQcP8/Qb78VW2zObLDc2jYQM90vIsx
	ys5C5iojK+wvWIy4gGfF7/CzHEf/+YusimCGXDusZ9blngai4PwAB+5rbVANxMfeVLvA53x08n1Da
	Za1RvGGNxa6S3S71HBmLQBTiGRqocaIxaDDu4oejGJ3KqBNSSHnCAlFNY0de/X7MEfgC1Kxq7Q/dp
	lHc/Y0ygIUDD6a8gsnNR8ByA5ST6hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKrn-00000008NqW-1dtf;
	Mon, 01 Apr 2024 16:50:39 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKrj-00000008Nq2-04cu
	for linux-mtd@lists.infradead.org;
	Mon, 01 Apr 2024 16:50:36 +0000
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c7e21711d0so305834939f.3
        for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2024 09:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711990232; x=1712595032;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96XoJ68f1pPqwTDxiK/2e2U+1D+SyMpCFNl1YhjT6fQ=;
        b=jtpJQDsE3d7ESud4Xw8vC9k9X8DU6+K2HRssOHY+8RN6hGFY8ScNtJJa9HeZ2lLI5M
         B066wzNQWU+97Rm5Uf0aenUMseFQ9W3P1NvqelhSS67+3mGT3DLQtb3RuJcLFAWnMEUT
         rluDPUYQQjXP7GKchIeRpZGHauZQyLse6YjtCc8gL4ZYXl9VnpulXb6+ziN4uSPm6AYP
         7yc/l5nJkGDHz1RdilQbFKGEVUInu4B/Lmm6K6wq9M+ctsLiYOLZJvXy+peXM6S1/CiC
         hMGg7jbc1DQFEbbUxqNhzCfVFK6FYKGO51uhQf5yqR98Adezy6K9tdDxW6vyYeq0+Kcg
         2JOg==
X-Forwarded-Encrypted: i=1; AJvYcCVxbaQh8Tx/yH8K0X1kOhMkqtWuOqJ5mV0RVvbec0WqcQyQYmeTb6capwcOI/9zmEdfIWxaMUiddleGj23BbRnbZpQUqvwAgu9VBYDJQg==
X-Gm-Message-State: AOJu0Yx3kdulss+65uamH0FH/cMwylbAxe0zrfVtEBhkwzRRd/heXV6H
	1JCKfj33z+m+onSbmzvRjFSZEcLtx5UiagEmuGVeOBe/0j2tFdvZzuBqx9pZx1U/Al52cUjAXdH
	X1pdZ27GVr7BSrhLS7I94DZVg/bx43sX1Cn1+fwv4++R34z3Qv44VfNc=
X-Google-Smtp-Source: AGHT+IHR6c+wQHslbg0c7R9/cPyUhDGzVcOXV8UfRmOHW/ICv4OnBfWeEfxxSqh3v6VjgZj15PfPmNOOOR1vcwQ2JZ0EPcNlVhMT
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3207:b0:368:9aaa:2920 with SMTP id
 cd7-20020a056e02320700b003689aaa2920mr593010ilb.6.1711990232310; Mon, 01 Apr
 2024 09:50:32 -0700 (PDT)
Date: Mon, 01 Apr 2024 09:50:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7f84306150bc9d5@google.com>
Subject: [syzbot] [mtd?] WARNING: zero-size vmalloc in ubi_read_volume_table
From: syzbot <syzbot+f516089d7815b10197c9@syzkaller.appspotmail.com>
To: chengzhihao1@huawei.com, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_095035_096966_AB9CC75E 
X-CRM114-Status: UNSURE (   9.64  )
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
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10223ae5180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aef2a55903e5791c
dashboard link: https://syzkaller.appspot.com/bug?extid=f516089d7815b10197c9
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13668b21180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10a6e21d180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/089e25869df5/disk-fe46a7dd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/423b1787914f/vmlinux-fe46a7dd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4c043e30c07d/bzImage-fe46a7dd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f516089d7815b10197c9@syzkaller.appspotmail.com

ubi0: scanning is finished
ubi0: empty MTD device detected
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5062 at mm/vmalloc.c:3319 __vmalloc_node_range+0x1065/0x1540 mm/vmalloc.c:3319
Modules linked in:
CPU: 0 PID: 5062 Comm: syz-executor167 Not tainted 6.8.0-syzkaller-08951-gfe46a7dd189e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
RIP: 0010:__vmalloc_node_range+0x1065/0x1540 mm/vmalloc.c:3319
Code: 48 8b 7d 08 e8 bc db ff ff 48 39 c5 0f 85 f3 02 00 00 e8 5e 9e b2 ff 48 89 ef e8 26 8f 02 00 e9 c2 f9 ff ff e8 4c 9e b2 ff 90 <0f> 0b 90 31 db e8 41 9e b2 ff 48 b8 00 00 00 00 00 fc ff df 4d 8d
RSP: 0018:ffffc900033df918 EFLAGS: 00010293
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffffffff81da4ac2
RDX: ffff88801976da00 RSI: ffffffff81da5a64 RDI: 0000000000000007
RBP: ffffffff85f10bf9 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff8ae00126 R12: 0000000000000000
R13: 1ffff9200067bf3e R14: 0000000000000000 R15: ffff88802ef1a600
FS:  000055556b89e380(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000045e620 CR3: 0000000022954000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __vmalloc_node mm/vmalloc.c:3457 [inline]
 vzalloc+0x6b/0x90 mm/vmalloc.c:3530
 create_empty_lvol drivers/mtd/ubi/vtbl.c:490 [inline]
 ubi_read_volume_table+0x639/0x2a30 drivers/mtd/ubi/vtbl.c:812
 ubi_attach+0x1a2f/0x4af0 drivers/mtd/ubi/attach.c:1601
 ubi_attach_mtd_dev+0x1659/0x3950 drivers/mtd/ubi/build.c:1000
 ctrl_cdev_ioctl+0x339/0x3d0 drivers/mtd/ubi/cdev.c:1043
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl fs/ioctl.c:890 [inline]
 __x64_sys_ioctl+0x193/0x220 fs/ioctl.c:890
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd2/0x260 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6d/0x75
RIP: 0033:0x7fbab2531369
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcb56bd0c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffcb56bd298 RCX: 00007fbab2531369
RDX: 0000000020000504 RSI: 0000000040186f40 RDI: 0000000000000003
RBP: 00007fbab25a4610 R08: 0000000000000000 R09: 00007ffcb56bd298
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffcb56bd288 R14: 0000000000000001 R15: 0000000000000001
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
