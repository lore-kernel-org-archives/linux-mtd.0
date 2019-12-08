Return-Path: <SRS0=+JRa=Z6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC274C43603
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2019 19:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EBC20692
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2019 19:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EzHL8Tbk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1EBC20692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wKqr74Rg+AYOEjWM+yojgQS35uGCCZNw6zvbGnlQz0s=; b=EzHL8Tbke3xbmd
	CZm/fD9CGEbU/li7yheUP7GneUAWnXiOe3oxc5B7VMXp1rvM3e4rsSk5z2yimkGjTrXmaXNk7zU05
	cNgOmQSEeqaYA0S7cDGoSzxD+oFuimh3UUhyzMKy8+0Jf9Z5ZZftbNO5MrMmLB+UEDlhBX2cuqqyt
	f0gPAPQoisukYpAGPQLN+rUN9i1ncgR01uIlFPZUPo/SgvXifWiyatGxDYG+5PO/oxgJdDaMBYveO
	bxn0wcl7XMXfDEk/pxvxmvmQPtI5K9e+qWVsiS/mHDICJAD9g5tLZ7W0pK7ZTBt4jbp7MdxebI/6t
	oVTWRfbOiiK/GzBym87Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie2Kp-0006Yj-DJ; Sun, 08 Dec 2019 19:35:15 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie2Km-0006SH-Lu
 for linux-mtd@lists.infradead.org; Sun, 08 Dec 2019 19:35:14 +0000
Received: by mail-io1-f69.google.com with SMTP id z21so9194616iob.22
 for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2019 11:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=gvAQ4NfvnOeIg1SkBSm6bTwN9I84q20C3o5MLaZUt60=;
 b=GEvcrlE0ONiJ9+uAxrL8dlWQKMXt52z4KVMktigvVDnhRiUtElJWJGg2yzKcPJdOT1
 tsKt7HXMlb4riA2bW/TfwLmcz3s0Yb9c4QfWmuHig2E6HyIE22TaVu9DGtkmST44GEHB
 TBfkGEvKqNsZxqCKmRfcUzX+ywIIhZJ5Ng8rOeaj9pg+runcCOjzYrKcte9XfaXyIDQU
 r5SqLihXB3vorBcgiRPnLx+BOvjtAMnZDiUM1Izw47l1xKZP9G63jFUNJOSxPQ3h/VnJ
 Zif5lE05wS/1waHmnvaGAg2uneekAESQi8u/kGkrmw63c9vSWQoR6bv8Xf1M5+wtupp3
 MIGQ==
X-Gm-Message-State: APjAAAUCe9ZpYXa8dXdScN1in1CiOTtUoimyP3cEn1TSzLcka9/nJFO4
 lMVCernrkhZvYWcclGD28UrIHl2EFw9DtPXTqbLQal/Y6cPD
X-Google-Smtp-Source: APXvYqxpTAdjbwjwSyRrxHPnqf9fVl+0mX9ZKt0gKVJ9KuSJgBDpf5vT2xdqhaI+qdoIZM21SB8m78X/n87umw67yYCv/DrVR108
MIME-Version: 1.0
X-Received: by 2002:a02:ccb9:: with SMTP id t25mr11790800jap.82.1575833708592; 
 Sun, 08 Dec 2019 11:35:08 -0800 (PST)
Date: Sun, 08 Dec 2019 11:35:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006d0a820599366088@google.com>
Subject: memory leak in erase_aeb
From: syzbot <syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_113512_716012_105736A2 
X-CRM114-Status: UNSURE (   3.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

syzbot found the following crash on:

HEAD commit:    ad910e36 pipe: fix poll/select race introduced by the pipe..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16080232e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3beca47aecbf4a9c
dashboard link: https://syzkaller.appspot.com/bug?extid=f317896aae32eb281a58
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14b527f2e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881225039a0 (size 32):
   comm "syz-executor.0", pid 7318, jiffies 4294950453 (age 8.280s)
   hex dump (first 32 bytes):
     00 00 00 00 03 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00  ................
   backtrace:
     [<000000003a9d0e7e>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<000000003a9d0e7e>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<000000003a9d0e7e>] slab_alloc mm/slab.c:3320 [inline]
     [<000000003a9d0e7e>] kmem_cache_alloc+0x13f/0x2c0 mm/slab.c:3484
     [<00000000b53dfd0a>] erase_aeb+0x2a/0x100 drivers/mtd/ubi/wl.c:1691
     [<000000005ccfba82>] ubi_wl_init+0x1ae/0x600 drivers/mtd/ubi/wl.c:1758
     [<000000002350928f>] ubi_attach+0x665/0x18e7  
drivers/mtd/ubi/attach.c:1605
     [<0000000055aac88b>] ubi_attach_mtd_dev+0x5b3/0xd40  
drivers/mtd/ubi/build.c:946
     [<00000000071dc178>] ctrl_cdev_ioctl+0x149/0x1c0  
drivers/mtd/ubi/cdev.c:1043
     [<000000004c359338>] vfs_ioctl fs/ioctl.c:47 [inline]
     [<000000004c359338>] file_ioctl fs/ioctl.c:545 [inline]
     [<000000004c359338>] do_vfs_ioctl+0x551/0x890 fs/ioctl.c:732
     [<000000002f3b4a0e>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:749
     [<0000000071dee951>] __do_sys_ioctl fs/ioctl.c:756 [inline]
     [<0000000071dee951>] __se_sys_ioctl fs/ioctl.c:754 [inline]
     [<0000000071dee951>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:754
     [<0000000069d4ede5>] do_syscall_64+0x73/0x220  
arch/x86/entry/common.c:294
     [<000000001a44675f>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



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
