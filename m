Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667CFC5DF8C
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2026 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=N+qG4EdLbhZDxiqo+1kSII1Qxpl92+BzG3k2NLWcQMY=; b=eq0
	9kx2QBU/oGT9GHAWFMo2Ies/mxQHUUwLbTAPoQJ01js9W0QJSrK3nC9GVLDZS5gRc76ehBvd4ugoh
	zoc3hI3au/IAS1gGTJJ8JpKUsHY5QhZSdRDpehypX1DVCIdbgBWey23w91lDMPyzM4m9dGNNlOsom
	QVeJbbOMepoXJzYeiICLU13WqtEePLjnj622Xlg+hpVqEpvU0ZAyt58FBHepZLOhtBiFzumGnDDPo
	GQPxbhBV8/nNzLDFchT3BA8/uDnjl8XZPkzlbLsrsjBBn7SHNxwWzOqkKy+OgHZT3Q9ZSS452alCj
	JvK4b5yV5BmSCUw8Nc273MUHBHu8teA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNBl-0000000FwAM-2nZI;
	Mon, 24 Aug 2026 05:25:41 +0000
Received: from mail-oa1-f78.google.com ([209.85.160.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNBj-0000000FwA3-1JpX
	for linux-mtd@lists.infradead.org;
	Mon, 24 Aug 2026 05:25:40 +0000
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-43cd2d12617so7537092fac.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Aug 2026 22:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787549137; x=1788153937;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZWUSFu9h8BHYi5GnVA0uVVbLkbhCP0/H8ChgVHNS8Y=;
        b=qv97K6TB9MfTIxsqQzCD/tygcFINIHkNJjAyvDmLrwYdjYQGZWYbYNNvX3mldLL/KQ
         x2wxtWtn9Y1RVV4vs8nF8vz0zq7ImmSZmyJPdx3B34lURWB/+NRyS093Kb1dekkuNzpO
         fqVhtLoavxU1LpUyZfvY6YHG4GDq1fH2nEfneTkaJz29Rvz4H/8/lwczAMfAswSGMebP
         FRJwxhL41lpyyVPYWf2LOp2OU9fz3Tm5J9BDQ17qtw21ZQ9yNRCKWjKwYLDyHtZSTgMO
         G9mBwBUa6LYSde0K+HnY+Nt1Y4rH8GgKRdVUHJIajPn8vnTgpfd4iKUiMG9FUqjDiKsA
         afvw==
X-Forwarded-Encrypted: i=1; AHgh+RpAJ+8r0IKxBvxNojeBMGKQdbXt5pcN2bm/MdodHC+Gqj3YDnQiMN4IBfUQVbHSfQDLX6NBxNf60T8=@lists.infradead.org
X-Gm-Message-State: AFuF++lzQVMWb0roOrBudanttV/+Uyb0JBanszpxzNU1wFrzuLbeEy62
	VJHRYWh5Dzo2TwP6nQgGDWnuan8JiD8i6+zyYNsG9sducaFsRgDmrbaNH1piOYDRjoSdw10+0zu
	/z2Ianb84AfCtpbfkI4u+9w/a0eNH8qX1gGzkKek6BBIucCx7z3uX/E7fJFE=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f024:b0:6ae:84e6:2de0 with SMTP id
 006d021491bc7-6b1593b93fcmr22935292eaf.26.1787549137632; Sun, 23 Aug 2026
 22:25:37 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:25:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8bd5d1.ae6ddae5.3da009.0076.GAE@google.com>
Subject: [syzbot] [jffs2?] kernel BUG in jffs2_link_node_ref
From: syzbot <syzbot+860303c982ac004f74f5@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_222539_361197_325866E3 
X-CRM114-Status: UNSURE (   7.83  )
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

HEAD commit:    bd5f485f3f02 Merge tag 'soc-arm-7.3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17f4ee79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4131490469a78a3
dashboard link: https://syzkaller.appspot.com/bug?extid=860303c982ac004f74f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-bd5f485f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/147156575815/vmlinux-bd5f485f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f8c1c266e68c/bzImage-bd5f485f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+860303c982ac004f74f5@syzkaller.appspotmail.com

block2mtd: error: cannot open device /dev/loop0
Flash size not aligned to erasesize, reducing to 2043KiB
jffs2: Eep. ofs 0x00000041 not word-aligned!
------------[ cut here ]------------
kernel BUG at fs/jffs2/nodelist.c:614!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 16927 Comm: syz.6.2727 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:jffs2_link_node_ref+0x4a1/0x940 fs/jffs2/nodelist.c:614
Code: 08 44 89 ee 49 8d 6c 24 28 83 e0 fc 89 c7 89 44 24 0c e8 52 e8 89 fe 8b 44 24 0c 44 39 e8 0f 84 cd fd ff ff e8 90 ee 89 fe 90 <0f> 0b e8 88 ee 89 fe 49 8d be 64 01 00 00 48 b8 00 00 00 00 00 fc
RSP: 0018:ffffc90002db77c8 EFLAGS: 00010287
RAX: 000000000001adff RBX: ffff888073efe260 RCX: ffffc9000bc04000
RDX: 0000000000080000 RSI: ffffffff83800bc0 RDI: ffff888020fb8000
RBP: ffffc900066c1070 R08: 0000000000000004 R09: 0000000000000040
R10: 0000000000000041 R11: 0000000000000000 R12: ffffc900066c1048
R13: 0000000000000041 R14: ffff8880251a8000 R15: ffff888073efe268
FS:  0000000000000000(0000) GS:ffff8880969db000(0063) knlGS:00000000f541db40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000000000c3fd7fc CR3: 0000000051e89000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 jffs2_scan_dirty_space+0x162/0x270 fs/jffs2/nodelist.c:685
 jffs2_scan_eraseblock fs/jffs2/scan.c:736 [inline]
 jffs2_scan_medium+0x189d/0x59d0 fs/jffs2/scan.c:151
 jffs2_build_filesystem fs/jffs2/build.c:112 [inline]
 jffs2_do_mount_fs+0x8a0/0x2300 fs/jffs2/build.c:416
 jffs2_do_fill_super+0x3d4/0xa50 fs/jffs2/fs.c:574
 jffs2_fill_super+0x283/0x370 fs/jffs2/super.c:290
 mtd_get_sb+0x2f0/0x4c0 drivers/mtd/mtdsuper.c:57
 mtd_get_sb_by_nr drivers/mtd/mtdsuper.c:88 [inline]
 get_tree_mtd+0x6f9/0x8a0 drivers/mtd/mtdsuper.c:141
 vfs_get_tree+0x92/0x320 fs/super.c:1947
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3772 [inline]
 do_new_mount fs/namespace.c:3848 [inline]
 path_mount+0x7d0/0x24c0 fs/namespace.c:4168
 do_mount fs/namespace.c:4181 [inline]
 __do_sys_mount fs/namespace.c:4397 [inline]
 __se_sys_mount fs/namespace.c:4374 [inline]
 __ia32_sys_mount+0x292/0x310 fs/namespace.c:4374
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf702efec
Code: Unable to access opcode bytes at 0xf702efc2.
RSP: 002b:00000000f541d50c EFLAGS: 00000292 ORIG_RAX: 0000000000000015
RAX: ffffffffffffffda RBX: 0000000080000900 RCX: 0000000080000800
RDX: 0000000080000a00 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_link_node_ref+0x4a1/0x940 fs/jffs2/nodelist.c:614
Code: 08 44 89 ee 49 8d 6c 24 28 83 e0 fc 89 c7 89 44 24 0c e8 52 e8 89 fe 8b 44 24 0c 44 39 e8 0f 84 cd fd ff ff e8 90 ee 89 fe 90 <0f> 0b e8 88 ee 89 fe 49 8d be 64 01 00 00 48 b8 00 00 00 00 00 fc
RSP: 0018:ffffc90002db77c8 EFLAGS: 00010287
RAX: 000000000001adff RBX: ffff888073efe260 RCX: ffffc9000bc04000
RDX: 0000000000080000 RSI: ffffffff83800bc0 RDI: ffff888020fb8000
RBP: ffffc900066c1070 R08: 0000000000000004 R09: 0000000000000040
R10: 0000000000000041 R11: 0000000000000000 R12: ffffc900066c1048
R13: 0000000000000041 R14: ffff8880251a8000 R15: ffff888073efe268
FS:  0000000000000000(0000) GS:ffff8880969db000(0063) knlGS:00000000f541db40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000f729ea66 CR3: 0000000051e89000 CR4: 0000000000352ef0


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
