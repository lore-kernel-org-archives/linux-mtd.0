Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A1CDB466
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jun 2026 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oyqihhLJoUd5HJV1S5rmETtfLbsd9fpp6W6HreZ9eog=; b=12g
	hnhfbVfeLKBYJDNRzG/4VwVTwx5+7E4O/V0PylL+9PWX2n5IPNbMPTWH+d+sNOPYH4jL/1frmtYkU
	gEMGQjAgdXbNiHEQlVOMnU0ALfM0sBbkAOVux95hVUQw83ufPvy7bMs1+1birl8oozD6rZYI5aFl2
	E+OtZVR4lD5YqDR4sBcHDjwltWeL/hdcolwigNjw6lrzV1Iuyt0D9x7/wnLapOj5OA8yn/lRD+w7F
	4CLCG8KAtj4KJemGh/1snJEy4Mh9uERxViBNmTayYWqZNHHN7hxNUYpI+nTVNgy5IkrHKBIMU6Q35
	XvvtAwwVnrI6juzSnv/nG0qkBip/iRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waqy8-00000003FB6-2arP;
	Sat, 20 Jun 2026 08:22:24 +0000
Received: from mail-ot1-f77.google.com ([209.85.210.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waqy6-00000003FAi-2bFu
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jun 2026 08:22:23 +0000
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7e6f905ea78so4513202a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2026 01:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781943740; x=1782548540;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iK7A0Rlt/6TDFKLm4tXtTVc9zLVvYi9wtPyCEYMULN0=;
        b=kE5U+yz07WXjJ5RnXcGwa8H4NT0RK+o68fidYJpjQAePktux4qEHaBl8p5dtCxh3IW
         GwcTj3s+8U+1zY2FehSMwbMd8trKA0XWEwk/UMusTyGFIwRP8vpSYsvMu9xJk/CTGv+C
         T7ZganZWD8ACrjWAJaGrv4PZDr/hhe7lLNGjvGWY+EuFyyskktFbU7yqaVn2ciE68F+C
         HgbP7MAcIVhQcd7KFleKkhAXq7ysZu0tvA3U5XCTINAesXvUjLRUX42M2sFytkuEHr/h
         DYkW9qsGTFdefl8YpRQ1euXIsbcXl4KLIZJo8lCPZvt0N/IPkEvl3qTsueA0fdW9HCZB
         9qGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LjnGhvHLSCpyfX48gj3kdtxTOfgmP8PLvCA9uZPpfacjeCen9zYCsqlDRyvOs3xfXXgj0YgKQ5mQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywou9BzStRqXHGGZYpUOawtAuaDtWRWQEAJ2fLDzBU4utq7bKRj
	dYgFL+cgg4eZPSpgdWNCWXKD0xyaJ6tJ3Lr+X13LKvbg53PY10WzfpRPzhitxIg6EUC4vekA5kS
	73dO14ufyIC/Cp6WdfHAu5y12YWXMomVGDSZvJzkl/A3x+2B4zgd6i+sVXCg=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:190d:b0:489:5df6:68ef with SMTP id
 5614622812f47-48ac136b184mr2085082b6e.40.1781943740594; Sat, 20 Jun 2026
 01:22:20 -0700 (PDT)
Date: Sat, 20 Jun 2026 01:22:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a364dbc.713c5d62.148f7.0000.GAE@google.com>
Subject: [syzbot] [mtd?] WARNING in add_mtd_device
From: syzbot <syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_012222_669305_EE22A991 
X-CRM114-Status: UNSURE (   5.86  )
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

HEAD commit:    a975094bf98c Merge tag 'exfat-for-7.2-rc1' of git://git.ke..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=16e3dd56580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c66dc15e483c558
dashboard link: https://syzkaller.appspot.com/bug?extid=3ae80219c633aca5431c
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-a975094b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/56fd6dc1b679/vmlinux-a975094b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b1422518a402/Image-a975094b.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com

mtd partition "" doesn't have enough space: 0x8000003 < 0x8000084bb, disabled
------------[ cut here ]------------
WARNING: drivers/mtd/mtdcore.c:719 at add_mtd_device+0x56c/0x14cc drivers/mtd/mtdcore.c:719, CPU#1: syz.0.5209/17410
Modules linked in:
CPU: 1 UID: 0 PID: 17410 Comm: syz.0.5209 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: linux,dummy-virt (DT)
pstate: 10000005 (nzcV daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : add_mtd_device+0x56c/0x14cc drivers/mtd/mtdcore.c:719
lr : mtd_add_partition+0x218/0x48c drivers/mtd/mtdpart.c:280
sp : ffff80008e3b76f0
x29: ffff80008e3b77b0 x28: ffff000015758000 x27: ffff00001783c004
x26: 1fffe00002f0783f x25: ffff00001783c014 x24: 0000000000000004
x23: ffff00001783c000 x22: 1ffff00011c76f02 x21: 0000000000000000
x20: ffff00001783c1a0 x19: 0000000000000c00 x18: 0000000000000000
x17: 3830303030387830 x16: 203c203330303030 x15: 30387830203a6563
x14: 617073206867756f x13: 0000000000000001 x12: ffff700011c76ee9
x11: 1ffff00011c76ee8 x10: ffff700011c76ee8 x9 : dfff800000000000
x8 : ffff80008e3b7747 x7 : 1ffff00011c76eea x6 : 0000000041b58ab3
x5 : ffff700011c76eea x4 : ffff80008e3b7750 x3 : 1fffe00002f07800
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
