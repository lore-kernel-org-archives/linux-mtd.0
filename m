Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA27ECD98E4
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pKojG3p0x1f0lNpXx+5vf3zURKz6/Yf6xqCdBBgg/mo=; b=qzfaXJv7v83l7o
	/TjD4i6LrjarS5PxlzrAdx/e01PHemlziwiq44EJnHN3UmaZgHCh9z6/j1w/uwECc9tS7O4je3I0p
	gzvDNCnxX7bqsLFWyQQmGD45W/WPMvBLoAAMJbpcwC2QEF7U+aAoYb48fRE+Mq4wJ0VdPPouwj9L2
	gBMYrfCm9t68c4wwNsJ1AjH6A2UnQ8Ax57HKdWRSvuvKeHkeiTJPceJ76wCnWt1sHR+0+dhRWKfTr
	HPe633EWcCsInseFBndCBmVVHmy0AsVI5P9+F6EnQaEa3kFCKR9zQ5jOVjnu+6nUlYMYa4nnnoQof
	iqXpvJh64pnyO7kGJICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waril-00000003ISH-0XE4;
	Sat, 20 Jun 2026 09:10:35 +0000
Received: from mail-oi1-f205.google.com ([209.85.167.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warif-00000003IRo-3TlD
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jun 2026 09:10:31 +0000
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-486cc29e03bso5052216b6e.3
        for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2026 02:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781946626; x=1782551426;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWD82BroOsIi4rrdyj/OhVieWHdSGpaVqYRWOkPTcyg=;
        b=IB/1SeiVnbArFNlzhHY0dBehoOfmbjRViyMrS5CZXGfKYcEc+P2y6Z4yLi0xMNruc0
         lva7pUPRl+M5jUItoFFG4+/ZjIFBrqR4Gv0wO0aXFChHp7uYF2M+DbEFZNMhN3wR+HqJ
         EfVoBNPkhkoVhrhL/mWMF1ZiKc8G0/xTOGuxW8aUyIoM8ll2HMb5TUNF851iGLq8zg5S
         jTgD1VCdoxtE61j6DUDd9HI3o81MkS7QcEtB6jL9UOKw99UFeP9kC9xyYKRhQuAJVt+E
         OH+kjhCu/eijZUQlsJPfQryFMYOLGd0AOb0xC7ersbkdqqLwQd5AK1c+rI8UqtUEvHXH
         xbAg==
X-Forwarded-Encrypted: i=1; AFNElJ/7Rxe2HF3+FOPPOzupnf0O3q4R3OJEtTPEcR+lld0kMmpZbbtPEndn2Rhyj+Ubjt+1kxyFfEkWsfs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/XdSN9bz0gC2/YbrxmQRqZZpE8wQaRT5eDW9juVsq+25Bwelx
	J2CxLH5p0pmBj2jvHJdl4MRCrQw0wTS3kuR8jplko1R2MeRPbOMpzx9Pn965tqKy/Jn9KyS30xR
	2rovoxyzdmOMaudWXS/71QXxIm1dvU8/nSsJAuvul5+pQPyB1Fq7C4SiUy/8=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2be:b0:485:7c3d:3829 with SMTP id
 5614622812f47-4896aa79fd2mr5672453b6e.13.1781946625734; Sat, 20 Jun 2026
 02:10:25 -0700 (PDT)
Date: Sat, 20 Jun 2026 02:10:25 -0700
In-Reply-To: <6a364dbc.713c5d62.148f7.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a365901.24bbd9d5.2022ac.0001.GAE@google.com>
Subject: Re: [syzbot] [mtd?] WARNING in add_mtd_device
From: syzbot <syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_021029_917007_2B9A2383 
X-CRM114-Status: UNSURE (   5.13  )
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

HEAD commit:    a975094bf98c Merge tag 'exfat-for-7.2-rc1' of git://git.ke..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=146d82fe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c66dc15e483c558
dashboard link: https://syzkaller.appspot.com/bug?extid=3ae80219c633aca5431c
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d3dd56580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a9050e580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-a975094b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/56fd6dc1b679/vmlinux-a975094b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b1422518a402/Image-a975094b.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com

mtd partition "" doesn't have enough space: 0x8000003 < 0x8000084bb, disabled
------------[ cut here ]------------
WARNING: drivers/mtd/mtdcore.c:719 at add_mtd_device+0x56c/0x14cc drivers/mtd/mtdcore.c:719, CPU#0: syz.2.17/3665
Modules linked in:
CPU: 0 UID: 0 PID: 3665 Comm: syz.2.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 10000005 (nzcV daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : add_mtd_device+0x56c/0x14cc drivers/mtd/mtdcore.c:719
lr : mtd_add_partition+0x218/0x48c drivers/mtd/mtdpart.c:280
sp : ffff8000a2c276f0
x29: ffff8000a2c277b0 x28: ffff0000158a8000 x27: ffff00001ef34004
x26: 1fffe00003de683f x25: ffff00001ef34014 x24: 0000000000000004
x23: ffff00001ef34000 x22: 1ffff00014584f02 x21: 0000000000000000
x20: ffff00001ef341a0 x19: 0000000000000c00 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: ffff80008764b708
x14: 1ffff00010ec96e1 x13: 0000000000000004 x12: ffff700014584ee9
x11: 1ffff00014584ee8 x10: ffff700014584ee8 x9 : dfff800000000000
x8 : ffff8000a2c27747 x7 : 1ffff00014584eea x6 : 0000000041b58ab3
x5 : ffff700014584eea x4 : ffff8000a2c27750 x3 : 1fffe00003de6800
x2 : 0000000000000000 x1 : 0000000000000007 x0 : 0000000000000000
Call trace:
 add_mtd_device+0x56c/0x14cc drivers/mtd/mtdcore.c:719 (P)
 mtd_add_partition+0x218/0x48c drivers/mtd/mtdpart.c:280
 mtdchar_blkpg_ioctl+0x17c/0x1b8 drivers/mtd/mtdchar.c:562
 mtdchar_ioctl+0x2f8/0x1ed8 drivers/mtd/mtdchar.c:1218
 mtdchar_unlocked_ioctl+0xa0/0xfc drivers/mtd/mtdchar.c:1241
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __arm64_sys_ioctl+0x124/0x1a4 fs/ioctl.c:583
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x74/0x240 arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0xac/0x230 arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x40/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x58/0x2a4 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<ffff800080215cc8>] copy_process+0x16a8/0x5700 kernel/fork.c:2232
softirqs last  enabled at (0): [<ffff800080215ce8>] copy_process+0x16c8/0x5700 kernel/fork.c:2233
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
