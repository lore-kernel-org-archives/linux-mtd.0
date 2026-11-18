Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE235606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TO2WHVl3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=BjjXiVXakzj6nPTaCBDAdjcA0qwL00acdQOMtLqhwig=; b=TO2WHVl3DCS1By3pObin9Pflm/
	GapV9mJVtoeAx5eLDZQtEy9LjLteVb4lI20McL02xjOp4pMTcimvxtJ6Sib6Agpp1JgznCUCbG531
	3I4e97Ira5Nmzg+xZnzHxgEjWHwkPbaAX7t0xFdTBW2l1rr/vSGtQU0cKuhkUB/OPdRju568bhhfC
	T8fZfuoUUbVeTgmICASF7yADp+9NxDBv48rtxjRerHwrbL/lmP3ploihZNw+QFQeq9578+r3bI2ll
	DEOyT7rkwckh2sAzquytvzDpc2Xxr3NGRgCEN6tMAkH1IRI/ZP0gpyvWUgIvkqMVaOIqVDu3oSijh
	xNvo1WPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUnw-00000007U2p-1Ibi;
	Wed, 18 Nov 2026 01:49:44 +0000
Received: from mail-oi1-f199.google.com ([209.85.167.199])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUnt-00000007U2I-0VGn
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 01:49:42 +0000
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-540537f959fso452974b6e.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 17:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966579; x=1795571379;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cR+/1INcvJb5Z5JiI/QnjvwLw88DezNFt0tyfSSUrCI=;
        b=rPgk4/gAM4ygN/bTdi+cmyonB+PoeRzKsJjS/z04t+iduwe+zXtkH4WqPl5eEZWrjt
         GqCCuOeCymVso220h8K9bEhJpU14/YusI6HBcBhufC2XnT38zM7m8+eGvqSma1Kc1dRY
         o/tpq9Ok+tMkqE4Pe8oOA2xnb1j59fhjHoLDWTuPDthYp1pKdXfRUYY+Dy0mq/2T1elF
         KTOsBBChF3w5oLtKiF6I5u4hO1Iyk7x7HTatr7Ha0BE5CCcorOqbi+16n69bovmovxUt
         vC09ELZgLzQpEidGakinYlyVoAH45IfxDMfZqiD8Y9y6+3VCZpXMZEHA5J7cpnCOGAsb
         QHfg==
X-Forwarded-Encrypted: i=1; AL+hErEpFddhnKvI4+zE5QT7i2UH55ERLSgyYV5FIEcudRzDyiBJ+wr/T5XDFP7JgkfeP6PXwWK3MMJJAtI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8lqGfPMMm0XjThJT33JFL3H87Uv2A7MMj4W7u5i3Ko4ySNql/B
	/UFn9U40ECVHqG281APMJ53l6VP345P2uohGedSVTTiesRSCISL/49c0ntyWCD3yBm2FuS7EAAx
	RD+AHRpF6TedQcUu3sYyF39mDJ0iciv/v9ugiB6PBBKZvMK4yZCwNVhQ46XU=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5198:b0:572:d0fb:ae64 with SMTP id
 5614622812f47-5773ee4c8f8mr1772035b6e.54.1794966579172; Tue, 17 Nov 2026
 17:49:39 -0800 (PST)
Date: Tue, 17 Nov 2026 17:49:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afd0433.8f566acc.2517be.000f.GAE@google.com>
Subject: [syzbot] [mtd?] BUG: unable to handle kernel paging request in phram_read
From: syzbot <syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com>
To: joern@lazybastard.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_174941_171678_EC40895C 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.8 (+)
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

Hello,

syzbot found the following issue on:

HEAD commit:    ad3fc05c7e65 arm64: suspend: Only track cpuidle context fo..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=165de94e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e8e6c1701ad8af2
dashboard link: https://syzkaller.appspot.com/bug?extid=ee09ee2112d03c35f1f7
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1796373d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13fbe5c3580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a30beb3b2b82/disk-ad3fc05c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2eaac3d8da90/vmlinux-ad3fc05c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/212a161a069b/Image-ad3fc05c.gz.xz

The issue was bisected by AI to candidate commits (most relevant first):

1da177e4c3f4 Linux-2.6.12-rc2
f3d45ac21e46 mtd: phram: Module parameters add writable permissions
285133040e6c arm64: Import latest memcpy()/memmove() implementation

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=c053ce4a-8b95-428d-87ad-63a0065b8ed9

AI-generated root cause summary:
In drivers/mtd/devices/phram.c, registering a phram device via module parameter
or sysfs (/sys/module/phram/parameters/phram) invokes register_device() with
pdev = NULL, which causes new->cached to be false. As a result, phram_map() maps
the physical memory region using ioremap() (mapped as PROT_DEVICE_nGnRE on
arm64) and forces the pointer into mtd->priv, yet phram_read(), phram_write(),
and phram_erase() access it using standard memcpy() and memset() instead of I/O
memory accessors (like memcpy_fromio()). When scanning partition headers (e.g.,
ftl_add_mtd() reading a 68-byte header via mtd_read()), arm64's memcpy
implementation issues pair-load (ldp) instructions at unaligned offsets, which
unconditionally triggers an alignment fault (FSC = 0x21) on Device memory and
crashes the kernel.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=ee09ee2112d03c35f1f7

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address ffff800090ffe024
KASAN: probably user-memory-access in range [0x0000000487ff0120-0x0000000487ff0127]
Mem abort info:
  ESR = 0x0000000096000021
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x21: alignment fault
Data abort info:
  ISV = 0, ISS = 0x00000021, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000002193b5000
[ffff800090ffe024] pgd=0000000000000000, p4d=100000021f6f0003, pud=100000021f6f1003, pmd=10000001013e1403, pte=0068000000000713
Internal error: Oops: 0000000096000021 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 4957 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
pstate: 23400005 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : __pi_memcpy_generic+0x98/0x22c arch/arm64/lib/memcpy.S:114
lr : __asan_memcpy+0x68/0x84 mm/kasan/shadow.c:109
sp : ffff800095836fc0
x29: ffff800095836fc0 x28: 1fffe00019f6102f x27: ffff0000cfb08000
x26: dfff800000000000 x25: ffff800095837150 x24: dfff800000000000
x23: ffff0000cfb08190 x22: ffff800082ab0064 x21: ffff800095837370
x20: ffff800090ffe000 x19: 0000000000000044 x18: 1fffe000359cf228
x17: 4a414d0064746d3d x16: 4d45545359534255 x15: ffff800080d0603c
x14: 0000000000000001 x13: 0000000000000009 x12: 0000000000000004
x11: ffff700012b06e76 x10: ffff700012b06e76 x9 : ffffffffffffffff
x8 : ffffffffffffffff x7 : ffffffffffffffff x6 : ffffffff14000400
x5 : ffff8000958373b4 x4 : ffff800090ffe044 x3 : ffff800082ab0064
x2 : 0000000000000044 x1 : ffff800090ffe000 x0 : ffff800095837370
Call trace:
 __pi_memcpy_generic+0x98/0x22c arch/arm64/lib/memcpy.S:113 (P)
 phram_read+0x64/0x98 drivers/mtd/devices/phram.c:70
 mtd_read_oob_std+0x180/0x19c drivers/mtd/mtdcore.c:1702
 mtd_read_oob+0x1fc/0x4ec drivers/mtd/mtdcore.c:1811
 mtd_read+0xd0/0x1a8 drivers/mtd/mtdcore.c:1603
 scan_header drivers/mtd/ftl.c:164 [inline]
 ftl_add_mtd+0x1e8/0x16d8 drivers/mtd/ftl.c:1017
 blktrans_notify_add+0xa8/0xf8 drivers/mtd/mtd_blkdevs.c:469
 add_mtd_device+0xedc/0x1504 drivers/mtd/mtdcore.c:828
 mtd_device_parse_register+0x660/0x7a0 drivers/mtd/mtdcore.c:1156
 register_device+0x340/0x51c drivers/mtd/devices/phram.c:162
 phram_setup+0x354/0x4fc drivers/mtd/devices/phram.c:324
 phram_param_call+0x34/0x90 drivers/mtd/devices/phram.c:349
 param_attr_store+0x144/0x1bc kernel/params.c:591
 module_attr_store+0x6c/0x94 kernel/params.c:906
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x51c/0xa0c fs/read_write.c:687
 ksys_write+0x12c/0x228 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x84/0x98 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Code: d65f03c0 d503201f a9401c26 a9412428 (a97e2c8a) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d65f03c0 	ret
   4:	d503201f 	nop
   8:	a9401c26 	ldp	x6, x7, [x1]
   c:	a9412428 	ldp	x8, x9, [x1, #16]
* 10:	a97e2c8a 	ldp	x10, x11, [x4, #-32] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about AI bisection see: https://goo.gl/tpsmEJ#ai-bisection

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
