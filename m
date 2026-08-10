Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB64C5AD5A
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 00:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1dDA9+zByoe7poYOe30EkcA2a6zW++ETWGEjnQGDr/w=; b=LZ2
	BuEPfM1q6e3ay3B9IPzEbpItIpiTeaU/1kUF5PGc0wnhMZN2Tg2ORdDcWXrEPRaQLd1drQae98lGT
	5QwVA0rVSvkad0G27nSc0U3NQRlWo0vcvm1DXH5Np2yzYQXlgVzzvnXzTCdYkSTOsoxh8d9Ldk9gi
	nJYceo3SVJb6edwK72t80HPMEkfozI9lwq2UEc4iO+XG9QCst3ip2uirVVbdmXXKH7i+NFL4qM6Lg
	1KubujSv0dxBFktKbWk8N2uTl9QLJy2UvEEHX8vAVHS2i4l3FHCJMZ18NUf0QQTuz8TiExZgYgDjQ
	7jnuUMniJCOFn6WCKUCm+uVt/wZj9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtDyL-0000000ArC5-1SeH;
	Mon, 10 Aug 2026 00:34:33 +0000
Received: from mail-ot1-f77.google.com ([209.85.210.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtDyI-0000000ArBi-3oH3
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 00:34:32 +0000
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7f36427abfdso2296763a34.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Aug 2026 17:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322069; x=1786926869;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4stc6q/YjnR6zOACY45yGoHWgorHHlXz7m6/y9/btE=;
        b=CAS1+D6OV5UyyIhN7dgVflyyCzk+xPQmoCfmZnNkUSSNJA1zoIVXC8gVcdiKRZj9CH
         W+Y/QaIxobST7QsyxrRnie6r7BxK0fa860/wNI4veQvgEdYhIxYLUEFfJok4fAu5m3cK
         4NaFvl39ul+sxWi/ewHzrOo2S6NvqDWEe4+OCBtnwemY5TqOD2fF19pt7ZjxR8VGakno
         S3L0byDCBnWCoDGEC8XPS4n9b4J7PmRArau8krbJ5SJlwSqDteTa/bUeb+oWpYYZJbpc
         4hQnieEHKm//R5tLvuT1p3IX6Z9hjnAzJHuGDdQYo1xbgTRMPsFkL70CDzwlOZPyeqe1
         6T/w==
X-Forwarded-Encrypted: i=1; AHgh+RoZI/BZ8EOvBp/KjfT71xLBR2Rw6J8iznHy9J417U0QugI4bZ0R1G20UwNm2Q4DToOJOr8B/beFkRU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzV3UoWcM4lyGgWT3uFWC2Tp2O3IaJjy0eani3hSMsETAXXY/pe
	4equNOZo4niSejP/L2n/JN3pGVqE9GYjWhZs8D7zZI+gID/DBf5E/gytBwSMlQ9IWEnj3Sbf6gV
	xsOm2Qz+eJTKwoDQhi+i2/TOB0ISsKK4z44DVSHgt9bG5AjiVMkUOO+ASD3o=
MIME-Version: 1.0
X-Received: by 2002:a4a:ee87:0:b0:6aa:d8d9:a4bb with SMTP id
 006d021491bc7-6ae970f14f6mr20924502eaf.36.1786322068894; Sun, 09 Aug 2026
 17:34:28 -0700 (PDT)
Date: Sun, 09 Aug 2026 17:34:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
Subject: [syzbot] [mtd?] divide error in block2mtd_setup2
From: syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>
To: joern@lazybastard.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_173430_955407_57EB93E7 
X-CRM114-Status: UNSURE (   8.71  )
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

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149f2cc6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c05be6c9b0d36cb9
dashboard link: https://syzkaller.appspot.com/bug?extid=b320a4d5f65a61dbbf89
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2425c07b5d46/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cf278dd14da3/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com

Oops: divide error: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5325 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:add_device drivers/mtd/devices/block2mtd.c:296 [inline]
RIP: 0010:block2mtd_setup2+0x592/0xda0 drivers/mtd/devices/block2mtd.c:459
Code: 48 8b 74 24 30 48 63 ce 48 89 d8 48 09 c8 48 c1 e8 20 4c 8b 64 24 10 74 0d 48 89 d8 48 99 48 f7 f9 49 89 d5 eb 09 89 d8 31 d2 <f7> f6 41 89 d5 31 ff 4c 89 ee e8 1f da 39 fb 4d 85 ed 0f 85 90 04
RSP: 0018:ffffc9000f26f9a0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001f00000
RBP: ffffc9000f26fb98 R08: ffff8880353962ef R09: 1ffff11006a72c5d
R10: dffffc0000000000 R11: ffffed1006a72c5e R12: 0000000000000000
R13: ffff88801d02d0b4 R14: ffff8880122be000 R15: ffff8880122be000
FS:  00007fa7d8c5d6c0(0000) GS:ffff88808c540000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa7d801bb30 CR3: 000000003fb3c000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 block2mtd_setup+0x27/0xe0 drivers/mtd/devices/block2mtd.c:476
 param_attr_store+0x214/0x310 kernel/params.c:589
 module_attr_store+0x65/0x90 kernel/params.c:904
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa7d7d9e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fa7d8c5cfe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fa7d8025fa0 RCX: 00007fa7d7d9e019
RDX: 000000000000000c RSI: 00002000000000c0 RDI: 0000000000000003
RBP: 00007fa7d7e3500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa7d8026038 R14: 00007fa7d8025fa0 R15: 00007ffe5587a628
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:add_device drivers/mtd/devices/block2mtd.c:296 [inline]
RIP: 0010:block2mtd_setup2+0x592/0xda0 drivers/mtd/devices/block2mtd.c:459
Code: 48 8b 74 24 30 48 63 ce 48 89 d8 48 09 c8 48 c1 e8 20 4c 8b 64 24 10 74 0d 48 89 d8 48 99 48 f7 f9 49 89 d5 eb 09 89 d8 31 d2 <f7> f6 41 89 d5 31 ff 4c 89 ee e8 1f da 39 fb 4d 85 ed 0f 85 90 04
RSP: 0018:ffffc9000f26f9a0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001f00000
RBP: ffffc9000f26fb98 R08: ffff8880353962ef R09: 1ffff11006a72c5d
R10: dffffc0000000000 R11: ffffed1006a72c5e R12: 0000000000000000
R13: ffff88801d02d0b4 R14: ffff8880122be000 R15: ffff8880122be000
FS:  00007fa7d8c5d6c0(0000) GS:ffff88808c540000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffee237bf52 CR3: 000000003fb3c000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   5:	48 63 ce             	movslq %esi,%rcx
   8:	48 89 d8             	mov    %rbx,%rax
   b:	48 09 c8             	or     %rcx,%rax
   e:	48 c1 e8 20          	shr    $0x20,%rax
  12:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  17:	74 0d                	je     0x26
  19:	48 89 d8             	mov    %rbx,%rax
  1c:	48 99                	cqto
  1e:	48 f7 f9             	idiv   %rcx
  21:	49 89 d5             	mov    %rdx,%r13
  24:	eb 09                	jmp    0x2f
  26:	89 d8                	mov    %ebx,%eax
  28:	31 d2                	xor    %edx,%edx
* 2a:	f7 f6                	div    %esi <-- trapping instruction
  2c:	41 89 d5             	mov    %edx,%r13d
  2f:	31 ff                	xor    %edi,%edi
  31:	4c 89 ee             	mov    %r13,%rsi
  34:	e8 1f da 39 fb       	call   0xfb39da58
  39:	4d 85 ed             	test   %r13,%r13
  3c:	0f                   	.byte 0xf
  3d:	85                   	.byte 0x85
  3e:	90                   	nop
  3f:	04                   	.byte 0x4


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
