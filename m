Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CCEC79F85
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Sep 2026 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HeyMVfwjIUNseV15sRr8yeDAwN4WpaH3uF97QATb4Ro=; b=XEh
	rCp4GGpHBjVzTLQQ0kjxz6sevk91k3Qhk908NKar568vfOoeJ+iyj0YJPy1EaxxTBD4Nvxi8mc+qQ
	HuD/lhkcxFO7l1VM0bMnaPrpQs2BRFnnQRXaS/o8tKALvRaw2EEY7p3pmG34BhlaFU5jnVKy1amCa
	8H2UZoTBnVIwZdMOWSFbvR8UCRui9pX6hHXhvuviTLstq8LjI+ayBj6Dz9fHCRvZgW4ltScOaesmJ
	91pyIqqzlqXWRdfooc5AAQT6Qu+qp25AdOKKMb7u+7wm4LagtjtTSWFA+s1NkcGAelcT07skGFKsU
	o57PaDyhpnHP6C7UZCE0Ogyj+QeLTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Bhi-000000050kg-2OUG;
	Sun, 06 Sep 2026 12:10:34 +0000
Received: from mail-oo2-f7.google.com ([74.125.231.135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Bhg-000000050kL-0dEH
	for linux-mtd@lists.infradead.org;
	Sun, 06 Sep 2026 12:10:33 +0000
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-6b1bebb3ae8so787644eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 05:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788696630; x=1789301430;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uodVNUfbRag88I5mELNLKqMsw2oq6XnMsWbte6N9A3A=;
        b=Iih0TDKqiwquB3iHsFnOfyztShMr+/cWfj/rL3o3tkHF7sTi9gkIthB94PxUcnHz8Y
         9iOAU1fU6I3Kv5NkLDVG0Vg3fgrY+hrqEDPEsCLXAqiiXp10poQJP9vncaA7SQ5XvTIp
         Gb8K8qGH5BxxhJohNuDXgABN0QYnSfweKDe272MsyIZwtBJnfeLzGmIJRBRQnkPTZW+p
         yVwF4CaVDM33IRDQRMtH3RY1XLQtTsDTuukIn3UxxPVYBx6btB18jxdh386tpmPBuPkK
         EWkPETEo/cxdzyns7VweG2ahT7qm9ODIqyPtdBTjjL8nwNjbBIm70rBLZudMJ+wYyOzI
         JQIw==
X-Forwarded-Encrypted: i=1; AKwUvBwkLDiWbW09gQyH6AjiC25QW48MSBwSVO93Fa36OyZ1S8C7Y0d5sjDDqynOO35eyGSIDJoIl91anMM=@lists.infradead.org
X-Gm-Message-State: AFuF++mh91PVzGKTEMwV/+N08uOU8jcwCeQYV+lN4C8BAFfeoe4GRqmQ
	ZhMYPaHxHY4UUOMHobGejknu5+o8LP4yZNXPxkkKAilqsgIkpui8tsVSAuffmKFbEe2HfBicNHf
	OPXdIhxS/2R4G7W3EHtKsyUTXNu2TJMf+/cbXh4tjd6kWHhe+fKT/9nBe3ho=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae7:b0:6b6:71f7:ecbe with SMTP id
 006d021491bc7-6b6fdfb58dfmr16537320eaf.18.1788696630381; Sun, 06 Sep 2026
 05:10:30 -0700 (PDT)
Date: Sun, 06 Sep 2026 05:10:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9d5836.a5e650b3.26d8a.001a.GAE@google.com>
Subject: [syzbot] [jffs2?] kernel BUG in jffs2_sum_write_sumnode (2)
From: syzbot <syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_051032_200994_425CA726 
X-CRM114-Status: UNSURE (   8.58  )
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

HEAD commit:    89a312991dc6 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10266f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
dashboard link: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8722ccd64272/disk-89a31299.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bb121ca607c4/vmlinux-89a31299.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e8f64808c5e/bzImage-89a31299.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com

jffs2: warning: (10801) jffs2_sum_write_sumnode: Empty summary info!!!
------------[ cut here ]------------
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:868!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 10801 Comm: syz.9.661 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 00 76 33 8c 48 c7 c7 00 72 33 8c e8 cd 73 f8 ff 90 <0f> 0b e8 45 f9 e1 00 65 4c 8b 3d 65 1a 62 13 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc90003a56d90 EFLAGS: 00010282
RAX: 0000000000000046 RBX: ffff8880375f8000 RCX: 0000000000000000
RDX: 0000000000000046 RSI: ffffffff81e9c5d9 RDI: fffff5200074ada3
RBP: ffffc90003a56f10 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807e062a00
R13: 0000000000000000 R14: 0000000000000f40 R15: 0000000000000000
FS:  00007f34bbf8d6c0(0000) GS:ffff888123b61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557616249078 CR3: 0000000074bae000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 jffs2_do_reserve_space+0xb94/0xf70 fs/jffs2/nodemgmt.c:392
 jffs2_reserve_space_gc+0x6b/0xf0 fs/jffs2/nodemgmt.c:226
 jffs2_garbage_collect_pristine+0x103/0x870 fs/jffs2/gc.c:613
 jffs2_garbage_collect_live+0x1471/0x36b0 fs/jffs2/gc.c:546
 jffs2_garbage_collect_pass+0xb28/0x1b40 fs/jffs2/gc.c:464
 jffs2_reserve_space+0x489/0xbb0 fs/jffs2/nodemgmt.c:171
 jffs2_write_inode_range+0x275/0xb80 fs/jffs2/write.c:362
 jffs2_write_end+0x72c/0xea0 fs/jffs2/file.c:299
 generic_perform_write+0x513/0xa40 mm/filemap.c:4395
 __generic_file_write_iter+0x1f7/0x240 mm/filemap.c:4491
 generic_file_write_iter+0xe1/0x390 mm/filemap.c:4517
 iter_file_splice_write+0x830/0x10b0 fs/splice.c:736
 do_splice_from fs/splice.c:936 [inline]
 direct_splice_actor+0x192/0x690 fs/splice.c:1159
 splice_direct_to_actor+0x345/0xa30 fs/splice.c:1103
 do_splice_direct_actor fs/splice.c:1202 [inline]
 do_splice_direct+0x174/0x240 fs/splice.c:1228
 do_sendfile+0xadc/0xe20 fs/read_write.c:1371
 __do_sys_sendfile64 fs/read_write.c:1432 [inline]
 __se_sys_sendfile64 fs/read_write.c:1418 [inline]
 __x64_sys_sendfile64+0x1d8/0x220 fs/read_write.c:1418
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f34bb19e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f34bbf8d028 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f34bb426090 RCX: 00007f34bb19e159
RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000009
RBP: 00007f34bb235024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000020000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f34bb426128 R14: 00007f34bb426090 R15: 00007ffc4299d258
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:jffs2_sum_write_sumnode.cold+0x4e/0x174 fs/jffs2/summary.c:868
Code: 0f b6 04 02 84 c0 74 08 3c 03 0f 8e 2c 01 00 00 8b b3 40 06 00 00 48 c7 c2 00 76 33 8c 48 c7 c7 00 72 33 8c e8 cd 73 f8 ff 90 <0f> 0b e8 45 f9 e1 00 65 4c 8b 3d 65 1a 62 13 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc90003a56d90 EFLAGS: 00010282
RAX: 0000000000000046 RBX: ffff8880375f8000 RCX: 0000000000000000
RDX: 0000000000000046 RSI: ffffffff81e9c5d9 RDI: fffff5200074ada3
RBP: ffffc90003a56f10 R08: 0000000000000007 R09: 0000000000000000
R10: 8000000000000000 R11: 0000000000000001 R12: ffff88807e062a00
R13: 0000000000000000 R14: 0000000000000f40 R15: 0000000000000000
FS:  00007f34bbf8d6c0(0000) GS:ffff888123c61000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe398fd0000 CR3: 0000000074bae000 CR4: 0000000000350ef0


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
