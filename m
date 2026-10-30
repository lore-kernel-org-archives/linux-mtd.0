Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36755606A31A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jntqOpqG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Cq5JlsB71Qf0RHvCpjZ1oY69NKpiFZJPT/e+0QPocPc=; b=jntqOpqGKSGEZWddW0od2geESL
	eEbfTU0ebEF9lMFO6zj8V/S8lmLUUtRGWevRZ1BN4V9nolmoYiSkftppEh7SLYRUGaHrlMQL+sCSL
	wX+KiylwJYupRuiQHgQLLoBxHFxNGIHbglWnMwrwOsBUCl5GZBA25PlCl1D96cXXoPflfaF4/AMpa
	GT43+lmKCHTyhjxied7AI1yHlaZ7a8XJRkiVoxIoQSqr62gVwuK4E25PbdWeQmnin3BeMI7vZFk1J
	6yCInYsriu1HGUL+Qb/aZ6pmGJ2Ha3P1sgsw3Kk7oxwGQaL7PDkxgIQW69UP6RRAPnVqWk8ffqquD
	jYgG7LBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdCc-0000000Aj1e-01FN;
	Fri, 30 Oct 2026 03:22:50 +0000
Received: from mail-oi1-f197.google.com ([209.85.167.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdCY-0000000Aj1I-2yRA
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 03:22:48 +0000
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso380142b6e.1
        for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2026 20:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330564; x=1793935364;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wGkmHDCxPvMLuXEXbbcNNCir8/WxlRJTdgzegweYTdY=;
        b=Bos1lXWpSmCAEEgpiSfZ56AryvVqZPQqskHadxzzl0mExPTed84zfO3y8PGWm2d4WU
         7Rtjxf/OLktaGDIAT7vA5xB+bh/Co3Js+Pt+Lj3ZGmjxdDgyjIfpe0frNUkTQ6tjM4s5
         Pw4FAyaXLhPugkyYz/iGpT6CEBEtlfdsHMu6r3N04VmqdDRY+v1sz4F8tgqkT/nKp5Ea
         XUmt1WPSFeE+lSNlQ7F1NiW+4a+PZI3Q8xe4kjf7JmWUzbV8MHM75gByS3oJergq6Och
         60BDqz28OTS7XT+UcPnCWY+cxFSvTYRc+jT/ZsKbFbPHfyHSUtR4nGlug59QsF3e1PFv
         N0Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwsfFC7G6mHalLldpUIgb4cwaTlbkcLOlDdzebfk/zN8Z94aX+GhBk2WawNloYYdKgVrej7655GkIc=@lists.infradead.org
X-Gm-Message-State: AFq9FYKfYNjS4ItNCKvgQk2tv/grY5/L9noaXP6SkPDln3NKqgo36okB
	KuW7cUQGsVhQ9vMWuhihHgiMqCiLwU9ivuV43S54hL35JNsyfUpuBeqzEDgEahuK21ljIUEahoe
	ivnujG0BfnlXVRmd+0epu5gqZqnXAd8YFoZcXQA4AdcPCAjwqO1ymfIMmHDg=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c49:b0:4c5:b120:9833 with SMTP id
 5614622812f47-5640d91b97cmr856492b6e.6.1793330564211; Thu, 29 Oct 2026
 20:22:44 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:22:44 -0700
In-Reply-To: <6a848afb.c8649fcc.3bb87.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae40d84.0c1d3ab6.e3d48.006f.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] WARNING: bad unlock balance in jffs2_do_create
From: syzbot <syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_202246_796984_0DF98893 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

syzbot has found a reproducer for the following issue on:

HEAD commit:    4dd16e31135e Merge tag 'net-7.4-rc1' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=120d9b8e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a49f7c2815c8df7
dashboard link: https://syzkaller.appspot.com/bug?extid=250fde257a3eebba4426
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10dd8129580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com

jffs2: Write of 68 bytes at 0x0001e00c failed. returned -12, retlen 0
jffs2: Not marking the space at 0x0001e00c as dirty because the flash driver returned retlen zero
=====================================
WARNING: bad unlock balance detected!
syzkaller #0 Not tainted
-------------------------------------
syz-executor317/5670 is trying to release lock (&c->alloc_sem) at:
[<ffffffff834f8efe>] jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
but there are no more locks to release!

other info that might help us debug this:
locks held by syz-executor317/5670: 2, last CPU#0:
 #0: ffff888049484460 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:531
 #1: ffff8880144cd800 (&type->i_mutex_dir_key#8){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1024 [inline]
 #1: ffff8880144cd800 (&type->i_mutex_dir_key#8){+.+.}-{4:4}, at: lookup_open+0x246/0x1970 fs/namei.c:4462

stack backtrace:
CPU: 0 UID: 0 PID: 5670 Comm: syz-executor317 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5349
 __lock_release kernel/locking/lockdep.c:5590 [inline]
 lock_release+0x252/0x3c0 kernel/locking/lockdep.c:5964
 __mutex_unlock_slowpath+0x88/0x900 kernel/locking/mutex.c:989
 jffs2_do_create+0x1ae/0xe00 fs/jffs2/write.c:474
 jffs2_create+0x1c8/0x320 fs/jffs2/dir.c:205
 lookup_open+0xedc/0x1970 fs/namei.c:4569
 open_last_lookups fs/namei.c:4768 [inline]
 path_openat+0x70c/0x20f0 fs/namei.c:5007
 do_file_open+0x23e/0x4a0 fs/namei.c:5039
 do_sys_openat2+0x115/0x200 fs/open.c:1442
 do_sys_open fs/open.c:1448 [inline]
 __do_sys_creat fs/open.c:1526 [inline]
 __se_sys_creat fs/open.c:1520 [inline]
 __x64_sys_creat+0x8f/0xc0 fs/open.c:1520
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3e047ea0f7
Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff7c755290 EFLAGS: 00000202 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 0000555569e9a400 RCX: 00007f3e047ea0f7
RDX: 0000000000000000 RSI: 00000000000001a4 RDI: 00007f3e04827201
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007f3e04827235
R13: 00007f3e04827252 R14: 000000000000000e R15: 0000000000020000
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
