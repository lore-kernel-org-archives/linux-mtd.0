Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C59C5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3iJkrpYZ2EpW/EJraZAIGwepZeUkNhpRE7h6WmxbIyU=; b=Hp3B8Spo9wEsil
	AtwpyFCb6RHdXNruPErQ+nqwae6PSHgEphviBQhoK6ZW2XlrhTUGwx7J31qKq2U8iH9IetdQH77ex
	g1JSC9ny7ydcbU/f8hIoFXzRbVcv7TqoxX2cpyPUDxxXGPU9MolNVtiwwdSdOP5PWY4oMJoB+Rl4p
	ZqIEjP6h4jaXouIpSY1PU8WPxKwCkGSsC9Sov3tNzxEVXR1R8zFmFY9C1ihMiWmh0tqeZhEbuXi39
	y5NwMvKOrvFZ7jPqzQBk4LujoCLXwkjzartWUr12JW4mxj9uTeEkWwijNKvpNMMfTR9lKaGFvp3nW
	P/3rDTq4apQqUGpIB5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtq4l-0000000EcOV-0spe;
	Tue, 11 Aug 2026 17:15:43 +0000
Received: from mail-oa1-f70.google.com ([209.85.160.70])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtq4h-0000000EcNm-45AV
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 17:15:41 +0000
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-456bbfa4cb3so3559738fac.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 10:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468538; x=1787073338;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AXfLTBt3QiphfYH21Xgm1enb28mlAdxrrXg76S/tXaY=;
        b=VlwRr1bFIgylz7lZC42DZmi9uWNxhplWKIcBV6s+I5XB1Mcf/71u8jF1pP8BIb+5rE
         9GuCRhwK/PPVPy0rwLSsbEJUn9qt9pHK0WYI3nj8GvdbUSSk2gNPU6Sy7bzPLdEPFFRj
         IeGESh/+Cgy2YbsyFT+huHJ+ohwc2zzaJRGmD33zCrSTKD3691uuNX7mL0NaJ9VenDnW
         VQIu9dApJ0XJvw/KPP5UqiH24qCNkw/8cAptrHJUNe8oTyKhz7rEBgFtkt6K+WzU4Gbs
         lErTlrtmxevFT5ZWL/EdbnyWJBvfstJs5e94Bk51Ywwmsb1cP9E+1nVXPGVuL8nUTlzn
         myJA==
X-Forwarded-Encrypted: i=1; AHgh+RrPXYbkpRPwMdkGRe5kyaiSrmqcFjK4r8yZMok/P2lDdVw7yiUP3eRr6rGUEOxmMzgMsDqB/8Hxw2I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu01uLuYFTRbfaKLYVSofFvN6Es0th4XsL1wFr+sCdVdbstVx5
	XnE1M1ZPxYTgrhkASJ4Sgloc5uojl8Ywk/VomY4ULGlh1aI40NK+ZEedt3WR/PSTdTltz2nGgV5
	+Xn2Xhpbw9fUqLmX+Ez+Wt7lFheRgJDVd0Ns7xFH9kSnCFe1OoTaupbazisg=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1aa:b0:4a3:ec8e:2052 with SMTP id
 5614622812f47-4b1fd67318bmr3873936b6e.8.1786468538231; Tue, 11 Aug 2026
 10:15:38 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:15:38 -0700
In-Reply-To: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7b58ba.ac361c09.22ff0a.0045.GAE@google.com>
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
From: syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>
To: fabf@skynet.be, joern@barelysecure.org, joern@lazybastard.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com, xiaopei01@kylinos.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_101540_023884_A85E2802 
X-CRM114-Status: UNSURE (   7.58  )
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    f5bbbfec59b4 Merge tag 'probes-fixes-v7.2-rc7' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a31079580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=b320a4d5f65a61dbbf89
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b76149580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com

Oops: divide error: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 6029 Comm: syz-executor518 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:add_device drivers/mtd/devices/block2mtd.c:296 [inline]
RIP: 0010:block2mtd_setup2.isra.0+0x3c8/0xc70 drivers/mtd/devices/block2mtd.c:459
Code: 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 2b 08 00 00 48 8b 6d 08 31 ff 48 89 e8 48 c1 e0 09 48 99 <49> f7 ff 48 89 d6 48 89 54 24 10 e8 98 d5 4d fb 48 8b 54 24 10 48
RSP: 0018:ffffc90004ccf9f0 EFLAGS: 00010206
RAX: 0000000000100000 RBX: 1ffff92000999f41 RCX: ffffffff86bc9838
RDX: 0000000000000000 RSI: ffffffff86bc984a RDI: 0000000000000000
RBP: 0000000000000800 R08: 0000000000000005 R09: 000000000000001f
R10: 0000000000000007 R11: 0000000000000000 R12: ffffc90004ccfaa8
R13: 0000000000000000 R14: ffff8880254fe000 R15: 0000000000000000
FS:  000055558148e400(0000) GS:ffff8880d5dec000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055a8208cda78 CR3: 000000003ad58000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 block2mtd_setup+0xbd/0xd0 drivers/mtd/devices/block2mtd.c:476
 param_attr_store+0x199/0x300 kernel/params.c:589
 module_attr_store+0x58/0x80 kernel/params.c:904
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0b39a14737
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffdcc22a9a0 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000055558148e400 RCX: 00007f0b39a14737
RDX: 000000000000000c RSI: 00007ffdcc22aa50 RDI: 0000000000000004
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffdcc22aa50
R13: 00007ffdcc22aa10 R14: 00007ffdcc22a9f0 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:add_device drivers/mtd/devices/block2mtd.c:296 [inline]
RIP: 0010:block2mtd_setup2.isra.0+0x3c8/0xc70 drivers/mtd/devices/block2mtd.c:459
Code: 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 2b 08 00 00 48 8b 6d 08 31 ff 48 89 e8 48 c1 e0 09 48 99 <49> f7 ff 48 89 d6 48 89 54 24 10 e8 98 d5 4d fb 48 8b 54 24 10 48
RSP: 0018:ffffc90004ccf9f0 EFLAGS: 00010206
RAX: 0000000000100000 RBX: 1ffff92000999f41 RCX: ffffffff86bc9838
RDX: 0000000000000000 RSI: ffffffff86bc984a RDI: 0000000000000000
RBP: 0000000000000800 R08: 0000000000000005 R09: 000000000000001f
R10: 0000000000000007 R11: 0000000000000000 R12: ffffc90004ccfaa8
R13: 0000000000000000 R14: ffff8880254fe000 R15: 0000000000000000
FS:  000055558148e400(0000) GS:ffff8880d5dec000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055a8208cda78 CR3: 000000003ad58000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   7:	fc ff df
   a:	48 89 fa             	mov    %rdi,%rdx
   d:	48 c1 ea 03          	shr    $0x3,%rdx
  11:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  15:	0f 85 2b 08 00 00    	jne    0x846
  1b:	48 8b 6d 08          	mov    0x8(%rbp),%rbp
  1f:	31 ff                	xor    %edi,%edi
  21:	48 89 e8             	mov    %rbp,%rax
  24:	48 c1 e0 09          	shl    $0x9,%rax
  28:	48 99                	cqto
* 2a:	49 f7 ff             	idiv   %r15 <-- trapping instruction
  2d:	48 89 d6             	mov    %rdx,%rsi
  30:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  35:	e8 98 d5 4d fb       	call   0xfb4dd5d2
  3a:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  3f:	48                   	rex.W


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
