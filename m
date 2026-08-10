Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA7C5AD4E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Q/8v5/AWtYoDJp3/CSoLFO/iRL2jn1F494H40Necm3Y=; b=jA+
	H8SK2+ElK/NOLjt0K+PRg6IlcuaDMNc+nrQGXUqQGpMWbChCe6CKHyii51sHlfz/seJZDKXpMAXT6
	KPqnJ292+DExVZK88q/Wi/Os6RjG+PhLEVydZCKclHoEsHeGcWL93onblsP7dAvsolhrFF+vG79f+
	sDsh8WYhzQv4gZaDHNVoUvy+iUX7Lk3JZWHYW/e90wVKouQ7dQiRorDMW+ZRLjDt0SWmdukobq4BZ
	pJ0l7F4lC5nznG9+kXIZmWX0UATJHjWmAAzVB2HSAmKpGP1Fkup057JEjP+G4dxzCbsDrYyYe2a64
	FotTPU99YgFZVpEhUa4nvPvMOB1hO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtDpf-0000000Aqz4-26qZ;
	Mon, 10 Aug 2026 00:25:35 +0000
Received: from mail-oi1-f208.google.com ([209.85.167.208])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtDpd-0000000Aqya-03XT
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 00:25:34 +0000
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-49f3a97f1caso852880b6e.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Aug 2026 17:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786321531; x=1786926331;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBAyexVC8K2C/49XqeyAP/AsC9x90y51/W2V02S4oyY=;
        b=UKggoxswBGK12kIB4Z1siYnurQlzF2X7yoHkcJ2af1LZJArb3P0ZULWi9ehd7oBnKX
         SRou/ofOGCiAU59QUIqbTILfHLh+uuHat7VKeZqGHuC9DIH85R3mRmoFBb57FrdBQLx9
         tay+vJNW+/RLnzLutp8DQUfywZyVKi1Em2P3YT+xsWmkzKWtq8QpgAmovVI3Ck8wU6GM
         GUQTdvLaK7WsfY9eylTwGdjgxkp6EcHEI9o6pA86DoonQruLx60NVZlO8VzZV9u8miX1
         aDJyVIqXotklSNpDSsqNnz4pCsk9WsvcdCISDyMmRmiYgFnzJHSl3wna7dmaeknmHQqg
         U0tw==
X-Forwarded-Encrypted: i=1; AHgh+Rom7gUAYfKYtTw3efHgS1WRZ1qPTItS3jKHJxAJ001rKrpysE1asLVGPfl1YxXA54eGnN4LRDqYWUY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJcqquq6zOmpE4tljIRUD8fTFvQ3s87jin+VVamheNitwW/7iB
	98GfnS87qu4JRdRZH5vh3hhkU4/JvXqLueQ/J6KIj+9/gELz/LV3+VRW5LdM34gjg53+xA9v2ZP
	IhfmNmEXZGYgsI5m3LyMJw7l4HaFgB6t7QeEP848x/KwPGNt00LE7hXI9tmg=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c183:b0:479:f7e7:4a81 with SMTP id
 5614622812f47-4b1ab3540ffmr9325638b6e.0.1786321531077; Sun, 09 Aug 2026
 17:25:31 -0700 (PDT)
Date: Sun, 09 Aug 2026 17:25:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a791a7b.01d0871a.3a0d52.0098.GAE@google.com>
Subject: [syzbot] [jffs2?] kernel BUG in jffs2_garbage_collect_pass
From: syzbot <syzbot+9bbc6788187abbabb2ee@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_172533_058206_F247ED5D 
X-CRM114-Status: UNSURE (   7.52  )
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

HEAD commit:    562bfb501c54 Merge tag 'integrity-v7.2-rc7' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a35bb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=9bbc6788187abbabb2ee
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dc0b8603d3a0/disk-562bfb50.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/08c750d8b185/vmlinux-562bfb50.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6142deb5b95c/bzImage-562bfb50.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9bbc6788187abbabb2ee@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/jffs2/gc.c:226!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 7620 Comm: jffs2_gcd_mtd0 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:jffs2_garbage_collect_pass+0x20e7/0x2170 fs/jffs2/gc.c:226
Code: 6b f7 fd 48 8b 7c 24 20 e8 06 6b 16 08 90 0f 0b e8 de de 95 fe bf 02 00 00 00 e8 34 44 64 fe e9 9d e7 ff ff e8 ca de 95 fe 90 <0f> 0b e8 c2 de 95 fe bf 02 00 00 00 e8 18 44 64 fe e9 7a f8 ff ff
RSP: 0018:ffffc900041b7aa0 EFLAGS: 00010293
RAX: ffffffff832ffa76 RBX: 0000000000000006 RCX: ffff888029738000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900041b7c70 R08: ffff888029738000 R09: 0000000000000006
R10: 0000000000000100 R11: 0000000000000005 R12: ffff8880357c6410
R13: ffff88805f5ef700 R14: 1ffff1100bebdee2 R15: ffff88805f5ef712
FS:  0000000000000000(0000) GS:ffff888125c3e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f06a384fffc CR3: 0000000056094000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 jffs2_garbage_collect_thread+0x634/0x6c0 fs/jffs2/background.c:155
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_garbage_collect_pass+0x20e7/0x2170 fs/jffs2/gc.c:226
Code: 6b f7 fd 48 8b 7c 24 20 e8 06 6b 16 08 90 0f 0b e8 de de 95 fe bf 02 00 00 00 e8 34 44 64 fe e9 9d e7 ff ff e8 ca de 95 fe 90 <0f> 0b e8 c2 de 95 fe bf 02 00 00 00 e8 18 44 64 fe e9 7a f8 ff ff
RSP: 0018:ffffc900041b7aa0 EFLAGS: 00010293
RAX: ffffffff832ffa76 RBX: 0000000000000006 RCX: ffff888029738000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900041b7c70 R08: ffff888029738000 R09: 0000000000000006
R10: 0000000000000100 R11: 0000000000000005 R12: ffff8880357c6410
R13: ffff88805f5ef700 R14: 1ffff1100bebdee2 R15: ffff88805f5ef712
FS:  0000000000000000(0000) GS:ffff888125c3e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f06a384fffc CR3: 0000000056094000 CR4: 00000000003526f0


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
