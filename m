Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036D8C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 16:49:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 865006108F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 16:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 865006108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ykFd9Dqno1bMqkghxFL8hwN1Lxq7vCEjifY79nXZums=; b=mE5
	Ux7k0mv5IlAjexwOhXvR3M1wolunktu2joci1FGaXWVmXnF/3GqRwbw6VtZld9hCO1vPwIpPC7Mgh
	bF70ZTxl7YBmcXjhVZ0M4bxim5qoomw1T44WG2mfx1B8o2u2GsjyNWjtb65GGdrZhYh48JWCFL3SJ
	oOk2syCmYyIOtjxOPUkObEgDelbdgSUEUX4KjSLFu6NAIMjscepHf1E7b04YgXv61f9eaCfSUgKir
	x1892Uf1GjFBQPdAD3t3gZcthtG9YiFeghQm5NOps6nFFGDhxGeBh/NGgB5csXt0JbsrRsUzRRBej
	4OVPA9052Bo0TznjzvYGHA1DQKPF/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH7gw-00Bfft-HN; Fri, 20 Aug 2021 16:48:26 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH7gp-00Bfe2-HZ
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 16:48:23 +0000
Received: by mail-io1-f71.google.com with SMTP id
 g5-20020a05660203c5b02905867ea91fc6so5766971iov.5
 for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2021 09:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=AoS2KwbRcXQ9NIRs5h6PWGGfZ4zUglRtWNysjlETQXI=;
 b=PMpufp/8W3xmUPzY1Pjnxn9yJS+FoqhHmb5YDpJnWX3TbdK6HA+X5fQzjuTie7Rsqp
 18CSlEeyv/CSshYAqw8DBncp08hIwASe5S3cK1Q/fjCYRiVMOKbHZwMw3CNvKunA3mGz
 1C/ENj7irAKAfMCwDPqsA/v9D7L/C/DpX+WmKO9gODM0Bh18pHwBjyukpE3IW9etOz98
 yHnpKK8uC336Qs7X1Tp+oHne0hMM51hBEUH7cZcp18LrfUbuHPdVvuNF+95xxDQNijMS
 E+uiJCYQy5ds1mNXrrqNrrrujhqQ+mfejXM+Y1j4FCGew7Hd+gwRBoyJ52e4oTHM/xH/
 iHYg==
X-Gm-Message-State: AOAM533bnKLnPaDetzlYt2bRj5x0yCeua9jSrU0GvOuiQpEX/0SK3ZRi
 kpnJh/NNKVUBXxCtjy/VJ7v/xHSHnmZSOrgk/tzim1rOsIr9
X-Google-Smtp-Source: ABdhPJzEtNk55tbXRjWwSm6Lfcvd34tDCs4MDOsN0KScq45BVMEL9dvKawSfY6vOnEESgF1co11tA3E2x2sdwHYqiIridIfq38zo
MIME-Version: 1.0
X-Received: by 2002:a02:a409:: with SMTP id c9mr18214386jal.138.1629478097608; 
 Fri, 20 Aug 2021 09:48:17 -0700 (PDT)
Date: Fri, 20 Aug 2021 09:48:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002d66c805ca006f38@google.com>
Subject: [syzbot] linux-next boot error: possible deadlock in blktrans_open
From: syzbot <syzbot+a44be5792ded9c017a13@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-next@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
 sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_094819_631496_926A38A1 
X-CRM114-Status: UNSURE (   6.79  )
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

HEAD commit:    86ed57fd8c93 Add linux-next specific files for 20210820
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1776d189300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f64eccb415bd479d
dashboard link: https://syzkaller.appspot.com/bug?extid=a44be5792ded9c017a13
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a44be5792ded9c017a13@syzkaller.appspotmail.com


======================================================
WARNING: possible circular locking dependency detected
5.14.0-rc6-next-20210820-syzkaller #0 Not tainted
------------------------------------------------------
systemd-udevd/4540 is trying to acquire lock:
ffffffff8c5df508 (mtd_table_mutex){+.+.}-{3:3}, at: blktrans_open+0x69/0x600 drivers/mtd/mtd_blkdevs.c:210

but task is already holding lock:
ffff88801d051918 (&disk->open_mutex){+.+.}-{3:3}, at: blkdev_get_by_dev.part.0+0x9b/0xb60 fs/block_dev.c:1227

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&disk->open_mutex){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:596 [inline]
       __mutex_lock+0x135/0x12f0 kernel/locking/mutex.c:729
       bd_register_pending_holders+0x2c/0x470 block/holder.c:153
       register_disk block/genhd.c:456 [inline]
       device_add_disk+0x376/0xcf0 block/genhd.c:551
       add_mtd_blktrans_dev+0xdd1/0x1610 drivers/mtd/mtd_blkdevs.c:430
       mtdblock_add_mtd+0x20f/0x2c0 drivers/mtd/mtdblock.c:329
       blktrans_notify_add drivers/mtd/mtd_blkdevs.c:510 [inline]
       blktrans_notify_add+0x7a/0xc0 drivers/mtd/mtd_blkdevs.c:502
       add_mtd_device+0xa8e/0x1170 drivers/mtd/mtdcore.c:690
       mtd_device_parse_register+0x510/0x870 drivers/mtd/mtdcore.c:979
       mtdram_init_device+0x295/0x350 drivers/mtd/devices/mtdram.c:146
       init_mtdram+0xe5/0x177 drivers/mtd/devices/mtdram.c:171
       do_one_initcall+0x103/0x650 init/main.c:1292
       do_initcall_level init/main.c:1367 [inline]
       do_initcalls init/main.c:1383 [inline]
       do_basic_setup init/main.c:1402 [inline]
       kernel_init_freeable+0x6b4/0x73d init/main.c:1604
       kernel_init+0x1a/0x1d0 init/main.c:1496
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

-> #0 (mtd_table_mutex){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3051 [inline]
       check_prevs_add kernel/locking/lockdep.c:3174 [inline]
       validate_chain kernel/locking/lockdep.c:3789 [inline]
       __lock_acquire+0x2a25/0x54e0 kernel/locking/lockdep.c:5015
       lock_acquire kernel/locking/lockdep.c:5625 [inline]
       lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
       __mutex_lock_common kernel/locking/mutex.c:596 [inline]
       __mutex_lock+0x135/0x12f0 kernel/locking/mutex.c:729
       blktrans_open+0x69/0x600 drivers/mtd/mtd_blkdevs.c:210
       blkdev_get_whole+0x9d/0x2b0 fs/block_dev.c:1079
       blkdev_get_by_dev.part.0+0x354/0xb60 fs/block_dev.c:1234
       blkdev_get_by_dev fs/block_dev.c:1323 [inline]
       blkdev_open+0x295/0x300 fs/block_dev.c:1329
       do_dentry_open+0x4c8/0x11d0 fs/open.c:826
       do_open fs/namei.c:3428 [inline]
       path_openat+0x1cbe/0x28b0 fs/namei.c:3561
       do_filp_open+0x1aa/0x400 fs/namei.c:3588
       do_sys_openat2+0x16d/0x4e0 fs/open.c:1204
       do_sys_open fs/open.c:1220 [inline]
       __do_sys_open fs/open.c:1228 [inline]
       __se_sys_open fs/open.c:1224 [inline]
       __x64_sys_open+0x119/0x1c0 fs/open.c:1224
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&disk->open_mutex);
                               lock(mtd_table_mutex);
                               lock(&disk->open_mutex);
  lock(mtd_table_mutex);

 *** DEADLOCK ***

1 lock held by systemd-udevd/4540:
 #0: ffff88801d051918 (&disk->open_mutex){+.+.}-{3:3}, at: blkdev_get_by_dev.part.0+0x9b/0xb60 fs/block_dev.c:1227

stack backtrace:
CPU: 0 PID: 4540 Comm: systemd-udevd Not tainted 5.14.0-rc6-next-20210820-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 check_noncircular+0x262/0x2f0 kernel/locking/lockdep.c:2131
 check_prev_add kernel/locking/lockdep.c:3051 [inline]
 check_prevs_add kernel/locking/lockdep.c:3174 [inline]
 validate_chain kernel/locking/lockdep.c:3789 [inline]
 __lock_acquire+0x2a25/0x54e0 kernel/locking/lockdep.c:5015
 lock_acquire kernel/locking/lockdep.c:5625 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
 __mutex_lock_common kernel/locking/mutex.c:596 [inline]
 __mutex_lock+0x135/0x12f0 kernel/locking/mutex.c:729
 blktrans_open+0x69/0x600 drivers/mtd/mtd_blkdevs.c:210
 blkdev_get_whole+0x9d/0x2b0 fs/block_dev.c:1079
 blkdev_get_by_dev.part.0+0x354/0xb60 fs/block_dev.c:1234
 blkdev_get_by_dev fs/block_dev.c:1323 [inline]
 blkdev_open+0x295/0x300 fs/block_dev.c:1329
 do_dentry_open+0x4c8/0x11d0 fs/open.c:826
 do_open fs/namei.c:3428 [inline]
 path_openat+0x1cbe/0x28b0 fs/namei.c:3561
 do_filp_open+0x1aa/0x400 fs/namei.c:3588
 do_sys_openat2+0x16d/0x4e0 fs/open.c:1204
 do_sys_open fs/open.c:1220 [inline]
 __do_sys_open fs/open.c:1228 [inline]
 __se_sys_open fs/open.c:1224 [inline]
 __x64_sys_open+0x119/0x1c0 fs/open.c:1224
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7faf61bb2840
Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 89 bb 20 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24
RSP: 002b:00007ffffbf04508 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 000055c752d73830 RCX: 00007faf61bb2840
RDX: 000055c751371fe3 RSI: 00000000000a0800 RDI: 000055c752d64f90
RBP: 00007ffffbf04680 R08: 000055c751371670 R09: 0000000000000020
R10: 000055c751371d0c R11: 0000000000000246 R12: 00007ffffbf045d0
R13: 000055c752d65880 R14: 0000000000000003 R15: 000000000000000e


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
