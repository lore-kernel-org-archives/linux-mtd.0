Return-Path: <SRS0=aChT=4M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED4AC3567B
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 06:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D5120661
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 06:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HCwnOOYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D5120661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=si+vvveAWo7YsgnqR2uMseQm+LROQMTsz/k2PNfRW8I=; b=HCw
	nOOYS1DoXP3d+GtCTk4ubOd6DZUOyH7ckQryybyuSnoB2KUr5q6Z036XID0khKHzytZ6FJXGUepGn
	jKBI3OOAUg19aTAe3levAZW9NFj0vf4ipgqoIXhCDxRBnS1T6wPnxMcbNI+TlrKSnueO5ntd0Q0BJ
	EnATClHqjsGuN4EMn029kF2EJVNWUfQLU3MmgrT5MUl2ceqAVfJIoqjcvBK7X9+v16Mi0rI0t83gj
	9Dbl6WIyEhOH4OsRE1V06/etb0aXEI07a3O2thG6JK9z3bFs4hTRBb6hZtq16d1CRcEsgLKEq27K0
	alX5H7i8Bn8yrIHZW07lnyHlB1ixFYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j67XN-0003zh-Ng; Mon, 24 Feb 2020 06:48:17 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j67XJ-0003xd-W4
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2020 06:48:16 +0000
Received: by mail-il1-f199.google.com with SMTP id d22so16653004ild.3
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2020 22:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=MUdLMp+7jhCngtINj4DxtoryosMj6GpMLy12KDW+6ys=;
 b=j28b3/SkaODNL0njl76SnxsyED2I/+h6nzS/oFz4Xs0zB1o97V37+9lvNdtmuWAGTH
 7xgIMq+s0uaxTqSuCsSBKbGgTiO87ycOuzwbCzEtkDFRsYshprGdYc3lTYI83j9c6a0k
 w4hY870knVHzEl5mthCqQEntzGnzyqDmNfEEomWVhvECjUxFwd6Bh87N/Wkh/SeOKfSt
 D36Z6xSy0+j7aUrKxq4LNB4yFc/AWqdADKTOSh76t8ECqFUUFIG8wRoCctKBFlOQUdPF
 F9JMgxSuHHdk3YqXahMOFp836OSZCVEg9Kjs1h6f21vGA4ft9F2Yum77Z3TAaqAPL3cX
 AbnA==
X-Gm-Message-State: APjAAAXArChrjEeYq2k/E2xcWnLY4mda7TwG3v+eCpLZEmU4TR4RoLWi
 8kDgtSdjvQyBWM3zStAh24HFzeYgbUKwgrKud1e6cIVBG8y8
X-Google-Smtp-Source: APXvYqzYSseNQdaDAlLE9ikCKGnjJwWatoeTxg0j70LIzW0DtRV5JaWDMbHtWNgqzpfNDbc0tNU2ii7mSfovCkhd7rqxKajglJh3
MIME-Version: 1.0
X-Received: by 2002:a05:6638:18c:: with SMTP id
 a12mr18036176jaq.105.1582526892260; 
 Sun, 23 Feb 2020 22:48:12 -0800 (PST)
Date: Sun, 23 Feb 2020 22:48:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000042c2b0059f4cc143@google.com>
Subject: INFO: task hung in ubi_detach_mtd_dev
From: syzbot <syzbot+853639d0cb16c31c7a14@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_224814_039973_E5F20E04 
X-CRM114-Status: UNSURE (   3.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

syzbot found the following crash on:

HEAD commit:    54dedb5b Merge tag 'for-linus-5.6-rc3-tag' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11d81c81e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b8906eb6a7d6028
dashboard link: https://syzkaller.appspot.com/bug?extid=853639d0cb16c31c7a14
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12037de9e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+853639d0cb16c31c7a14@syzkaller.appspotmail.com

INFO: task syz-executor.0:10515 blocked for more than 143 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.0  D28360 10515      1 0x00004004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_timeout+0x717/0xc50 kernel/time/timer.c:1871
 do_wait_for_common kernel/sched/completion.c:83 [inline]
 __wait_for_common kernel/sched/completion.c:104 [inline]
 wait_for_common kernel/sched/completion.c:115 [inline]
 wait_for_completion+0x29c/0x440 kernel/sched/completion.c:136
 kthread_stop+0x187/0x800 kernel/kthread.c:559
 ubi_detach_mtd_dev+0x219/0x43a drivers/mtd/ubi/build.c:1101
 ctrl_cdev_ioctl+0x1d6/0x2d0 drivers/mtd/ubi/cdev.c:1068
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007f8a63950c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f8a639516d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bf2c
INFO: task syz-executor.2:10517 blocked for more than 143 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.2  D28360 10517      1 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007f0e054ecc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f0e054ed6d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bf2c
INFO: task syz-executor.1:10526 blocked for more than 143 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.1  D28360 10526      1 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007efcab39fc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007efcab3a06d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bf2c
INFO: task syz-executor.5:10531 blocked for more than 144 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.5  D28360 10531      1 0x00004004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007f2004611c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f20046126d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bf2c
INFO: task syz-executor.5:10535 blocked for more than 144 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.5  D28360 10535      1 0x00004004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x22b/0x2d0 drivers/mtd/ubi/cdev.c:1042
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007f20045f0c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f20045f16d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040186f40 RDI: 0000000000000004
RBP: 000000000076bfc0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bfcc
INFO: task syz-executor.5:10542 blocked for more than 144 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.5  D28360 10542      1 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007f20045cfc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f20045d06d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076c060 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076c06c
INFO: task syz-executor.3:10537 blocked for more than 144 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.3  D28360 10537      1 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007fa602909c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa60290a6d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bf2c
INFO: task syz-executor.3:10540 blocked for more than 144 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.3  D28360 10540      1 0x00004004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x22b/0x2d0 drivers/mtd/ubi/cdev.c:1042
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007fa6028e8c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa6028e96d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040186f40 RDI: 0000000000000004
RBP: 000000000076bfc0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bfcc
INFO: task syz-executor.3:10544 blocked for more than 145 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.3  D28360 10544      1 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007fa6028c7c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa6028c86d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076c060 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076c06c
INFO: task syz-executor.4:10538 blocked for more than 145 seconds.
      Not tainted 5.6.0-rc2-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D28360 10538      1 0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3380 [inline]
 __schedule+0x934/0x1f90 kernel/sched/core.c:4080
 schedule+0xdc/0x2b0 kernel/sched/core.c:4154
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4213
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x7ab/0x13c0 kernel/locking/mutex.c:1103
 mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
 ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:770
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45c429
Code: Bad RIP value.
RSP: 002b:00007f9d3b12ac78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f9d3b12b6d4 RCX: 000000000045c429
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 000000000076bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000207 R14: 00000000004c3e69 R15: 000000000076bf2c

Showing all locks held in the system:
1 lock held by khungtaskd/1106:
 #0: ffffffff89bac240 (rcu_read_lock){....}, at: debug_show_all_locks+0x5f/0x279 kernel/locking/lockdep.c:5333
1 lock held by rsyslogd/9451:
 #0: ffff88808bc82e20 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xee/0x110 fs/file.c:821
2 locks held by getty/9541:
 #0: ffff8880a00c1090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
 #1: ffffc900058532e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
2 locks held by getty/9542:
 #0: ffff88809f997090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
 #1: ffffc9000589b2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
2 locks held by getty/9543:
 #0: ffff8880a962c090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
 #1: ffffc900058432e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
2 locks held by getty/9544:
 #0: ffff8880a30bc090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
 #1: ffffc9000587c2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
2 locks held by getty/9545:
 #0: ffff88809fa28090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
 #1: ffffc900058672e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
2 locks held by getty/9546:
 #0: ffff888099536090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
 #1: ffffc900058ab2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
2 locks held by getty/9547:
 #0: ffff8880a039e090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
 #1: ffffc900058132e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
1 lock held by syz-executor.0/10515:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.2/10517:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.1/10526:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.5/10531:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.5/10535:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x22b/0x2d0 drivers/mtd/ubi/cdev.c:1042
1 lock held by syz-executor.5/10542:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.3/10537:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.3/10540:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x22b/0x2d0 drivers/mtd/ubi/cdev.c:1042
1 lock held by syz-executor.3/10544:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.4/10538:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067
1 lock held by syz-executor.4/10541:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x22b/0x2d0 drivers/mtd/ubi/cdev.c:1042
1 lock held by syz-executor.4/10546:
 #0: ffffffff8a330480 (ubi_devices_mutex){+.+.}, at: ctrl_cdev_ioctl+0x1cd/0x2d0 drivers/mtd/ubi/cdev.c:1067

=============================================

NMI backtrace for cpu 0
CPU: 0 PID: 1106 Comm: khungtaskd Not tainted 5.6.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 nmi_cpu_backtrace.cold+0x70/0xb2 lib/nmi_backtrace.c:101
 nmi_trigger_cpumask_backtrace+0x23b/0x28b lib/nmi_backtrace.c:62
 arch_trigger_cpumask_backtrace+0x14/0x20 arch/x86/kernel/apic/hw_nmi.c:38
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:205 [inline]
 watchdog+0xb11/0x10c0 kernel/hung_task.c:289
 kthread+0x361/0x430 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1 skipped: idling at native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:60


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
