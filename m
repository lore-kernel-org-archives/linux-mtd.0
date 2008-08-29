Date: Fri, 29 Aug 2008 11:48:28 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Eirik Aanonsen" <eaa@wprmedical.com>
Subject: Re: Slub debugging NAND error in 2.6.25.10.atmel.2
Message-ID: <20080829114828.279b79bc@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417CA6@wpr01.wprmedical.local>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C9D@wpr01.wprmedical.local>
	<6B5648EA2E2C2D42AF2FF7691522AD92417CA6@wpr01.wprmedical.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@avr32linux.org, David
	Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[adding linux-mtd and David back to Cc]

"Eirik Aanonsen" <eaa@wprmedical.com> wrote:
> > Using physmap partition information
> > Creating 5 MTD partitions on "physmap-flash.0":
> > 0x00000000-0x00020000 : "u-boot"
> > 0x00020000-0x00640000 : "root"
> > 0x00640000-0x00720000 : "kernel1"
> > 0x00720000-0x007e0000 : "modules"
> > 0x007e0000-0x00800000 : "env"
> > NAND device: Manufacturer ID: 0xec, Chip ID: 0xd5 (Samsung NAND 2GiB 3,3V 8-bit)
> > Scanning device for bad blocks
> > Bad eraseblock 31 at 0x00f80000
> > Bad eraseblock 1579 at 0x31580000
> > Bad eraseblock 2921 at 0x5b480000
> > Bad eraseblock 2931 at 0x5b980000
> > Bad eraseblock 3359 at 0x68f80000
> > Creating 1 MTD partitions on "atmel_nand":
> > 0x00000000-0x80000000 : "main"
> > =============================================================================
> > BUG kmalloc-4096: Poison overwritten
> > -----------------------------------------------------------------------------

Hmm...I just saw this when booting 2.6.27-rc5 on the NGW100:

physmap platform flash device: 00800000 at 00000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0041
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
Using physmap partition information
Creating 3 MTD partitions on "physmap-flash.0":
0x00000000-0x00020000 : "u-boot"
0x00020000-0x007f0000 : "root"
kobject (91ce8410): tried to init an initialized object, something is seriously wrong.
Call trace:
 [<90017184>] dump_stack+0x18/0x20
 [<900c1894>] kobject_init+0x28/0x5c
 [<900c1bf6>] kobject_init_and_add+0xe/0x24
 [<900beff0>] blk_register_filter+0x28/0x40
 [<900be224>] add_disk+0x38/0x68
 [<900e70f0>] add_mtd_blktrans_dev+0x174/0x184
 [<900e748e>] mtdblock_add_mtd+0x36/0x3c
 [<900e6e38>] blktrans_notify_add+0x1a/0x3a
 [<900e533c>] add_mtd_device+0x60/0xa0
 [<900e5f7e>] add_mtd_partitions+0x37a/0x3a0
 [<900ec4d0>] physmap_flash_probe+0x1ec/0x21c
 [<900e0f24>] platform_drv_probe+0x10/0x12
 [<900e06d0>] driver_probe_device+0x84/0xf0
 [<900e076a>] __driver_attach+0x2e/0x44
 [<900e0096>] bus_for_each_dev+0x2e/0x4c
 [<900e05b6>] driver_attach+0x12/0x14
 [<900e036c>] bus_add_driver+0x6c/0x178
 [<900e08a4>] driver_register+0x58/0xb0
 [<900e1126>] platform_driver_register+0x56/0x5c
 [<9000aaf6>] physmap_init+0xa/0x10
 [<9001422a>] do_one_initcall+0x2a/0x10c
 [<900005b8>] kernel_init+0x48/0x90
 [<9001fcc0>] do_exit+0x0/0x4cc

0x007f0000-0x00800000 : "env"
kobject (91ce8410): tried to init an initialized object, something is seriously wrong.
Call trace:
 [<90017184>] dump_stack+0x18/0x20
 [<900c1894>] kobject_init+0x28/0x5c
 [<900c1bf6>] kobject_init_and_add+0xe/0x24
 [<900beff0>] blk_register_filter+0x28/0x40
 [<900be224>] add_disk+0x38/0x68
 [<900e70f0>] add_mtd_blktrans_dev+0x174/0x184
 [<900e748e>] mtdblock_add_mtd+0x36/0x3c
 [<900e6e38>] blktrans_notify_add+0x1a/0x3a
 [<900e533c>] add_mtd_device+0x60/0xa0
 [<900e5f7e>] add_mtd_partitions+0x37a/0x3a0
 [<900ec4d0>] physmap_flash_probe+0x1ec/0x21c
 [<900e0f24>] platform_drv_probe+0x10/0x12
 [<900e06d0>] driver_probe_device+0x84/0xf0
 [<900e076a>] __driver_attach+0x2e/0x44
 [<900e0096>] bus_for_each_dev+0x2e/0x4c
 [<900e05b6>] driver_attach+0x12/0x14
 [<900e036c>] bus_add_driver+0x6c/0x178
 [<900e08a4>] driver_register+0x58/0xb0
 [<900e1126>] platform_driver_register+0x56/0x5c
 [<9000aaf6>] physmap_init+0xa/0x10
 [<9001422a>] do_one_initcall+0x2a/0x10c
 [<900005b8>] kernel_init+0x48/0x90
 [<9001fcc0>] do_exit+0x0/0x4cc

I wonder if it's related?

Haavard

[fullquoting since others might find the below interesting]

> > INFO: 0x91c0a0c0-0x91c0a13f. First byte 0xff instead of 0x6b
> > INFO: Slab 0x90157100 used=2 fp=0x91c0a080 flags=0x40c2
> > INFO: Object 0x91c0a080 @offset=8320 fp=0x91c0b0c0
> > 
> > Bytes b4 0x91c0a070:  5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a ZZZZZZZZZZZZZZZZ
> >   Object 0x91c0a080:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> >   Object 0x91c0a090:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> >   Object 0x91c0a0a0:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> >   Object 0x91c0a0b0:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> >   Object 0x91c0a0c0:  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
> >   Object 0x91c0a0d0:  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
> >   Object 0x91c0a0e0:  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
> >   Object 0x91c0a0f0:  ff ff ff ff ff ff ff ff ff ff ff ff 3d ff 3d ff ÿÿÿÿÿÿÿÿÿÿÿÿ=ÿ=ÿ
> >  Redzone 0x91c0b080:  bb bb bb bb                                     »»»»
> >  Padding 0x91c0b0a8:  5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a ZZZZZZZZZZZZZZZZ
> >  Padding 0x91c0b0b8:  5a 5a 5a 5a 5a 5a 5a 5a                         ZZZZZZZZ
> > Call trace:
> >  [<90010680>] dump_stack+0x18/0x20
> >  [<90048468>] print_trailer+0xdc/0x108
> >  [<90048500>] check_bytes_and_report+0x6c/0x8c
> >  [<900486b0>] check_object+0x84/0x170
> >  [<900490ae>] __slab_alloc+0x2c2/0x35c
> >  [<900499fc>] kmem_cache_alloc+0x20/0x50
> >  [<900967d8>] kobject_uevent_env+0x6c/0x1c8
> >  [<9009693c>] kobject_uevent+0x8/0xc
> >  [<90071c5e>] register_disk+0xbe/0xf0
> >  [<90092d88>] add_disk+0x2c/0x38
> >  [<900b25cc>] add_mtd_blktrans_dev+0x16c/0x17c
> >  [<900b296a>] mtdblock_add_mtd+0x36/0x3c
> >  [<900b233c>] blktrans_notify_add+0x1a/0x36
> >  [<900b0832>] add_mtd_device+0x62/0x9c
> >  [<900b147a>] add_mtd_partitions+0x386/0x3a8
> >  [<900090dc>] atmel_nand_probe+0x2b8/0x300
> >  [<900aeaf0>] platform_drv_probe+0x10/0x12
> >  [<900ad9c8>] driver_probe_device+0x7c/0xe8
> >  [<900adb22>] __driver_attach+0x4e/0x88
> >  [<900ad12e>] bus_for_each_dev+0x2e/0x4c
> >  [<900ad8b6>] driver_attach+0x12/0x14
> >  [<900ad700>] bus_add_driver+0x6c/0x178
> >  [<900adcda>] driver_register+0x3e/0x94
> >  [<900aec5a>] platform_driver_register+0x4a/0x50
> >  [<900aec6a>] platform_driver_probe+0xa/0x38
> >  [<90008e1e>] atmel_nand_init+0xe/0x14
> >  [<900003e2>] kernel_init+0x8e/0x1c8
> >  [<9001966c>] do_exit+0x0/0x428
> > 
> > FIX kmalloc-4096: Restoring 0x91c0a0c0-0x91c0a13f=0x6b
> > 
> > FIX kmalloc-4096: Marking all objects used
> > atmel_spi atmel_spi.0: Atmel SPI Controller at 0xffe00000 (irq 3)
> > atmel_usba_udc atmel_usba_udc.0: MMIO registers at 0xfff03000 mapped at fff03000
> > atmel_usba_udc atmel_usba_udc.0: FIFO at 0xff300000 mapped at ff300000
> > at32ap700x_rtc at32ap700x_rtc.0: rtc core: registered at32ap700x_rtc as rtc0
> > at32ap700x_rtc at32ap700x_rtc.0: Atmel RTC for AT32AP700x at fff00080 irq 21
> > at32_wdt at32_wdt.0: AT32AP700X WDT at 0xfff000b0, timeout 2 sec (nowayout=0)
> > cpufreq: AT32AP CPU frequency driver
> > at32ap700x_rtc at32ap700x_rtc.0: setting system clock to 1970-01-01 00:00:00 UTC (0)
> > VFS: Mounted root (jffs2 filesystem).
> > Freeing init memory: 48K (90000000 - 9000c000)
> 
> It seems like the data that starts this error initiates from.
> 
> Drivers/mtd/nand/atmel_nand.c line 634
> return platform_driver_probe(&atmel_nand_driver, atmel_nand_probe);
> 
> ...
> 
> fs/partitions/check.c line 446
> kobject_uevent(&disk->dev.kobj, KOBJ_ADD);
> 
> lib/kobject_uevent.c line 156
> env = kzalloc(sizeof(struct kobj_uevent_env), GFP_KERNEL);
> 
> include/linux/slab.h line 271
> return kmalloc(size, flags | __GFP_ZERO); 
> 
> The needed space for the struct is 2184 and the kzalloc is called with size 2184 as well. Resulting in a 4kb chache that seems not to be free and something is overwritten.
> 
> The function in check.c is called many times when registering different partitions and only fails when related to the atmel_nand driver.
> 
> Does anyone know how I can go from here to try and locate what is wrong?
> 
> The error occurs in both the 2.6.25.10.atmel.2 as well as 2.6.25.6.atmel.1
> 
> ____________________________________________________
>  
> Eirik Aanonsen
> SW Developer
> E-mail: eaa@wprmedical.com
> Phone: +47 90 68 11 92
> Fax: +47 37 03 56 77
> ____________________________________________________
> 
> _______________________________________________
> Kernel mailing list
> Kernel@avr32linux.org
> http://duppen.flaskehals.net/cgi-bin/mailman/listinfo/kernel
