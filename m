Received: from fnoeppeil48.netpark.at ([217.175.205.176]
	helo=roarinelk.homelinux.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KYd8v-0006aZ-GO
	for linux-mtd@lists.infradead.org; Thu, 28 Aug 2008 08:46:13 +0000
Date: Thu, 28 Aug 2008 10:46:03 +0200
From: Manuel Lauss <mano@roarinelk.homelinux.net>
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: MTD kobject warnings due to block layer changes
Message-ID: <20080828084603.GA17139@roarinelk.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Todays -git spits out these wanings during boot, caused by
Commit abf5439370491dd6fbb4fe1a7939680d2a9bc9d4
( block: move cmdfilter from gendisk to request_queue ):

Using physmap partition information
Creating 3 MTD partitions on "physmap-flash":
0x00000000-0x01c00000 : "User FS"
0x01c00000-0x01c40000 : "booter"
kobject (8511c410): tried to init an initialized object, something is seriously wrong.
Call Trace:
[<8036644c>] dump_stack+0x8/0x34
[<8021f050>] kobject_init+0x50/0xcc
[<8021fa18>] kobject_init_and_add+0x24/0x58
[<8021d20c>] blk_register_filter+0x4c/0x64
[<8021c194>] add_disk+0x78/0xe0
[<8027d14c>] add_mtd_blktrans_dev+0x254/0x278
[<8027c8f0>] blktrans_notify_add+0x40/0x78
[<80279c00>] add_mtd_device+0xd0/0x150
[<8027b090>] add_mtd_partitions+0x568/0x5d8
[<80285458>] physmap_flash_probe+0x2ac/0x334
[<802644f8>] driver_probe_device+0x12c/0x244
[<8026465c>] __driver_attach+0x4c/0x84
[<80263c64>] bus_for_each_dev+0x58/0xac
[<802633ec>] bus_add_driver+0xc4/0x24c
[<802648e0>] driver_register+0xcc/0x184
[<80100460>] _stext+0x60/0x1bc

0x01c40000-0x01fe0000 : "vmlinux.elf"
kobject (8511c410): tried to init an initialized object, something is seriously wrong.
Call Trace:
[<8036644c>] dump_stack+0x8/0x34
[<8021f050>] kobject_init+0x50/0xcc
[<8021fa18>] kobject_init_and_add+0x24/0x58
[<8021d20c>] blk_register_filter+0x4c/0x64
[<8021c194>] add_disk+0x78/0xe0
[<8027d14c>] add_mtd_blktrans_dev+0x254/0x278
[<8027c8f0>] blktrans_notify_add+0x40/0x78
[<80279c00>] add_mtd_device+0xd0/0x150
[<8027b090>] add_mtd_partitions+0x568/0x5d8
[<80285458>] physmap_flash_probe+0x2ac/0x334
[<802644f8>] driver_probe_device+0x12c/0x244
[<8026465c>] __driver_attach+0x4c/0x84
[<80263c64>] bus_for_each_dev+0x58/0xac
[<802633ec>] bus_add_driver+0xc4/0x24c
[<802648e0>] driver_register+0xcc/0x184
[<80100460>] _stext+0x60/0x1bc

NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB 3,3V 8-bit)
Scanning device for bad blocks
Creating 1 MTD partitions on "gen_nand":
0x00000000-0x08000000 : "NAND FS 0"
kobject (8511c410): tried to init an initialized object, something is seriously wrong.
Call Trace:
[<8036644c>] dump_stack+0x8/0x34
[<8021f050>] kobject_init+0x50/0xcc
[<8021fa18>] kobject_init_and_add+0x24/0x58
[<8021d20c>] blk_register_filter+0x4c/0x64
[<8021c194>] add_disk+0x78/0xe0
[<8027d14c>] add_mtd_blktrans_dev+0x254/0x278
[<8027c8f0>] blktrans_notify_add+0x40/0x78
[<80279c00>] add_mtd_device+0xd0/0x150
[<8027b090>] add_mtd_partitions+0x568/0x5d8
[<804016b0>] plat_nand_probe+0x1e8/0x24c
[<802644f8>] driver_probe_device+0x12c/0x244
[<8026465c>] __driver_attach+0x4c/0x84
[<80263c64>] bus_for_each_dev+0x58/0xac
[<802633ec>] bus_add_driver+0xc4/0x24c
[<802648e0>] driver_register+0xcc/0x184
[<80100460>] _stext+0x60/0x1bc


Thanks!
	Manuel Lauss
