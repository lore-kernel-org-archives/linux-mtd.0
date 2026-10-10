Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D60CA9EBE
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=O5stkHMVIpQs4r1x/BafEiaf1J101I/ngS5bRfapRIE=; b=ocB3eHiuKbJrZg
	71d8uxMaye6frcTkQtBNnmhtewctZpX3BWRjUOuu3EePAosdbiHhNd+IjqPdkNFarY7QnaBd+oUwC
	cIlxgsvMkUTKcpt8HlvsiWY0K+zx/VVrzU8b3Tmz1amj29t70qQjZd+92oAlhfkcyP56m9t2iGQhI
	sQx7byN1vPJ8iHqIFCmYDiffVQlXw7n/FkP58K/mhdIU7lCVIZ8ifiTkEe6juyrPWS0Qa9r5Bgorl
	2mufyU8ho3pX1nYusK7fftiuqwmdo4ogHiP2FXSAS0gILTQ+9t3x2DcqvlM4o6D8dxOCyaZI0uyEY
	uWDeKDDikrO4ZfnMxBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTWH-00000007mdF-37hJ;
	Sat, 10 Oct 2026 09:37:33 +0000
Received: from mail-oi1-f200.google.com ([209.85.167.200])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTWE-00000007mcb-0zi7
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 09:37:31 +0000
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ea2c058e67so955868b6e.1
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 02:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791625048; x=1792229848;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uysb7hrMW18ta6csFuo/tjmPM1oPyOV160RXUd7+cRo=;
        b=pjU6oG1bZv9eIRluaZqzLbTKL1L/b8JTmR8C2ibylo8EEozp/jQPTiBMsPaRiYGi20
         ETiZhWTJs8+v2vL1PGscUDdBZl02NAtXsy0a1MrUA5ytPY8vXe4TDbgbRRIbWRnaJjlG
         bcKfG7VR3kjd+wt75CmsvVl2EYsyoX/Sijz4Z96PytgB6eC8h6ZisAek9pp1CyhKKJFL
         yzdXaHdafVaOREqhf+7Uvt/U/wEM5VdtW2oc8XVI7pML4L3ZppPn7ksIRvEDvDMPoVuT
         C71EQy//8+vcCvW0MUqJvuA/hsBvv2Ahlu74j33pU4GL6VUHzUQ00DDczkxcHUefA/19
         ISGA==
X-Forwarded-Encrypted: i=1; AKwUvByWTy+T4hKAGT9mYiBHvuu5dyYauR8ZFJDGNJewDv2zrQrtZDsOOjHRiZyRvQ2MRfqtIdWa6RBRPRk=@lists.infradead.org
X-Gm-Message-State: AFq9FYKegiBMiHhcQ1VKKI/gwLX64U4Z1vtdRD9QF+BlqjrVnKBTG1Qn
	egcysNkQrpl0w1hkWeGGPqKOCRgzBdpBOQVvNloG1/AkEra7K5aNnxz286APSXxqvW95X6D9ddD
	hwsK0NrSvgn5TVhLJyYjl5xaz8IE8kA6TS2sYXR+khdaeztx8XzqbPMdKwmE=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4495:b0:4d6:90d3:e184 with SMTP id
 5614622812f47-50c57b6e9f2mr3181357b6e.45.1791625048377; Sat, 10 Oct 2026
 02:37:28 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:37:28 -0700
In-Reply-To: <6a9d5836.a5e650b3.26d8a.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aca0758.70ed5d86.2ac85.00ab.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] kernel BUG in jffs2_sum_write_sumnode (2)
From: syzbot <syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_023730_280120_7B50B023 
X-CRM114-Status: UNSURE (   7.39  )
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

HEAD commit:    3857c2fe5449 Merge tag 'pci-v7.3-fixes-4' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1433f199580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3e4baf48b1a52e1
dashboard link: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1233f199580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com

block2mtd: Using custom MTD label 'testjffs' for dev /dev/loop0
ftl_cs: FTL header not found.
block2mtd: mtd1: [testjffs] erase_size = 4KiB [4096]
jffs2: notice: (6012) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
jffs2: warning: (6012) jffs2_sum_write_sumnode: Empty summary info!!!
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:868!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 6012 Comm: syz-executor253 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/16/2026
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 80 9d 33 8c 48 c7 c7 80 99 33 8c e8 2d 6e f8 ff 90 <0f> 0b e8 65 49 e2 00 65 4c 8b 3d 45 e4 63 14 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc9000347f9a0 EFLAGS: 00010286
RAX: 0000000000000045 RBX: ffff88802f168000 RCX: 0000000000000000
RDX: 0000000000000045 RSI: ffffffff81ea14b9 RDI: fffff5200068ff25
RBP: ffffc9000347fb20 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807b45a080
R13: 0000000000000000 R14: 0000000000000012 R15: 0000000000000000
FS:  0000555557c2d400(0000) GS:ffff888122a44000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ab45d7ad51 CR3: 0000000021ea9000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 jffs2_do_reserve_space+0xb94/0xf70 fs/jffs2/nodemgmt.c:392
 jffs2_reserve_space+0x605/0xbb0 fs/jffs2/nodemgmt.c:201
 jffs2_symlink+0x172/0x1160 fs/jffs2/dir.c:317
 vfs_symlink fs/namei.c:5823 [inline]
 vfs_symlink+0x178/0x4d0 fs/namei.c:5802
 filename_symlinkat+0x2a6/0x560 fs/namei.c:5848
 __do_sys_symlink fs/namei.c:5875 [inline]
 __se_sys_symlink fs/namei.c:5871 [inline]
 __x64_sys_symlink+0x79/0xb0 fs/namei.c:5871
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fda09c12537
Code: 00 00 90 48 83 ec 10 48 63 ff 45 31 c9 45 31 c0 6a 00 31 c9 e8 6a cd 02 00 48 83 c4 18 c3 0f 1f 44 00 00 b8 58 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc31fc8508 EFLAGS: 00000206 ORIG_RAX: 0000000000000058
RAX: ffffffffffffffda RBX: 00007ffc31fc85e0 RCX: 00007fda09c12537
RDX: 0000000000000000 RSI: 00007fda09c7eff9 RDI: 00007fda09c7b2b0
RBP: 00007fda09c7ef8c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 00007ffc31fc85e0
R13: 00007fda09c7efa1 R14: 00007fda09ca7cc0 R15: 0000000000000002
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 80 9d 33 8c 48 c7 c7 80 99 33 8c e8 2d 6e f8 ff 90 <0f> 0b e8 65 49 e2 00 65 4c 8b 3d 45 e4 63 14 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc9000347f9a0 EFLAGS: 00010286
RAX: 0000000000000045 RBX: ffff88802f168000 RCX: 0000000000000000
RDX: 0000000000000045 RSI: ffffffff81ea14b9 RDI: fffff5200068ff25
RBP: ffffc9000347fb20 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807b45a080
R13: 0000000000000000 R14: 0000000000000012 R15: 0000000000000000
FS:  0000555557c2d400(0000) GS:ffff888122944000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ab45d75950 CR3: 0000000021ea9000 CR4: 0000000000350ef0


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
