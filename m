Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7U2L-0004wv-AU
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2016 21:16:02 +0000
Received: by mail-wm0-x243.google.com with SMTP id m203so25063672wma.3
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2016 13:15:40 -0800 (PST)
From: Ivan Grimaldi <grimaldi.ivan@gmail.com>
Date: Thu, 17 Nov 2016 22:15:37 +0100
To: linux-mtd@lists.infradead.org, grimaldi.ivan@gmail.com
Cc: linux-kernel@vger.kernel.org, grimaldi.ivan@gmail.com
Subject: [BUG] mtd: blkdevs: fix deadlock
Message-ID: <20161117211537.GA5885@tuco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found this deadlock with kernel version 4.4.30, when insmod the ftl
module, which register_mtd_blktrans.

  -> register_mtd_blktrans()
  -> mutex_lock(&mtd_table_mutex)
  -> ftl_add_mtd()
  -> add_mtd_blktrans_dev()
  -> add_disk()
  -> register_disk()
  -> blkdev_get()
  -> __blkdev_get()
  -> blktrans_open()
  -> mutex_lock(&mtd_table_mutex); !!!!!!!

I think the lock/unlock of the mtd_table_mutex is not necessary in
blktrans_open and blktrans_release, the log message of lockdep
output follow:

=============================================
[ INFO: possible recursive locking detected ]
4.4.30+siae-g8b14c5b-dirty #23 Not tainted
---------------------------------------------
insmod/440 is trying to acquire lock:
 (mtd_table_mutex){+.+.+.}, at: [<802fe6b0>] blktrans_open+0x30/0x1ac

but task is already holding lock:
 (mtd_table_mutex){+.+.+.}, at: [<802fe93c>] register_mtd_blktrans+0x2c/0x120

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(mtd_table_mutex);
  lock(mtd_table_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by insmod/440:
 #0:  (mtd_table_mutex){+.+.+.}, at: [<802fe93c>] register_mtd_blktrans+0x2c/0x120
 #1:  (&bdev->bd_mutex){+.+.+.}, at: [<8013c404>] __blkdev_get+0x40/0x398

stack backtrace:
CPU: 0 PID: 440 Comm: insmod Not tainted 4.4.30+siae-g8b14c5b-dirty #23
Hardware name: SIAE Microelettronica AGS20 (Device Tree)
Backtrace: 
[<800140e8>] (dump_backtrace) from [<800142dc>] (show_stack+0x18/0x1c)
 r6:60000093 r5:00000000 r4:8067cb48 r3:00000000
[<800142c4>] (show_stack) from [<8024fe1c>] (dump_stack+0xb4/0xe8)
[<8024fd68>] (dump_stack) from [<8006dc48>] (__lock_acquire+0x1a94/0x1f14)
 r10:807d6db8 r9:8067cc28 r8:bdacd4c0 r7:80e933dc r6:bdacd080 r5:80e84ab4
 r4:807d6db8 r3:00000002
[<8006c1b4>] (__lock_acquire) from [<8006e8ec>] (lock_acquire+0x78/0x98)
 r10:80686c38 r9:00000000 r8:00000001 r7:00000001 r6:802fe6b0 r5:60000013
 r4:00000000
[<8006e874>] (lock_acquire) from [<804bc708>] (mutex_lock_nested+0x54/0x3ec)
 r7:bdacd080 r6:80e84ab4 r5:802fe6b0 r4:00000000
[<804bc6b4>] (mutex_lock_nested) from [<802fe6b0>] (blktrans_open+0x30/0x1ac)
 r10:00000001 r9:00000000 r8:00000001 r7:be61be10 r6:00000000 r5:bd98a400
 r4:be61be00
[<802fe680>] (blktrans_open) from [<8013c464>] (__blkdev_get+0xa0/0x398)
 r8:00000000 r7:bec24f10 r6:00000000 r5:bd98a400 r4:bec24f00 r3:802fe680
[<8013c3c4>] (__blkdev_get) from [<8013c86c>] (blkdev_get+0x110/0x348)
 r10:bec24f00 r9:00000001 r8:be831f90 r7:bd98a40c r6:00000000 r5:00000000
 r4:bec24f00
[<8013c75c>] (blkdev_get) from [<8024204c>] (add_disk+0x318/0x46c)
 r10:bec24f00 r9:00000001 r8:be831f90 r7:bd98a40c r6:bd98a480 r5:00000000
 r4:bd98a400
[<80241d34>] (add_disk) from [<802fde80>] (add_mtd_blktrans_dev+0x314/0x440)
 r10:be61be9c r9:00000000 r8:00f68e00 r7:bd98a400 r6:7f00242c r5:00000000
 r4:be61be00
[<802fdb6c>] (add_mtd_blktrans_dev) from [<7f000c74>] (ftl_add_mtd+0x490/0x7d8 [ftl])
 r10:bd843d28 r9:be61bf00 r8:00000000 r7:000000bf r6:00007b47 r5:00000be0
 r4:be61be00
[<7f0007e4>] (ftl_add_mtd [ftl]) from [<802fe9c4>] (register_mtd_blktrans+0xb4/0x120)
 r10:00000000 r9:be618ec0 r8:7f0024c8 r7:7f004000 r6:00000000 r5:7f00242c
 r4:be806000
[<802fe910>] (register_mtd_blktrans) from [<7f004014>] (init_ftl+0x14/0x1c [ftl])
 r6:be618f80 r5:8066ad20 r4:8066ad20 r3:00000000
[<7f004000>] (init_ftl [ftl]) from [<800097bc>] (do_one_initcall+0x88/0x1e8)
[<80009734>] (do_one_initcall) from [<800bf9f4>] (do_init_module+0x60/0x394)
 r10:00000001 r9:be618ec0 r8:7f0024c8 r7:7f002480 r6:be618700 r5:be618ec8
 r4:7f002480
[<800bf994>] (do_init_module) from [<800a1b7c>] (load_module+0x1814/0x1f34)
 r6:00000001 r5:be618ec8 r4:bd843f34
[<800a0368>] (load_module) from [<800a2370>] (SyS_init_module+0xd4/0x148)
 r10:bd842000 r9:00000051 r8:c6b16780 r7:76fd8788 r6:00000000 r5:00004780
 r4:00000000
[<800a229c>] (SyS_init_module) from [<8000fb60>] (ret_fast_syscall+0x0/0x1c)
 r10:00000000 r9:bd842000 r8:8000fd04 r7:00000080 r6:00000191 r5:7e8cbf31
 r4:00024780


IVan
