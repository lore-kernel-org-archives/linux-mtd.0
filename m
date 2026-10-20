Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5959606A32E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dwGs3Toa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c8LSwzJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EXSJhki+9AGKNICpmYM2Uot83cWLb00D712E40Sbkg0=; b=dwG
	s3Toap3iMG5fs8M5HU1T9hxMyaPkkT0PwDZzZ8u1R6yNaPqPD56BhnNfjAuDJil950so5J/csAIMT
	SCkep9X+Ojdcea0Z24Fus/zONNKjaN6G5sI+KvqcPKNxlzPSlCPdN7+DPpEjYgktfZU5NYlfkVZRp
	7P7FGgIdKYMkL/DeLRRMcznjr+IdLcnwF5ckwxurXki5oD0MPPUhgjrG54rJ4URH+8w07eh/eXNUs
	mhCXxqAzBHHJuyBT2TLMFmlrkNXPARVhUbwltm6cy0gPsJIFOEnmWBMz7xDM5Tm3Uk4B70+4xDeU4
	+5KgiSYd+neAOB8kwZlSd2KyVPCCgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERy-0000000AQsR-07c7;
	Tue, 20 Oct 2026 18:20:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERw-0000000AQrC-1rib
	for linux-mtd@bombadil.infradead.org;
	Tue, 20 Oct 2026 18:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=SHm3lNj7Pvfb+cw41IZikmw0ICaWLgMwwg0/9x5rfJg=; b=c8LSwzJS1/4HLOdAtjdsMGa+si
	Wv4VhQfj5U+gkvYBxN5fK9AT0WnznfSINpXsyuk1nmn6DXop0ES4+Fm0lAi/zj2mjdQveDQDq3HIH
	8ahcgjGlMokcvXB/Gb34ZY1Vz425yJTAKQqvHgLKpFn7aVdoM0wP/q2J20GEIC3PoUuvrf2TqClJV
	oCzYd55HcFBZKrnIv7FQ4OQnErZY3qUbglnh3VWNrX1k/AX3hhr3/u8+PclSBZcsZji42OQnZRHu0
	+2Ot0vIi+S32LrSIos/BRQHIiQZfvQZ5Chdh5/ZNDWqTE68r+liTfDrrIwIg+ZjoeSZBlYsed/zpp
	QMyJxy7Q==;
Received: from mail-oi1-f197.google.com ([209.85.167.197])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJERs-000000053RQ-2WlB
	for linux-mtd@lists.infradead.org;
	Tue, 20 Oct 2026 18:20:35 +0000
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f4612a1a5cso1231964b6e.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2026 11:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520430; x=1793125230;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHm3lNj7Pvfb+cw41IZikmw0ICaWLgMwwg0/9x5rfJg=;
        b=Krpt702fUaflsOL6s+j2mNXUrp91GFC1aoLx6V/gBfxCQtveRhM7RSW5cIyz78IXbp
         eLt6Nv/ByN68ftEhfoQ+oTwhRzGNhUQ0LNxUfdOfD7uXQKElzi2czFS1TgeBg9qDYYQ9
         6DtxSq17NSfaSMDbARD+CXu3CQUv8LxHItfsEsf05VEK3/HO/M4BBdFy3YvrnxadJeEx
         cztJ33MPgdewG4UzapV5jvtwg5ZE/ubnpiPYEktdYotIpi2YhkVYIe/GledymOw9g6J1
         D4lzTDorOzkBk4bDhMQvSNzftMNwxV1kXsegeptYuEdNXxtvAGBEwCK7L56L3Tma3pNk
         XQsA==
X-Forwarded-Encrypted: i=1; AKwUvBxQz0j8MDsFM2m98r392sYI7z4CgGyslX1LbFPrYUavw5u9fiMAvzZTZ+sYbnC70GRhIbuL1+TNL1M=@lists.infradead.org
X-Gm-Message-State: AFq9FYITXXggSlV6EG4Gi6UgJH9jNPm1rDAKgmMOHth80JtZVg+7IeM1
	cZXOICX7IIKsFPTN2Q0eZcq2F0EB8qfwJaiFp3W7myffvGkGtIk2CONKs0FIoKg88KB+d/12Rt3
	dMg3xv6eb5w6+GJefT7ilE1o1MXMXSXaAhyNVtUPgePHy/Dgb7AopZscyhO0=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1b8:b0:4f5:214:fb96 with SMTP id
 5614622812f47-54d974aec0fmr1886617b6e.42.1792520430038; Tue, 20 Oct 2026
 11:20:30 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:20:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad7b0ee.5c73e770.1a06c9.013b.GAE@google.com>
Subject: [syzbot] [mtd?] Internal error in mtd_read_oob_std
From: syzbot <syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com>
To: joern@lazybastard.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_192032_736328_9387824E 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 4.0 (++++)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

syzbot found the following issue on:

HEAD commit:    2f2f7eeef8b0 Merge tag 'soc-fixes-7.3-3' of git://git.kern..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=12cfd20d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=644925403e5fc5f8
dashboard link: https://syzkaller.appspot.com/bug?extid=eaaabe90f486cb6f31b2
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15845da9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115c960d580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-2f2f7eee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0db2a9d79647/vmlinux-2f2f7eee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4415d93465b1/Image-2f2f7eee.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eaaabe90f486cb6f31b2@syzkaller.appspotmail.com

Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 3660 Comm: syz.2.17 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: linux,dummy-virt (DT)
pstate: 81402009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : __memcpy+0xc/0x44 arch/arm64/lib/memcpy.S:251
lr : phram_read+0x28/0x40 drivers/mtd/devices/phram.c:70
sp : ffff80008671b7c0
x29: ffff80008671b7c0 x28: f7f0000012970000 x27: 0000000000000000
x26: 0000000000003030 x25: 0000000000002000 x24: 0000000000000000
x23: 0000000000000000 x22: 0000000000000000 x21: ffff80008671b830
x20: ffff80008671b840 x19: 0000000000000044 x18: 00000000ffffffff
x17: ffff800083ab372d x16: ffff800083ab3708 x15: f9f0000006deb280
x14: ffff80008671b600 x13: f9f0000006deba1c x12: 0000550855e43902
x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
x8 : 0000000000000000 x7 : dead000000000122 x6 : 0000000000000000
x5 : ffff8000c0000000 x4 : ffff80008671b8e4 x3 : ffff80008671b8e4
x2 : 0000000000000044 x1 : ffff8000c0000000 x0 : ffff80008671b8e4
Call trace:
 __memcpy+0xc/0x44 arch/arm64/lib/memcpy.S:250 (P)
 mtd_read_oob_std+0x84/0x9c drivers/mtd/mtdcore.c:1702
 mtd_read_oob+0x8c/0x15c drivers/mtd/mtdcore.c:1811
 mtd_read+0x68/0xc4 drivers/mtd/mtdcore.c:1603
 scan_header drivers/mtd/ftl.c:164 [inline]
 ftl_add_mtd+0xec/0x6a8 drivers/mtd/ftl.c:1017
 blktrans_notify_add drivers/mtd/mtd_blkdevs.c:464 [inline]
 blktrans_notify_add+0x50/0x74 drivers/mtd/mtd_blkdevs.c:456
 add_mtd_device+0x45c/0x7a8 drivers/mtd/mtdcore.c:828
 mtd_device_parse_register+0x294/0x35c drivers/mtd/mtdcore.c:1156
 register_device+0x104/0x260 drivers/mtd/devices/phram.c:162
 phram_setup+0x16c/0x2a0 drivers/mtd/devices/phram.c:324
 phram_param_call+0x60/0x84 drivers/mtd/devices/phram.c:349
 param_attr_store+0xa4/0x100 kernel/params.c:591
 module_attr_store+0x24/0x40 kernel/params.c:906
 sysfs_kf_write+0x7c/0x98 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x138/0x200 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x244/0x36c fs/read_write.c:687
 ksys_write+0x70/0x108 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x18/0x24 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x54/0x10c arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x1c/0x34 arch/arm64/kernel/syscall.c:140
 el0_svc+0x38/0x1fc arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0xa0/0xe4 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:590
Code: d65f03c0 d503245f d503201f aa0003e3 (1d010443) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d65f03c0 	ret
   4:	d503245f 	bti	c
   8:	d503201f 	nop
   c:	aa0003e3 	mov	x3, x0
* 10:	1d010443 	cpyp	[x3]!, [x1]!, x2! <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

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
