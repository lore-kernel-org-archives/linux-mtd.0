Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOo6M-0007DZ-5k
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 12:21:57 +0000
Received: by mail-we0-f182.google.com with SMTP id q59so6102198wes.27
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 05:21:29 -0700 (PDT)
Message-ID: <5242D37D.5030106@gmail.com>
Date: Wed, 25 Sep 2013 14:13:49 +0200
From: Richard Genoud <richard.genoud@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: BUG: fastmap and u-boot's ubi write command
References: <5242C213.3080808@gmail.com> <5242C4C1.2030401@nod.at>
In-Reply-To: <5242C4C1.2030401@nod.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25/09/2013 13:10, Richard Weinberger wrote:
> Hi!
> 
> Am 25.09.2013 12:59, schrieb Richard Genoud:
>>
>> [CC u-boot ML since it may not be a kernel only related bug(s)]
>>
>> Hi Richard, Artem,
>>
>> I'm still playing with fastmap and I ran into something.
>> It's involving u-boot's "ubi write" command and fastmap.
>> What I'm doing is:
>> - Flashing a mtd partition with a userspace.ubi image via u-boot
>> - Booting linux one or to times
>> - Flashing the UBI volume rootfs with a rootfs.ubifs image via u-boot
>> - Booting linux one or to times.
>>
>> And, depending on fastmap not compiled/disable/auto I've got an ubi_assert that fails and a slowpath warning.
>>
>> Here's the story:
>> U-Boot 2013.07
>> Kernel 3.11.1
> 
> Before we waste time, please ensure that you have all recent UBI fixes applied.
> UBI: Fix PEB leak in wear_leveling_worker() (Merged into 3.12-rc1, on it's way to -stable)
> UBI: Fix invalidate_fastmap() (Merged into 3.12-rc1)
> UBI: Fix refill_wl_user_pool() (Pending, http://lkml.org/lkml/2013/8/26/121)
> 
yes, I have them:
git log --oneline v3.11.1..HEAD -- drivers/mtd/ubi/
241bac5 UBI: fix refill_wl_user_pool()
a5858cf UBI: Fix invalidate_fastmap()
fd00289 UBI: Fix PEB leak in wear_leveling_worker()

>> NAND:
>> - 128KiB PEB
>> - 2KiB page
>> - 2048 PEB
>> - no subpage
>> mapping is:
>> 0x000000000000-0x000000020000 : "dtb"  (128KiB)
>> 0x000000020000-0x000000a00000 : "Kernel" (9.875KiB)
>> 0x000000a00000-0x00000ff80000 : "UBI" (245.5 KiB)
>> 0x00000ff80000-0x000010000000 : "BBT" (512KiB)
>>
>> 1- With Fastmap NOT compiled
>> - Flashing the UBI mtd partition under u-boot:
>>> fatload usb 0 0x20008000 /userspace.ubi
>>> nand device ubi
>>> nand erase.part ubi
>> NAND erase.part: device 0 offset 0xa00000, size 0xf580000
>> OK
>>> nand write.trimffs 0x20008000 ubi 35a0000
>> NAND write: device 0 offset 0xa00000, size 0x35a0000
>>  56229888 bytes written: OK
>> Booting a non-FASTMAP kernel:
>> [...]
>> [    0.789062] UBI: attaching mtd2 to ubi0
>> [    1.351562] UBI: scanning is finished
>> [    1.367187] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.375000] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.382812] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.390625] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.398437] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.398437] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.406250] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 891983656
>> [    1.414062] UBI: available PEBs: 2, total reserved PEBs: 1962, PEBs reserved for bad PEB handling: 40
>> [    1.421875] UBI: background thread "ubi_bgt0d" started, PID 354
>> [    1.437500] UBIFS: background thread "ubifs_bgt0_0" started, PID 356
>> [    1.523437] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>> [    1.523437] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    1.531250] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
>> [    1.539062] UBIFS: reserved for root: 0 bytes (0 KiB)
>> [    1.546875] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
>>
>> => OK
>>
>> Now, under u-boot, flashing only the ubi volume "rootfs":
>>> fatload usb 0 0x20008000 /rootfs.ubifs
>> 54218752 bytes read in 3259 ms (15.9 MiB/s)
>>> ubi part ubi
>> UBI: attaching mtd1 to ubi0
>> UBI: physical eraseblock size:   131072 bytes (128 KiB)
>> UBI: logical eraseblock size:    126976 bytes
>> UBI: smallest flash I/O unit:    2048
>> UBI: VID header offset:          2048 (aligned 2048)
>> UBI: data offset:                4096
>> UBI: attached mtd1 to ubi0
>> UBI: MTD device name:            "mtd=2"
>> UBI: MTD device size:            245 MiB
>> UBI: number of good PEBs:        1964
>> UBI: number of bad PEBs:         0
>> UBI: max. allowed volumes:       128
>> UBI: wear-leveling threshold:    4096
>> UBI: number of internal volumes: 1
>> UBI: number of user volumes:     3
>> UBI: available PEBs:             23
>> UBI: total number of reserved PEBs: 1941
>> UBI: number of PEBs reserved for bad PEB handling: 19
>> UBI: max/mean erase counter: 2/0
>>> ubi write 0x20008000 rootfs 33b5000
>> 54218752 bytes written to volume rootfs
>>
>> Booting the same kernel:
>> [    0.812500] UBI: attaching mtd2 to ubi0
>> [    1.664062] UBI: scanning is finished
>> [    1.687500] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.687500] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.695312] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.703125] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.710937] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.718750] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.718750] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
>> [    1.726562] UBI: available PEBs: 2, total reserved PEBs: 1962, PEBs reserved for bad PEB handling: 40
>> [    1.734375] UBI: background thread "ubi_bgt0d" started, PID 354
>> [    1.750000] UBIFS: background thread "ubifs_bgt0_0" started, PID 356
>> [    1.789062] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>> [    1.796875] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    1.804687] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
>> [    1.812500] UBIFS: reserved for root: 0 bytes (0 KiB)
>> [    1.812500] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
>>
>> => all OK
>>
>> 2- With Fastmap compiled and ubi.fm_autoconvert=0
>> - Flashing the UBI mtd partition under u-boot:
>>> fatload usb 0 0x20008000 /userspace.ubi
>>> nand device ubi
>>> nand erase.part ubi
>> NAND erase.part: device 0 offset 0xa00000, size 0xf580000
>> OK
>>> nand write.trimffs 0x20008000 ubi 35a0000
>> NAND write: device 0 offset 0xa00000, size 0x35a0000
>>  56229888 bytes written: OK
>> Booting a FASTMAP kernel:
>> [...]
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    1.289062] UBI: scanning is finished
>> [    1.304687] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.312500] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.320312] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.328125] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.328125] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.335937] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.343750] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 891983656
>> [    1.351562] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
>> [    1.359375] UBI: background thread "ubi_bgt0d" started, PID 355
>> [    1.453125] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
>> [    1.515625] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>> [    1.515625] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    1.523437] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
>> [    1.531250] UBIFS: reserved for root: 0 bytes (0 KiB)
>> [    1.539062] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
>> => OK
>>
>>
>> Rebooting: :
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    1.578125] UBI: scanning is finished
>> [    1.601562] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.609375] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.617187] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.617187] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.625000] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.632812] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.640625] UBI: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 891983656
>> [    1.648437] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
>> [    1.656250] UBI: background thread "ubi_bgt0d" started, PID 355
>>
>> Still ok.
>>
>> Now, under u-boot, flashing only the ubi volume "rootfs":
>>> fatload usb 0 0x20008000 /rootfs.ubifs
>> 54218752 bytes read in 3259 ms (15.9 MiB/s)
>>> ubi part ubi
>> UBI: attaching mtd1 to ubi0
>> UBI: physical eraseblock size:   131072 bytes (128 KiB)
>> UBI: logical eraseblock size:    126976 bytes
>> UBI: smallest flash I/O unit:    2048
>> UBI: VID header offset:          2048 (aligned 2048)
>> UBI: data offset:                4096
>> UBI: attached mtd1 to ubi0
>> UBI: MTD device name:            "mtd=2"
>> UBI: MTD device size:            245 MiB
>> UBI: number of good PEBs:        1964
>> UBI: number of bad PEBs:         0
>> UBI: max. allowed volumes:       128
>> UBI: wear-leveling threshold:    4096
>> UBI: number of internal volumes: 1
>> UBI: number of user volumes:     3
>> UBI: available PEBs:             23
>> UBI: total number of reserved PEBs: 1941
>> UBI: number of PEBs reserved for bad PEB handling: 19
>> UBI: max/mean erase counter: 2/0
>>> ubi write 0x20008000 rootfs 33b5000
>> 54218752 bytes written to volume rootfs
>>
>> Booting the same kernel:
>> [    0.804687] UBI: default fastmap pool size: 95
>> [    0.812500] UBI: default fastmap WL pool size: 25
>> [    0.812500] UBI: attaching mtd2 to ubi0
>> [    1.570312] UBI: scanning is finished
>> [    1.593750] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.601562] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.609375] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.609375] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.617187] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.625000] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.632812] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
>> [    1.640625] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
>> [    1.648437] UBI: background thread "ubi_bgt0d" started, PID 355
>> [    1.664062] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
>> [    1.703125] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>> [    1.710937] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    1.718750] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
>> [    1.726562] UBIFS: reserved for root: 0 bytes (0 KiB)
>> [    1.734375] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
>> => All OK (I rebooted one or two times, no problem showing up)
>>
>> Now, booting with ubi.fm_autoconvert=1:
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    1.578125] UBI: scanning is finished
>> [    1.601562] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.609375] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.609375] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.617187] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.625000] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.632812] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.640625] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
>> [    1.648437] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
>> [    1.656250] UBI: background thread "ubi_bgt0d" started, PID 355
>> [    1.671875] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
>> [    1.710937] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>> [    1.718750] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    1.726562] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
>> [    1.734375] UBIFS: reserved for root: 0 bytes (0 KiB)
>> [    1.742187] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
>> => Still OK
>> Rebooting again with ubi.fm_autoconvert=1:
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    0.851562] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
> 
> This is not the top most error. Do you have to full log?
> Would be nice to know why fastmap has fallen back to a full scan.

Here's the full log for this one:
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 3.11.1 (rgenoud@lnx-rg) (gcc version 4.7.3 (Buildroot 2013.05-00178-gd93036d-dirty) ) #5 Tue Sep 24 15:24:16 CEST 2013
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: Atmel AT91SAM (Device Tree), model: Paratronic LNS
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] AT91: Detected soc type: at91sam9x5
[    0.000000] AT91: Detected soc subtype: at91sam9g35
[    0.000000] AT91: sram at 0x300000 of 0x8000 mapped at 0xfef70000
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat c0374ccc, node_mem_map c03a6000
[    0.000000]   Normal zone: 256 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 32768 pages, LIFO batch:7
[    0.000000] Clocks: CPU 400 MHz, master 133 MHz, main 12.000 MHz
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: console=ttyS0,115200 loglevel=8 ubi.fm_autoconvert=1 rw root=ubi0:rootfs rootfstype=ubifs ubi.mtd=UBI
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 126100K/131072K available (2474K kernel code, 140K rwdata, 776K rodata, 115K init, 194K bss, 4972K reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0334eec   (3252 kB)
[    0.000000]       .init : 0xc0335000 - 0xc0351f14   ( 116 kB)
[    0.000000]       .data : 0xc0352000 - 0xc03753a0   ( 141 kB)
[    0.000000]        .bss : 0xc03753a0 - 0xc03a5cf8   ( 195 kB)
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] sched_clock: 32 bits at 128 Hz, resolution 7812500ns, wraps every 3489660920ms
[    0.000000] Console: colour dummy device 80x30
[    0.054687] Calibrating delay loop... 198.76 BogoMIPS (lpj=775168)
[    0.054687] pid_max: default: 32768 minimum: 301
[    0.062500] Mount-cache hash table entries: 512
[    0.070312] CPU: Testing write buffer coherency: ok
[    0.070312] Setting up static identity map for 0xc0257aa8 - 0xc0257ae4
[    0.078125] devtmpfs: initialized
[    0.078125] pinctrl core: initialized pinctrl subsystem
[    0.078125] NET: Registered protocol family 16
[    0.078125] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.109375] gpio-at91 fffff400.gpio: at address fefff400
[    0.109375] gpio-at91 fffff600.gpio: at address fefff600
[    0.109375] gpio-at91 fffff800.gpio: at address fefff800
[    0.117187] gpio-at91 fffffa00.gpio: at address fefffa00
[    0.117187] pinctrl-at91 pinctrl.2: initialized AT91 pinctrl driver
[    0.117187] tcb_clksrc: tc0 at 16.166 MHz
[    0.148437] bio: create slab <bio-0> at 0
[    0.148437] at_hdmac ffffec00.dma-controller: Atmel AHB DMA Controller ( cpy slave ), 8 channels
[    0.156250] at_hdmac ffffee00.dma-controller: Atmel AHB DMA Controller ( cpy slave ), 8 channels
[    0.164062] Switched to clocksource tcb_clksrc
[    0.218750] NET: Registered protocol family 2
[    0.218750] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
[    0.218750] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.218750] TCP: Hash tables configured (established 1024 bind 1024)
[    0.218750] TCP: reno registered
[    0.218750] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.218750] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.218750] NET: Registered protocol family 1
[    0.218750] RPC: Registered named UNIX socket transport module.
[    0.218750] RPC: Registered udp transport module.
[    0.218750] RPC: Registered tcp transport module.
[    0.218750] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.226562] NetWinder Floating Point Emulator V0.97 (double precision)
[    0.226562] msgmni has been set to 246
[    0.234375] NET: Registered protocol family 38
[    0.234375] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.234375] io scheduler noop registered (default)
[    0.242187] gpio-export gpio_export.5: 16 gpio(s) exported
[    0.242187] fffff200.serial: ttyS0 at MMIO 0xfffff200 (irq = 16) is a ATMEL_SERIAL
[    0.593750] console [ttyS0] enabled
[    0.601562] f801c000.serial: ttyS1 at MMIO 0xf801c000 (irq = 23) is a ATMEL_SERIAL
[    0.609375] f8020000.serial: ttyS2 at MMIO 0xf8020000 (irq = 24) is a ATMEL_SERIAL
[    0.625000] brd: module loaded
[    0.640625] loop: module loaded
[    0.656250] atmel_nand: Use On Flash BBT
[    0.656250] atmel_nand 40000000.nand: Using dma0chan0 for DMA transfers.
[    0.664062] ONFI param page 0 valid
[    0.671875] ONFI flash detected
[    0.671875] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAWP), 256MiB, page size: 2048, OOB size: 64
[    0.679687] atmel_nand 40000000.nand: ONFI params, minimum required ECC: 4 bits in 512 bytes
[    0.687500] atmel_nand 40000000.nand: Initialize PMECC params, cap: 4, sector: 512
[    0.695312] Bad block table found at page 131008, version 0x01
[    0.703125] Bad block table found at page 130944, version 0x01
[    0.710937] 4 ofpart partitions found on MTD device atmel_nand
[    0.710937] Creating 4 MTD partitions on "atmel_nand":
[    0.718750] 0x000000000000-0x000000020000 : "dtb"
[    0.726562] 0x000000020000-0x000000a00000 : "Kernel"
[    0.734375] 0x000000a00000-0x00000ff80000 : "UBI"
[    0.742187] 0x00000ff80000-0x000010000000 : "BBT"
[    0.757812] libphy: MACB_mii_bus: probed
[    0.765625] macb f802c000.ethernet eth0: Cadence MACB at 0xf802c000 irq 25 (00:04:a3:91:c4:e3)
[    0.773437] macb f802c000.ethernet eth0: attached PHY driver [Davicom DM9161A] (mii_bus:phy_addr=f802c000.etherne:00, irq=-1)
[    0.781250] at91sam9_wdt: sorry, watchdog is disabled
[    0.789062] at91_wdt: probe of fffffe40.wdt failed with error -5
[    0.796875] TCP: cubic registered
[    0.804687] NET: Registered protocol family 17
[    0.804687] Key type dns_resolver registered
[    0.812500] UBI: default fastmap pool size: 95
[    0.820312] UBI: default fastmap WL pool size: 25
[    0.820312] UBI: attaching mtd2 to ubi0
[    0.851562] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
[    1.593750] UBI: scanning is finished
[    1.601562] UBI assert failed in ubi_wl_init at 1967 (pid 1)
[    1.609375] CPU: 0 PID: 1 Comm: swapper Not tainted 3.11.1 #5
[    1.617187] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from [<c0010bb8>] (show_stack+0x10/0x14)
[    1.625000] [<c0010bb8>] (show_stack+0x10/0x14) from [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8)
[    1.632812] [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8) from [<c01a2cd4>] (ubi_attach+0x270/0x34c)
[    1.640625] [<c01a2cd4>] (ubi_attach+0x270/0x34c) from [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c)
[    1.648437] [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c) from [<c0346630>] (ubi_init+0x1d8/0x29c)
[    1.656250] [<c0346630>] (ubi_init+0x1d8/0x29c) from [<c0008810>] (do_one_initcall+0x94/0x144)
[    1.664062] [<c0008810>] (do_one_initcall+0x94/0x144) from [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac)
[    1.671875] [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac) from [<c0251500>] (kernel_init+0x8/0xe4)
[    1.679687] [<c0251500>] (kernel_init+0x8/0xe4) from [<c000e590>] (ret_from_fork+0x14/0x24)
[    1.695312] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
[    1.703125] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    1.703125] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    1.710937] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    1.718750] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
[    1.726562] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
[    1.726562] UBI: max/mean erase counter: 3/1, WL threshold: 4096, image sequence number: 891983656
[    1.734375] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
[    1.742187] UBI: background thread "ubi_bgt0d" started, PID 355
[    1.757812] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
[    1.796875] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    1.804687] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    1.812500] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
[    1.820312] UBIFS: reserved for root: 0 bytes (0 KiB)
[    1.820312] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
[    1.828125] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    1.835937] devtmpfs: mounted
[    1.835937] Freeing unused kernel memory: 112K (c0335000 - c0351000)
[    2.187500] UBI error: ubi_update_fastmap: could not find any anchor PEB
[    2.195312] UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=-28


>> => If I reboot again, I still have those error messages.
>>
>>
>> 3- With Fastmap compiled and ubi.fm_autoconvert=1
>> - Flashing the UBI mtd partition under u-boot:
>>> fatload usb 0 0x20008000 /userspace.ubi
>>> nand device ubi
>>> nand erase.part ubi
>> NAND erase.part: device 0 offset 0xa00000, size 0xf580000
>> OK
>>> nand write.trimffs 0x20008000 ubi 35a0000
>> NAND write: device 0 offset 0xa00000, size 0x35a0000
>>  56229888 bytes written: OK
>> Booting a FASTMAP kernel with ubi.fm_autoconvert=1:
>> [...]
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    1.289062] UBI: scanning is finished
>> [    1.304687] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.312500] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.320312] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.328125] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.328125] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.335937] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.343750] UBI: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 891983656
>> [    1.351562] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
>> [    1.359375] UBI: background thread "ubi_bgt0d" started, PID 355
>> [    1.437500] UBI error: ubi_update_fastmap: could not find any anchor PEB
>> [    1.445312] UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
>> =>OK
>>
>> Rebooting 2 times to let FASTMAP show its power:
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    0.929687] UBI: attached by fastmap
>> [    0.937500] UBI: fastmap pool size: 95
>> [    0.937500] UBI: fastmap WL pool size: 25
>> [    0.960937] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> GREAT !
>>
>> Now, under u-boot, flashing only the ubi volume "rootfs":
>>> fatload usb 0 0x20008000 /rootfs.ubifs
>> 54218752 bytes read in 3259 ms (15.9 MiB/s)
>>> ubi part ubi
>> UBI: attaching mtd1 to ubi0
>> UBI: physical eraseblock size:   131072 bytes (128 KiB)
>> UBI: logical eraseblock size:    126976 bytes
>> UBI: smallest flash I/O unit:    2048
>> UBI: VID header offset:          2048 (aligned 2048)
>> UBI: data offset:                4096
>> UBI: "delete" compatible internal volume 2147479552:0 found, remove it
>> UBI: attached mtd1 to ubi0
>> UBI: MTD device name:            "mtd=2"
>> UBI: MTD device size:            245 MiB
>> UBI: number of good PEBs:        1964
>> UBI: number of bad PEBs:         0
>> UBI: max. allowed volumes:       128
>> UBI: wear-leveling threshold:    4096
>> UBI: number of internal volumes: 1
>> UBI: number of user volumes:     3
>> UBI: available PEBs:             23
>> UBI: total number of reserved PEBs: 1941
>> UBI: number of PEBs reserved for bad PEB handling: 19
>> UBI: max/mean erase counter: 2/0
>>> ubi write 0x20008000 rootfs 33b5000
>> 54218752 bytes written to volume rootfs
>>
>> =>FASTMAP internal volume has been erased, which is the expected behaviour.
>>
>> Booting the same kernel, still with ubi.fm_autoconvert=1:
>> [...]
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    1.585937] UBI: scanning is finished
>> [    1.601562] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.609375] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.617187] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.625000] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.625000] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.632812] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.640625] UBI: max/mean erase counter: 4/1, WL threshold: 4096, image sequence number: 891983656
>> [    1.648437] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
>> [    1.656250] UBI: background thread "ubi_bgt0d" started, PID 355
>> [    1.703125] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
>> [    1.734375] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>> [    1.742187] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    1.750000] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
>> [    1.757812] UBIFS: reserved for root: 0 bytes (0 KiB)
>> [    1.765625] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
>> =>OK this time, let's reboot:
>>
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.820312] UBI: attaching mtd2 to ubi0
>> [    0.914062] UBI error: scan_pool: bad image seq: 0x0, expected: 0x352a9728
>> [    0.921875] ------------[ cut here ]------------
>> [    0.929687] WARNING: CPU: 0 PID: 1 at drivers/mtd/ubi/fastmap.c:829 ubi_attach_fastmap+0xd38/0xda0()
> 
> This bug got most likely fixed by "UBI: Fix PEB leak in wear_leveling_worker()".
> 
Well, I'm afraid it's not. But I'm going to redo those tests with UBI
debug enabled to be really really sure.

>> [    0.937500] Modules linked in:
>> [    0.937500] CPU: 0 PID: 1 Comm: swapper Not tainted 3.11.1 #5
>> [    0.945312] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from [<c0010bb8>] (show_stack+0x10/0x14)
>> [    0.953125] [<c0010bb8>] (show_stack+0x10/0x14) from [<c001ab2c>] (warn_slowpath_common+0x60/0x80)
>> [    0.960937] [<c001ab2c>] (warn_slowpath_common+0x60/0x80) from [<c001ab64>] (warn_slowpath_null+0x18/0x1c)
>> [    0.968750] [<c001ab64>] (warn_slowpath_null+0x18/0x1c) from [<c01a5c8c>] (ubi_attach_fastmap+0xd38/0xda0)
>> [    0.976562] [<c01a5c8c>] (ubi_attach_fastmap+0xd38/0xda0) from [<c01a62d4>] (ubi_scan_fastmap+0x5b4/0x7b8)
>> [    0.984375] [<c01a62d4>] (ubi_scan_fastmap+0x5b4/0x7b8) from [<c01a2c2c>] (ubi_attach+0x1c8/0x34c)
>> [    0.992187] [<c01a2c2c>] (ubi_attach+0x1c8/0x34c) from [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c)
>> [    1.000000] [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c) from [<c0346630>] (ubi_init+0x1d8/0x29c)
>> [    1.007812] [<c0346630>] (ubi_init+0x1d8/0x29c) from [<c0008810>] (do_one_initcall+0x94/0x144)
>> [    1.015625] [<c0008810>] (do_one_initcall+0x94/0x144) from [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac)
>> [    1.023437] [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac) from [<c0251500>] (kernel_init+0x8/0xe4)
>> [    1.031250] [<c0251500>] (kernel_init+0x8/0xe4) from [<c000e590>] (ret_from_fork+0x14/0x24)
>> [    1.039062] ---[ end trace 313a7957427257d8 ]---
>> [    1.039062] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
>> [    1.781250] UBI: scanning is finished
>> [    1.796875] UBI assert failed in ubi_wl_init at 1967 (pid 1)
>> [    1.796875] CPU: 0 PID: 1 Comm: swapper Tainted: G        W    3.11.1 #5
>> [    1.804687] [<c0012e20>] (unwind_backtrace+0x0/0xe0) from [<c0010bb8>] (show_stack+0x10/0x14)
>> [    1.812500] [<c0010bb8>] (show_stack+0x10/0x14) from [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8)
>> [    1.820312] [<c01a0704>] (ubi_wl_init+0x3d0/0x4b8) from [<c01a2cd4>] (ubi_attach+0x270/0x34c)
>> [    1.828125] [<c01a2cd4>] (ubi_attach+0x270/0x34c) from [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c)
>> [    1.835937] [<c0197678>] (ubi_attach_mtd_dev+0x2b8/0x86c) from [<c0346630>] (ubi_init+0x1d8/0x29c)
>> [    1.843750] [<c0346630>] (ubi_init+0x1d8/0x29c) from [<c0008810>] (do_one_initcall+0x94/0x144)
>> [    1.851562] [<c0008810>] (do_one_initcall+0x94/0x144) from [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac)
>> [    1.859375] [<c0335a9c>] (kernel_init_freeable+0xe8/0x1ac) from [<c0251500>] (kernel_init+0x8/0xe4)
>> [    1.867187] [<c0251500>] (kernel_init+0x8/0xe4) from [<c000e590>] (ret_from_fork+0x14/0x24)
>> [    1.882812] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
>> [    1.890625] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> [    1.898437] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> [    1.898437] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
>> [    1.906250] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
>> [    1.914062] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
>> [    1.921875] UBI: max/mean erase counter: 4/1, WL threshold: 4096, image sequence number: 891983656
>> [    1.929687] UBI: available PEBs: 0, total reserved PEBs: 1964, PEBs reserved for bad PEB handling: 40
>> [    1.937500] UBI: background thread "ubi_bgt0d" started, PID 355
>> [    1.953125] UBIFS: background thread "ubifs_bgt0_0" started, PID 357
>> [    1.992187] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
>> [    2.000000] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
>> [    2.007812] UBIFS: FS size: 63614976 bytes (60 MiB, 501 LEBs), journal size 8634368 bytes (8 MiB, 68 LEBs)
>> [    2.015625] UBIFS: reserved for root: 0 bytes (0 KiB)
>> [    2.023437] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 47FE5308-55FD-4F1C-BD13-C23AED232326, small LPT model
>> [    2.031250] VFS: Mounted root (ubifs filesystem) on device 0:11.
>> [    2.039062] devtmpfs: mounted
>> [    2.046875] Freeing unused kernel memory: 112K (c0335000 - c0351000)
>> [    2.390625] UBI error: ubi_update_fastmap: could not find any anchor PEB
>> [    2.398437] UBI warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
> 
> Thanks,
> //richard
> 

Thanks !
