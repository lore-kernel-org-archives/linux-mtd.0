Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23126C43463
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 10:03:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C432821D7A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 10:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IfKDXMcO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C432821D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+jY/aaXv9gmfwPFibyj4g2iHTjLQDKferJ2Z+nMWpQ=; b=IfKDXMcO8xc3qoY89Va+s+BD2L
	E7XPIKFq67lbK283PT6eYwygDSSG3fkGOELDcB9YXRcvGL+2OSCXtFY5+qIXY9o5f19Q5XZuy4HNk
	bokOo37TJozoPw4IAdZ8WFV4NndFiBXT6rf2YLN6bSP+DJ0epaaapJqMnGBivX9RDX31kn/YC7foe
	rPGxOpP32Ymn11vS03IyvU6IxoYeLQYKOVBQtZI/k529Q/Dt9Gnjbp+Yy9mSMV+EMHg+K5Q++D2T+
	7XeBXTxtGtZl+Awp0ol3nUNNk02hT9HxOXHjsBzrVa8CNXRCP2VspyC1JflRgMB2SYPejlSMMHiUw
	g32vgBVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKIeV-0004Y1-5E; Mon, 21 Sep 2020 10:02:31 +0000
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKIeN-0004Wv-Hx
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 10:02:24 +0000
Received: by mail-il1-f208.google.com with SMTP id v5so186352ilj.20
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2020 03:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=878X+MokR+ZbeqJGJQNq7QDLXnpG5EMYsQ8wF9gEG6g=;
 b=A1LvJKROr1hZK8ff8rvQdc+GLhodSyzpn9CzIIL2IJCsN7AdKCVuDSICge+Aa8PXoC
 zKkoFmqOzw8EFSD/l1o7aMNFMj1n0pu5wV3lrrFnA0iKMwb9F8YW1XTQCsg3cp5fO2Nq
 KQvZr8Kdzf1Tag//0RWxsCawyme7sDMkDez4jYcYZD06ZttFNg3UePZuDf9wrYge6kVU
 piNQVjVBT3CQZBuUPmLMyWhEy9J3wE6caaqpALP7nNgYd+GgcPYneIWMqMZzw6/Z6fAR
 X1ZO177apczOxZDvSaxCspy0pKrpiPnX0gkWvHdAdcJtnj1XcgmmHWMt/E6Ok9ETz77W
 ++7A==
X-Gm-Message-State: AOAM533aR+xoZain1OVLOSzUCAehGmApe70qmoQ9vKXP3NC1L0ow0OHF
 QrPsvvYWNpQxyvFJ8MERyzOh3mUd+pVT0UsAcJ9KwDfUPQPs
X-Google-Smtp-Source: ABdhPJy77SpanDAhaUD564y+kfir5vkWynL2iO3uzcCnBbobRoCMtMVM2wLANCqpTZo8HnFv9DEsyoW2UKTNcmOMcsiqIT+5iXiI
MIME-Version: 1.0
X-Received: by 2002:a6b:3e84:: with SMTP id
 l126mr35372373ioa.118.1600682541024; 
 Mon, 21 Sep 2020 03:02:21 -0700 (PDT)
Date: Mon, 21 Sep 2020 03:02:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000418c7705afcff2e1@google.com>
Subject: general protection fault in jffs2_parse_param
From: syzbot <syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com>
To: dhowells@redhat.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, richard@nod.at, sandeen@sandeen.net, 
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_060223_596238_C75F4F8B 
X-CRM114-Status: UNSURE (   7.81  )
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

syzbot found the following issue on:

HEAD commit:    325d0eab Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12acb307900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b12e84189082991c
dashboard link: https://syzkaller.appspot.com/bug?extid=9765367bb86a19d38732
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175909d9900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179b3cc3900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 PID: 6866 Comm: syz-executor202 Not tainted 5.9.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:jffs2_parse_param+0x141/0x330 fs/jffs2/super.c:206
Code: 48 c1 ea 03 4d 63 fc 80 3c 02 00 0f 85 de 01 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b 75 00 49 8d 7e 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 c8 01 00 00 4d 8b 76 08 4c 89 ff 4c 89 f6 e8 d6
RSP: 0018:ffffc90001087b78 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff8880932c9c00 RCX: ffffffff82882084
RDX: 0000000000000001 RSI: ffffffff82882096 RDI: 0000000000000008
RBP: 1ffff92000210f6f R08: 0000000000000001 R09: 0000000000000003
R10: 00000000003fffff R11: 0000000000000000 R12: 0000000000000000
R13: ffff88808de2a000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000002198880(0000) GS:ffff8880ae500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043e830 CR3: 00000000a11a3000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 vfs_parse_fs_param fs/fs_context.c:117 [inline]
 vfs_parse_fs_param+0x203/0x550 fs/fs_context.c:98
 vfs_parse_fs_string+0xe6/0x150 fs/fs_context.c:161
 generic_parse_monolithic+0x16f/0x1f0 fs/fs_context.c:201
 do_new_mount fs/namespace.c:2871 [inline]
 path_mount+0x133f/0x20a0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x44699a
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 7d ae fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 5a ae fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffc381bf788 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffc381bf7d0 RCX: 000000000044699a
RDX: 0000000020001300 RSI: 0000000020001340 RDI: 0000000000000000
RBP: 0000000000000000 R08: 00007ffc381bf7d0 R09: 0000000000000014
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401c80
R13: 0000000000401d10 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace 9cf0f624124bffcb ]---
RIP: 0010:jffs2_parse_param+0x141/0x330 fs/jffs2/super.c:206
Code: 48 c1 ea 03 4d 63 fc 80 3c 02 00 0f 85 de 01 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b 75 00 49 8d 7e 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 c8 01 00 00 4d 8b 76 08 4c 89 ff 4c 89 f6 e8 d6
RSP: 0018:ffffc90001087b78 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff8880932c9c00 RCX: ffffffff82882084
RDX: 0000000000000001 RSI: ffffffff82882096 RDI: 0000000000000008
RBP: 1ffff92000210f6f R08: 0000000000000001 R09: 0000000000000003
R10: 00000000003fffff R11: 0000000000000000 R12: 0000000000000000
R13: ffff88808de2a000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000002198880(0000) GS:ffff8880ae500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043e830 CR3: 00000000a11a3000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
