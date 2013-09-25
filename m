Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOptU-0001xK-Nz
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 14:16:46 +0000
Message-ID: <5242F034.9070209@nod.at>
Date: Wed, 25 Sep 2013 16:16:20 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: BUG: fastmap and u-boot's ubi write command
References: <5242C213.3080808@gmail.com> <5242C4C1.2030401@nod.at>
 <5242D37D.5030106@gmail.com> <5242E591.5050208@nod.at>
 <CACQ1gAhKY3785KH78DxW_bC3TdopxAqkp+z0keTi4KmvsA4dKQ@mail.gmail.com>
In-Reply-To: <CACQ1gAhKY3785KH78DxW_bC3TdopxAqkp+z0keTi4KmvsA4dKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: u-boot@lists.denx.de, linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 25.09.2013 15:39, schrieb Richard Genoud:
> 2013/9/25 Richard Weinberger <richard@nod.at>:
>> Am 25.09.2013 14:13, schrieb Richard Genoud:
>>>> Before we waste time, please ensure that you have all recent UBI fixes applied.
>>>> UBI: Fix PEB leak in wear_leveling_worker() (Merged into 3.12-rc1, on it's way to -stable)
>>>> UBI: Fix invalidate_fastmap() (Merged into 3.12-rc1)
>>>> UBI: Fix refill_wl_user_pool() (Pending, http://lkml.org/lkml/2013/8/26/121)
>>>>
>>> yes, I have them:
>>> git log --oneline v3.11.1..HEAD -- drivers/mtd/ubi/
>>> 241bac5 UBI: fix refill_wl_user_pool()
>>> a5858cf UBI: Fix invalidate_fastmap()
>>> fd00289 UBI: Fix PEB leak in wear_leveling_worker()
>>
>> Oh, this makes me sad. ;-)
>>
>>>> This is not the top most error. Do you have to full log?
>>>> Would be nice to know why fastmap has fallen back to a full scan.
>>>
>>> Here's the full log for this one:
>>> Uncompressing Linux... done, booting the kernel.
>>> [    0.000000] Booting Linux on physical CPU 0x0
>>> [    0.000000] Linux version 3.11.1 (rgenoud@lnx-rg) (gcc version 4.7.3 (Buildroot 2013.05-00178-gd93036d-dirty) ) #5 Tue Sep 24 15:24:16 CEST 2013
>>> [    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
>>> [    0.000000] CPU: VIVT data cache, VIVT instruction cache
>>> [    0.000000] Machine: Atmel AT91SAM (Device Tree), model: Paratronic LNS
>>> [    0.000000] Memory policy: ECC disabled, Data cache writeback
>>> [    0.000000] AT91: Detected soc type: at91sam9x5
>>> [    0.000000] AT91: Detected soc subtype: at91sam9g35
>>> [    0.000000] AT91: sram at 0x300000 of 0x8000 mapped at 0xfef70000
>>> [    0.000000] On node 0 totalpages: 32768
>>> [    0.000000] free_area_init_node: node 0, pgdat c0374ccc, node_mem_map c03a6000
>>> [    0.000000]   Normal zone: 256 pages used for memmap
>>> [    0.000000]   Normal zone: 0 pages reserved
>>> [    0.000000]   Normal zone: 32768 pages, LIFO batch:7
>>> [    0.000000] Clocks: CPU 400 MHz, master 133 MHz, main 12.000 MHz
>>> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
>>> [    0.000000] pcpu-alloc: [0] 0
>>> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
>>> [    0.000000] Kernel command line: console=ttyS0,115200 loglevel=8 ubi.fm_autoconvert=1 rw root=ubi0:rootfs rootfstype=ubifs ubi.mtd=UBI
>>> [    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
>>> [    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
>>> [    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
>>> [    0.000000] Memory: 126100K/131072K available (2474K kernel code, 140K rwdata, 776K rodata, 115K init, 194K bss, 4972K reserved)
>>> [    0.000000] Virtual kernel memory layout:
>>> [    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>>> [    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
>>> [    0.000000]     vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
>>> [    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
>>> [    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
>>> [    0.000000]       .text : 0xc0008000 - 0xc0334eec   (3252 kB)
>>> [    0.000000]       .init : 0xc0335000 - 0xc0351f14   ( 116 kB)
>>> [    0.000000]       .data : 0xc0352000 - 0xc03753a0   ( 141 kB)
>>> [    0.000000]        .bss : 0xc03753a0 - 0xc03a5cf8   ( 195 kB)
>>> [    0.000000] NR_IRQS:16 nr_irqs:16 16
>>> [    0.000000] sched_clock: 32 bits at 128 Hz, resolution 7812500ns, wraps every 3489660920ms
>>> [    0.000000] Console: colour dummy device 80x30
>>> [    0.054687] Calibrating delay loop... 198.76 BogoMIPS (lpj=775168)
>>> [    0.054687] pid_max: default: 32768 minimum: 301
>>> [    0.062500] Mount-cache hash table entries: 512
>>> [    0.070312] CPU: Testing write buffer coherency: ok
>>> [    0.070312] Setting up static identity map for 0xc0257aa8 - 0xc0257ae4
>>> [    0.078125] devtmpfs: initialized
>>> [    0.078125] pinctrl core: initialized pinctrl subsystem
>>> [    0.078125] NET: Registered protocol family 16
>>> [    0.078125] DMA: preallocated 256 KiB pool for atomic coherent allocations
>>> [    0.109375] gpio-at91 fffff400.gpio: at address fefff400
>>> [    0.109375] gpio-at91 fffff600.gpio: at address fefff600
>>> [    0.109375] gpio-at91 fffff800.gpio: at address fefff800
>>> [    0.117187] gpio-at91 fffffa00.gpio: at address fefffa00
>>> [    0.117187] pinctrl-at91 pinctrl.2: initialized AT91 pinctrl driver
>>> [    0.117187] tcb_clksrc: tc0 at 16.166 MHz
>>> [    0.148437] bio: create slab <bio-0> at 0
>>> [    0.148437] at_hdmac ffffec00.dma-controller: Atmel AHB DMA Controller ( cpy slave ), 8 channels
>>> [    0.156250] at_hdmac ffffee00.dma-controller: Atmel AHB DMA Controller ( cpy slave ), 8 channels
>>> [    0.164062] Switched to clocksource tcb_clksrc
>>> [    0.218750] NET: Registered protocol family 2
>>> [    0.218750] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
>>> [    0.218750] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
>>> [    0.218750] TCP: Hash tables configured (established 1024 bind 1024)
>>> [    0.218750] TCP: reno registered
>>> [    0.218750] UDP hash table entries: 256 (order: 0, 4096 bytes)
>>> [    0.218750] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
>>> [    0.218750] NET: Registered protocol family 1
>>> [    0.218750] RPC: Registered named UNIX socket transport module.
>>> [    0.218750] RPC: Registered udp transport module.
>>> [    0.218750] RPC: Registered tcp transport module.
>>> [    0.218750] RPC: Registered tcp NFSv4.1 backchannel transport module.
>>> [    0.226562] NetWinder Floating Point Emulator V0.97 (double precision)
>>> [    0.226562] msgmni has been set to 246
>>> [    0.234375] NET: Registered protocol family 38
>>> [    0.234375] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
>>> [    0.234375] io scheduler noop registered (default)
>>> [    0.242187] gpio-export gpio_export.5: 16 gpio(s) exported
>>> [    0.242187] fffff200.serial: ttyS0 at MMIO 0xfffff200 (irq = 16) is a ATMEL_SERIAL
>>> [    0.593750] console [ttyS0] enabled
>>> [    0.601562] f801c000.serial: ttyS1 at MMIO 0xf801c000 (irq = 23) is a ATMEL_SERIAL
>>> [    0.609375] f8020000.serial: ttyS2 at MMIO 0xf8020000 (irq = 24) is a ATMEL_SERIAL
>>> [    0.625000] brd: module loaded
>>> [    0.640625] loop: module loaded
>>> [    0.656250] atmel_nand: Use On Flash BBT
>>> [    0.656250] atmel_nand 40000000.nand: Using dma0chan0 for DMA transfers.
>>> [    0.664062] ONFI param page 0 valid
>>> [    0.671875] ONFI flash detected
>>> [    0.671875] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAWP), 256MiB, page size: 2048, OOB size: 64
>>> [    0.679687] atmel_nand 40000000.nand: ONFI params, minimum required ECC: 4 bits in 512 bytes
>>> [    0.687500] atmel_nand 40000000.nand: Initialize PMECC params, cap: 4, sector: 512
>>> [    0.695312] Bad block table found at page 131008, version 0x01
>>> [    0.703125] Bad block table found at page 130944, version 0x01
>>> [    0.710937] 4 ofpart partitions found on MTD device atmel_nand
>>> [    0.710937] Creating 4 MTD partitions on "atmel_nand":
>>> [    0.718750] 0x000000000000-0x000000020000 : "dtb"
>>> [    0.726562] 0x000000020000-0x000000a00000 : "Kernel"
>>> [    0.734375] 0x000000a00000-0x00000ff80000 : "UBI"
>>> [    0.742187] 0x00000ff80000-0x000010000000 : "BBT"
>>> [    0.757812] libphy: MACB_mii_bus: probed
>>> [    0.765625] macb f802c000.ethernet eth0: Cadence MACB at 0xf802c000 irq 25 (00:04:a3:91:c4:e3)
>>> [    0.773437] macb f802c000.ethernet eth0: attached PHY driver [Davicom DM9161A] (mii_bus:phy_addr=f802c000.etherne:00, irq=-1)
>>> [    0.781250] at91sam9_wdt: sorry, watchdog is disabled
>>> [    0.789062] at91_wdt: probe of fffffe40.wdt failed with error -5
>>> [    0.796875] TCP: cubic registered
>>> [    0.804687] NET: Registered protocol family 17
>>> [    0.804687] Key type dns_resolver registered
>>> [    0.812500] UBI: default fastmap pool size: 95
>>> [    0.820312] UBI: default fastmap WL pool size: 25
>>> [    0.820312] UBI: attaching mtd2 to ubi0
>>> [    0.851562] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
>>
>> Okay, you hit a code path which does not call ubi_err() and just terminates the attach function.
>> These paths are mostly fatal errors like OOM or major problems with the fastmap disk-layout.
>> So, we need a debug-patch. By end of the week I'll send one.
>>
>>> [    1.593750] UBI: scanning is finished
>>> [    1.601562] UBI assert failed in ubi_wl_init at 1967 (pid 1)
>>> [    1.609375] CPU: 0 PID: 1 Comm: swapper Not tainted 3.11.1 #5
>>> [    1.617187] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from [<c0010bb8>] (show_stack+0x10/0x14)
>>> [    1.625000] [<c0010bb8>] (show_stack+0x10/0x14) from [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8)
>>> [    1.632812] [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8) from [<c01a2cd4>] (ubi_attach+0x270/0x34c)
>>> [    1.640625] [<c01a2cd4>] (ubi_attach+0x270/0x34c) from [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c)
>>> [    1.648437] [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c) from [<c0346630>] (ubi_init+0x1d8/0x29c)
>>> [    1.656250] [<c0346630>] (ubi_init+0x1d8/0x29c) from [<c0008810>] (do_one_initcall+0x94/0x144)
>>> [    1.664062] [<c0008810>] (do_one_initcall+0x94/0x144) from [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac)
>>> [    1.671875] [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac) from [<c0251500>] (kernel_init+0x8/0xe4)
>>> [    1.679687] [<c0251500>] (kernel_init+0x8/0xe4) from [<c000e590>] (ret_from_fork+0x14/0x24)
>>
>> What is line wl.c:1967 in your tree?
>>
>> Is it
>> ubi_assert(ubi->good_peb_count == found_pebs + ubi->fm->used_blocks);
>> or
>> ubi_assert(ubi->good_peb_count == found_pebs);
> it's
>  ubi_assert(ubi->good_peb_count == found_pebs);
> (in the debug log I sent you, it's line 1968 because I added a quick
> "#define DEBUG" at the top)

Okay. The assert() not correct.
It does not honor the case where we have a fastmap found (thus some PEBs are used for the fastmap)
but the fastmap has be treated as invalid.

Thanks,
//richard
