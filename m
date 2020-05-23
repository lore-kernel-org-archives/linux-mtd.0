Return-Path: <SRS0=u3RZ=7F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E693FC433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 23 May 2020 14:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B533A2072C
	for <linux-mtd@archiver.kernel.org>; Sat, 23 May 2020 14:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GNa6J2fM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B533A2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0orqyVD/y8DWI0hBEQKv7gxgmK8Z6tWtOpDr5KccbK0=; b=GNa6J2fMP6dRGn
	7WezJOT7LbL0aE6co0WQrAPUkBHa+C/ntpOXvnmuuTSLckEbv86Gv9rLWl+o7KnhkbZKVhBeTCGj8
	NR6xlCrHsHCOrw8RvD9hioqAToT9lzqr7r2fRavL8N4EK6RoSKSPsAMKmjX+ZBIuB7PfqjU3hr0WH
	hYibfH+A0mGVrXI0MfOVc0YkKIXJUTPz8Yf6x7MYE7qWSZp4t3rXC7ZqfRxL1s3WddG3Y8g2e8cDD
	PgwQM86lqb+lWhVfQT89mD4uki2ZsC9akKXgRgoYjkqwoThbQaGAjnQ7W5ZcT5KJrP5GXgoxGox1t
	MzuXGyXKHpFOFBitDXGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcVH7-0003tm-E9; Sat, 23 May 2020 14:37:21 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcVH2-0003ss-19
 for linux-mtd@lists.infradead.org; Sat, 23 May 2020 14:37:17 +0000
Received: by mail-il1-f199.google.com with SMTP id g13so11239987ild.16
 for <linux-mtd@lists.infradead.org>; Sat, 23 May 2020 07:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=JTLjpJotlBYtj20lijo2JeDWAKa3e3dTd3xmvcIoBYI=;
 b=IyITC+6ikSb0rmkLihHqbvR6f/0aUxfEeQHZsQkwwkxR0kR9rc7Y27yW/K1Bvxwb2T
 oH2L8THmOx7HKosN7ANZqFMvoTTjrzrNDKUnShHdVN2s3kR7TemIihAqFdv7kw63b7Gm
 G+dfuBXhKIF+ylP4q/qNd9U+5oWcyCx+lTBnCUJJGtnoMQ1g88QBEjiXAVzQXCpuOErr
 1aYKaTuUjIG6sNdQ1D609YrJgyGokbbdO7sou4q7CwJpeNFyZGGHvhElf1RoS7EC1FNK
 7C7m3FFtXv+TOdFqAiSyxBaBC2W+JZGghDtjFKITDQl3vnrGSL4SnlLMpZ/JSl8AjtIs
 Zq7g==
X-Gm-Message-State: AOAM533OTBsxa675ysTcPe1lTuwZ9lK6DhpYcRDSEudI15+DGQEzOEP2
 EyB7Ivojp5XH+x1xTlAW6r+jskmNBTCNLtiBTj8KwuTC4JX0
X-Google-Smtp-Source: ABdhPJzmXUW14Bq0SeNAnekAkCASeu/xxBnvKP50jWRGrH4tFotHPrcng9yJ87dXkQYDYPw46RgWRPAWYc5S7kx6l/IAKI/LhPqv
MIME-Version: 1.0
X-Received: by 2002:a02:6649:: with SMTP id l9mr12136458jaf.94.1590244634684; 
 Sat, 23 May 2020 07:37:14 -0700 (PDT)
Date: Sat, 23 May 2020 07:37:14 -0700
In-Reply-To: <000000000000ba47b705a6443a0d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008e6f7b05a651ae10@google.com>
Subject: Re: KASAN: use-after-free Read in uif_close
From: syzbot <syzbot+0ce97ea45b008ba3b8bd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com, 
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200523_073716_073043_E4102C24 
X-CRM114-Status: UNSURE (   5.13  )
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

syzbot has found a reproducer for the following crash on:

HEAD commit:    c11d28ab Add linux-next specific files for 20200522
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=158d1baa100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6dbdea4159fb66
dashboard link: https://syzkaller.appspot.com/bug?extid=0ce97ea45b008ba3b8bd
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14b23f06100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111b0172100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+0ce97ea45b008ba3b8bd@syzkaller.appspotmail.com

ubi0: detaching mtd0
==================================================================
BUG: KASAN: use-after-free in uif_close+0x15e/0x190 drivers/mtd/ubi/build.c:502
Read of size 4 at addr ffff8880a6ff09e8 by task syz-executor247/8078

CPU: 1 PID: 8078 Comm: syz-executor247 Not tainted 5.7.0-rc6-next-20200522-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x413 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 uif_close+0x15e/0x190 drivers/mtd/ubi/build.c:502
 ubi_detach_mtd_dev+0x226/0x432 drivers/mtd/ubi/build.c:1110
 ctrl_cdev_ioctl+0x1bf/0x2b0 drivers/mtd/ubi/cdev.c:1068
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x44af69
Code: e8 7c e6 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 1b 05 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f48c29a8ce8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000006e7a08 RCX: 000000000044af69
RDX: 000000000076006e RSI: 0000000040046f41 RDI: 0000000000000003
RBP: 00000000006e7a00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006e7a0c
R13: 00007ffe9ed2c70f R14: 00007f48c29a99c0 R15: 20c49ba5e353f7cf

Allocated by task 8070:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc mm/kasan/common.c:494 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:467
 kmem_cache_alloc_trace+0x153/0x7d0 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 ubi_attach_mtd_dev+0x2e7/0x27c0 drivers/mtd/ubi/build.c:901
 ctrl_cdev_ioctl+0x229/0x2b0 drivers/mtd/ubi/cdev.c:1043
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

Freed by task 8078:
 save_stack+0x1b/0x40 mm/kasan/common.c:48
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0xf7/0x140 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x109/0x2b0 mm/slab.c:3757
 device_release+0x71/0x200 drivers/base/core.c:1541
 kobject_cleanup lib/kobject.c:701 [inline]
 kobject_release lib/kobject.c:732 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x2f0 lib/kobject.c:749
 cdev_device_del+0x69/0x80 fs/char_dev.c:575
 uif_close+0xea/0x190 drivers/mtd/ubi/build.c:501
 ubi_detach_mtd_dev+0x226/0x432 drivers/mtd/ubi/build.c:1110
 ctrl_cdev_ioctl+0x1bf/0x2b0 drivers/mtd/ubi/cdev.c:1068
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

The buggy address belongs to the object at ffff8880a6ff0000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 2536 bytes inside of
 8192-byte region [ffff8880a6ff0000, ffff8880a6ff2000)
The buggy address belongs to the page:
page:ffffea00029bfc00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 head:ffffea00029bfc00 order:2 compound_mapcount:0 compound_pincount:0
flags: 0xfffe0000010200(slab|head)
raw: 00fffe0000010200 ffffea0002382708 ffffea00028eb008 ffff8880aa0021c0
raw: 0000000000000000 ffff8880a6ff0000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880a6ff0880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880a6ff0900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880a6ff0980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff8880a6ff0a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880a6ff0a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
