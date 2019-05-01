Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16417C43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 14:36:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D60B020651
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 14:36:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbTJqacm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D60B020651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V7KWkI1kwmURiLBA0LrWEDurbSKHzbXzAwSIymSVOyo=; b=DbTJqacmLC65xR
	3IVcUCYFlz9cXmcln5Yynl3lZzcaIMddREZ3pod4ojOMMmE14+HsPOfzlchi9LRy0TuCplBP9LEym
	siLComURdTZlXFNbXcFpaXY2uwnfxzAwkmhvfjxwQNTgK4NK8DIATbLHWgqkK5EyXsiYsVAVrB3a7
	TCSBYNGs0OkLJooLR7u2yDRScufTaIDFO7ocJI8QtOCMYZn09uB72J9dOzhjKx2fkvgkE6j/W/Jfc
	OttiX67ifnwbROjzYcbk4H1MxaNJOhDE8YARsLSUjVfxk3+DlIrBY7AntC6gU5ajWX+i9jtDAOPVV
	hcCzdvYH9em8AVUWDz+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLqLC-000804-MT; Wed, 01 May 2019 14:36:10 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLqL9-0007zH-Oe
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 14:36:09 +0000
Received: by mail-io1-f71.google.com with SMTP id i84so13972578iof.13
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 07:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=9KnWVcLoBlD7VDt2+YV7qzyPJTnUaAO40/FVjLQme4Q=;
 b=f4CyiQutGQkBhsLy+cTQstKXssMhXrq8HsPN/j9y4rTymirezG0OV0v+sS9a2HQLbG
 Lo/BC/PjqXzyXLu/FS9/p+IwNkCM/Rpqq6t/y+KOuhXzfsIZhxWyHFXCsaAYDYG2/Fi2
 4l0njPLlM/zzWXKB2jM7HH+ZXUIK9YK4TnsTL813DYcyjk5aFeHuOU/Itxkg+tV64wL1
 DW4qzw4fz8spCLBXPqQO5ecemwXsQXFMlO6xlxKOUl04+CgWf8NxE8hZJP9An36Qz7sj
 dBm46jxV1pxXrurATh0Fm0UJSIYNWMpPhj5Qd0yOirh1826SfjXR0Hi4IabaGtyKcQzY
 N+qA==
X-Gm-Message-State: APjAAAVr2GMaVK1+Ji+7evPiYABl0yHtGNMLPEb1yDdqLruGt6G0uUQa
 XXZlogfMstij0Y2aXYFCrlK9k2gPzxUMeoLtGwCY2sgzLnel
X-Google-Smtp-Source: APXvYqwobjtIAJnGhBqxYFPq6zujC6IR9o8IZb4xFa/sSUduiR7Gw7nd3NsIt5te6Vi4hOBe/Hl9m+9dU7j1q/MnIpFRd7d95XqY
MIME-Version: 1.0
X-Received: by 2002:a24:2502:: with SMTP id g2mr8148451itg.106.1556721365118; 
 Wed, 01 May 2019 07:36:05 -0700 (PDT)
Date: Wed, 01 May 2019 07:36:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb78720587d46fe9@google.com>
Subject: BUG: soft lockup in kvm_vm_ioctl
From: syzbot <syzbot+8d9bb6157e7b379f740e@syzkaller.appspotmail.com>
To: adrian.hunter@intel.com, davem@davemloft.net, dedekind1@gmail.com, 
 ebiggers@google.com, jbaron@redhat.com, jpoimboe@redhat.com, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, luto@kernel.org, 
 mingo@kernel.org, peterz@infradead.org, richard@nod.at, riel@surriel.com, 
 rostedt@goodmis.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_073607_803888_88AAEC99 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

syzbot found the following crash on:

HEAD commit:    baf76f0c slip: make slhc_free() silently accept an error p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1407f57f200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a42d110b47dd6b36
dashboard link: https://syzkaller.appspot.com/bug?extid=8d9bb6157e7b379f740e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1266a588a00000

The bug was bisected to:

commit 252153ba518ac0bcde6b7152c63380d4415bfe5d
Author: Eric Biggers <ebiggers@google.com>
Date:   Wed Nov 29 20:43:17 2017 +0000

     ubifs: switch to fscrypt_prepare_setattr()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1448f588a00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1648f588a00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1248f588a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8d9bb6157e7b379f740e@syzkaller.appspotmail.com
Fixes: 252153ba518a ("ubifs: switch to fscrypt_prepare_setattr()")

watchdog: BUG: soft lockup - CPU#0 stuck for 123s! [syz-executor.3:22023]
Modules linked in:
irq event stamp: 26556
hardirqs last  enabled at (26555): [<ffffffff81006673>]  
trace_hardirqs_on_thunk+0x1a/0x1c
hardirqs last disabled at (26556): [<ffffffff8100668f>]  
trace_hardirqs_off_thunk+0x1a/0x1c
softirqs last  enabled at (596): [<ffffffff87400662>]  
__do_softirq+0x662/0x95a kernel/softirq.c:320
softirqs last disabled at (517): [<ffffffff8144e4e0>] invoke_softirq  
kernel/softirq.c:374 [inline]
softirqs last disabled at (517): [<ffffffff8144e4e0>] irq_exit+0x180/0x1d0  
kernel/softirq.c:414
CPU: 0 PID: 22023 Comm: syz-executor.3 Not tainted 5.1.0-rc6+ #89
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:csd_lock_wait kernel/smp.c:108 [inline]
RIP: 0010:smp_call_function_single+0x13e/0x420 kernel/smp.c:302
Code: 00 48 8b 4c 24 08 48 8b 54 24 10 48 8d 74 24 40 8b 7c 24 1c e8 23 fa  
ff ff 41 89 c5 eb 07 e8 e9 87 0a 00 f3 90 44 8b 64 24 58 <31> ff 41 83 e4  
01 44 89 e6 e8 54 89 0a 00 45 85 e4 75 e1 e8 ca 87
RSP: 0018:ffff88809277f3e0 EFLAGS: 00000293 ORIG_RAX: ffffffffffffff13
RAX: ffff8880a8bfc040 RBX: 1ffff110124efe80 RCX: ffffffff8166051c
RDX: 0000000000000000 RSI: ffffffff81660507 RDI: 0000000000000005
RBP: ffff88809277f4b8 R08: ffff8880a8bfc040 R09: ffffed1015d25be9
R10: ffffed1015d25be8 R11: ffff8880ae92df47 R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000000
FS:  00007fd569980700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd56997e178 CR3: 00000000a4fd2000 CR4: 00000000001426f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  smp_call_function_many+0x750/0x8c0 kernel/smp.c:434
  smp_call_function+0x42/0x90 kernel/smp.c:492
  on_each_cpu+0x31/0x200 kernel/smp.c:602
  text_poke_bp+0x107/0x19b arch/x86/kernel/alternative.c:821
  __jump_label_transform+0x263/0x330 arch/x86/kernel/jump_label.c:91
  arch_jump_label_transform+0x2b/0x40 arch/x86/kernel/jump_label.c:99
  __jump_label_update+0x16a/0x210 kernel/jump_label.c:389
  jump_label_update kernel/jump_label.c:752 [inline]
  jump_label_update+0x1ce/0x3d0 kernel/jump_label.c:731
  static_key_slow_inc_cpuslocked+0x1c1/0x250 kernel/jump_label.c:129
  static_key_slow_inc+0x1b/0x30 kernel/jump_label.c:144
  kvm_arch_vcpu_init+0x6b7/0x870 arch/x86/kvm/x86.c:9068
  kvm_vcpu_init+0x272/0x370 arch/x86/kvm/../../../virt/kvm/kvm_main.c:320
  vmx_create_vcpu+0x191/0x2540 arch/x86/kvm/vmx/vmx.c:6577
  kvm_arch_vcpu_create+0x80/0x120 arch/x86/kvm/x86.c:8755
  kvm_vm_ioctl_create_vcpu arch/x86/kvm/../../../virt/kvm/kvm_main.c:2569  
[inline]
  kvm_vm_ioctl+0x5ce/0x19c0 arch/x86/kvm/../../../virt/kvm/kvm_main.c:3105
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd6e/0x1390 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0x103/0x610 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x458da9
Code: ad b8 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fd56997fc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000458da9
RDX: 0000000000000000 RSI: 000000000000ae41 RDI: 0000000000000005
RBP: 000000000073bfa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fd5699806d4
R13: 00000000004c1905 R14: 00000000004d40d0 R15: 00000000ffffffff
Sending NMI from CPU 0 to CPUs 1:


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
