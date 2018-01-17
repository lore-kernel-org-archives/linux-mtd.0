Received: from 2.mo3.mail-out.ovh.net ([46.105.75.36])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebj4V-0004K9-0h
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 08:27:49 +0000
Received: from player797.ha.ovh.net (gw6.ovh.net [213.251.189.206])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 53C45181E8E
 for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2018 09:27:31 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 17 Jan 2018 09:27:18 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Peter Rosin <peda@axentia.se>
Cc: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] linux-next panics when trying to mount root
In-Reply-To: <574b1571-1664-f09f-62bf-48f7f94a51cd@axentia.se>
References: <574b1571-1664-f09f-62bf-48f7f94a51cd@axentia.se>
Message-ID: <a1fa20bcb07cf6016f38e499ba434d97@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-01-16 14:28, Peter Rosin wrote:
> When trying next-20180116 I get the following panic during boot:
> 
> Linux version 4.15.0-rc8-next-20180116 (peda@orc) (gcc version 4.9.2
> 20140811 (prerelease) (crosstool-NG linaro-1.13.1-4.9-2014.08 - Linaro
> GCC 4.9-2014.08)) #208 Tue Jan 16 14:23:44 CET 2018
> CPU: ARMv7 Processor [410fc051] revision 1 (ARMv7), cr=10c53c7d
> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction 
> cache
> OF: fdt: Machine model: Axentia Linea-Nattis v2 Natte v2
> Memory policy: Data cache writeback
> CPU: All CPU(s) started in SVC mode.
> random: fast init done
> Built 1 zonelists, mobility grouping on.  Total pages: 16256
> Kernel command line: console=ttyS0,115200 rw consoleblank=0 ip=none
> root=ubi0:rootfs ubi.mtd=6 rootfstype=ubifs noinitrd
> mtdparts=atmel_nand:256k(at91bootstrap),384k(barebox)ro,256k@768k(bareboxenv),256k(bareboxenv2),128k@1536k(oftree),5M@2M(kernel),-@8M(rootfs)
> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> Memory: 56244K/65536K available (5120K kernel code, 183K rwdata, 1064K
> rodata, 1024K init, 108K bss, 9292K reserved, 0K cma-reserved)
> Virtual kernel memory layout:
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
>     vmalloc : 0xc4800000 - 0xff800000   ( 944 MB)
>     lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
>       .text : 0x(ptrval) - 0x(ptrval)   (6112 kB)
>       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
>       .data : 0x(ptrval) - 0x(ptrval)   ( 184 kB)
>        .bss : 0x(ptrval) - 0x(ptrval)   ( 109 kB)
> NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> clocksource: pit: mask: 0xfffffff max_cycles: 0xfffffff, max_idle_ns:
> 14479245754 ns
> sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
> 21474836475000000ns
> Console: colour dummy device 80x30
> Calibrating delay loop... 351.43 BogoMIPS (lpj=1757184)
> pid_max: default: 32768 minimum: 301
> Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> CPU: Testing write buffer coherency: ok
> Setting up static identity map for 0x20100000 - 0x20100060
> devtmpfs: initialized
> VFP support v0.3: implementor 41 architecture 2 part 30 variant 5 rev 1
> clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
> max_idle_ns: 19112604462750000 ns
> futex hash table entries: 256 (order: -1, 3072 bytes)
> pinctrl core: initialized pinctrl subsystem
> NET: Registered protocol family 16
> DMA: preallocated 256 KiB pool for atomic coherent allocations
> AT91: PM: standby: standby, suspend: ulp0
> No ATAGs?
> gpio-at91 fffff200.gpio: at address 45a5b6d3
> gpio-at91 fffff400.gpio: at address d0c9dba6
> gpio-at91 fffff600.gpio: at address fb737fc9
> gpio-at91 fffff800.gpio: at address c5aa2ee6
> gpio-at91 fffffa00.gpio: at address 4663f5ca
> pinctrl-at91 ahb:apb:pinctrl@fffff200: initialized AT91 pinctrl driver
> clocksource: tcb_clksrc: mask: 0xffffffff max_cycles: 0xffffffff,
> max_idle_ns: 115833966437 ns
> at_hdmac ffffe600.dma-controller: Atmel AHB DMA Controller ( cpy set
> slave ), 8 channels
> at_hdmac ffffe800.dma-controller: Atmel AHB DMA Controller ( cpy set
> slave ), 8 channels
> AT91: Detected SoC family: sama5d3
> AT91: Detected SoC: sama5d31, revision 2
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> at91_i2c f0014000.i2c: using dma0chan0 (tx) and dma0chan1 (rx) for DMA 
> transfers
> at91_i2c f0014000.i2c: AT91 i2c bus driver (hw version: 0x402).
> clocksource: Switched to clocksource tcb_clksrc
> NET: Registered protocol family 2
> tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes)
> TCP established hash table entries: 1024 (order: 0, 4096 bytes)
> TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
> TCP: Hash tables configured (established 1024 bind 1024)
> UDP hash table entries: 256 (order: 0, 4096 bytes)
> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> NET: Registered protocol family 1
> Initialise system trusted keyrings
> workingset: timestamp_bits=30 max_order=14 bucket_order=0
> Key type asymmetric registered
> Asymmetric key parser 'x509' registered
> io scheduler noop registered (default)
> io scheduler mq-deadline registered
> io scheduler kyber registered
> f001c000.serial: ttyS1 at MMIO 0xf001c000 (irq = 22, base_baud =
> 4125000) is a ATMEL_SERIAL
> ffffee00.serial: ttyS0 at MMIO 0xffffee00 (irq = 30, base_baud =
> 8250000) is a ATMEL_SERIAL
> console [ttyS0] enabled
> loop: module loaded
> ssc f0008000.ssc: Atmel SSC device at 0x6a12493c (irq 19)
> ssc f0008000.ssc: failed to auto-setup ssc for audio
> at24 0-0051: 8192 byte 24c64 EEPROM, writable, 32 bytes/write
> at24 0-0050: 256 byte 24c02 EEPROM, writable, 16 bytes/write
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] No driver support for vblank timestamp query.
> atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to create HLCDC
> outputs: -517
> atmel-hlcdc-display-controller atmel-hlcdc-dc: failed to initialize 
> mode setting
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> ehci-atmel: EHCI Atmel driver
> atmel_usba_udc 500000.gadget: MMIO registers at 0xf8030000 mapped at 
> ff1022ba
> atmel_usba_udc 500000.gadget: FIFO at 0x00500000 mapped at 3b2532b1
> g_serial gadget: Gadget Serial v2.4
> g_serial gadget: g_serial ready
> at91_rtc fffffeb0.rtc: registered as rtc0
> at91_rtc fffffeb0.rtc: AT91 Real Time Clock driver.
> i2c /dev entries driver
> AT91: Starting after wakeup
> atmel_mci f0000000.mmc: version: 0x505
> atmel_mci f0000000.mmc: using dma0chan2 for DMA transfers
> atmel_mci f0000000.mmc: Atmel MCI controller at 0xf0000000 irq 18, 1 
> slots
> atmel_aes f8038000.aes: version: 0x135
> atmel_aes f8038000.aes: Atmel AES - Using dma1chan0, dma1chan1 for DMA 
> transfers
> atmel_sha f8034000.sha: version: 0x410
> atmel_sha f8034000.sha: using dma1chan2 for DMA transfers
> atmel_sha f8034000.sha: Atmel SHA1/SHA256/SHA224/SHA384/SHA512
> atmel_tdes f803c000.tdes: version: 0x701
> atmel_tdes f803c000.tdes: using dma1chan3, dma1chan4 for DMA transfers
> atmel_tdes f803c000.tdes: Atmel DES/TDES
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xac
> nand: Micron MT29F4G08ABBDAHC
> nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> Bad block table found at page 262080, version 0x01
> Bad block table found at page 262016, version 0x01
> 6 ofpart partitions found on MTD device atmel_nand
> Creating 6 MTD partitions on "atmel_nand":
> 0x000000000000-0x000000040000 : "at91bootstrap"
> 0x000000040000-0x0000000c0000 : "bootloader"
> 0x0000000c0000-0x000000180000 : "bootloader env"
> 0x000000180000-0x000000200000 : "device tree"
> 0x000000200000-0x000000800000 : "kernel"
> 0x000000800000-0x000010000000 : "rootfs"
> NET: Registered protocol family 10
> Segment Routing with IPv6
> sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> NET: Registered protocol family 17
> Loading compiled-in X.509 certificates
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [drm] No driver support for vblank timestamp query.
> atmel-hlcdc-display-controller atmel-hlcdc-dc: fb0:  frame buffer 
> device
> [drm] Initialized atmel-hlcdc 1.0.0 20141504 for atmel-hlcdc-dc on 
> minor 0
> UBI error: cannot open mtd 6, error -19
> input: gpio-keys as /devices/platform/gpio-keys/input/input0
> at91_rtc fffffeb0.rtc: setting system clock to 2007-01-01 00:00:08 UTC
> (1167609608)
> panel-VCC: disabling
> panel-VDD: disabling
> atmel_usart ffffee00.serial: using dma1chan5 for rx DMA transfers
> Kernel panic - not syncing: VFS: Unable to mount root fs on 
> unknown-block(0,0)
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.15.0-rc8-next-20180116 #208
> Hardware name: Atmel SAMA5
> [<c010cc5c>] (unwind_backtrace) from [<c010b140>] 
> (show_stack+0x10/0x14)
> [<c010b140>] (show_stack) from [<c0115f20>] (panic+0xc8/0x254)
> [<c0115f20>] (panic) from [<c0801348>] (mount_block_root+0x23c/0x2f8)
> [<c0801348>] (mount_block_root) from [<c0801528>] 
> (prepare_namespace+0xa8/0x19c)
> [<c0801528>] (prepare_namespace) from [<c0800ff0>]
> (kernel_init_freeable+0x1bc/0x1cc)
> [<c0800ff0>] (kernel_init_freeable) from [<c051b958>] 
> (kernel_init+0x8/0x10c)
> [<c051b958>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> Exception stack(0xc3821fb0 to 0xc3821ff8)
> 1fa0:                                     00000000 00000000 00000000 
> 00000000
> 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
> 00000000
> 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
> 
> 
> I bisected it to:
> 
> 4ac9222778478a00c7fc9d347b7ed1e0e595120d is the first bad commit
> commit 4ac9222778478a00c7fc9d347b7ed1e0e595120d
> Author: Rafał Miłecki <rafal@milecki.pl>
> Date:   Thu Jan 4 08:05:34 2018 +0100
> 
>     mtd: ofpart: add of_match_table with "fixed-partitions"
> 
>     This allows using this parser with any flash driver that takes care 
> of
>     setting of_node (using mtd_set_of_node helper) correctly. Up to now
>     support for "fixed-partitions" DT compatibility string was working 
> only
>     with flash drivers that were specifying "ofpart" (manually or by 
> letting
>     mtd use the default set of parsers).
> 
>     This matches existing bindings documentation.
> 
>     Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>     Reviewed-by: Brian Norris <computersforpeace@gmail.com>
>     Tested-by: Brian Norris <computersforpeace@gmail.com>
>     Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> 
> Reverting that patch on top of next-20180116 fixes the problem.
> 
> I'm using the arch/arm/boot/dts/at91-nattis-2-natte-2.dts device tree 
> which for
> the record is kind of new in the upstream kernel, but I have been using 
> that dts
> for a while previously. However, I'd put my money on at91-tse850-3.dts 
> also
> being affected, and that one have been upstream for a while. Haven't 
> tested the
> tse850 device tree though...

Peter, above patch was dropped, together with the one adding support for
the "of_match_table".

I just sent V8 of my changes, hopefully they don't cause regression this
time.

Would you be able to test following two patches & verify that your 
device
still works, please?
[PATCH V8 1/2] mtd: partitions: add of_match_table parser matching
[PATCH V8 2/2] mtd: ofpart: add of_match_table with "fixed-partitions"
https://patchwork.ozlabs.org/patch/862075/
https://patchwork.ozlabs.org/patch/862076/
