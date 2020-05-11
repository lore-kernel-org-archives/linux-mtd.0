Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0022EC54E8E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 18:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA4E20752
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 18:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O9A475Z0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA4E20752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8PCufmiLYwRc9NuqP8UV3KYS8Ij+15h5S5bSgWXU8R4=; b=O9A
	475Z0JAdjnSa7LzAptqOI1MHQ5obxMhLN2/Zqu6sanjvTDOl+KN6eFV2lcLybwDnGCHW2rycTdWeC
	O2fBaCvrsjZcKzjs/80+uBy+ZPMQaIIYOkSmDmLfaD/mz4nUooVc+xE1vzKCfHpCAxd+W8OK0AoWa
	bBrnwpY4lnAxnEA/J0BMidd/1Gx3SLH1HbG5TeTF8KPCDYwAOUfUIqpQCQHUOoIPg3kvxt5q3nz9M
	gR0COBjpZtcmefol9dy7FHqwCSOPpdOADg68bxQyeTcRpOc4Came7oSruLbVE9JnRd4J3anGmC1p8
	88rpntJsjqjYxzNZ+zk1vnz85JADWKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYD3M-0003PQ-Pd; Mon, 11 May 2020 18:21:24 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYD3J-0003Nm-Mn
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 18:21:23 +0000
Received: by mail-io1-f72.google.com with SMTP id g10so10314466iov.20
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 11:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=6IhQVM21jouY7unYnKk8xoX6AewAdvt9Su+siXbvu9Q=;
 b=h5FO55zne8OMnbtvOeNs5MT/878MyAJiwYkWWXy59Fp6VNwoGhJLxV2Pd+cApJemQ3
 Gtz00d+Rzy9o3IyooAuNFhPtP15g/UzBsg5/Mx94uq14Ae8tdxjnNwlRNOVts1poUOV2
 l5mEkAY7Ht1nDSRACLqz52hFbC7WXBfukjPwO6nX6J28ke2mao3v5d89UJ53Ai0IXPH3
 lL5okeDoABr2wEMylY8PIfM3XXhQ9YeBnOC2j5d40vQDS62mGRvWduhjYcWqplQb7t+T
 9ygUw86tWdiry9rb3WAkBZbt+sdZ9uTwS8cXB0r9HyzXMF6TlTuAaNsNjF+Ub5cSuNeC
 Ajdg==
X-Gm-Message-State: AGi0PuZl6kSYYI8LB5zV5LHfxU//JN8L44DaIIOWEgTHmtRDwxbHg7oK
 k7XK0ExlmCHq+J7+E0ANPMCiz+XfEFv67sy/Z3hjCmBIvIqB
X-Google-Smtp-Source: APiQypKk9BzI5bmAuB7bOiRXIisFnD9ZGVqUW1uDSRyhqz1+fyIfPz5wIODV8zkIdpJDFQ2y/MUCPhy8Or0CVm37ApnS21xXNNS+
MIME-Version: 1.0
X-Received: by 2002:a02:3b4b:: with SMTP id i11mr16870119jaf.16.1589221280294; 
 Mon, 11 May 2020 11:21:20 -0700 (PDT)
Date: Mon, 11 May 2020 11:21:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e1accc05a563699e@google.com>
Subject: memory leak in erase_aeb (2)
From: syzbot <syzbot+d9aab50b1154e3d163f5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_112121_747493_1819D0C1 
X-CRM114-Status: UNSURE (   4.20  )
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

HEAD commit:    2ef96a5b Linux 5.7-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1383fd32100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c566cc03357343ce
dashboard link: https://syzkaller.appspot.com/bug?extid=d9aab50b1154e3d163f5
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1166ab14100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d9aab50b1154e3d163f5@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888127f372c0 (size 32):
  comm "syz-executor.0", pid 6931, jiffies 4294945277 (age 14.410s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00  ................
  backtrace:
    [<0000000049aad7d8>] erase_aeb+0x25/0x110 drivers/mtd/ubi/wl.c:1690
    [<000000004a6c95d3>] ubi_wl_init+0x193/0x5c0 drivers/mtd/ubi/wl.c:1757
    [<00000000a1d58128>] ubi_attach+0x611/0x18ba drivers/mtd/ubi/attach.c:1605
    [<00000000eb6b9da4>] ubi_attach_mtd_dev+0x665/0xcc0 drivers/mtd/ubi/build.c:967
    [<000000000a8ebd80>] ctrl_cdev_ioctl+0x144/0x1b0 drivers/mtd/ubi/cdev.c:1043
    [<000000007ada47ea>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<000000007ada47ea>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:771
    [<00000000bd687125>] __do_sys_ioctl fs/ioctl.c:780 [inline]
    [<00000000bd687125>] __se_sys_ioctl fs/ioctl.c:778 [inline]
    [<00000000bd687125>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:778
    [<000000006f0eae66>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:295
    [<00000000eaee3164>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



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
