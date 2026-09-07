Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43246C79FA0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 20:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YWJBfOMLj8+Juzp6m5NNhir9eW3AJsLkItUcDW/vAMg=; b=k3qiVoowHQsItH
	xB3+E5gdHX/1vi/3ot/A3QCPo/nfraukGWM4IXxfOF1eNrK0Nar+Tod0hKGZzVpnDtKelLKnp2YL5
	eXQiJ8D9QbEz2PUmO/3FB5BWKOdbKii1z+IUIAnTgm2V17u5ofTbCzXBcZ10pbU++pNQQeC5CyDvi
	aMEcqF83GNMXUiI7vLG4VlYydlx5iE8GVAjuhkvvAogsBcEKVX690t3w3OJVrgIY7FBHja10grfRp
	R6A0Ft/A43UV4VJhtAM+NfEfJt5s11dr9i8cdbMiKopQEFzvQQ1wxrhdCZPIEyZDRZH1Gc+m7yGc/
	sC/Dd3cZpNFQwbEeEFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fju-00000007gYx-0dtH;
	Mon, 07 Sep 2026 20:14:50 +0000
Received: from mail-oo2-f0.google.com ([74.125.231.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fjq-00000007gYc-0LeM
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 20:14:47 +0000
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-6a3900cb2b5so1581308eaf.0
        for <linux-mtd@lists.infradead.org>; Mon, 07 Sep 2026 13:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812084; x=1789416884;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KhEdS9RlguF9ZCBAEbbv2+cYvXUAPXxzyDvBl5gFfyo=;
        b=rJA/IUJvR4lIgebW6/WJnQ0yb6vxOomP/ByrsvBU8JRx4LJWZXPXMddQoKws3YEZ1w
         AUdUP7yXcVvJ/xqSbwPemCE+3xEHlSdYH/+XvM0l+rTL8bzTegtT1Roc7Rq9SkuF49al
         bXbRYt+N/I1twAH8EMHxp4ofbu5dszDmC1SsJjnTYWCde2kwFm4rBoK2brlDne8rGsAc
         09fgg11PF5I9AVRwtOOJvboJs9LVDSmAl8wIp5yeUUEPU1HaWVBQ5jCLataw+8Jj3TAR
         gD/13CJXdYyKnq/2nvzVw90QD91tWO3XaWmHWy9uBy9xb1AeKQagZL3Eq/pG95BWOp+U
         7cag==
X-Forwarded-Encrypted: i=1; AKwUvBx+tqroCWHLzsmZDiyVJv2S9qFXpUE9GCaVZofWMQ1286pkI0E3C9jyQ+ZsNsexANaaf3uBAbH1Qhw=@lists.infradead.org
X-Gm-Message-State: AFuF++mNUM4s0pUteJLQPwe6O0flHv/J6LlnMzasOZxNoeZG6sjZALw8
	BBTiPvuIEMRcsMzfNWaKYwd9gBfDfca3BslzibNZi9WZjwF5BipC81riPFtzA5mTF2wWI4jADNu
	ITYhUd4UGL9p5g/fKgH1lsRET2F34MmTp5o4AzGdoMMLvBabevHhTNptMDUs=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c87:b0:6b3:6920:4ca0 with SMTP id
 006d021491bc7-6b6fabe1ff3mr13779461eaf.9.1788812084157; Mon, 07 Sep 2026
 13:14:44 -0700 (PDT)
Date: Mon, 07 Sep 2026 13:14:44 -0700
In-Reply-To: <6a752024.b50370da.49fe0.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f1b34.2bb5a69c.24b23c.000b.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] possible deadlock in jffs2_do_clear_inode (2)
From: syzbot <syzbot+743079a09058321247d8@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_131446_163112_3022786B 
X-CRM114-Status: UNSURE (   6.17  )
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

HEAD commit:    df2908090cda Linux 7.3-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17c4f8d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=743079a09058321247d8
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14824601580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-df290809.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a500bcdb2c4d/vmlinux-df290809.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2b5c3e1aefa2/bzImage-df290809.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+743079a09058321247d8@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/113 is trying to acquire lock:
ffff8880139810e0 (&f->sem){+.+.}-{4:4}, at: jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419

but task is already holding lock:
ffffffff8efc9860 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0xc4/0x100 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4636 [inline]
       slab_alloc_node mm/slub.c:4974 [inline]
       kmem_cache_alloc_noprof+0x63/0x6a0 mm/slub.c:5010
       jffs2_do_read_inode+0x307/0x520 fs/jffs2/readinode.c:1372
       jffs2_iget+0x32b/0xe30 fs/jffs2/fs.c:277
       jffs2_do_fill_super+0x44b/0xa50 fs/jffs2/fs.c:578
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

-> #0 (&f->sem){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419
       evict+0x3c2/0xad0 fs/inode.c:822
       dispose_list+0x117/0x1e0 fs/inode.c:864
       prune_icache_sb+0xea/0x150 fs/inode.c:1011
       super_cache_scan+0x3ac/0x5c0 fs/super.c:240
       do_shrink_slab+0x416/0x1200 mm/shrinker.c:443
       shrink_slab_memcg mm/shrinker.c:560 [inline]
       shrink_slab+0xa82/0x12e0 mm/shrinker.c:638
       shrink_one+0x398/0x850 mm/vmscan.c:5119
       shrink_many mm/vmscan.c:5180 [inline]
       lru_gen_shrink_node mm/vmscan.c:5258 [inline]
       shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
       kswapd_shrink_node mm/vmscan.c:7101 [inline]
       balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
       kswapd+0x556/0xb50 mm/vmscan.c:7555
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&f->sem);
                               lock(fs_reclaim);
  lock(&f->sem);

 *** DEADLOCK ***

locks held by kswapd0/113: 2, last CPU#3:
 #0: ffffffff8efc9860 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0xbce/0x1f00 mm/vmscan.c:7292
 #1: ffff88806bdce0e8 (&type->s_umount_key#59){++++}-{4:4}, at: super_trylock_shared fs/super.c:688 [inline]
 #1: ffff88806bdce0e8 (&type->s_umount_key#59){++++}-{4:4}, at: super_cache_scan+0x9b/0x5c0 fs/super.c:213

stack backtrace:
CPU: 3 UID: 0 PID: 113 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2087
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2219
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 jffs2_do_clear_inode+0x5a/0x470 fs/jffs2/readinode.c:1419
 evict+0x3c2/0xad0 fs/inode.c:822
 dispose_list+0x117/0x1e0 fs/inode.c:864
 prune_icache_sb+0xea/0x150 fs/inode.c:1011
 super_cache_scan+0x3ac/0x5c0 fs/super.c:240
 do_shrink_slab+0x416/0x1200 mm/shrinker.c:443
 shrink_slab_memcg mm/shrinker.c:560 [inline]
 shrink_slab+0xa82/0x12e0 mm/shrinker.c:638
 shrink_one+0x398/0x850 mm/vmscan.c:5119
 shrink_many mm/vmscan.c:5180 [inline]
 lru_gen_shrink_node mm/vmscan.c:5258 [inline]
 shrink_node+0x2b20/0x4320 mm/vmscan.c:6247
 kswapd_shrink_node mm/vmscan.c:7101 [inline]
 balance_pgdat+0xb20/0x1f00 mm/vmscan.c:7279
 kswapd+0x556/0xb50 mm/vmscan.c:7555
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
