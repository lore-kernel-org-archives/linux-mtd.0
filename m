Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F9CCF2C4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ZhMPPUJCsrhW5ogDhl5rgQaedV+VhtiEvM+QikKHL/M=; b=FvA
	WbmszHAARDLGJUlRsY51WzToAeIhhUnX8iaLsoKa+CuxmSnXWaErfVjai5vdtcs/6cCYYP/V7bfBV
	BPIwG11ggmHB1qmd8JEPvsicRLQOhxgK/ORLFnHTGMbqT+HZRBIHEcN62HMTsS5Lf9IrDBhB04u1Z
	/NsHInfnQj+nLPMql61lFOe03Vh8xCU7NgheOsKWPORgCsTO8o0ZYKiZCIxkwdcC1ZbmNdquFMQdB
	W+9qMBUhOYbzubfkU4Nupcv1NOzKps58hlxZ9aVxkSEJWmimTWnPTIvqYHsV3wNQJr0/sIkhiCSFV
	5xx0ZsyRHOGRjkhfXAuLibBUmFhlqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIBRK-00000005ESx-2Gsg;
	Sat, 17 Oct 2026 20:55:38 +0000
Received: from mail-ot1-f70.google.com ([209.85.210.70])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIBRI-00000005EST-26jB
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 20:55:37 +0000
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-843c6807307so1614763a34.3
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 13:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792270535; x=1792875335;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkCz3HCYfdF/OoT6Q+24x/6yDact+rY8x9IzAwYTBKY=;
        b=PcRdFLWoQuJ+pZEFxtntAIxz9mE8IBsFMkgOmauU41TFovVidP17Ek/CPOBEscL50k
         wKo2nQqhOkjgYs3nURj0qy4ZXIC21+vIxcTMx1lbHs+z9MX9XgtCPMfBTvS/2Bmhtt2g
         Cb6DtKhcXDF2EfHZcifMfBGJadEUJ8fugaggn7+GBr2UPeDbClB3y94+DHbdcXHZZBiv
         fuM10YvelPjJ/lFX+aqmefFjJgsvZ0jLeyFoyw+ZZdhTtRohju9LLcRizScP5TZVAsgX
         lF/bLyLKffS50o3VnHI0w3y2p06vxpqMwkNHXtvSpZw90vdQgs2ik2obWfBj0YoxSwnK
         1tbg==
X-Forwarded-Encrypted: i=1; AKwUvBxmFfLHwPfxaAnbgPoWnZcQESMa8BA+G0eM4CcsERcVtxhfDFtEX+QJ/spDZWjhvrZryuYs5CGhRz4=@lists.infradead.org
X-Gm-Message-State: AFq9FYI91WRn5gVt32RuZT0/hDJgE3bTMZbAkJz5y3W9/+TyvakkCMPZ
	0PMQG3CE7fAS2c15qQPw/ag01EMo8+bZCJBpSpyIjTZO/zRJWz3DoS4lOLvXX9u8vzjUa5OZxqJ
	PE/P4fWzYvk+t764WOs5SehZM0jbmlX3oa8cCyzDdIqlFhX2b4mQoOZE4xOs=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c93:b0:4e8:2150:2a1 with SMTP id
 5614622812f47-53cd63c1741mr2497986b6e.68.1792270534947; Sat, 17 Oct 2026
 13:55:34 -0700 (PDT)
Date: Sat, 17 Oct 2026 13:55:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad3e0c6.a6d1a155.34a93f.004a.GAE@google.com>
Subject: [syzbot] [mtd?] memory leak in phram_setup
From: syzbot <syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com>
To: joern@lazybastard.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_135536_558988_73A7D9D5 
X-CRM114-Status: UNSURE (   5.21  )
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

HEAD commit:    24a19b953e2a Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15a128a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eeccc827207f48ec
dashboard link: https://syzkaller.appspot.com/bug?extid=c9d8bc9f8ccc03799e1f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110d73d1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1025968e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0f1e259089c6/disk-24a19b95.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6b65050296a3/vmlinux-24a19b95.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cb73ff77ea56/bzImage-24a19b95.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810afde7f8 (size 8):
  comm "syz.0.17", pid 5903, jiffies 4294943995
  hex dump (first 8 bytes):
    70 30 00 00 00 00 00 00                          p0......
  backtrace (crc 43334c2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_node_track_caller_noprof+0x40d/0x560 mm/slub.c:5545
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    parse_name drivers/mtd/devices/phram.c:224 [inline]
    phram_setup+0x1c2/0x360 drivers/mtd/devices/phram.c:286
    phram_param_call+0xe4/0x110 drivers/mtd/devices/phram.c:349
    param_attr_store+0x99/0x130 kernel/params.c:591
    module_attr_store+0x3d/0x60 kernel/params.c:906
    sysfs_kf_write+0x94/0xb0 fs/sysfs/file.c:145
    kernfs_fop_write_iter+0x1f1/0x2d0 fs/kernfs/file.c:345
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810afdebe8 (size 8):
  comm "syz.0.18", pid 5905, jiffies 4294943995
  hex dump (first 8 bytes):
    70 30 00 00 00 00 00 00                          p0......
  backtrace (crc 43334c2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_node_track_caller_noprof+0x40d/0x560 mm/slub.c:5545
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    parse_name drivers/mtd/devices/phram.c:224 [inline]
    phram_setup+0x1c2/0x360 drivers/mtd/devices/phram.c:286
    phram_param_call+0xe4/0x110 drivers/mtd/devices/phram.c:349
    param_attr_store+0x99/0x130 kernel/params.c:591
    module_attr_store+0x3d/0x60 kernel/params.c:906
    sysfs_kf_write+0x94/0xb0 fs/sysfs/file.c:145
    kernfs_fop_write_iter+0x1f1/0x2d0 fs/kernfs/file.c:345
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810afde5b8 (size 8):
  comm "syz.0.19", pid 5908, jiffies 4294943996
  hex dump (first 8 bytes):
    70 30 00 00 00 00 00 00                          p0......
  backtrace (crc 43334c2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4696 [inline]
    slab_alloc_node mm/slub.c:4996 [inline]
    __do_kmalloc_node mm/slub.c:5413 [inline]
    __kmalloc_node_track_caller_noprof+0x40d/0x560 mm/slub.c:5545
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    parse_name drivers/mtd/devices/phram.c:224 [inline]
    phram_setup+0x1c2/0x360 drivers/mtd/devices/phram.c:286
    phram_param_call+0xe4/0x110 drivers/mtd/devices/phram.c:349
    param_attr_store+0x99/0x130 kernel/params.c:591
    module_attr_store+0x3d/0x60 kernel/params.c:906
    sysfs_kf_write+0x94/0xb0 fs/sysfs/file.c:145
    kernfs_fop_write_iter+0x1f1/0x2d0 fs/kernfs/file.c:345
    new_sync_write fs/read_write.c:595 [inline]
    vfs_write+0x3ae/0x720 fs/read_write.c:687
    ksys_write+0xa5/0x170 fs/read_write.c:739
    do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
