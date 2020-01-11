Return-Path: <SRS0=phPz=3A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,LONGWORDS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDD3C282DD
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 17:19:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E63942084D
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 17:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rtu1L10r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E63942084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SWiKH/KrXXPRxZjUY6BkikI8Pyulkq3omIaHDjXKWtE=; b=Rtu1L10r1JjlJh
	WdI5ck3rf2EFOMo4xlp/4l99MGLyUhDnuakPI3OON5+kLaG2ejYp80276gkLRi8ekY1t+LubQtMF2
	2ZdvZFT14zYNLoSvYyRIXL9bqtl43K7ps9XIr0aukwV8CUAjMgc1IPSSv4oUYs+yZuHeFxjI6wbDH
	twRRMtiTxCdS3YWiplRkhKPJP9zRDl04wGdx/FEjpMUxKnsZDS/wfjxOpKPaTf+lB1I+9+niuxHDV
	1HLGOH+SP1v7IkxX1BW8HUg6IrXHPcufG+Kbx1HXljrZfSIG0GDI/Ry8ojxRP8wJc2mTwN5YUC7lC
	4aldkEfiayFT/+apDW6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqKPr-0007fi-CX; Sat, 11 Jan 2020 17:19:15 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqKPn-0007fI-Eu
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2020 17:19:13 +0000
Received: by mail-io1-f70.google.com with SMTP id 13so3547504iof.14
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2020 09:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=rOxD20ubENsSvUKR96g4GhYacd9/gWfWmD4fONuaSG0=;
 b=GwtpvN2GYQh+i5eBAwEFI+eDIzqrMXPrE2lzWn4gP9H/kFDAW3KM3dJzUQIxKBOECm
 uPN7wHcDdtgp2al2kzzYdvTlUMDd/d8GIXBjbRUZkqwVMrtiQNkzcHe5qMJ7irfuzJUJ
 QAc6rplpjjrmK5okEcYAKYYrVAOykVeRbzskISadKp+VVztuifiX1JmAMjjDWXLOQiv3
 EoQY+cdi3Genm8hNf0dpNbqV9E/WfRIf123X9LOCMxvhkOxbVwS+XBYDSHsTQuALCxEL
 xsVnlCqKbf6KHWN1xtS8OM9XxlTaUjMTRpQpKhbJG5i6VX+28CtlzNB8CFcFDbZ8nyws
 /Q7g==
X-Gm-Message-State: APjAAAXY/eIHRy6HeOTibzvYbJfRhBuZqZa7d1hu/gNTG5UzK7Up4BH/
 31283CYL05iE6m8sUhC+MijWPXeQheRT80vV+oMa28WAR2rp
X-Google-Smtp-Source: APXvYqxbZH4l1OKZCSVA3wEKraLueKJeidVG10Gfew2kkXB5bcA2+MIjG6lXeleijv5+yLvegBXC/vR4RjNxksi/M7l9sRtVenLv
MIME-Version: 1.0
X-Received: by 2002:a92:906:: with SMTP id y6mr7879438ilg.157.1578763149416;
 Sat, 11 Jan 2020 09:19:09 -0800 (PST)
Date: Sat, 11 Jan 2020 09:19:09 -0800
In-Reply-To: <0000000000006d0a820599366088@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b4acb6059be070c0@google.com>
Subject: Re: memory leak in erase_aeb
From: syzbot <syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_091911_502241_C2A491A6 
X-CRM114-Status: UNSURE (   4.41  )
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

syzbot has found a reproducer for the following crash on:

HEAD commit:    bef1d882 Merge tag 'pstore-v5.5-rc6' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=158a51b9e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e479cb92d5ce3196
dashboard link: https://syzkaller.appspot.com/bug?extid=f317896aae32eb281a58
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=132269e1e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1247d58ee00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f317896aae32eb281a58@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888127cecb00 (size 32):
   comm "syz-executor527", pid 7144, jiffies 4294957528 (age 23.750s)
   hex dump (first 32 bytes):
     00 01 00 00 00 00 ad de 22 01 00 00 00 00 ad de  ........".......
     00 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00  ................
   backtrace:
     [<0000000029f9ef6c>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<0000000029f9ef6c>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<0000000029f9ef6c>] slab_alloc mm/slab.c:3320 [inline]
     [<0000000029f9ef6c>] kmem_cache_alloc+0x13f/0x2c0 mm/slab.c:3484
     [<000000003092c936>] erase_aeb+0x2a/0x100 drivers/mtd/ubi/wl.c:1691
     [<00000000d507b66e>] ubi_wl_init+0x1ae/0x600 drivers/mtd/ubi/wl.c:1758
     [<0000000072e7d762>] ubi_attach+0x665/0x18e7  
drivers/mtd/ubi/attach.c:1605
     [<0000000024d645cb>] ubi_attach_mtd_dev+0x5b3/0xd40  
drivers/mtd/ubi/build.c:946
     [<00000000e6600cef>] ctrl_cdev_ioctl+0x149/0x1c0  
drivers/mtd/ubi/cdev.c:1043
     [<000000001253992f>] vfs_ioctl fs/ioctl.c:47 [inline]
     [<000000001253992f>] file_ioctl fs/ioctl.c:545 [inline]
     [<000000001253992f>] do_vfs_ioctl+0x551/0x890 fs/ioctl.c:732
     [<00000000c49e8c94>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:749
     [<00000000261db07c>] __do_sys_ioctl fs/ioctl.c:756 [inline]
     [<00000000261db07c>] __se_sys_ioctl fs/ioctl.c:754 [inline]
     [<00000000261db07c>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:754
     [<000000004f01dc3e>] do_syscall_64+0x73/0x220  
arch/x86/entry/common.c:294
     [<000000002de81d29>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888127cecb00 (size 32):
   comm "syz-executor527", pid 7144, jiffies 4294957528 (age 26.350s)
   hex dump (first 32 bytes):
     00 01 00 00 00 00 ad de 22 01 00 00 00 00 ad de  ........".......
     00 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00  ................
   backtrace:
     [<0000000029f9ef6c>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<0000000029f9ef6c>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<0000000029f9ef6c>] slab_alloc mm/slab.c:3320 [inline]
     [<0000000029f9ef6c>] kmem_cache_alloc+0x13f/0x2c0 mm/slab.c:3484
     [<000000003092c936>] erase_aeb+0x2a/0x100 drivers/mtd/ubi/wl.c:1691
     [<00000000d507b66e>] ubi_wl_init+0x1ae/0x600 drivers/mtd/ubi/wl.c:1758
     [<0000000072e7d762>] ubi_attach+0x665/0x18e7  
drivers/mtd/ubi/attach.c:1605
     [<0000000024d645cb>] ubi_attach_mtd_dev+0x5b3/0xd40  
drivers/mtd/ubi/build.c:946
     [<00000000e6600cef>] ctrl_cdev_ioctl+0x149/0x1c0  
drivers/mtd/ubi/cdev.c:1043
     [<000000001253992f>] vfs_ioctl fs/ioctl.c:47 [inline]
     [<000000001253992f>] file_ioctl fs/ioctl.c:545 [inline]
     [<000000001253992f>] do_vfs_ioctl+0x551/0x890 fs/ioctl.c:732
     [<00000000c49e8c94>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:749
     [<00000000261db07c>] __do_sys_ioctl fs/ioctl.c:756 [inline]
     [<00000000261db07c>] __se_sys_ioctl fs/ioctl.c:754 [inline]
     [<00000000261db07c>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:754
     [<000000004f01dc3e>] do_syscall_64+0x73/0x220  
arch/x86/entry/common.c:294
     [<000000002de81d29>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888127cecb00 (size 32):
   comm "syz-executor527", pid 7144, jiffies 4294957528 (age 32.820s)
   hex dump (first 32 bytes):
     00 01 00 00 00 00 ad de 22 01 00 00 00 00 ad de  ........".......
     00 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00  ................
   backtrace:
     [<0000000029f9ef6c>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<0000000029f9ef6c>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<0000000029f9ef6c>] slab_alloc mm/slab.c:3320 [inline]
     [<0000000029f9ef6c>] kmem_cache_alloc+0x13f/0x2c0 mm/slab.c:3484
     [<000000003092c936>] erase_aeb+0x2a/0x100 drivers/mtd/ubi/wl.c:1691
     [<00000000d507b66e>] ubi_wl_init+0x1ae/0x600 drivers/mtd/ubi/wl.c:1758
     [<0000000072e7d762>] ubi_attach+0x665/0x18e7  
drivers/mtd/ubi/attach.c:1605
     [<0000000024d645cb>] ubi_attach_mtd_dev+0x5b3/0xd40  
drivers/mtd/ubi/build.c:946
     [<00000000e6600cef>] ctrl_cdev_ioctl+0x149/0x1c0  
drivers/mtd/ubi/cdev.c:1043
     [<000000001253992f>] vfs_ioctl fs/ioctl.c:47 [inline]
     [<000000001253992f>] file_ioctl fs/ioctl.c:545 [inline]
     [<000000001253992f>] do_vfs_ioctl+0x551/0x890 fs/ioctl.c:732
     [<00000000c49e8c94>] ksys_ioctl+0x86/0xb0 fs/ioctl.c:749
     [<00000000261db07c>] __do_sys_ioctl fs/ioctl.c:756 [inline]
     [<00000000261db07c>] __se_sys_ioctl fs/ioctl.c:754 [inline]
     [<00000000261db07c>] __x64_sys_ioctl+0x1e/0x30 fs/ioctl.c:754
     [<000000004f01dc3e>] do_syscall_64+0x73/0x220  
arch/x86/entry/common.c:294
     [<000000002de81d29>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

executing program
executing program
executing program
executing program
executing program


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
