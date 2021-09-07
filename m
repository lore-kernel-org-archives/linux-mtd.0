Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF57C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 22:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7ADA61101
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 22:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7ADA61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8dDBh6JWObOf95D9ohWgck3B4F6luHraIZdIJgDp2xw=; b=poQ
	ngwI2+TUima4ALeZ3HmCNqU6XEgPtzDGljtPz1E0dHadn22sMI9ZwMBCCnpP7pKg4hf82aSMG8PP1
	93NWhmQCRTd/G2py8k8ikRbgTddz4Kbhu46dgWVLCfzrwYq9W+Ox5JvRT0x1NHUHhSPUHE/Qh9tv8
	aCDh+uIhzi445SjfowPg0/c2UfAhJwqok2OPVscyNfNj1MXaWsjrBxY6MSEUFTPjPHIdkL87HU+dI
	BdXL6onOTY0p7KdYipMfWFcSIW4hxlFrDnn4DBf0PzXlqRNMl+d/OW8cFRJGTp0LddZkxdIqinq+K
	T0jMMLL1VyKkg6Y94b7eUlyRmLBctbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNjpO-004yIT-SX; Tue, 07 Sep 2021 22:44:30 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNjpL-004yHl-In
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 22:44:29 +0000
Received: by mail-il1-f197.google.com with SMTP id
 r6-20020a92c506000000b002246015b2a4so157388ilg.21
 for <linux-mtd@lists.infradead.org>; Tue, 07 Sep 2021 15:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=2RrC34cTaNsUtCpEbC+ymqF0FjuPLB8f0hQoaI7rRcw=;
 b=IzRI+J38YOyDLXPfF6JRSmaKs24p+lMMeh1eWl5gjgrf8VACoomXLGjOO3RwBqSYVW
 1hHBmt+R605OV9B9F9vQXLzr93EvCZTEgV9RNk10x2LKItoxYTy/RHR6F+amWqLnRoEz
 Ip87f2i+dQf4dnlFg01Difd2TeZwPO4I3mSwPlnH8n/DAQMul4dQymlWvV414JmhXRcY
 9o5PGWSV1DSIkpdoxsqt2Qiy4jh+R9zf2bE+UhctjxXTG8pQEnNVCyMHS2NborBzw9Ho
 wMFVk5OIshn+pASEIsUXqAWtJvhwqsNDhElq2sciu1OmliLWt4DSEqEn83zFYm6Kg5yz
 VO5w==
X-Gm-Message-State: AOAM530kJUwd0JeLWQpJ0tLXb83jHEbojCnvUMf5wDsXf+Ofp9IhGEpr
 GBI3vN6uWO38XVfysWq1vCOxUVCdBEc+OHxqBMUXKvi6yMPi
X-Google-Smtp-Source: ABdhPJybYAzEpUyxBUYCR5nO/5OUMhzS+LqO0UwpcP3OMHvQl6tcH2crKgtPlPTgKTj4qIm/oPW8uqIesJAZIYy1vDSA0gOb2xww
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1250:: with SMTP id
 j16mr409643ilq.215.1631054665227; 
 Tue, 07 Sep 2021 15:44:25 -0700 (PDT)
Date: Tue, 07 Sep 2021 15:44:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ee215105cb6f8117@google.com>
Subject: [syzbot] upstream boot error: possible deadlock in blktrans_open
From: syzbot <syzbot+f676029927929bee165f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_154427_677620_B14AD140 
X-CRM114-Status: UNSURE (   7.64  )
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

HEAD commit:    7cca308cfdc0 Merge tag 'powerpc-5.15-1' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10235915300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8aa56a640db99eb1
dashboard link: https://syzkaller.appspot.com/bug?extid=f676029927929bee165f
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f676029927929bee165f@syzkaller.appspotmail.com


======================================================
WARNING: possible circular locking dependency detected
5.14.0-syzkaller #0 Not tainted
------------------------------------------------------
systemd-udevd/6382 is trying to acquire lock:
ffffffff8c5db488 (mtd_table_mutex){+.+.}-{3:3}, at: blktrans_open+0x69/0x600 drivers/mtd/mtd_blkdevs.c:210

but task is already holding lock:
ffff888020ba7118 (&disk->open_mutex){+.+.}-{3:3}, at: blkdev_get_by_dev.part.0+0x9b/0xb60 fs/block_dev.c:1227

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&disk->open_mutex){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:596 [inline]
       __mutex_lock+0x131/0x12f0 kernel/locking/mutex.c:729
       bd_register_pending_holders+0x2c/0x470 block/holder.c:160
       device_add_disk+0x74c/0xfc0 block/genhd.c:470
       add_mtd_blktrans_dev+0xdae/0x15f0 drivers/mtd/mtd_blkdevs.c:430
       mtdblock_add_mtd+0x1c9/0x260 drivers/mtd/mtdblock.c:325
       blktrans_notify_add drivers/mtd/mtd_blkdevs.c:510 [inline]
       blktrans_notify_add+0x7a/0xc0 drivers/mtd/mtd_blkdevs.c:502
       add_mtd_device+0xa8e/0x1170 drivers/mtd/mtdcore.c:690
       mtd_device_parse_register+0x50c/0x860 drivers/mtd/mtdcore.c:979
       mtdram_init_device+0x291/0x350 drivers/mtd/devices/mtdram.c:146
       init_mtdram+0xe5/0x177 drivers/mtd/devices/mtdram.c:171
       do_one_initcall+0x103/0x650 init/main.c:1287
       do_initcall_level init/main.c:1360 [inline]
       do_initcalls init/main.c:1376 [inline]
       do_basic_setup init/main.c:1396 [inline]
       kernel_init_freeable+0x6b8/0x741 init/main.c:1598
       kernel_init+0x1a/0x1d0 init/main.c:1490
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

-> #0 (mtd_table_mutex){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3051 [inline]
       check_prevs_add kernel/locking/lockdep.c:3174 [inline]
       validate_chain kernel/locking/lockdep.c:3789 [inline]
       __lock_acquire+0x2a07/0x54a0 kernel/locking/lockdep.c:5015
       lock_acquire kernel/locking/lockdep.c:5625 [inline]
       lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
       __mutex_lock_common kernel/locking/mutex.c:596 [inline]
       __mutex_lock+0x131/0x12f0 kernel/locking/mutex.c:729
       blktrans_open+0x69/0x600 drivers/mtd/mtd_blkdevs.c:210
       blkdev_get_whole+0x99/0x2a0 fs/block_dev.c:1079
       blkdev_get_by_dev.part.0+0x354/0xb60 fs/block_dev.c:1234
       blkdev_get_by_dev fs/block_dev.c:1323 [inline]
       blkdev_open+0x295/0x300 fs/block_dev.c:1329
       do_dentry_open+0x4c8/0x11d0 fs/open.c:822
       do_open fs/namei.c:3426 [inline]
       path_openat+0x1c9a/0x2740 fs/namei.c:3559
       do_filp_open+0x1aa/0x400 fs/namei.c:3586
       do_sys_openat2+0x16d/0x4d0 fs/open.c:1200
       do_sys_open fs/open.c:1216 [inline]
       __do_sys_open fs/open.c:1224 [inline]
       __se_sys_open fs/open.c:1220 [inline]
       __x64_sys_open+0x119/0x1c0 fs/open.c:1220
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
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

1 lock held by systemd-udevd/6382:
 #0: ffff888020ba7118 (&disk->open_mutex){+.+.}-{3:3}, at: blkdev_get_by_dev.part.0+0x9b/0xb60 fs/block_dev.c:1227

stack backtrace:
CPU: 0 PID: 6382 Comm: systemd-udevd Not tainted 5.14.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:105
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2131
 check_prev_add kernel/locking/lockdep.c:3051 [inline]
 check_prevs_add kernel/locking/lockdep.c:3174 [inline]
 validate_chain kernel/locking/lockdep.c:3789 [inline]
 __lock_acquire+0x2a07/0x54a0 kernel/locking/lockdep.c:5015
 lock_acquire kernel/locking/lockdep.c:5625 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
 __mutex_lock_common kernel/locking/mutex.c:596 [inline]
 __mutex_lock+0x131/0x12f0 kernel/locking/mutex.c:729
 blktrans_open+0x69/0x600 drivers/mtd/mtd_blkdevs.c:210
 blkdev_get_whole+0x99/0x2a0 fs/block_dev.c:1079
 blkdev_get_by_dev.part.0+0x354/0xb60 fs/block_dev.c:1234
 blkdev_get_by_dev fs/block_dev.c:1323 [inline]
 blkdev_open+0x295/0x300 fs/block_dev.c:1329
 do_dentry_open+0x4c8/0x11d0 fs/open.c:822
 do_open fs/namei.c:3426 [inline]
 path_openat+0x1c9a/0x2740 fs/namei.c:3559
 do_filp_open+0x1aa/0x400 fs/namei.c:3586
 do_sys_openat2+0x16d/0x4d0 fs/open.c:1200
 do_sys_open fs/open.c:1216 [inline]
 __do_sys_open fs/open.c:1224 [inline]
 __se_sys_open fs/open.c:1220 [inline]
 __x64_sys_open+0x119/0x1c0 fs/open.c:1220
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fc8603b3840
Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 89 bb 20 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24
RSP: 002b:00007ffe4d0d43b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 000055da6177ec20 RCX: 00007fc8603b3840
RDX: 000055da60055fe3 RSI: 00000000000a0800 RDI: 000055da61793030
RBP: 00007ffe4d0d4530 R08: 000055da60055670 R09: 0000000000000020
R10: 000055da60055d0c R11: 0000000000000246 R12: 00007ffe4d0d4480
R13: 000055da6178f3f0 R14: 0000000000000003 R15: 000000000000000e


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
